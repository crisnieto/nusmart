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
using NuSmart.BLL;

namespace NuSmart
{
    public partial class Agenda : FormObserver
    {
        bool sessionOut = false;

        public Agenda()
        {
            InitializeComponent();
            base.setup();
            agenda_lbl_username.Text = Sesion.Instancia().UsuarioActual.Username;
        }

        private void Agenda_Load(object sender, EventArgs e)
        {
            agenda_btn_bitacora.Enabled = Sesion.Instancia().UsuarioActual.validar("OP45");
            agenda_btn_backup.Enabled = Sesion.Instancia().UsuarioActual.validar("OP46");
            agenda_btn_gestion_pacientes.Enabled = Sesion.Instancia().UsuarioActual.validar("GE100");
            agenda_btn_gestion_comidas.Enabled = Sesion.Instancia().UsuarioActual.validar("GE102");
            agenda_btn_gestion_ejercicios.Enabled = Sesion.Instancia().UsuarioActual.validar("GE102");
            agenda_btn_gestion_dietas.Enabled = Sesion.Instancia().UsuarioActual.validar("GE102");
            agenda_btn_micuenta.Enabled = Sesion.Instancia().UsuarioActual.validar("GE110");
            agenda_btn_usuarios.Enabled = Sesion.Instancia().UsuarioActual.validar("AA099");
            agenda_btn_start_appointment.Enabled = Sesion.Instancia().UsuarioActual.validar("AA099");
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
            new BLLBitacora().crearNuevaBitacora("Logout de Usuario", "Se detectó un logout", Criticidad.Baja);
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

        private void button6_Click_1(object sender, EventArgs e)
        {

        }

        private void btn_gestionar_mi_cuenta_Click(object sender, EventArgs e)
        {
            new MiCuenta().Show();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            new NutricionistaABM().Show();
        }

        private void agenda_btn_idioma_Click(object sender, EventArgs e)
        {
            new Lenguaje().Show();
        }

        private void monthCalendar1_DateChanged(object sender, DateRangeEventArgs e)
        {

        }
    }
}
