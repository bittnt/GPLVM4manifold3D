using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OpenTK;
using OpenTK.Graphics;
using OpenTK.Input;
using System.Drawing;
using System.Drawing.Imaging;
using System.Threading;

namespace Renderer.Lib
{
    public class Game : GameWindow
    {
        float[] pose;

        private string modelName;
        private string testImageName;
        private string textureName;

        public float[] Pose
        {
            get { return pose; }
            set { pose = value; }
        }
        public string ModelName
        {
            get { return modelName; }
            set { modelName = value; }
        }
        public string TestImageName
        {
            get { return testImageName; }
            set { testImageName = value; }
        }
        public string TextureName
        {
            get { return textureName; }
            set { textureName = value; }
        }

        float[] globalAmbientLight = { 1.0f, 1.0f, 1.0f, 1.0f };

        int texId_Background;

        Model3D currentModel;
        Matrix4 projectionMatrix, currentModelViewMatrix;
        Bitmap testImage;

        public Game(): base(640, 480, GraphicsMode.Default, "Cassiopeia 3D ML Renderer")
        {
            VSync = VSyncMode.On;
        }
        protected override void OnLoad(EventArgs e)
        {
            Console.Out.Write("I get here");
            base.OnLoad(e);

            GL.ClearColor(0.0f, 148.0f / 255.0f, 255.0f / 255.0f, 0.0f);
            GL.Enable(EnableCap.Texture2D);

            Vector4 row0 = new Vector4(-2.584487400f, 0.000000000f, 0.000000000f, 0.000000000f);
            Vector4 row1 = new Vector4(0.000000000f, 3.42109470f, 0.000000000f, 0.000000000f);
            Vector4 row2 = new Vector4(-0.028586626f, 0.21707320f, -1.000400100f, -1.00000000f);
            Vector4 row3 = new Vector4(0.000000000f, 0.000000000f, -0.020004001f, 0.000000000f);
            projectionMatrix = new Matrix4(row0, row1, row2, row3);
            
            pose = new float[6];

            pose[0] = 0.1000f; pose[1] = 0.1000f; pose[2] = -4.0000f; pose[3] = 0.1303f; pose[4] = 0.1580f; pose[5] = 0.1507f;

            currentModelViewMatrix = ModelViewCreator.BuildFromPose(pose);

            this.LoadBackgroundTexture();
            this.LoadModel();
        }

        protected override void OnResize(EventArgs e)
        {
            base.OnResize(e);

            this.ChangeProjectionMatrix(ClientRectangle.Width, ClientRectangle.Height);
        }

        protected override void OnUpdateFrame(FrameEventArgs e)
        {
            base.OnUpdateFrame(e);

            if (Keyboard[Key.Escape])
                Exit();
        }

        protected override void OnRenderFrame(FrameEventArgs e)
        {
            base.OnRenderFrame(e);

            GL.Clear(ClearBufferMask.ColorBufferBit | ClearBufferMask.DepthBufferBit);

            this.RenderBackground();
            this.RenderObject();

            SwapBuffers();
        }

        private void RenderBackground()
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
            testImage = (Bitmap)Image.FromFile(testImageName);

            GL.Enable(EnableCap.Texture2D);
            GL.BindTexture(TextureTarget.Texture2D, texId_Background);
            
            BitmapData bmpData = testImage.LockBits(new Rectangle(0, 0, testImage.Width, testImage.Height), System.Drawing.Imaging.ImageLockMode.ReadOnly, testImage.PixelFormat);
            GL.TexImage2D(TextureTarget.Texture2D, 0, PixelInternalFormat.Rgb, testImage.Width, testImage.Height, 0, OpenTK.Graphics.PixelFormat.Rgb, PixelType.UnsignedByte, bmpData.Scan0);
            testImage.UnlockBits(bmpData);
            GL.TexParameter(TextureTarget.Texture2D, TextureParameterName.TextureMinFilter, (int)TextureMinFilter.Linear);
            GL.TexParameter(TextureTarget.Texture2D, TextureParameterName.TextureMagFilter, (int)TextureMagFilter.Linear);

            testImage.Dispose();
        }

        private void LoadModel()
        {
            currentModel = new Model3D(modelName, textureName);
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
    }
}
