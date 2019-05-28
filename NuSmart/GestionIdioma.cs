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
    public partial class GestionIdioma : FormObserver
    {
        public GestionIdioma()
        {
            InitializeComponent();
            setup();
        }

        Idioma idiomaSeleccionado;
        BLLIdioma idiomaBLL;

        private void GestionIdioma_Load(object sender, EventArgs e)
        {
            idiomaBLL = new BLLIdioma();
            actualizarGrilla();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
        }

        private void actualizarGrilla()
        {
            dataGridView1.DataSource = idiomaBLL.conseguirIdiomas();
        }

        private void dataGridView1_SelectionChanged(object sender, EventArgs e)
        {
            idiomaSeleccionado = (Idioma)dataGridView1.CurrentRow.DataBoundItem;
            gestion_idioma_txt_descripcion.Text = idiomaSeleccionado.DescripcionIdioma;
            gestion_idioma_txt_idioma.Text = idiomaSeleccionado.NombreIdioma;
        }

        private void gestion_idioma_btn_guardar_Click(object sender, EventArgs e)
        {
            Idioma idiomaAGuardar = new Idioma();
            idiomaAGuardar.NombreIdioma = gestion_idioma_txt_idioma.Text;
            idiomaAGuardar.DescripcionIdioma = gestion_idioma_txt_descripcion.Text;
            idiomaBLL.guardar(idiomaAGuardar);
            actualizarGrilla();
        }

        private void gestion_idioma_btn_eliminar_Click(object sender, EventArgs e)
        {
            idiomaBLL.eliminar(idiomaSeleccionado.Id);
            actualizarGrilla();
        }

        private void gestion_idioma_btn_modificar_Click(object sender, EventArgs e)
        {
            idiomaSeleccionado.NombreIdioma = gestion_idioma_txt_idioma.Text;
            idiomaSeleccionado.DescripcionIdioma = gestion_idioma_txt_idioma.Text;
            idiomaBLL.modificar(idiomaSeleccionado);
            actualizarGrilla();
        }
    }
}
