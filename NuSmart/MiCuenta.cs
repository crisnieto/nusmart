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

        private void micuenta_btn_cambiar_Click(object sender, EventArgs e)
        {
            if (new BLLUsuario().actualizarPassword(Sesion.Instancia().UsuarioActual, micuenta_txt_cambiar.Text) == 0)
            {
                new BLLBitacora().crearNuevaBitacora("Cambio de Password", "Se ejecutó un cambio de password", Criticidad.Alta);
                MessageBox.Show("Contraseña Actualizada Correctamente");
            }
            else
            {
                MessageBox.Show("Ocurrió un error al actualizar");
            }
        }

        private void MiCuenta_Load(object sender, EventArgs e)
        {
            Nutricionista nutricionista = bllNutricionista.conseguir(Sesion.Instancia().UsuarioActual.Id);
            nutricionista.Usuario = Sesion.Instancia().UsuarioActual;

            micuenta_txt_usuario.Text = nutricionista.Usuario.Username;
            micuenta_txt_apellido.Text = nutricionista.Apellido;
            micuenta_txt_nombre.Text = nutricionista.Nombre;
        }
    }
}
