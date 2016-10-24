using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OpenTK.Graphics.OpenGL;
using System.Drawing;
using System.Drawing.Imaging;

namespace Renderer.Lib
{
    class ModelRenderer
    {
        uint dataBuffer;
        uint indexBuffer;

        int vertOffset, normOffset, texcoordOffset;

        uint texId_object;

        int versCount;

        public void LoadTexture(string texFile)
        {
            texId_object = this.LoadTex(texFile);
        }

        public void LoadTexture(byte[] textureSource, int textureWidth, int textureHeight)
        {
            texId_object = this.LoadTex(textureSource, textureWidth, textureHeight);
        }

        public void LoadBuffers(ModelData m)
        {
            versCount = m.IndicesArray.Length;

            GL.GenBuffers(1, out dataBuffer);
            GL.GenBuffers(1, out indexBuffer);

            // Set up data for VBO.
            // We're going to use one VBO for all geometry, and stick it in 
            // in (VVVVNNNNCCCC) order.  Non interleaved.
            int buffersize = (m.VerticesArray.Length + m.NormalsArray.Length + m.TexCoordsArray.Length);
            float[] bufferdata = new float[buffersize];
            vertOffset = 0;
            normOffset = m.VerticesArray.Length;
            texcoordOffset = (m.VerticesArray.Length + m.NormalsArray.Length);

            m.VerticesArray.CopyTo(bufferdata, vertOffset);
            m.NormalsArray.CopyTo(bufferdata, normOffset);
            m.TexCoordsArray.CopyTo(bufferdata, texcoordOffset);

            bool v = false;
            for (int i = texcoordOffset; i < bufferdata.Length; i++)
            {
                if (v) { bufferdata[i] = 1 - bufferdata[i]; v = false; }
                else v = true;
            }

            // Load geometry data
            GL.BindBuffer(BufferTarget.ArrayBuffer, dataBuffer);
            GL.BufferData<float>(BufferTarget.ArrayBuffer, (IntPtr)(buffersize * sizeof(float)), bufferdata,BufferUsageHint.StaticDraw);

            // Load index data
            GL.BindBuffer(BufferTarget.ElementArrayBuffer, indexBuffer);
            GL.BufferData<uint>(BufferTarget.ElementArrayBuffer, (IntPtr)(m.IndicesArray.Length * sizeof(uint)), m.IndicesArray, BufferUsageHint.StaticDraw);
        }

        private uint LoadTex(string file)
        {
            Bitmap bitmap = new Bitmap(file);

            uint texture;
            GL.Hint(HintTarget.PerspectiveCorrectionHint, HintMode.Nicest);

            GL.GenTextures(1, out texture);
            GL.BindTexture(TextureTarget.Texture2D, texture);

            BitmapData data = bitmap.LockBits(new System.Drawing.Rectangle(0, 0, bitmap.Width, bitmap.Height),
                ImageLockMode.ReadOnly, System.Drawing.Imaging.PixelFormat.Format32bppArgb);

            GL.TexImage2D(TextureTarget.Texture2D, 0, PixelInternalFormat.Rgba, data.Width, data.Height, 0,
                OpenTK.Graphics.OpenGL.PixelFormat.Bgra, PixelType.UnsignedByte, data.Scan0);
            bitmap.UnlockBits(data);

            GL.TexParameter(TextureTarget.Texture2D, TextureParameterName.TextureMinFilter, (int)TextureMinFilter.Linear);
            GL.TexParameter(TextureTarget.Texture2D, TextureParameterName.TextureMagFilter, (int)TextureMagFilter.Linear);

            return texture;
        }

        private uint LoadTex(byte[] textureSource, int textureWidth, int textureHeight)
        {
            uint texture;
            GL.Hint(HintTarget.PerspectiveCorrectionHint, HintMode.Nicest);

            GL.GenTextures(1, out texture);
            GL.BindTexture(TextureTarget.Texture2D, texture);

            GL.TexImage2D<byte>(TextureTarget.Texture2D, 0, PixelInternalFormat.Rgba, textureWidth, textureHeight, 0,
                OpenTK.Graphics.OpenGL.PixelFormat.Rgb, PixelType.UnsignedByte, textureSource);

            GL.TexParameter(TextureTarget.Texture2D, TextureParameterName.TextureMinFilter, (int)TextureMinFilter.Linear);
            GL.TexParameter(TextureTarget.Texture2D, TextureParameterName.TextureMagFilter, (int)TextureMagFilter.Linear);

            return texture;
        }

        public void DrawBuffer()
        {
            GL.PushClientAttrib(ClientAttribMask.ClientVertexArrayBit);

            GL.EnableClientState(EnableCap.VertexArray);
            GL.EnableClientState(EnableCap.NormalArray);
            GL.EnableClientState(EnableCap.TextureCoordArray);

            GL.ClientActiveTexture(TextureUnit.Texture0);
            GL.BindTexture(TextureTarget.Texture2D, texId_object);

            GL.BindBuffer(BufferTarget.ArrayBuffer, dataBuffer);

            GL.NormalPointer(NormalPointerType.Float, 0, (IntPtr)(normOffset * sizeof(float)));
            GL.TexCoordPointer(2, TexCoordPointerType.Float, 0, (IntPtr)(texcoordOffset * sizeof(float)));
            GL.VertexPointer(3, VertexPointerType.Float, 0, (IntPtr)(vertOffset * sizeof(float)));

            GL.BindBuffer(BufferTarget.ElementArrayBuffer, indexBuffer);
            GL.DrawElements(BeginMode.Triangles, versCount, DrawElementsType.UnsignedInt, IntPtr.Zero);

            GL.PopClientAttrib();
        }
    }
}
