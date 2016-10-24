using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using OpenTK;
using OpenTK.Graphics;
using System.Drawing.Imaging;
using System.IO;
using System.Runtime.InteropServices;

namespace Renderer.Lib
{
    public partial class RendererWindow : Form
    {
        public RendererWindow()
        {
            InitializeComponent();
        }

        float[] pose;

        //for library load
        private string testImageName;
        private string modelName;
        private string textureName;

        //for direct load
        private byte[] backImage;
        private int backImageWidth, backImageHeight;
        private float[] vertices;
        private int[] faces;
        private byte[] textureObjectSource;
        private int textureObjectWidth, textureObjectHeight;

        //dump image
        byte[] frontBuffer;

        enum RunType { FromFiles, FromMemory };
        RunType runType;

        public float[] Pose
        {
            get { return pose; }
            set { pose = value; }
        }

        public byte[] FrontBuffer
        {
            get { return frontBuffer; }
            set { frontBuffer = value; }
        }

        public void Set(byte[] backImage, int backImageWidth, int backImageHeight, float[] vertices, int[] faces, byte[] textureObjectSource, int textureObjectWidth, int textureObjectHeight)
        {
            this.backImage = backImage;
            this.backImageWidth = backImageWidth;
            this.backImageHeight = backImageHeight;
            this.vertices = vertices;
            this.faces = faces;
            this.textureObjectSource = textureObjectSource;
            this.textureObjectWidth = textureObjectWidth;
            this.textureObjectHeight = textureObjectHeight;

            runType = RunType.FromMemory;
        }

        public void Set(string testImageName, string modelName, string textureName)
        {
            this.testImageName = testImageName;
            this.modelName = modelName;
            this.textureName = textureName;

            runType = RunType.FromFiles;
        }

        float[] globalAmbientLight = { 1.0f, 1.0f, 1.0f, 1.0f };

        int texId_Background;

        Model3D currentModel;
        Matrix4 projectionMatrix, currentModelViewMatrix;

        public void OnLoad(object sender, EventArgs e)
        {
            GL.ClearColor(0.0f, 148.0f / 255.0f, 255.0f / 255.0f, 0.0f);
            GL.Enable(EnableCap.Texture2D);

            Vector4 row0 = new Vector4(-2.584487400f, 0.000000000f, 0.000000000f, 0.000000000f);
            Vector4 row1 = new Vector4(0.000000000f, 3.42109470f, 0.000000000f, 0.000000000f);
            Vector4 row2 = new Vector4(-0.028586626f, 0.21707320f, -1.000400100f, -1.00000000f);
            Vector4 row3 = new Vector4(0.000000000f, 0.000000000f, -0.020004001f, 0.000000000f);
            projectionMatrix = new Matrix4(row0, row1, row2, row3);

            currentModelViewMatrix = ModelViewCreator.BuildFromPose(pose);

            this.LoadBackgroundTexture();
            this.LoadModel();
        }

        public void RenderOffScreen()
        {
            this.Visible = true;
            this.Location = new Point(50000, 50000);
            this.OnLoad(null, null);
            this.OnRenderFrame(null, null);
        }

        protected void OnRenderFrame(object sender, PaintEventArgs e)
        {
            this.ChangeProjectionMatrix(glControl.Width, glControl.Height);

            GL.Clear(ClearBufferMask.ColorBufferBit | ClearBufferMask.DepthBufferBit);

            this.RenderBackground();
            this.RenderObject();

            glControl.SwapBuffers();

            frontBuffer = this.DumpBuffer();

            //this.Close();
        }

        protected void RenderBackground()
        {
            GL.Disable(EnableCap.DepthTest); GL.Disable(EnableCap.Lighting); GL.Disable(EnableCap.Light0);

            GL.MatrixMode(MatrixMode.Projection);
            GL.PushMatrix();
            {
                GL.LoadIdentity();
                GL.Ortho(0.0, 1.0, 0.0, 1.0, 0.0, 1.0);

                GL.MatrixMode(MatrixMode.Modelview);
                GL.PushMatrix();
                {
                    GL.BindTexture(TextureTarget.Texture2D, texId_Background);
                    GL.Begin(BeginMode.Quads);
                    {
                        GL.TexCoord2(0.0f, 1.0f); GL.Vertex2(0.0f, 0.0f);
                        GL.TexCoord2(1.0f, 1.0f); GL.Vertex2(1.0f, 0.0f);
                        GL.TexCoord2(1.0f, 0.0f); GL.Vertex2(1.0f, 1.0f);
                        GL.TexCoord2(0.0f, 0.0f); GL.Vertex2(0.0f, 1.0f);
                    }
                    GL.End();
                }
                GL.PopMatrix();
            }
            GL.MatrixMode(MatrixMode.Projection);
            GL.PopMatrix();

            GL.Enable(EnableCap.DepthTest); GL.Enable(EnableCap.Lighting); GL.Enable(EnableCap.Light0);
        }

        private void RenderObject()
        {
            GL.MatrixMode(MatrixMode.Modelview);
            GL.PushMatrix();
            {
                GL.LoadMatrix(ref currentModelViewMatrix);
                currentModel.Render();
            }
            GL.PopMatrix();
        }

        private void LoadBackgroundTexture()
        {
            texId_Background = GL.GenTexture();
            switch (runType)
            {
                case RunType.FromFiles:
                    Bitmap localTestImage = (Bitmap)Image.FromFile(testImageName);

                    GL.Enable(EnableCap.Texture2D);
                    GL.BindTexture(TextureTarget.Texture2D, texId_Background);

                    BitmapData bmpData = localTestImage.LockBits(new Rectangle(0, 0, localTestImage.Width, localTestImage.Height),
                    System.Drawing.Imaging.ImageLockMode.ReadOnly, localTestImage.PixelFormat);
                    GL.TexImage2D(TextureTarget.Texture2D, 0, PixelInternalFormat.Rgb, localTestImage.Width, localTestImage.Height, 0,
                        OpenTK.Graphics.PixelFormat.Rgb, PixelType.UnsignedByte, bmpData.Scan0);
                    localTestImage.UnlockBits(bmpData);

                    GL.TexParameter(TextureTarget.Texture2D, TextureParameterName.TextureMinFilter, (int)TextureMinFilter.Linear);
                    GL.TexParameter(TextureTarget.Texture2D, TextureParameterName.TextureMagFilter, (int)TextureMagFilter.Linear);

                    localTestImage.Dispose();
                    break;
                case RunType.FromMemory:
                    texId_Background = GL.GenTexture();

                    GL.Enable(EnableCap.Texture2D);
                    GL.BindTexture(TextureTarget.Texture2D, texId_Background);

                    GL.TexImage2D<Byte>(TextureTarget.Texture2D, 0, PixelInternalFormat.Rgb, glControl.Width, glControl.Height, 0,
                        OpenTK.Graphics.PixelFormat.Rgb, PixelType.UnsignedByte, (Byte[])backImage);

                    GL.TexParameter(TextureTarget.Texture2D, TextureParameterName.TextureMinFilter, (int)TextureMinFilter.Linear);
                    GL.TexParameter(TextureTarget.Texture2D, TextureParameterName.TextureMagFilter, (int)TextureMagFilter.Linear);

                    break;
            }
        }

        private void LoadModel()
        {
            switch (runType)
            {
                case RunType.FromFiles:
                    currentModel = new Model3D(modelName, textureName);
                    break;
                case RunType.FromMemory:
                    currentModel = new Model3D(vertices, faces, textureObjectSource, textureObjectWidth, textureObjectHeight);
                    break;
            }
        }

        private void ChangeProjectionMatrix(int w, int h)
        {
            GL.Viewport(0, 0, w, h);

            GL.MatrixMode(MatrixMode.Projection);
            GL.LoadMatrix(ref projectionMatrix);

            float[] specular_light = { 1.0f, 1.0f, 1.0f, 1.0f };
            float[] global_ambient_light = { 1.0f, 1.0f, 1.0f, 1.0f };

            GL.Light(LightName.Light0, LightParameter.Specular, specular_light);
            GL.ShadeModel(ShadingModel.Flat);
            GL.LightModel(LightModelParameter.LightModelAmbient, global_ambient_light);

            GL.Enable(EnableCap.Lighting);
            GL.Enable(EnableCap.Light0);
        }

        private byte[] DumpBuffer()
        {
            int width = glControl.Width, height = glControl.Height;
            byte[] image = new byte[width * height * 3];

            GL.ReadBuffer(ReadBufferMode.Front);

            Bitmap bmp = new Bitmap(width, height);
            System.Drawing.Imaging.BitmapData data =
                bmp.LockBits(new Rectangle(0, 0, width, height), System.Drawing.Imaging.ImageLockMode.WriteOnly, System.Drawing.Imaging.PixelFormat.Format24bppRgb);
            GL.ReadPixels(0, 0, width, height, OpenTK.Graphics.PixelFormat.Bgr, PixelType.UnsignedByte, data.Scan0);
            bmp.UnlockBits(data);

            bmp.RotateFlip(RotateFlipType.RotateNoneFlipY);

            data = bmp.LockBits(new Rectangle(0, 0, width, height), System.Drawing.Imaging.ImageLockMode.ReadOnly, System.Drawing.Imaging.PixelFormat.Format24bppRgb);
            Marshal.Copy(data.Scan0, image, 0, width * height * 3);
            bmp.UnlockBits(data);

            //data = bmp.LockBits(new Rectangle(0, 0, width, height), System.Drawing.Imaging.ImageLockMode.WriteOnly, System.Drawing.Imaging.PixelFormat.Format24bppRgb);
            //Marshal.Copy(image, 0, data.Scan0, width * height * 3);
            //bmp.UnlockBits(data);

            //bmp.Save("ana.png");

            return image;
        }

        private void bSave_Click(object sender, EventArgs e)
        {
            this.DumpBuffer();
        }

        private void RendererWindow_Load(object sender, EventArgs e)
        {
            //glControl.CreateControl();
        }
    }
}
