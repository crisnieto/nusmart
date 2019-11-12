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
    public partial class AgregarRutina : FormObserver
    {

        BLLRutina bllRutina;
        BLLTratamiento bllTratamiento;
        Rutina rutinaActual;
        Tratamiento tratamientoActual;
        TratamientoActual tratamientoForm;

        public AgregarRutina(Tratamiento tratamiento, TratamientoActual tratamientoForm)
        {
            tratamientoActual = tratamiento;
            bllRutina = new BLLRutina();
            bllTratamiento = new BLLTratamiento();
            this.tratamientoForm = tratamientoForm;
            InitializeComponent();
            setup();
        }

        private void AgregarRutina_Load(object sender, EventArgs e)
        {
            try
            {
                comboBox1.DataSource = bllRutina.obtenerTodos();
            }catch(Exception ex)
            {
                MessageBox.Show(NuSmartMessage.formatearMensaje("Error_messagebox_carga_formulario"));
                MessageBox.Show(NuSmartMessage.formatearMensaje(ex.Message));
            }
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (comboBox1.SelectedIndex >= 0)
                {
                    rutinaActual = (Rutina)comboBox1.SelectedItem;

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

                    AgregarRutina_label_calorias_semanales.Text = bllRutina.calcularCaloriasQuemadas(rutinaActual).ToString();
                    AgregarDieta_dia_lunes.Checked = true;

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

        private void actualizarCaloriasQuemadasDiarias(DiaEjercicio dia)
        {
            try
            {
                AgregarRutina_label_calorias_dia.Text = dia.Calorias.ToString();
            }catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void Ejercicios_radiobutton_lunes_CheckedChanged(object sender, EventArgs e)
        {
            actualizarCaloriasQuemadasDiarias(rutinaActual.DiaEjercicioLunes);
        }

        private void Ejercicios_radiobutton_martes_CheckedChanged(object sender, EventArgs e)
        {
            actualizarCaloriasQuemadasDiarias(rutinaActual.DiaEjercicioMartes);

        }

        private void Ejercicios_radiobutton_miercoles_CheckedChanged(object sender, EventArgs e)
        {
            actualizarCaloriasQuemadasDiarias(rutinaActual.DiaEjercicioMiercoles);
        }

        private void Ejercicios_radiobutton_jueves_CheckedChanged(object sender, EventArgs e)
        {
            actualizarCaloriasQuemadasDiarias(rutinaActual.DiaEjercicioJueves);
        }

        private void Ejercicios_radiobutton_viernes_CheckedChanged(object sender, EventArgs e)
        {
            actualizarCaloriasQuemadasDiarias(rutinaActual.DiaEjercicioViernes);
        }

        private void Ejercicios_radiobutton_sabado_CheckedChanged(object sender, EventArgs e)
        {
            actualizarCaloriasQuemadasDiarias(rutinaActual.DiaEjercicioSabado);
        }

        private void Ejercicios_radiobutton_domingo_CheckedChanged(object sender, EventArgs e)
        {
            actualizarCaloriasQuemadasDiarias(rutinaActual.DiaEjercicioDomingo);
        }

        private void button3_Click(object sender, EventArgs e)
        {
            try
            {
                tratamientoActual.Rutina = rutinaActual;
                bllTratamiento.agregarRutina(tratamientoActual);

                tratamientoForm.actualizarRutina();

                MessageBox.Show("OK");
            }catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}
