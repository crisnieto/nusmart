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
    public partial class NuevaDieta : Form
    {

        BLLAlimento bllAlimento;
        BLLPlato bllPlato;
        Dieta dietaActual;
        DiaAlimenticio diaActual;
        BLLDieta bllDieta;
        bool limpiar;

        public NuevaDieta()
        {
            bllAlimento = new BLLAlimento();
            bllPlato = new BLLPlato();
            dietaActual = new Dieta();
            bllDieta = new BLLDieta();
            InitializeComponent();

        }

        private void NuevaDieta_Load(object sender, EventArgs e)
        {
            dataGridView1.DataSource = bllPlato.obtenerTodos("esDesayuno");
            dataGridView2.DataSource = bllAlimento.obtenerTodos();
            dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.AllCells;
            dataGridView2.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.AllCells;

            listBox1.Items.Add(dietaActual.Lunes);
            listBox1.Items.Add(dietaActual.Martes);
            listBox1.Items.Add(dietaActual.Miercoles);
            listBox1.Items.Add(dietaActual.Jueves);
            listBox1.Items.Add(dietaActual.Viernes);
            listBox1.Items.Add(dietaActual.Sabado);
            listBox1.Items.Add(dietaActual.Domingo);

        }

        private void listBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            diaActual = (DiaAlimenticio)listBox1.SelectedItem;

            actualizarDatos();
        }

        private void GestionDieta_radiobutton_desayuno_CheckedChanged(object sender, EventArgs e)
        {
            limpiar = true;
            dataGridView1.ClearSelection();
            dataGridView1.DataSource = bllPlato.obtenerTodos("esDesayuno");
            limpiar = false;
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void actualizarDatos()
        {
            GestionDieta_textbox_desayuno.Text = diaActual.Desayuno != null ? diaActual.Desayuno.Nombre : "";
            GestionDieta_textbox_colacion.Text = diaActual.Colacion != null ? diaActual.Colacion.Nombre : "";
            GestionDieta_textbox_almuerzo.Text = diaActual.Almuerzo != null ? diaActual.Almuerzo.Nombre : "";
            GestionDieta_textbox_merienda.Text = diaActual.Merienda != null ? diaActual.Merienda.Nombre : "";
            GestionDieta_textbox_cena.Text = diaActual.Cena != null ? diaActual.Cena.Nombre : "";

            GestionDieta_textbox_calorias.Text = bllDieta.calcularCalorias(dietaActual).ToString();
        }

        private void dataGridView1_SelectionChanged(object sender, EventArgs e)
        {
            if (diaActual != null && dataGridView1.SelectedCells.Count > 0 && !limpiar)
            {
                Plato platoSeleccionado = (Plato)dataGridView1.SelectedCells[0].OwningRow.DataBoundItem;
                if (GestionDieta_radiobutton_desayuno.Checked)
                {
                    diaActual.Desayuno = platoSeleccionado;
                }
                else if (GestionDieta_radiobutton_colacion.Checked)
                {
                    diaActual.Colacion = platoSeleccionado;
                }
                else if (GestionDieta_radiobutton_almuerzo.Checked)
                {
                    diaActual.Almuerzo = platoSeleccionado;
                }
                else if (GestionDieta_radiobutton_merienda.Checked)
                {
                    diaActual.Merienda = platoSeleccionado;
                }
                else if (GestionDieta_radiobutton_cena.Checked)
                {
                    diaActual.Cena = platoSeleccionado;
                }
                actualizarDatos();
            }
        }

        private void dataGridView2_SelectionChanged(object sender, EventArgs e)
        {

            if(diaActual != null && dataGridView2.SelectedCells.Count > 0)
            {
                Plato alimentoSeleccionado = (Plato)dataGridView2.SelectedCells[0].OwningRow.DataBoundItem;
                if (GestionDieta_radiobutton_desayuno.Checked)
                {
                    diaActual.Desayuno = alimentoSeleccionado;
                }
                else if (GestionDieta_radiobutton_colacion.Checked)
                {
                    diaActual.Colacion = alimentoSeleccionado;
                }
                else if (GestionDieta_radiobutton_almuerzo.Checked)
                {
                    diaActual.Almuerzo = alimentoSeleccionado;
                }
                else if (GestionDieta_radiobutton_merienda.Checked)
                {
                    diaActual.Merienda = alimentoSeleccionado;
                }
                else if (GestionDieta_radiobutton_cena.Checked)
                {
                    diaActual.Cena = alimentoSeleccionado;
                }
                actualizarDatos();
            }

        }

        private void button2_Click(object sender, EventArgs e)
        {
            diaActual.Desayuno = null;
            limpiarSeleccion(GestionDieta_textbox_desayuno);
        }

        private void limpiarSeleccion(TextBox textbox)
        {
            textbox.Text = "";
            dataGridView1.ClearSelection();
            dataGridView2.ClearSelection();
            GestionDieta_textbox_calorias.Text = bllDieta.calcularCalorias(dietaActual).ToString();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            diaActual.Colacion = null;
            limpiarSeleccion(GestionDieta_textbox_colacion);

        }

        private void button4_Click(object sender, EventArgs e)
        {
            diaActual.Almuerzo = null;
            limpiarSeleccion(GestionDieta_textbox_almuerzo);
        }

        private void button5_Click(object sender, EventArgs e)
        {
            diaActual.Merienda = null;
            limpiarSeleccion(GestionDieta_textbox_merienda);
        }

        private void button6_Click(object sender, EventArgs e)
        {
            diaActual.Cena = null;
            limpiarSeleccion(GestionDieta_textbox_cena);
        }

        private void GestionDieta_radiobutton_colacion_CheckedChanged(object sender, EventArgs e)
        {
            limpiar = true;
            dataGridView1.ClearSelection();
            dataGridView1.DataSource = bllPlato.obtenerTodos("esColacion");
            limpiar = false;

        }

        private void GestionDieta_radiobutton_almuerzo_CheckedChanged(object sender, EventArgs e)
        {
            limpiar = true;
            dataGridView1.ClearSelection();
            dataGridView1.DataSource = bllPlato.obtenerTodos("esPlatoPrincipal");
            limpiar = false;
        }

        private void GestionDieta_radiobutton_merienda_CheckedChanged(object sender, EventArgs e)
        {
            limpiar = true;
            dataGridView1.ClearSelection();
            dataGridView1.DataSource = bllPlato.obtenerTodos("esMerienda");
            limpiar = false;
        }

        private void GestionDieta_radiobutton_cena_CheckedChanged(object sender, EventArgs e)
        {
            limpiar = true;
            dataGridView1.ClearSelection();
            dataGridView1.DataSource = bllPlato.obtenerTodos("esPlatoPrincipal");
            limpiar = false;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if(GestionDieta_textbox_nombre_dieta.Text != null && GestionDieta_textbox_nombre_dieta.Text != "")
            {
                dietaActual.Nombre = GestionDieta_textbox_nombre_dieta.Text;
            }else
            {
                MessageBox.Show("Por favor introduzca un nombre");
            }
            try
            {
                bllDieta.guardar(dietaActual);
            }catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}
