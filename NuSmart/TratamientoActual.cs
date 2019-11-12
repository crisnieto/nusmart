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
    public partial class TratamientoActual : FormObserver
    {
        Turno turno;
        BLLMedicion bllMedicion;
        BLLDieta bllDieta;
        BLLRutina bllRutina;
        BLLTratamiento bllTratamiento;
        Dieta dietaActual;
        Medicion ultimaMedicion;
        Medicion primeraMedicion;
        DiaAlimenticio diaActual;
        Tratamiento tratamientoActivo;

        public TratamientoActual(Turno turno)
        {
            this.turno = turno;
            InitializeComponent();
            setup();
            bllMedicion = new BLLMedicion();
            bllTratamiento = new BLLTratamiento();
            bllRutina = new BLLRutina();
            bllDieta = new BLLDieta();
        }

        private void TratamientoActual_Load(object sender, EventArgs e)
        {
            try
            {
                tratamientoActivo = bllTratamiento.obtenerTratamientoActivo(turno.Paciente);

                actualizarMediciones();

                dietaActual = bllDieta.conseguirDieta(tratamientoActivo.Dieta.Id);
                tratamientoActivo.Dieta = dietaActual;
                TratamientoActual_lbl_dietaActual.Text = dietaActual.Nombre;

                TratamientoActual_listbox_dias.Items.Add(dietaActual.Lunes);
                TratamientoActual_listbox_dias.Items.Add(dietaActual.Martes);
                TratamientoActual_listbox_dias.Items.Add(dietaActual.Miercoles);
                TratamientoActual_listbox_dias.Items.Add(dietaActual.Jueves);
                TratamientoActual_listbox_dias.Items.Add(dietaActual.Viernes);
                TratamientoActual_listbox_dias.Items.Add(dietaActual.Sabado);
                TratamientoActual_listbox_dias.Items.Add(dietaActual.Domingo);

                actualizarRutina();
            }catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Mediciones mediciones = new Mediciones(turno, this);
            mediciones.MdiParent = this.ParentForm;
            mediciones.Show();
        }


        public void actualizarMediciones()
        {
            primeraMedicion = bllMedicion.obtenerPrimeraMedicionTratamiento(tratamientoActivo);

            ultimaMedicion = bllMedicion.conseguirUltimaMedicion(turno.Paciente);
            List<Medicion> dataSourceUltimaMedicion = new List<Medicion>();
            dataSourceUltimaMedicion.Add(ultimaMedicion);
            dataGridView1.DataSource = dataSourceUltimaMedicion;

            List<Medicion> dataSourcePrimeraMedicion = new List<Medicion>();
            dataSourcePrimeraMedicion.Add(primeraMedicion);
            dataGridView2.DataSource = dataSourcePrimeraMedicion;
        }

        private void button5_Click(object sender, EventArgs e)
        {
            try
            {
                tratamientoActivo.FechaFinalizado = turno.Fecha;
                bllTratamiento.finalizarTratamiento(tratamientoActivo);
                this.Close();
            }catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        public void actualizarRutina()
        {
            try
            {
            if (tratamientoActivo.Rutina != null) { 
                Ejercicios_textbox_lunes.Text = tratamientoActivo.Rutina.DiaEjercicioLunes.Ejercicio.Nombre;
                Ejercicios_textbox_lunes_duracion.Text = tratamientoActivo.Rutina.DiaEjercicioLunes.Duracion.ToString();
                Ejercicios_textbox_lunes_calorias.Text = tratamientoActivo.Rutina.DiaEjercicioLunes.Calorias.ToString();

                Ejercicios_textbox_martes.Text = tratamientoActivo.Rutina.DiaEjercicioMartes.Ejercicio.Nombre;
                Ejercicios_textbox_martes_duracion.Text = tratamientoActivo.Rutina.DiaEjercicioMartes.Duracion.ToString();
                Ejercicios_textbox_martes_calorias.Text = tratamientoActivo.Rutina.DiaEjercicioMartes.Calorias.ToString();

                Ejercicios_textbox_miercoles.Text = tratamientoActivo.Rutina.DiaEjercicioMiercoles.Ejercicio.Nombre;
                Ejercicios_textbox_miercoles_duracion.Text = tratamientoActivo.Rutina.DiaEjercicioMiercoles.Duracion.ToString();
                Ejercicios_textbox_miercoles_calorias.Text = tratamientoActivo.Rutina.DiaEjercicioMiercoles.Calorias.ToString();

                Ejercicios_textbox_jueves.Text = tratamientoActivo.Rutina.DiaEjercicioJueves.Ejercicio.Nombre;
                Ejercicios_textbox_jueves_duracion.Text = tratamientoActivo.Rutina.DiaEjercicioJueves.Duracion.ToString();
                Ejercicios_textbox_jueves_calorias.Text = tratamientoActivo.Rutina.DiaEjercicioJueves.Calorias.ToString();

                Ejercicios_textbox_viernes.Text = tratamientoActivo.Rutina.DiaEjercicioViernes.Ejercicio.Nombre;
                Ejercicios_textbox_viernes_duracion.Text = tratamientoActivo.Rutina.DiaEjercicioViernes.Duracion.ToString();
                Ejercicios_textbox_viernes_calorias.Text = tratamientoActivo.Rutina.DiaEjercicioViernes.Calorias.ToString();

                Ejercicios_textbox_sabado.Text = tratamientoActivo.Rutina.DiaEjercicioSabado.Ejercicio.Nombre;
                Ejercicios_textbox_sabado_duracion.Text = tratamientoActivo.Rutina.DiaEjercicioSabado.Duracion.ToString();
                Ejercicios_textbox_sabado_calorias.Text = tratamientoActivo.Rutina.DiaEjercicioSabado.Calorias.ToString();

                Ejercicios_textbox_domingo.Text = tratamientoActivo.Rutina.DiaEjercicioDomingo.Ejercicio.Nombre;
                Ejercicios_textbox_domingo_duracion.Text = tratamientoActivo.Rutina.DiaEjercicioDomingo.Duracion.ToString();
                Ejercicios_textbox_domingo_calorias.Text = tratamientoActivo.Rutina.DiaEjercicioDomingo.Calorias.ToString();

                Ejercicios_textbox_calorias.Text = bllRutina.calcularCaloriasQuemadas(tratamientoActivo.Rutina).ToString();
            }
            }catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

        }

        private void TratamientoActual_listbox_dias_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                DiaAlimenticio dia = (DiaAlimenticio)TratamientoActual_listbox_dias.SelectedItem;
                agregarDieta_textbox_desayuno.Text = dia.Desayuno.Nombre;
                agregarDieta_textbox_colacion.Text = dia.Colacion.Nombre;
                agregarDieta_textbox_almuerzo.Text = dia.Almuerzo.Nombre;
                agregarDieta_textbox_merienda.Text = dia.Merienda.Nombre;
                agregarDieta_textbox_cena.Text = dia.Cena.Nombre;
                diaActual = dia;
            }catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            actualizarCaloriasMostradas();

        }

        private void actualizarCaloriasMostradas()
        {
            try
            {
                AgregarDieta_textbox_cantidad_calorias_totales.Text = bllDieta.calcularCalorias(dietaActual).ToString();
                AgregarDieta_textbox_cantidad_calorias_dia.Text = bllDieta.calcularCaloriasDia(diaActual).ToString();
            }catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            GraficoProyeccion graficoProyeccion = new GraficoProyeccion(tratamientoActivo, ultimaMedicion);
            graficoProyeccion.MdiParent = this.ParentForm;
            graficoProyeccion.Show();

        }

        private void button2_Click(object sender, EventArgs e)
        {
            AgregarRutina agregarRutina = new AgregarRutina(tratamientoActivo, this);
            agregarRutina.MdiParent = this.ParentForm;
            agregarRutina.Show();
        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            try
            {
                MessageBox.Show(new BLLEscritura().escribir(tratamientoActivo, turno));
            }catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}
