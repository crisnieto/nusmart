using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO;
using NuSmart.BLL;

namespace NuSmart
{
    public partial class BackupManager : FormObserver
    {
        public BackupManager()
        {
            InitializeComponent();
            base.setup();
        }



        private void button2_Click(object sender, EventArgs e)
        {

            saveFileDialog1.Filter = "bak files (*.bak)|*.bak";
            saveFileDialog1.FilterIndex = 1;
            saveFileDialog1.RestoreDirectory = true;

            if (saveFileDialog1.ShowDialog() == DialogResult.OK)
            {
                Console.WriteLine(Path.GetFullPath(saveFileDialog1.FileName));
                BLLBackupManager bllBackupManager = new BLLBackupManager();
                bllBackupManager.crearBackup(Path.GetFullPath(saveFileDialog1.FileName));
            }

        }

        private void button3_Click(object sender, EventArgs e)
        {
            openFileDialog1.Filter = "bak files (*.bak)|*.bak";
            openFileDialog1.FilterIndex = 1;
            openFileDialog1.RestoreDirectory = true;
            if (openFileDialog1.ShowDialog() == DialogResult.OK)
            {
                Console.WriteLine(Path.GetFullPath(openFileDialog1.FileName));
                BLLBackupManager bllBackupManager = new BLLBackupManager();
                bllBackupManager.ejecutarRestore(Path.GetFullPath(openFileDialog1.FileName));
            }


        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void BackupManager_Load(object sender, EventArgs e)
        {

        }
    }
}
