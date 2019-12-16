using System;
using System.Windows.Forms;
using NuSmart.BE;
using NuSmart.BLL;

namespace NuSmart
{
    public partial class MiCuenta : FormObserver
    {
        BLLNutricionista bllNutricionista;

        public MiCuenta()
        {
            InitializeComponent();
            setup();
            bllNutricionista = new BLLNutricionista();
        }

        private void micuenta_btn_cambiar_Click(object sender, EventArgs e)
        {
            try
            {
                new BLLUsuario().actualizarPassword(micuenta_txt_cambiar.Text);
                MessageBox.Show(NuSmartMessage.formatearMensaje("MiCuenta_messagebox_cambio_password_correcto"));

            } catch (Exception ex)
            {
                MessageBox.Show(ex.Message);

            }
        }

        private void MiCuenta_Load(object sender, EventArgs e)
        {
            try { 
            Nutricionista nutricionista = bllNutricionista.conseguir(Sesion.Instancia().UsuarioActual.Id);
            nutricionista.Usuario = Sesion.Instancia().UsuarioActual;
            micuenta_txt_usuario.Text = nutricionista.Usuario.Username;
            micuenta_txt_apellido.Text = nutricionista.Apellido;
            micuenta_txt_nombre.Text = nutricionista.Nombre;
            }catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
                this.Close();
            }
        }
    }
}
