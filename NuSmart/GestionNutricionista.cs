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
    public partial class GestionNutricionista : FormObserver
    {
        BLLUsuario bllUsuario;
        public GestionNutricionista()
        {
            InitializeComponent();
            setup();
            bllUsuario = new BLLUsuario();
        }

        private void GestionNutricionista_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                Usuario usuarioADesbloquear = bllUsuario.conseguir(nutricionista_txt_usuario_desbloquear.Text);
                bllUsuario.reiniciarIntentos(usuarioADesbloquear);
                MessageBox.Show("Usuario desbloqueado correctamente!");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void nutricionista_btn_crear_Click(object sender, EventArgs e)
        {
            try
            {
                Nutricionista nutricionista = new Nutricionista();
                nutricionista.Apellido = nutricionista_txt_apellido.Text;
                nutricionista.Nombre = nutricionista_txt_nombre.Text;
                nutricionista.Matricula = nutricionista_txt_matricula.Text;
                nutricionista.Sexo = nutricionista_txt_sexo.SelectedText;
                nutricionista.Usuario = new Usuario();
                nutricionista.Usuario.Username = nutricionista_txt_usuario.Text;
                nutricionista.Especializacion = nutricionista_txt_especializacion.Text;
                nutricionista.Dni = Convert.ToInt32(nutricionista_txt_dni.Text);

                bllUsuario.crearUsuario(nutricionista.Usuario, nutricionista_txt_contraseña.Text);

                //Consigo el usuario insertado en la BD para continuar, con su correspondiente ID
                nutricionista.Usuario = bllUsuario.conseguir(nutricionista.Usuario.Username);
                BLLNutricionista bllNutricionista = new BLLNutricionista();
                if (bllNutricionista.ingresar(nutricionista) == 0)
                {
                    MessageBox.Show("Nutricionista creado correctamente");
                };
            }
            catch (Exception ex)
            {
                MessageBox.Show("Hubo un error creando al Nutricionista");
            }
        }

        private void nutricionista_txt_usuario_desbloquear_TextChanged(object sender, EventArgs e)
        {

        }

        private void nutricionista_lbl_usuario_desbloquear_Click(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click_1(object sender, EventArgs e)
        {

            try
            {
                Usuario usuarioAReestablecerContrasena = bllUsuario.conseguir(nutricionista_txt_usuario_pwd_restablecer.Text);
                string password = nutricionista_txt_password_restablecer.Text;
                bllUsuario.actualizarPassword(usuarioAReestablecerContrasena, password);
                MessageBox.Show("Contraseña reestablecida correctamente!");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

        }
    }
}
