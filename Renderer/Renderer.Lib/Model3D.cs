using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Drawing;
using OpenTK.Graphics.OpenGL;
using System.Drawing.Imaging;

namespace Renderer.Lib
{
    class Model3D
    {
        ModelData modelData;
        ModelRenderer modelRenderer;

        public Model3D(string modelFile, string textureFile)
        {
            modelData = new ModelData();
            modelRenderer = new ModelRenderer();

            modelData.LoadFromObjFile(modelFile);
            modelRenderer.LoadTexture(textureFile);
            modelRenderer.LoadBuffers(modelData);
        }

        public Model3D(float[] vertices, int[] faces, byte[] textureSource, int textureWidth, int textureHeight)
        {
            modelData = new ModelData();
            modelRenderer = new ModelRenderer();

            modelData.LoadFromArrays(vertices, faces);
            modelRenderer.LoadTexture(textureSource, textureWidth, textureHeight);
            modelRenderer.LoadBuffers(modelData);
        }

        public void Render() { modelRenderer.DrawBuffer(); }
    }
}
