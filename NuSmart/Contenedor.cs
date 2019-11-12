using System;
using System.Windows.Forms;
using NuSmart.BLL;
using NuSmart.BE;

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
            this.MaximizeBox = true;
            //agenda_lbl_username.Text = Sesion.Instancia().UsuarioActual.Username;
        }

        public override void Actualizar()
        {
            base.Actualizar();
            //bllIdioma.conseguirLeyendaMenu(menuStrip1);
            reloadMainMenu(menuStrip1);
        }


        private void Contenedor_Load(object sender, EventArgs e)
        {
            //TODO: Validar el Rol del usuario para validar qué opciones se muestran
            reloadMainMenu(menuStrip1);
            Contenedor_menu_gestion_bitacora.Enabled = Sesion.Instancia().validar("OP45");
            Contenedor_menu_backup.Enabled = Sesion.Instancia().validar("OP46");
            Contenedor_menu_gestion_pacientes.Enabled = Sesion.Instancia().validar("GE100");
            Contenedor_menu_gestion_alimentos.Enabled = Sesion.Instancia().validar("GE102");
            Contenedor_menu_gestion_ejercicios.Enabled = Sesion.Instancia().validar("GE102");
            Contenedor_menu_gestion_micuenta.Enabled = Sesion.Instancia().validar("GE110");
            Contenedor_menu_gestion_nutricionistas.Enabled = Sesion.Instancia().validar("AA099");
            Contenedor_menu_roles.Enabled = Sesion.Instancia().validar("AA099");
            Contenedor_menu_gestion_turnos.Enabled = Sesion.Instancia().validar("GE101");
            Contenedor_menu_gestion_bitacora.Enabled = Sesion.Instancia().validar("AA099");
            Contenedor_menu_gestion_idioma.Enabled = Sesion.Instancia().validar("OP83");
            Contenedor_menu_gestion_etiquetas.Enabled = Sesion.Instancia().validar("OP84");

            ocultarItems();
        }

        private void menu_gestion_bitacora_Click(object sender, EventArgs e)
        {
            crearFormulario(typeof(Bitacora));
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

        private void menu_cerrar_sesion_Click(object sender, EventArgs e)
        {
            new BLLBitacora().crearNuevaBitacora("Logout de Usuario", "Se detectó un logout", Criticidad.Baja);
            Sesion.Instancia().Eliminar();
            new Lenguaje().Show();
            sessionOut = true;
            this.Close();
        }

        private void menu_gestion_nutricionistas_Click(object sender, EventArgs e)
        {
            crearFormulario(typeof(GestionNutricionista));
        }

        private void Contenedor_FormClosed(object sender, FormClosedEventArgs e)
        {
            //Si se está cerrando el formulario (no haciendo un logout),
            //salgo directamente de la aplicación.
            if (sessionOut == false)
            {
                Application.Exit();
            }
        }

        private void menu_micuenta_Click(object sender, EventArgs e)
        {

        }

        private void menu_gestion_micuenta_Click(object sender, EventArgs e)
        {
            crearFormulario(typeof(MiCuenta));
        }

        private void gestiónDeRolesToolStripMenuItem_Click(object sender, EventArgs e)
        {
            crearFormulario(typeof(GestionRoles));
        }

        private void rolesToolStripMenuItem_Click(object sender, EventArgs e)
        {
            crearFormulario(typeof(GestionRoles));
        }

        private void menu_gestion_backup_Click(object sender, EventArgs e)
        {
            crearFormulario(typeof(BackupManager));
        }

        private void menu_gestion_idioma_Click(object sender, EventArgs e)
        {
            crearFormulario(typeof(GestionIdioma));
        }

        private void Contenedor_menu_gestion_etiquetas_Click(object sender, EventArgs e)
        {
            crearFormulario(typeof(GestionEtiqueta));
        }

        private void Cotenedor_menu_cambiar_idioma_Click(object sender, EventArgs e)
        {
            crearFormulario(typeof(Lenguaje));
        }

        private void Contenedor_menu_gestion_pacientes_Click(object sender, EventArgs e)
        {
            crearFormulario(typeof(Pacientes));
        }

        private void Contenedor_menu_turnos_Click(object sender, EventArgs e)
        {
        }

        private void Contenedor_menu_gestion_turnos_Click(object sender, EventArgs e)
        {
            crearFormulario(typeof(MisTurnos));
        }

        private void gestionDeDietasToolStripMenuItem_Click(object sender, EventArgs e)
        {
            crearFormulario(typeof(NuevaDieta));
        }

        private void Contenedor_menu_gestion_ejercicios_Click(object sender, EventArgs e)
        {
            crearFormulario(typeof(Ejercicios));
        }

        private void Contenedor_menu_gestion_alimentos_Click(object sender, EventArgs e)
        {
            crearFormulario(typeof(Alimentos));
        }

        private void Contenedor_menu_dieta_ejercicio_Click(object sender, EventArgs e)
        {
            
        }

        private void menuStrip1_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {

        }

        private void ocultarItems()
        {
            foreach(ToolStripMenuItem toolStrip in menuStrip1.Items)
            {
                if (toolStrip.HasDropDownItems)
                {
                    bool tieneHijosVisibles = false;
                    foreach(ToolStripDropDownItem item in toolStrip.DropDownItems)
                    {
                        if(item.Enabled == true)
                        {
                            tieneHijosVisibles = true;
                        }else
                        {
                            item.Visible = false;
                        }
                    }
                    toolStrip.Visible = tieneHijosVisibles;
                }
                else{
                    if (!toolStrip.Enabled)
                    {
                        toolStrip.Visible = false;
                    }
                }
            }
        }

        private void Contenedor_menu_nutricionistas_Click(object sender, EventArgs e)
        {

        }
    }
}
