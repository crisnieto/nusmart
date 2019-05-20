using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using NuSmart.BE;

namespace NuSmart
{
    public partial class Agenda : FormObserver
    {
        bool sessionOut = false;

        public Agenda()
        {
            InitializeComponent();
        }

        private void Agenda_Load(object sender, EventArgs e)
        {
            agenda_btn_bitacora.Enabled = Sesion.Instancia().UsuarioActual.validar("OP45");
            agenda_btn_backup.Enabled = Sesion.Instancia().UsuarioActual.validar("OP46");
            agenda_btn_gestion_pacientes.Enabled = Sesion.Instancia().UsuarioActual.validar("GE100");
        }


        private void Agenda_Closing(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            new Bitacora().Show();
        }

        private void button3_Click(object sender, EventArgs e)
        {

        }

        private void button6_Click(object sender, EventArgs e)
        {
            new BackupManager().Show();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            Sesion.Instancia().Eliminar();
            new Lenguaje().Show();
            sessionOut = true;
            this.Close();
        }

        private void Agenda_FormClosed(object sender, FormClosedEventArgs e)
        {
            //Si se está cerrando el formulario (no haciendo un logout),
            //salgo directamente de la aplicación.
            if (sessionOut == false)
            {
                Application.Exit();
            }

                
        }

        private void button2_Click(object sender, EventArgs e)
        {

        }
    }
}
