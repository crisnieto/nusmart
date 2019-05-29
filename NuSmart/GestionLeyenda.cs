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
    public partial class GestionLeyenda : FormObserver
    {
        BLLIdioma bllIdioma;
        BLLLeyenda bllLeyenda;
        Idioma idiomaSeleccionado;
        Leyenda leyendaSeleccionada;
        public GestionLeyenda()
        {
            InitializeComponent();
            bllIdioma = new BLLIdioma();
            bllLeyenda = new BLLLeyenda();
            dataGridView1.DataSource = bllIdioma.conseguirIdiomas();
            dataGridView2.Columns.Add("Nombre", "Nombre");
        }

        public void actualizarGrid()
        {
            dataGridView2.Rows.Clear();
            dataGridView2.DataSource = null;
            dataGridView2.Refresh();
            foreach (string nombre in bllLeyenda.conseguirLeyendasPorNombre())
            {
                dataGridView2.Rows.Add(nombre);
            }
            gestion_leyenda_txt_texto.Text = "";
            gestion_leyendas_txt_leyenda_seleccionada.Text = "";
            dataGridView2.ClearSelection();
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void GestionLeyenda_Load(object sender, EventArgs e)
        {
            
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void dataGridView1_SelectionChanged(object sender, EventArgs e)
        {
            idiomaSeleccionado = (Idioma)dataGridView1.CurrentRow.DataBoundItem;
            gestion_leyendas_txt_idioma_seleccionado.Text = idiomaSeleccionado.NombreIdioma;
            actualizarGrid();
        }

        private void dataGridView2_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }


        private void dataGridView2_SelectionChanged(object sender, EventArgs e)
        {
            if(dataGridView2.SelectedCells.Count > 0) {
                string nombre = dataGridView2.SelectedCells[0].Value.ToString();
                gestion_leyendas_txt_leyenda_seleccionada.Text = nombre;
                leyendaSeleccionada = bllLeyenda.conseguirLeyendaParaIdioma(nombre, idiomaSeleccionado.Id);
                gestion_leyenda_txt_texto.Text = leyendaSeleccionada.Texto;
            }
        }
    }
}
