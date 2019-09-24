using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using System.Windows.Forms;
using NuSmart.BLL;
using NuSmart.BE;

namespace NuSmart
{
    public partial class BackupManager : FormObserver
    {
        public BackupManager()
        {
            InitializeComponent();
            setup();
        }

        private void backup_btn_crear_Click(object sender, EventArgs e)
        {
            try
            {
                saveFileDialog1.Filter = "bak files (*.bak)|*.bak";
                saveFileDialog1.FilterIndex = 1;
                saveFileDialog1.RestoreDirectory = true;

                if (saveFileDialog1.ShowDialog() == DialogResult.OK)
                {
                    Console.WriteLine(Path.GetFullPath(saveFileDialog1.FileName));
                    BLLBackupManager bllBackupManager = new BLLBackupManager();

                    if (bllBackupManager.crearBackup(Path.GetFullPath(saveFileDialog1.FileName)) == 0)
                    {
                        MessageBox.Show(NuSmartMessage.formatearMensaje("BackupManager_messagebox_backup_creado"));
                    };
                }
            }catch(Exception ex)
            {
                Console.WriteLine(ex);
                MessageBox.Show(ex.Message);
            }

        }

        private void backup_btn_restaurar_Click(object sender, EventArgs e)
        {
            try
            {
                openFileDialog1.Filter = "bak files (*.bak)|*.bak";
                openFileDialog1.FilterIndex = 1;
                openFileDialog1.RestoreDirectory = true;
                if (openFileDialog1.ShowDialog() == DialogResult.OK)
                {
                    Console.WriteLine(Path.GetFullPath(openFileDialog1.FileName));
                    BLLBackupManager bllBackupManager = new BLLBackupManager();
                    if (bllBackupManager.ejecutarRestore(Path.GetFullPath(openFileDialog1.FileName)) == 0)
                    {
                        MessageBox.Show(NuSmartMessage.formatearMensaje("BackupManager_messagebox_restore_creado"));
                        Application.Exit();
                    }
                }
            }catch(Exception ex)
            {
                Console.WriteLine(ex);
                MessageBox.Show(ex.Message);
            }
        }

        private void BackupManager_Load(object sender, EventArgs e)
        {

        }
    }
}
