using System;
using System.Windows.Forms;
using NuSmart.BLL;
using NuSmart.BE;

namespace NuSmart
{
    public partial class Login : FormObserver
    {
        public Login()
        {
            InitializeComponent();
            base.setup();
        }

        private void Login_Load(object sender, EventArgs e)
        {
            DVVH dvvh = new DVVH();

            try
            {
                dvvh.verificarIntegridad();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                Application.Exit();
            }
        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
            Usuario usuario = new Usuario();

            usuario.Username = txtUsuario.Text;
            usuario.Password = txtPassword.Text;

            BLLUsuario bllUsuario = new BLLUsuario();
            try
            {
                bllUsuario.conseguirUsuarioLogIn(usuario);
                new Contenedor().Show();
                this.Close();
            }
            catch (Exception exception)
            {
                MessageBox.Show(exception.Message);
            }
        }

        private void Login_FormClosed(object sender, FormClosedEventArgs e)
        {
            if (Application.OpenForms.Count == 0)
                Application.Exit();
        }

        private void login_lbl_password_Click(object sender, EventArgs e)
        {

        }
    }
}
