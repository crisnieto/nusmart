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
    public partial class Alimentos : FormObserver
    {
        BLLAlimento bllAlimento;
        BLLPlato bllPlato;
        BLLDieta bllDieta;
        Plato platoActual;
        Dieta dietaActual;
        DiaAlimenticio diaActual;
        bool limpiar;

        public Alimentos()
        {
            InitializeComponent();
            bllAlimento = new BLLAlimento();
            bllPlato = new BLLPlato();
            bllDieta = new BLLDieta();
            dietaActual = new Dieta();
            
        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            Alimento alimento = new Alimento();
            alimento.Nombre = Alimentos_textbox_nombre.Text;
            alimento.TipoAlimento = Alimentos_textbox_tipo.Text;
            alimento.Calorias = Convert.ToInt32(Alimentos_textbox_calorias.Text);

            bllAlimento.agregar(alimento);
            refrescar();
        }

        private void Alimentos_Load(object sender, EventArgs e)
        {
            refrescar();
        }

        private void refrescar()
        {
            dataGridView1.DataSource = bllAlimento.obtenerTodos();
            dataGridView2.DataSource = bllPlato.obtenerTodos();
            dataGridView3.DataSource = bllPlato.obtenerTodos("esDesayuno");
            GestionDieta_radiobutton_desayuno.Checked = true;
            dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.AllCells;
            dataGridView2.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.AllCells;
            dataGridView3.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;


            listBox2.Items.Add(dietaActual.Lunes);
            listBox2.Items.Add(dietaActual.Martes);
            listBox2.Items.Add(dietaActual.Miercoles);
            listBox2.Items.Add(dietaActual.Jueves);
            listBox2.Items.Add(dietaActual.Viernes);
            listBox2.Items.Add(dietaActual.Sabado);
            listBox2.Items.Add(dietaActual.Domingo);

        }


        private void button6_Click(object sender, EventArgs e)
        {
            platoActual = new Plato();
            platoActual.Nombre = Alimentos_textbox_nombre_plato.Text;
            try
            {
                platoActual.Calorias = Convert.ToInt32(Alimentos_textbox_calorias_plato.Text);
            }catch(Exception ex)
            {
                platoActual.Calorias = 0;
            }
            platoActual.EsDesayuno = Alimentos_checkbox_desayuno.Checked;
            platoActual.EsMerienda = Alimentos_checkbox_merienda.Checked;
            platoActual.EsColacion = Alimentos_checkbox_colacion.Checked;
            platoActual.EsPlatoPrincipal = Alimentos_checkbox_plato_principal.Checked;

            platoActual.Alimentos = listBox1.Items.OfType<Alimento>().ToList();
            bllPlato.agregar(platoActual);
            refrescar();
        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            Alimento alimento = (Alimento)dataGridView1.SelectedCells[0].OwningRow.DataBoundItem;
            listBox1.Items.Add(alimento);
        }

        private void button7_Click(object sender, EventArgs e)
        {
            dataGridView2.ClearSelection();
            listBox1.DataSource = null;
            platoActual = null;
            Alimento_textbox_mostrar_nombre_plato.Text = "";


        }

        private void dataGridView2_SelectionChanged(object sender, EventArgs e)
        {
            if (dataGridView2.SelectedCells.Count > 0)
            {
                Plato platoActual = (Plato)(dataGridView2.SelectedCells[0].OwningRow.DataBoundItem);
                listBox1.DataSource = ((Plato)(dataGridView2.SelectedCells[0].OwningRow.DataBoundItem)).Alimentos;
                Alimento_textbox_mostrar_nombre_plato.Text = platoActual.Nombre;
            }
        }

        private void dataGridView2_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void GestionDieta_radiobutton_desayuno_CheckedChanged(object sender, EventArgs e)
        {
            limpiar = true;
            dataGridView3.ClearSelection();
            dataGridView3.DataSource = bllPlato.obtenerTodos("esDesayuno");
            limpiar = false;
        }

        private void GestionDieta_radiobutton_colacion_CheckedChanged(object sender, EventArgs e)
        {
            limpiar = true;
            dataGridView3.ClearSelection();
            dataGridView3.DataSource = bllPlato.obtenerTodos("esColacion");
            limpiar = false;
        }

        private void GestionDieta_radiobutton_almuerzo_CheckedChanged(object sender, EventArgs e)
        {
            limpiar = true;
            dataGridView3.ClearSelection();
            dataGridView3.DataSource = bllPlato.obtenerTodos("esPlatoPrincipal");
            limpiar = false;
        }

        private void GestionDieta_radiobutton_merienda_CheckedChanged(object sender, EventArgs e)
        {
            limpiar = true;
            dataGridView3.ClearSelection();
            dataGridView3.DataSource = bllPlato.obtenerTodos("esMerienda");
            limpiar = false;
        }

        private void GestionDieta_radiobutton_cena_CheckedChanged(object sender, EventArgs e)
        {
            limpiar = true;
            dataGridView3.ClearSelection();
            dataGridView3.DataSource = bllPlato.obtenerTodos("esPlatoPrincipal");
            limpiar = false;
        }

        private void dataGridView3_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
           
        }

        private void dataGridView3_SelectionChanged(object sender, EventArgs e)
        {
            if (diaActual != null && dataGridView3.SelectedCells.Count > 0 && !limpiar)
            {
                Plato platoSeleccionado = (Plato)dataGridView3.SelectedCells[0].OwningRow.DataBoundItem;
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
                actualizarDatosDieta();
            }
        }

        private void listBox2_SelectedIndexChanged(object sender, EventArgs e)
        {
            diaActual = (DiaAlimenticio)listBox2.SelectedItem;

            actualizarDatosDieta();
        }

        private void actualizarDatosDieta()
        {
            GestionDieta_textbox_desayuno.Text = diaActual.Desayuno != null ? diaActual.Desayuno.Nombre : "";
            GestionDieta_textbox_colacion.Text = diaActual.Colacion != null ? diaActual.Colacion.Nombre : "";
            GestionDieta_textbox_almuerzo.Text = diaActual.Almuerzo != null ? diaActual.Almuerzo.Nombre : "";
            GestionDieta_textbox_merienda.Text = diaActual.Merienda != null ? diaActual.Merienda.Nombre : "";
            GestionDieta_textbox_cena.Text = diaActual.Cena != null ? diaActual.Cena.Nombre : "";

            GestionDieta_textbox_calorias.Text = bllDieta.calcularCalorias(dietaActual).ToString();
            GestionDieta_textbox_calorias_dia.Text = bllDieta.calcularCaloriasDia(diaActual).ToString();

        }

        private void button13_Click(object sender, EventArgs e)
        {
            if (GestionDieta_textbox_nombre_dieta.Text != null && GestionDieta_textbox_nombre_dieta.Text != "")
            {
                dietaActual.Nombre = GestionDieta_textbox_nombre_dieta.Text;
            }
            else
            {
                MessageBox.Show("Por favor introduzca un nombre");
            }
            try
            {
                bllDieta.guardar(dietaActual);
                MessageBox.Show("Dieta Creada Correctamente");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void button4_Click(object sender, EventArgs e)
        {
        }

        private void Alimentos_textbox_buscar_TextChanged(object sender, EventArgs e)
        {
            if (Alimentos_textbox_buscar.Text != null && Alimentos_textbox_buscar.Text != "")
            {
                dataGridView1.DataSource = bllAlimento.buscarPorNombre(Alimentos_textbox_buscar.Text);
            }
        }
    }
}
