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
            setup();
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
            try
            {
                Alimento alimento = new Alimento();
                alimento.Nombre = Alimentos_textbox_nombre.Text;
                alimento.TipoAlimento = Alimentos_textbox_tipo.Text;
                alimento.Calorias = Convert.ToInt32(Alimentos_textbox_calorias.Text);

                bllAlimento.agregar(alimento);
                refrescar();
            }catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

        }

        private void Alimentos_Load(object sender, EventArgs e)
        {
            try
            {
                refrescar();
            }catch(Exception ex)
            {
                MessageBox.Show(NuSmartMessage.formatearMensaje("Error_messagebox_carga_formulario"));
                MessageBox.Show(ex.Message);
            }
        }

        private void refrescar()
        {
            dataGridView1.DataSource = bllAlimento.obtenerTodos();
            dataGridView2.DataSource = bllPlato.obtenerTodos();
            dataGridView3.DataSource = bllPlato.obtenerTodos("esDesayuno");
            AgregarDieta_label_desayuno.Checked = true;
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
            try
            {
                platoActual = new Plato();
                platoActual.Nombre = Alimentos_textbox_nombre_plato.Text;
                platoActual.Calorias = Convert.ToInt32(Alimentos_textbox_calorias_plato.Text);
                platoActual.EsDesayuno = Alimentos_checkbox_desayuno.Checked;
                platoActual.EsMerienda = Alimentos_checkbox_merienda.Checked;
                platoActual.EsColacion = Alimentos_checkbox_colacion.Checked;
                platoActual.EsPlatoPrincipal = Alimentos_checkbox_plato_principal.Checked;

                platoActual.Alimentos = listBox1.Items.OfType<Alimento>().ToList();
                bllPlato.agregar(platoActual);
                refrescar();
            }
            catch (Exception ex)
            {
                MessageBox.Show(NuSmartMessage.formatearMensaje("Alimentos_messagebox_verificar"));
                MessageBox.Show(ex.Message);
            }
        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            try
            {
                Alimento alimento = (Alimento)dataGridView1.SelectedCells[0].OwningRow.DataBoundItem;
                listBox1.Items.Add(alimento);
            }catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

        }

        private void button7_Click(object sender, EventArgs e)
        {
            try
            {
                dataGridView2.ClearSelection();
                listBox1.DataSource = null;
                platoActual = null;
                Alimento_textbox_mostrar_nombre_plato.Text = "";
                Alimentos_label_agregar_alimento_a_plato.Enabled = true;
            }catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void dataGridView2_SelectionChanged(object sender, EventArgs e)
        {
            try
            {
                if (dataGridView2.SelectedCells.Count > 0)
                {
                    Plato platoActual = (Plato)(dataGridView2.SelectedCells[0].OwningRow.DataBoundItem);
                    Alimentos_label_agregar_alimento_a_plato.Enabled = false;
                    listBox1.DataSource = ((Plato)(dataGridView2.SelectedCells[0].OwningRow.DataBoundItem)).Alimentos;
                    Alimento_textbox_mostrar_nombre_plato.Text = platoActual.Nombre;
                }
            }catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

        }

        private void dataGridView2_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void GestionDieta_radiobutton_desayuno_CheckedChanged(object sender, EventArgs e)
        {
            cambiarTipoDePlato("esDesayuno");
        }

        private void GestionDieta_radiobutton_colacion_CheckedChanged(object sender, EventArgs e)
        {
            cambiarTipoDePlato("esColacion");
        }

        private void GestionDieta_radiobutton_almuerzo_CheckedChanged(object sender, EventArgs e)
        {
            cambiarTipoDePlato("esPlatoPrincipal");
        }

        private void GestionDieta_radiobutton_merienda_CheckedChanged(object sender, EventArgs e)
        {
            cambiarTipoDePlato("esMerienda");
        }

        private void GestionDieta_radiobutton_cena_CheckedChanged(object sender, EventArgs e)
        {
            cambiarTipoDePlato("esPlatoPrincipal");
        }

        private void cambiarTipoDePlato(string tipo)
        {
            limpiar = true;
            dataGridView3.ClearSelection();
            dataGridView3.DataSource = bllPlato.obtenerTodos(tipo);
            limpiar = false;
        }

        private void dataGridView3_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
           
        }

        private void dataGridView3_SelectionChanged(object sender, EventArgs e)
        {
            try
            {
                if (diaActual != null && dataGridView3.SelectedCells.Count > 0 && !limpiar)
                {
                    Plato platoSeleccionado = (Plato)dataGridView3.SelectedCells[0].OwningRow.DataBoundItem;
                    if (AgregarDieta_label_desayuno.Checked)
                    {
                        diaActual.Desayuno = platoSeleccionado;
                    }
                    else if (AgregarDieta_label_colacion.Checked)
                    {
                        diaActual.Colacion = platoSeleccionado;
                    }
                    else if (AgregarDieta_label_almuerzo.Checked)
                    {
                        diaActual.Almuerzo = platoSeleccionado;
                    }
                    else if (AgregarDieta_label_merienda.Checked)
                    {
                        diaActual.Merienda = platoSeleccionado;
                    }
                    else if (AgregarDieta_label_cena.Checked)
                    {
                        diaActual.Cena = platoSeleccionado;
                    }
                    actualizarDatosDieta();
                }
            }catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            
        }

        private void listBox2_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                diaActual = (DiaAlimenticio)listBox2.SelectedItem;
                actualizarDatosDieta();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

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
            try
            {
                if (GestionDieta_textbox_nombre_dieta.Text != null && GestionDieta_textbox_nombre_dieta.Text != "")
                {
                    dietaActual.Nombre = GestionDieta_textbox_nombre_dieta.Text;
                    bllDieta.guardar(dietaActual);
                    MessageBox.Show("Alimentos_messagebox_dieta_creada");
                }
                else
                {
                    MessageBox.Show("Alimentos_messagebox_insert_name");
                }    
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
            try
            {
                if (Alimentos_textbox_buscar.Text != null && Alimentos_textbox_buscar.Text != "")
                {
                    dataGridView1.DataSource = bllAlimento.buscarPorNombre(Alimentos_textbox_buscar.Text);
                }else
                {
                    dataGridView1.DataSource = bllAlimento.obtenerTodos();
                }
            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }


        private void Alimentos_button_limpiar_colacion_Click(object sender, EventArgs e)
        {

        }
    }
}
