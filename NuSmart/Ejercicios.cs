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
    public partial class Ejercicios : FormObserver
    {

        BLLEjercicio bllEjercicio;
        BLLRutina bllRutina;
        Rutina rutinaActual;
        Rutina rutinaCargada;
        bool cargando;

        public Ejercicios()
        {
            bllEjercicio = new BLLEjercicio();
            bllRutina = new BLLRutina();
            rutinaActual = new Rutina();

            InitializeComponent();
            setup();
        }

        private void Ejercicios_Load(object sender, EventArgs e)
        {
            try
            {
                dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
                cargando = true;
                actualizarEjercicios();
                cargando = false;
            }catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

        }

        private void actualizarEjercicios()
        {
            dataGridView1.DataSource = bllEjercicio.obtenerTodos();
            comboBox1.DataSource = bllRutina.obtenerTodos();
            comboBox1.SelectedIndex = -1;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                Ejercicio ejercicio = new Ejercicio();
                ejercicio.Nombre = Ejercicios_textbox_nombre.Text;
                ejercicio.CaloriasQuemadas = Convert.ToInt32(Ejercicios_numericupdown_calorias.Value);
                bllEjercicio.agregar(ejercicio);
                actualizarEjercicios();
            }catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void numericUpDown8_ValueChanged(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            try
            {



                rutinaActual.DiaEjercicioLunes.Duracion = (int)Ejercicios_numericupdown_lunes.Value;
                rutinaActual.DiaEjercicioMartes.Duracion = (int)Ejercicios_numericupdown_martes.Value;
                rutinaActual.DiaEjercicioMiercoles.Duracion = (int)Ejercicios_numericupdown_miercoles.Value;
                rutinaActual.DiaEjercicioJueves.Duracion = (int)Ejercicios_numericupdown_jueves.Value;
                rutinaActual.DiaEjercicioViernes.Duracion = (int)Ejercicios_numericupdown_viernes.Value;
                rutinaActual.DiaEjercicioSabado.Duracion = (int)Ejercicios_numericupdown_sabado.Value;
                rutinaActual.DiaEjercicioDomingo.Duracion = (int)Ejercicios_numericupdown_domingo.Value;
                rutinaActual.Nombre = Ejercicios_textbox_rutinaNombre.Text;


                bllRutina.agregar(rutinaActual);
                MessageBox.Show("OK");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void dataGridView1_SelectionChanged(object sender, EventArgs e)
        {
            try
            {
                if (rutinaCargada == null)
                {
                    if (AgregarDieta_dia_lunes.Checked)
                    {
                        rutinaActual.DiaEjercicioLunes.Ejercicio = (Ejercicio)dataGridView1.SelectedCells[0].OwningRow.DataBoundItem;
                        Ejercicios_textbox_lunes.Text = rutinaActual.DiaEjercicioLunes.Ejercicio.ToString();

                    }
                    else if (AgregarDieta_dia_martes.Checked)
                    {
                        rutinaActual.DiaEjercicioMartes.Ejercicio = (Ejercicio)dataGridView1.SelectedCells[0].OwningRow.DataBoundItem;
                        Ejercicios_textbox_martes.Text = rutinaActual.DiaEjercicioMartes.Ejercicio.ToString();
                    }
                    else if (AgregarDieta_dia_miercoles.Checked)
                    {
                        rutinaActual.DiaEjercicioMiercoles.Ejercicio = (Ejercicio)dataGridView1.SelectedCells[0].OwningRow.DataBoundItem;
                        Ejercicios_textbox_miercoles.Text = rutinaActual.DiaEjercicioMiercoles.Ejercicio.ToString();
                    }
                    else if (AgregarDieta_dia_jueves.Checked)
                    {
                        rutinaActual.DiaEjercicioJueves.Ejercicio = (Ejercicio)dataGridView1.SelectedCells[0].OwningRow.DataBoundItem;
                        Ejercicios_textbox_jueves.Text = rutinaActual.DiaEjercicioJueves.Ejercicio.ToString();
                    }
                    else if (AgregarDieta_dia_viernes.Checked)
                    {
                        rutinaActual.DiaEjercicioViernes.Ejercicio = (Ejercicio)dataGridView1.SelectedCells[0].OwningRow.DataBoundItem;
                        Ejercicios_textbox_viernes.Text = rutinaActual.DiaEjercicioViernes.Ejercicio.ToString();
                    }
                    else if (AgregarDieta_dia_sabado.Checked)
                    {
                        rutinaActual.DiaEjercicioSabado.Ejercicio = (Ejercicio)dataGridView1.SelectedCells[0].OwningRow.DataBoundItem;
                        Ejercicios_textbox_sabado.Text = rutinaActual.DiaEjercicioSabado.Ejercicio.ToString();
                    }
                    else if (AgregarDieta_dia_domingo.Checked)
                    {
                        rutinaActual.DiaEjercicioDomingo.Ejercicio = (Ejercicio)dataGridView1.SelectedCells[0].OwningRow.DataBoundItem;
                        Ejercicios_textbox_domingo.Text = rutinaActual.DiaEjercicioDomingo.Ejercicio.ToString();
                    }
                }
            }catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

          
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (comboBox1.SelectedIndex >= 0 && !cargando)
                {
                    rutinaCargada = (Rutina)comboBox1.SelectedItem;
                    rutinaActual = rutinaCargada;

                    Ejercicios_textbox_lunes.Text = rutinaActual.DiaEjercicioLunes.Ejercicio.Nombre;
                    Ejercicios_numericupdown_lunes.Value = rutinaActual.DiaEjercicioLunes.Duracion;

                    Ejercicios_textbox_martes.Text = rutinaActual.DiaEjercicioMartes.Ejercicio.Nombre;
                    Ejercicios_numericupdown_martes.Value = rutinaActual.DiaEjercicioMartes.Duracion;

                    Ejercicios_textbox_miercoles.Text = rutinaActual.DiaEjercicioMiercoles.Ejercicio.Nombre;
                    Ejercicios_numericupdown_miercoles.Value = rutinaActual.DiaEjercicioMiercoles.Duracion;

                    Ejercicios_textbox_jueves.Text = rutinaActual.DiaEjercicioJueves.Ejercicio.Nombre;
                    Ejercicios_numericupdown_jueves.Value = rutinaActual.DiaEjercicioJueves.Duracion;

                    Ejercicios_textbox_viernes.Text = rutinaActual.DiaEjercicioViernes.Ejercicio.Nombre;
                    Ejercicios_numericupdown_viernes.Value = rutinaActual.DiaEjercicioViernes.Duracion;

                    Ejercicios_textbox_sabado.Text = rutinaActual.DiaEjercicioSabado.Ejercicio.Nombre;
                    Ejercicios_numericupdown_sabado.Value = rutinaActual.DiaEjercicioSabado.Duracion;

                    Ejercicios_textbox_domingo.Text = rutinaActual.DiaEjercicioDomingo.Ejercicio.Nombre;
                    Ejercicios_numericupdown_domingo.Value = rutinaActual.DiaEjercicioDomingo.Duracion;

                    Ejercicios_textbox_lunes.Enabled = false;
                    Ejercicios_numericupdown_lunes.Enabled = false;
                    Ejercicios_textbox_martes.Enabled = false;
                    Ejercicios_numericupdown_martes.Enabled = false;
                    Ejercicios_textbox_miercoles.Enabled = false;
                    Ejercicios_numericupdown_miercoles.Enabled = false;
                    Ejercicios_textbox_jueves.Enabled = false;
                    Ejercicios_numericupdown_jueves.Enabled = false;
                    Ejercicios_textbox_viernes.Enabled = false;
                    Ejercicios_numericupdown_viernes.Enabled = false;
                    Ejercicios_textbox_sabado.Enabled = false;
                    Ejercicios_numericupdown_sabado.Enabled = false;
                    Ejercicios_textbox_domingo.Enabled = false;
                    Ejercicios_numericupdown_domingo.Enabled = false;
                }
            }catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

        }

        private void button3_Click(object sender, EventArgs e)
        {
            try
            {
                limpiar();
            }catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        public void limpiar()
        {
            rutinaCargada = null;
            rutinaActual = new Rutina();

            Ejercicios_numericupdown_lunes.Value = 0;
            Ejercicios_textbox_lunes.Text = "";

            Ejercicios_numericupdown_martes.Value = 0;
            Ejercicios_textbox_martes.Text = "";

            Ejercicios_numericupdown_miercoles.Value = 0;
            Ejercicios_textbox_miercoles.Text = "";

            Ejercicios_numericupdown_jueves.Value = 0;
            Ejercicios_textbox_jueves.Text = "";

            Ejercicios_numericupdown_viernes.Value = 0;
            Ejercicios_textbox_viernes.Text = "";

            Ejercicios_numericupdown_sabado.Value = 0;
            Ejercicios_textbox_sabado.Text = "";

            Ejercicios_numericupdown_domingo.Value = 0;
            Ejercicios_textbox_domingo.Text = "";

            Ejercicios_textbox_lunes.Enabled = true;
            Ejercicios_numericupdown_lunes.Enabled = true;
            Ejercicios_textbox_martes.Enabled = true;
            Ejercicios_numericupdown_martes.Enabled = true;
            Ejercicios_textbox_miercoles.Enabled = true;
            Ejercicios_numericupdown_miercoles.Enabled = true;
            Ejercicios_textbox_jueves.Enabled = true;
            Ejercicios_numericupdown_jueves.Enabled = true;
            Ejercicios_textbox_viernes.Enabled = true;
            Ejercicios_numericupdown_viernes.Enabled = true;
            Ejercicios_textbox_sabado.Enabled = true;
            Ejercicios_numericupdown_sabado.Enabled = true;
            Ejercicios_textbox_domingo.Enabled = true;
            Ejercicios_numericupdown_domingo.Enabled = true;

        }

        private void Ejercicios_radiobutton_martes_CheckedChanged(object sender, EventArgs e)
        {

        }
    }
}
