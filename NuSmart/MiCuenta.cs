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
    public partial class MiCuenta : FormObserver
    {
        BLLNutricionista bllNutricionista;

        public MiCuenta()
        {
            InitializeComponent();
            setup();
            bllNutricionista = new BLLNutricionista();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (new BLLUsuario().actualizarPassword(Sesion.Instancia().UsuarioActual, micuenta_txt_cambiar.Text) == 0)
            {
                new BLLBitacora().crearNuevaBitacora("Cambio de Password", "Se ejecutó un cambio de password", Criticidad.Media);
                MessageBox.Show("Contraseña Actualizada Correctamente");
            }
            else
            {
                MessageBox.Show("Ocurrió un error al actualizar");
            }
           
        }

        private void MiCuenta_Load(object sender, EventArgs e)
        {
            Nutricionista nutricionista = bllNutricionista.conseguir(Sesion.Instancia().UsuarioActual.ID);
            nutricionista.Usuario = Sesion.Instancia().UsuarioActual;

            micuenta_txt_usuario.Text = nutricionista.Usuario.Username;
            micuenta_txt_apellido.Text = nutricionista.Apellido;
            micuenta_txt_nombre.Text = nutricionista.Nombre;
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void micuenta_txt_cambiar_TextChanged(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            Nutricionista nutricionista = bllNutricionista.conseguir(Sesion.Instancia().UsuarioActual.ID);
            nutricionista.Usuario = Sesion.Instancia().UsuarioActual;
            Console.WriteLine("DVH ACTUAL: " + bllNutricionista.calcularDVH(nutricionista));
        }
    }
}
