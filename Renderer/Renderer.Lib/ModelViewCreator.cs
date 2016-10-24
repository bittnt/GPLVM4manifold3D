using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OpenTK;

namespace Renderer.Lib
{
    class ModelViewCreator
    {
        public static Matrix4 BuildFromPose(float[] pose)
        {
            float t1, t2, t3, tsq, tsum;
            float[,] em;

            em = new float[4, 4];

            for (int i = 0; i < 4; i++) for (int j = 0; j < 4; j++) em[i, j] = 0;

            t1 = pose[3]; t2 = pose[4]; t3 = pose[5];
            tsq = t1 * t1 + t2 * t2 + t3 * t3;
            tsum = 1 - tsq;

            em[0, 0] = 4 * t1 * t1 - 4 * t2 * t2 - 4 * t3 * t3 + tsum * tsum;
            em[1, 0] = 8 * t1 * t2 - 4 * t3 * tsum;
            em[2, 0] = 8 * t1 * t3 + 4 * t2 * tsum;

            em[0, 1] = 8 * t1 * t2 + 4 * t3 * tsum;
            em[1, 1] = 4 * t2 * t2 - 4 * t1 * t1 - 4 * t3 * t3 + tsum * tsum;
            em[2, 1] = 8 * t2 * t3 - 4 * t1 * tsum;

            em[0, 2] = 8 * t1 * t3 - 4 * t2 * tsum;
            em[1, 2] = 8 * t2 * t3 + 4 * t1 * tsum;
            em[2, 2] = 4 * t3 * t3 - 4 * t2 * t2 - 4 * t1 * t1 + tsum * tsum;

            for (int i = 0; i < 4; i++) for (int j = 0; j < 4; j++) em[i, j] *= 1.0f / ((1.0f + tsq) * (1.0f + tsq));

            em[3, 0] = pose[0];
            em[3, 1] = pose[1];
            em[3, 2] = pose[2];

            em[3, 3] = 1;

            return new Matrix4(em[0,0], em[0,1], em[0,2], em[0,3], em[1,0], em[1,1], em[1,2], em[1,3], em[2,0], em[2,1], em[2,2], em[2,3], em[3,0], em[3,1], em[3,2], em[3,3]);
        }
    }
}
