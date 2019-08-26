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
    }
}
