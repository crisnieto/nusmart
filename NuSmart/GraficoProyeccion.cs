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
    public partial class GraficoProyeccion : FormObserver
    {
        Series serieActual;
        Tratamiento tratamiento;
        Medicion medicion;

        public GraficoProyeccion(Tratamiento tratamiento, Medicion medicion)
        {
            this.tratamiento = tratamiento;
            this.medicion = medicion;
            InitializeComponent();
            setup();
        }

        private void Proyeccion_Load(object sender, EventArgs e)
        {
            try
            {
                chart1.Series.Remove(chart1.Series["Series1"]);
                Proyeccion_textbox_pesoInicial.Text = medicion.Peso.ToString();
                Proyeccion_textbox_bfpInicial.Text = medicion.Bfp.ToString();
            }catch(Exception ex)
            {
                MessageBox.Show(NuSmartMessage.formatearMensaje("Error_messagebox_carga_formulario"));
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                Proyeccion proyeccion = new BLLProyeccion().calcularProyeccion(medicion.Fecha, medicion.Peso, Convert.ToDouble(Proyeccion_textbox_bfpInicial.Text), Convert.ToDouble(Proyeccion_textbox_bfpObjetivo.Text));
                llenarGrafico(proyeccion);
                Proyeccion_textbox_primerPeso.Text = proyeccion.Puntos[1].puntoPeso.ToString();
                Proyeccion_textbox_segundoPeso.Text = proyeccion.Puntos[2].puntoPeso.ToString();
                Proyeccion_textbox_tercerPeso.Text = proyeccion.Puntos[3].puntoPeso.ToString();
                Proyeccion_textbox_cuartoPeso.Text = proyeccion.Puntos[4].puntoPeso.ToString();

                Proyeccion_textbox_primerFecha.Text = Convert.ToInt32(proyeccion.Puntos[1].puntoFecha * 7).ToString();
                Proyeccion_textbox_segundaFecha.Text = Convert.ToInt32(proyeccion.Puntos[2].puntoFecha * 7).ToString();
                Proyeccion_textbox_terceraFecha.Text = Convert.ToInt32(proyeccion.Puntos[3].puntoFecha * 7).ToString();
                Proyeccion_textbox_cuartaFecha.Text = Convert.ToInt32(proyeccion.Puntos[4].puntoFecha * 7).ToString();
            }catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
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

        private void label9_Click(object sender, EventArgs e)
        {

        }
    }
}
