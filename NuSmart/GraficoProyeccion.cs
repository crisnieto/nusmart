using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Windows.Forms.DataVisualization.Charting;
using NuSmart.BLL;
using NuSmart.BE;

namespace NuSmart
{
    public partial class GraficoProyeccion : Form
    {
        Series serieActual;
        Tratamiento tratamiento;
        Medicion medicion;
        public GraficoProyeccion(Tratamiento tratamiento, Medicion medicion)
        {
            this.tratamiento = tratamiento;
            this.medicion = medicion;
            InitializeComponent();
        }

        private void Proyeccion_Load(object sender, EventArgs e)
        {
            chart1.Series.Remove(chart1.Series["Series1"]);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Proyeccion proyeccion = new BLLProyeccion().calcularProyeccion(DateTime.Today, Convert.ToDouble(textBox1.Text), Convert.ToDouble(textBox2.Text), Convert.ToDouble(textBox3.Text));
            llenarGrafico(proyeccion);
        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void llenarGrafico(Proyeccion proyeccion)
        {
            if(serieActual != null){
                chart1.Series.Remove(serieActual);
            }
            var chart = chart1.ChartAreas[0];
            chart.AxisX.IntervalType = DateTimeIntervalType.Number;
            chart.AxisY.IntervalType = DateTimeIntervalType.Number;
            chart.AxisX.Maximum = proyeccion.Semanas;
            chart.AxisX.Minimum = 0;
            chart.AxisX.Interval = 1;
            
            if(proyeccion.PesoObjetivo <= proyeccion.PesoActual)
            {
                chart.AxisY.Maximum = proyeccion.PesoActual;
                chart.AxisY.Minimum = proyeccion.PesoObjetivo;
            }else
            {
                chart.AxisY.Maximum = proyeccion.PesoObjetivo;
                chart.AxisY.Minimum = proyeccion.PesoActual;
            }

            chart.AxisY.Interval = 1;
            
            serieActual = chart1.Series.Add("Proyeccion");
            chart1.Series["Proyeccion"].ChartType = SeriesChartType.Line;
            chart1.Series["Proyeccion"].Color = Color.Red;
            foreach (PuntoProyeccion punto in proyeccion.Puntos)

            {
                chart1.Series["Proyeccion"].Points.AddXY(punto.puntoFecha, punto.puntoPeso);
            }

        }
    }
}
