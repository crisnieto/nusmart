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
    public partial class Ejercicios : Form
    {

        BLLEjercicio bllEjercicio;
        BLLRutina bllRutina;
        Rutina rutinaActual;

        public Ejercicios()
        {
            bllEjercicio = new BLLEjercicio();
            rutinaActual = new Rutina();
            InitializeComponent();
            
        }

        private void Ejercicios_Load(object sender, EventArgs e)
        {
            actualizarEjercicios();
        }

        private void actualizarEjercicios()
        {
            dataGridView1.DataSource = bllEjercicio.obtenerTodos();
            comboBox1.DataSource = bllRutina.obtenerTodos();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Ejercicio ejercicio = new Ejercicio();
            ejercicio.Nombre = Ejercicios_textbox_nombre.Text;
            ejercicio.CaloriasQuemadas = Convert.ToInt32(Ejercicios_numericupdown_calorias.Value);
            bllEjercicio.agregar(ejercicio);
            actualizarEjercicios();
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void numericUpDown8_ValueChanged(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            Rutina rutina = new Rutina();

            DiaEjercicio lunes = new DiaEjercicio();
            DiaEjercicio martes = new DiaEjercicio();
            DiaEjercicio miercoles = new DiaEjercicio();
            DiaEjercicio jueves = new DiaEjercicio();
            DiaEjercicio viernes = new DiaEjercicio();
            DiaEjercicio sabado = new DiaEjercicio();
            DiaEjercicio domingo = new DiaEjercicio();

            lunes.Duracion = (int)Ejercicios_numericupdown_lunes.Value;
            lunes.Ejercicio = (Ejercicios_textbox_lunes.DataBindings)

            martes.Duracion = (int)Ejercicios_numericupdown_martes.Value;
            miercoles.Duracion = (int)Ejercicios_numericupdown_miercoles.Value;
            jueves.Duracion = (int)Ejercicios_numericupdown_jueves.Value;
            viernes.Duracion = (int)Ejercicios_numericupdown_viernes.Value;
            sabado.Duracion = (int)Ejercicios_numericupdown_sabado.Value;
            domingo.Duracion = (int)Ejercicios_numericupdown_domingo.Value;


            bllRutina.agregar()
        }
    }
}
