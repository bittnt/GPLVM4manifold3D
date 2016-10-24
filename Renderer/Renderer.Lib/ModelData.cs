using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Globalization;
using System.Diagnostics;
using System.Windows.Forms;

namespace Renderer.Lib
{
    class ModelData
    {
        private List<Vertex> vertices;
        private List<Face> faces;

        private uint[] indicesArray;
        private float[] normalsArray;
        private float[] verticesArray;
        private float[] texCoordsArray;

        public uint[] IndicesArray
        {
            get { return indicesArray; }
            set { indicesArray = value; }
        }
        public float[] NormalsArray
        {
            get { return normalsArray; }
            set { normalsArray = value; }
        }
        public float[] VerticesArray
        {
            get { return verticesArray; }
            set { verticesArray = value; }
        }
        public float[] TexCoordsArray
        {
            get { return texCoordsArray; }
            set { texCoordsArray = value; }
        }

        public void LoadFromObjFile(string fileName)
        {
            vertices = new List<Vertex>();
            faces = new List<Face>();

            string[] lines = File.ReadAllLines(fileName);

            char[] splitChars = { ' ' };
            foreach (string line in lines)
            {
                string[] parameters = line.Trim(splitChars).Replace("  ", " ").Split(splitChars);

                switch (parameters[0])
                {
                    case "p": break;
                    case "vt": break;
                    case "vn": break;

                    case "v":
                        float x = float.Parse(parameters[1], CultureInfo.InvariantCulture.NumberFormat);
                        float y = float.Parse(parameters[2], CultureInfo.InvariantCulture.NumberFormat);
                        float z = float.Parse(parameters[3], CultureInfo.InvariantCulture.NumberFormat);
                        vertices.Add(new Vertex(x, y, z));
                        break;
                    case "f":
                        //todo: proper parse (support with /)
                        int v1 = int.Parse(parameters[1], CultureInfo.InvariantCulture.NumberFormat) - 1;
                        int v2 = int.Parse(parameters[2], CultureInfo.InvariantCulture.NumberFormat) - 1;
                        int v3 = int.Parse(parameters[3], CultureInfo.InvariantCulture.NumberFormat) - 1;
                        faces.Add(new Face(v1, v2, v3));
                        break;
                }
            }

            this.ComputeFaceNormals();
            this.BuildOpenGLArray();
        }

        public void LoadFromArrays(float[] vertices, int[] faces)
        {
            this.vertices = new List<Vertex>();
            this.faces = new List<Face>();

            for (int i = 0; i < vertices.Length / 3; i++)
            {
                Vertex vertex = new Vertex(vertices[i * 3 + 0], vertices[i * 3 + 1], vertices[i * 3 + 2]);
                this.vertices.Add(vertex);
            }

            for (int i = 0; i < faces.Length / 3; i++)
            {
                Face face = new Face(faces[i * 3 + 0], faces[i * 3 + 1], faces[i * 3 + 2]);
                this.faces.Add(face);
            }

            this.ComputeFaceNormals();
            this.BuildOpenGLArray();
        }

        private void ComputeFaceNormals()
        {
            Vertex u, v, n, v1, v2, v3;
            u = new Vertex(); v = new Vertex(); n = new Vertex(); v1 = new Vertex(); v2 = new Vertex(); v3 = new Vertex();
            for (int i = 0; i < faces.Count; i++)
            {
                v1 = vertices[faces[i].VerticesIdx[0]]; v2 = vertices[faces[i].VerticesIdx[1]]; v3 = vertices[faces[i].VerticesIdx[2]];

                // V2 - V3;
                u.X = v2.X - v3.X; u.Y = v2.Y - v3.Y; u.Z = v2.Z - v3.Z;
                // V2 - V1;
                v.X = v2.X - v1.X; v.Y = v2.Y - v1.Y; v.Z = v2.Z - v1.Z;

                n.X = (u.Y * v.Z - u.Z * v.Y); n.Y = (u.Z * v.X - u.X * v.Z); n.Z = (u.X * v.Y - u.Y * v.X);
                n.X = n.X * -1.0f; n.Y = n.Y * -1.0f; n.Z = n.Z * -1.0f;

                faces[i].Normal.Set(n);
            }
        }

        private void BuildOpenGLArray()
        {
            verticesArray = new float[faces.Count * 9];
            normalsArray = new float[faces.Count * 9];
            texCoordsArray = new float[faces.Count * 2];
            indicesArray = new uint[faces.Count * 3];

            for (int faceIdx = 0; faceIdx < faces.Count; faceIdx++)
            {
                Face face = faces[faceIdx];

                for (int pointIdx = 0; pointIdx < 3; pointIdx++)
                {
                    verticesArray[(faceIdx * 3 + pointIdx) * 3 + 0] = vertices[face.VerticesIdx[pointIdx]].X;
                    verticesArray[(faceIdx * 3 + pointIdx) * 3 + 1] = vertices[face.VerticesIdx[pointIdx]].Y;
                    verticesArray[(faceIdx * 3 + pointIdx) * 3 + 2] = vertices[face.VerticesIdx[pointIdx]].Z;
                }

                for (int pointIdx = 0; pointIdx < 3; pointIdx++)
                {
                    normalsArray[(faceIdx * 3 + pointIdx) * 3 + 0] += face.Normal.X;
                    normalsArray[(faceIdx * 3 + pointIdx) * 3 + 1] += face.Normal.Y;
                    normalsArray[(faceIdx * 3 + pointIdx) * 3 + 2] += face.Normal.Z;
                }

                texCoordsArray[faceIdx * 2 + 0] = 0;
                texCoordsArray[faceIdx * 2 + 1] = 0;

                for (int pointIdx = 0; pointIdx < 3; pointIdx++) indicesArray[faceIdx * 3 + pointIdx] = (uint)(faceIdx * 3 + pointIdx);
            }

            float nX, nY, nZ, length;
            for (int faceIdx = 0; faceIdx < faces.Count; faceIdx++)
            {
                for (int pointIdx = 0; pointIdx < 3; pointIdx++)
                {
                    nX = normalsArray[(faceIdx * 3 + pointIdx) * 3 + 0];
                    nY = normalsArray[(faceIdx * 3 + pointIdx) * 3 + 1];
                    nZ = normalsArray[(faceIdx * 3 + pointIdx) * 3 + 2];

                    length = (float)Math.Sqrt((nX * nX) + (nY * nY) + (nZ * nZ));

                    nX /= length; nY /= length; nZ /= length;

                    normalsArray[(faceIdx * 3 + pointIdx) * 3 + 0] = nX;
                    normalsArray[(faceIdx * 3 + pointIdx) * 3 + 1] = nY;
                    normalsArray[(faceIdx * 3 + pointIdx) * 3 + 2] = nZ;
                }
            }
        }
    }

    class Face
    {
        private int[] verticesIdx;
        private Vertex normal;

        public int[] VerticesIdx
        {
            get { return verticesIdx; }
            set { verticesIdx = value; }
        }
        public Vertex Normal
        {
            get { return normal; }
            set { normal = value; }
        }

        public Face(int v1, int v2, int v3)
        {
            normal = new Vertex();
            verticesIdx = new int[3];

            this.verticesIdx[0] = v1;
            this.verticesIdx[1] = v2;
            this.verticesIdx[2] = v3;
        }
    }

    class Vertex
    {
        float x, y, z;

        public float X
        {
            get { return x; }
            set { x = value; }
        }

        public float Y
        {
            get { return y; }
            set { y = value; }
        }

        public float Z
        {
            get { return z; }
            set { z = value; }
        }

        public Vertex()
        { this.Set(0.0f, 0.0f, 0.0f); }

        public Vertex(float x, float y, float z)
        { this.Set(x, y, z); }

        public void Set(Vertex newVertex)
        { this.Set(newVertex.x, newVertex.y, newVertex.z); }

        public void Set(float x, float y, float z)
        {
            this.x = x;
            this.y = y;
            this.z = z;
        }
    }
}
