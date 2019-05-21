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
    public partial class NutricionistaABM : Form
    {
        public NutricionistaABM()
        {
            InitializeComponent();
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            try { 
            Nutricionista nutricionista = new Nutricionista();
            nutricionista.Apellido = nutricionista_txt_apellido.Text;
            nutricionista.Nombre = nutricionista_txt_nombre.Text;
            nutricionista.Matricula = nutricionista_txt_matricula.Text;
            nutricionista.Sexo = nutricionista_txt_sexo.SelectedText;
            nutricionista.Usuario = new Usuario();
            nutricionista.Usuario.Username = nutricionista_txt_usuario.Text;
            nutricionista.Especializacion = nutricionista_txt_especializacion.Text;
            nutricionista.Dni = Convert.ToInt32(nutricionista_txt_dni.Text);

            BLLUsuario bllUsuario = new BLLUsuario();
            bllUsuario.crearUsuario(nutricionista.Usuario, nutricionista_txt_contraseña.Text);

            //Consigo el usuario insertado en la BD para continuar, con su correspondiente ID
            nutricionista.Usuario = bllUsuario.conseguir(nutricionista.Usuario.Username);
               


            BLLNutricionista bllNutricionista = new BLLNutricionista();
            if (bllNutricionista.ingresar(nutricionista) == 0) {
                MessageBox.Show("Nutricionista creado correctamente");
            };
            }catch(Exception ex)
            {
                MessageBox.Show("Hubo un error creando al Nutricionista");
            }
        }

        private void NutricionistaABM_Load(object sender, EventArgs e)
        {

        }

        private void label9_Click(object sender, EventArgs e)
        {

        }
    }
}
