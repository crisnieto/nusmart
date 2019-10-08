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
        Idioma idiomaSeleccionado;
        BLLIdioma idiomaBLL;

        public GestionIdioma()
        {
            InitializeComponent();
            setup();
        }

        private void GestionIdioma_Load(object sender, EventArgs e)
        {
            try
            {
                idiomaBLL = new BLLIdioma();
                dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
                dataGridView1.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
                dataGridView1.MultiSelect = false;
                dataGridView1.ReadOnly = true;
                actualizarGrilla();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }


        private void actualizarGrilla()
        {
            dataGridView1.DataSource = idiomaBLL.conseguirIdiomas();
        }

        private void gestion_idioma_btn_guardar_Click(object sender, EventArgs e)
        {
            try
            {
                Idioma idiomaAGuardar = new Idioma();
                idiomaAGuardar.NombreIdioma = gestion_idioma_txt_idioma.Text;
                idiomaAGuardar.DescripcionIdioma = gestion_idioma_txt_descripcion.Text;
                idiomaBLL.guardar(idiomaAGuardar);
                actualizarGrilla();
            }catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            
        }

        private void gestion_idioma_btn_modificar_Click(object sender, EventArgs e)
        {

            try
            {
                idiomaSeleccionado.NombreIdioma = gestion_idioma_txt_idioma.Text;
                idiomaSeleccionado.DescripcionIdioma = gestion_idioma_txt_descripcion.Text;
                idiomaBLL.modificar(idiomaSeleccionado);
                actualizarGrilla();
            }catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
}

        private void gestion_idioma_btn_eliminar_Click(object sender, EventArgs e)
        {

            try
            {
                idiomaBLL.eliminar(idiomaSeleccionado.Id);
                actualizarGrilla();
            }catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void dataGridView1_SelectionChanged(object sender, EventArgs e)
        {
            try
            {
                idiomaSeleccionado = (Idioma)dataGridView1.CurrentRow.DataBoundItem;
                gestion_idioma_txt_descripcion.Text = idiomaSeleccionado.DescripcionIdioma;
                gestion_idioma_txt_idioma.Text = idiomaSeleccionado.NombreIdioma;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
