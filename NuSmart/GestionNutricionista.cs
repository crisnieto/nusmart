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
        BLLNutricionista bllNutricionista;
        List<Usuario> usuarios;
        bool loading = true;
        Usuario usuarioSeleccionado;
        Nutricionista nutricionistaSeleccionado;

        Usuario usuarioADesbloquear;
        Usuario usuarioACambiarPassword;

        public GestionNutricionista()
        {
            InitializeComponent();
            setup();
            bllUsuario = new BLLUsuario();
            bllNutricionista = new BLLNutricionista();
        }

        private void GestionNutricionista_Load(object sender, EventArgs e)
        {
            recargar();
            loading = false;
        }

        private void recargar()
        {
            usuarios = bllUsuario.conseguirUsuarios();
            comboBox1.DataSource = usuarios;
            comboBox2.DataSource = usuarios;
            comboBox3.DataSource = usuarios;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                bllUsuario.reiniciarIntentos(usuarioADesbloquear);
                recargar();
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
                nutricionista.Sexo = nutricionista_txt_sexo.Text;
                nutricionista.Usuario.Username = nutricionista_txt_usuario.Text;
                nutricionista.Usuario.Password = nutricionista_txt_password.Text;
                nutricionista.Especializacion = nutricionista_txt_especializacion.Text;
                nutricionista.Dni = Convert.ToInt32(nutricionista_txt_dni.Text);

                //Consigo el usuario insertado en la BD para continuar, con su correspondiente ID
                if (bllNutricionista.ingresar(nutricionista))
                {
                    MessageBox.Show("Nutricionista creado correctamente");
                    recargar();
                };
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
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
                string password = nutricionista_txt_password_restablecer.Text;
                bllUsuario.actualizarPassword(usuarioACambiarPassword, password);
                recargar();
                MessageBox.Show("Contraseña reestablecida correctamente!");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            usuarioADesbloquear = (Usuario)comboBox1.SelectedItem;
        }

        private void comboBox3_SelectedIndexChanged(object sender, EventArgs e)
        {
                usuarioSeleccionado = (Usuario)comboBox3.SelectedItem;
                nutricionistaSeleccionado = bllNutricionista.conseguir(usuarioSeleccionado.Id);
                nutricionista_txt_apellido.Text = nutricionistaSeleccionado.Apellido;
                nutricionista_txt_dni.Text = Convert.ToString(nutricionistaSeleccionado.Dni);
                nutricionista_txt_matricula.Text = nutricionistaSeleccionado.Matricula;
                nutricionista_txt_especializacion.Text = nutricionistaSeleccionado.Especializacion;
                nutricionista_txt_nombre.Text = nutricionistaSeleccionado.Nombre;
                nutricionista_txt_sexo.Text = nutricionistaSeleccionado.Sexo;
                nutricionista_txt_usuario.Text = "";
                nutricionista_txt_password.Text = "";
        }

        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {
            usuarioACambiarPassword = (Usuario)comboBox2.SelectedItem;
        }

        private void nutricionista_btn_modificar_Click(object sender, EventArgs e)
        {
            nutricionistaSeleccionado.Nombre = nutricionista_txt_nombre.Text;
            nutricionistaSeleccionado.Apellido = nutricionista_txt_apellido.Text;
            nutricionistaSeleccionado.Matricula = nutricionista_txt_matricula.Text;
            nutricionistaSeleccionado.Especializacion = nutricionista_txt_especializacion.Text;
            nutricionistaSeleccionado.Dni = Convert.ToInt32(nutricionista_txt_dni.Text);
            nutricionistaSeleccionado.Sexo = nutricionista_txt_sexo.Text;

            bllNutricionista.modificar(nutricionistaSeleccionado);
            recargar();
        }

        private void nutricionista_btn_borrar_Click(object sender, EventArgs e)
        {
            nutricionistaSeleccionado = bllNutricionista.conseguir(usuarioSeleccionado.Id);
            bllNutricionista.eliminar(nutricionistaSeleccionado);
            recargar();
        }
    }
}
