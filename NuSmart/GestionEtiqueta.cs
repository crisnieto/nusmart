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
    public partial class GestionEtiqueta : Form
    {
        BLLIdioma bllIdioma;
        BLLLeyenda bllLeyenda;
        Idioma idiomaSeleccionado;
        Leyenda leyendaSeleccionada;

        public GestionEtiqueta()
        {
            InitializeComponent();
            bllIdioma = new BLLIdioma();
            bllLeyenda = new BLLLeyenda();

        }

        private void GestionEtiqueta_Load(object sender, EventArgs e)
        {
            comboBox1.DataSource = bllIdioma.conseguirIdiomas();
            dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dataGridView1.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dataGridView1.MultiSelect = false;
            dataGridView1.ReadOnly = true;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            recargarEtiquetas();
        }

        private void recargarEtiquetas()
        {
            dataGridView1.DataSource = bllLeyenda.conseguirLeyendasParaIdioma(idiomaSeleccionado.Id);
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            idiomaSeleccionado = (Idioma)comboBox1.SelectedItem;
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            leyendaSeleccionada = (Leyenda)dataGridView1.CurrentRow.DataBoundItem;
            GestionEtiqueta_textbox_nombre_control.Text = leyendaSeleccionada.NombreControl;
            GestionEtiqueta_textbox_texto_leyenda.Text = leyendaSeleccionada.Texto;
        }

        private void GestionEtiqueta_textbox_nombre_control_TextChanged(object sender, EventArgs e)
        {

        }

        private void GestionEtiqueta_textbox_texto_leyenda_TextChanged(object sender, EventArgs e)
        {

        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            leyendaSeleccionada = (Leyenda)dataGridView1.CurrentRow.DataBoundItem;
            GestionEtiqueta_textbox_nombre_control.Text = leyendaSeleccionada.NombreControl;
            GestionEtiqueta_textbox_texto_leyenda.Text = leyendaSeleccionada.Texto;
        }

        private void button3_Click(object sender, EventArgs e)
        {

            bllLeyenda.eliminarLeyenda(leyendaSeleccionada);
            recargarEtiquetas();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            leyendaSeleccionada.NombreControl = GestionEtiqueta_textbox_nombre_control.Text;
            leyendaSeleccionada.Texto = GestionEtiqueta_textbox_texto_leyenda.Text;
            bllLeyenda.modificarLeyenda(leyendaSeleccionada);
            recargarEtiquetas();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Leyenda leyenda = new Leyenda();
            leyenda.NombreControl = GestionEtiqueta_textbox_nombre_control.Text;
            leyenda.Texto = GestionEtiqueta_textbox_texto_leyenda.Text;
            bllLeyenda.crearLeyenda(leyenda, idiomaSeleccionado);
            recargarEtiquetas();
        }
    }
}
