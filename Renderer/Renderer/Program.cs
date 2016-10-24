using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using Renderer.Lib;
using System.Windows.Forms;
using System.Drawing;
using System.Drawing.Imaging;
using System.Threading;

namespace Renderer
{
    class Program
    {
        [STAThread]
        static void Main()
        {
            //using (Game game = new Game()) 
            //{ 
            //    float[] pose = new float[6];
            //    string dataDir = "../../../../Data/";

            //    pose[0] = 0.1000f; pose[1] = 0.1000f; pose[2] = -4.0000f; pose[3] = 0.1303f; pose[4] = 0.1580f; pose[5] = 0.1507f;

            //    game.TextureName = dataDir + "Out/red.png";
            //    game.ModelName = dataDir + "Out/ana.obj";
            //    game.TestImageName = dataDir + "Out/test.png";
            //    game.Pose = pose;

            //    game.Run(0.0);
            //}

            //using (Game game = new Game())
            //{
            //    float[] pose = new float[6];
            //    string dataDir = "../../../../Data/";

            //    pose[0] = 0.1000f; pose[1] = 0.1000f; pose[2] = -4.0000f; pose[3] = 0.1303f; pose[4] = 0.1580f; pose[5] = 0.1507f;

            //    game.TextureName = dataDir + "Out/red.png";
            //    game.ModelName = dataDir + "Out/ana.obj";
            //    game.TestImageName = dataDir + "Out/test.png";
            //    game.Pose = pose;

            //    game.Run(0.0);
            //}


            RendererWindow game = new RendererWindow();
            float[] pose = new float[6];
            string dataDir = "../../../Data/";

            pose[0] = -0.0065f; pose[1] = 0.0499f; pose[2] = -1.8197f; 
            pose[3] = -0.0156f; pose[4] = 0.0178f; pose[5] = -0.4001f;
            
            game.Set(dataDir + "test.png", dataDir + "ana.obj", dataDir + "red.png");
            game.Pose = pose;

            game.ShowDialog();
            //game.RenderOffScreen();
        }
    }
}
