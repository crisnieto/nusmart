using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
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
            dvvh.verificarIntegridad();
        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
            Usuario usuario = new Usuario();

            usuario.Username = txtUsuario.Text;
            usuario.Password = txtPassword.Text;

            BLLUsuario bllUsuario = new BLLUsuario();
            bllUsuario.conseguirUsuario(usuario);
        }


    }
}
