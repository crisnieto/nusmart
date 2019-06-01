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
    public partial class Contenedor : FormObserver
    {
        bool sessionOut = false;

        public Contenedor()
        {
            InitializeComponent();
            base.setup();
            this.WindowState = FormWindowState.Maximized;
            //agenda_lbl_username.Text = Sesion.Instancia().UsuarioActual.Username;
        }

        public override void Actualizar()
        {
            base.Actualizar();
            //bllIdioma.conseguirLeyendaMenu(menuStrip1);
            reloadMainMenu(menuStrip1);
        }

        private void Agenda_Load(object sender, EventArgs e)
        {
            reloadMainMenu(menuStrip1);
            menu_gestion_bitacora.Enabled = Sesion.Instancia().UsuarioActual.validar("OP45");
            menu_gestion_backup.Enabled = Sesion.Instancia().UsuarioActual.validar("OP46");
            menu_gestion_pacientes.Enabled = Sesion.Instancia().UsuarioActual.validar("GE100");
            menu_gestion_comidas.Enabled = Sesion.Instancia().UsuarioActual.validar("GE102");
            menu_gestion_ejercicios.  Enabled = Sesion.Instancia().UsuarioActual.validar("GE102");
            menu_gestion_dietas.Enabled = Sesion.Instancia().UsuarioActual.validar("GE102");
            menu_gestion_micuenta.Enabled = Sesion.Instancia().UsuarioActual.validar("GE110");
            menu_gestion_nutricionistas.Enabled = Sesion.Instancia().UsuarioActual.validar("AA099");
            //agenda_btn_start_appointment.Enabled = Sesion.Instancia().UsuarioActual.validar("GE100");
            //agenda_btn_erase_appointment.Enabled = Sesion.Instancia().UsuarioActual.validar("GE100");

        }

        private void CargarMenu()
        {
            foreach(Rol rol in Sesion.Instancia().UsuarioActual.Roles)
            {
                if(rol is Familia)
                {
                    ToolStripItem item = menuStrip1.Items.Add(rol.Descripcion);
                    CargarAFamilia(rol.mostrar(), item);
                }
            }
        }

        private void CargarAFamilia(List<Rol> roles, ToolStripItem item)
        {
            foreach(Rol rol in roles)
            {

            }
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
            new GestionNutricionistas().Show();
        }

        private void agenda_btn_idioma_Click(object sender, EventArgs e)
        {
            new Lenguaje().Show();
        }

        private void monthCalendar1_DateChanged(object sender, DateRangeEventArgs e)
        {

        }

        private void nToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void menu_gestionar_cuenta_Click(object sender, EventArgs e)
        {

        }

        private void gestionarTurnosToolStripMenuItem_Click(object sender, EventArgs e)
        {
            crearFormulario(typeof(Turnos));
        }

        private void cambiarIdiomaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            crearFormulario(typeof(Lenguaje));
        }

        private void crearFormulario(Type clase)
        {
            //Este metodo sirve para asegurar que no existan ventanas duplicadas en el MDI
            bool formOpened = false;
            foreach (Form form in Application.OpenForms)
            {
                if (form.GetType() == clase)
                {
                    formOpened = true;
                    break;
                }
            }
            if (!formOpened)
            {
                Form child = (Form)Activator.CreateInstance(clase);
                child.MdiParent = this;
                child.Show();
            }
        }

        private void miCuentaToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void menu_gestion_bitacora_Click(object sender, EventArgs e)
        {
            crearFormulario(typeof(Bitacora));
        }

        private void menu_gestion_backup_Click(object sender, EventArgs e)
        {
            crearFormulario(typeof(BackupManager));
        }

        private void menu_gestion_nutricionistas_Click(object sender, EventArgs e)
        {
            crearFormulario(typeof(GestionNutricionistas));
        }

        private void gestionarIdiomasToolStripMenuItem_Click(object sender, EventArgs e)
        {
            crearFormulario(typeof(GestionIdioma));
        }

        private void gestionarEtiquetasToolStripMenuItem_Click(object sender, EventArgs e)
        {
            crearFormulario(typeof(GestionLeyenda));
        }

        private void menuStrip1_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {

        }

        private void gestiónDeRolesToolStripMenuItem_Click(object sender, EventArgs e)
        {
            crearFormulario(typeof(Roles));
        }
    }
}
