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
    public partial class TratamientoActual : Form
    {
        Turno turno;
        BLLMedicion bllMedicion;
        BLLDieta bllDieta;
        BLLTratamiento bllTratamiento;
        Dieta dietaActual;
        DiaAlimenticio diaActual;
        public TratamientoActual(Turno turno)
        {
            this.turno = turno;
            InitializeComponent();
            bllMedicion = new BLLMedicion();
            bllTratamiento = new BLLTratamiento();
            bllDieta = new BLLDieta();
        }

        private void TratamientoActual_Load(object sender, EventArgs e)
        {
            Medicion ultimaMedicion = bllMedicion.conseguirUltimaMedicion(turno.Paciente);
            List<Medicion> dataSourceMedicion = new List<Medicion>();
            dataSourceMedicion.Add(ultimaMedicion);
            dataGridView1.DataSource = dataSourceMedicion;

            Tratamiento tratamientoActivo = bllTratamiento.obtenerTratamientoActivo(turno.Paciente);

            dietaActual = bllDieta.conseguirDieta(tratamientoActivo.Dieta.Id);
            TratamientoActual_lbl_dietaActual.Text = dietaActual.Nombre;

            TratamientoActual_listbox_dias.Items.Add(dietaActual.Lunes);
            TratamientoActual_listbox_dias.Items.Add(dietaActual.Martes);
            TratamientoActual_listbox_dias.Items.Add(dietaActual.Miercoles);
            TratamientoActual_listbox_dias.Items.Add(dietaActual.Jueves);
            TratamientoActual_listbox_dias.Items.Add(dietaActual.Viernes);
            TratamientoActual_listbox_dias.Items.Add(dietaActual.Sabado);
            TratamientoActual_listbox_dias.Items.Add(dietaActual.Domingo);

        }

        private void button3_Click(object sender, EventArgs e)
        {
            Mediciones mediciones = new Mediciones(turno);
            mediciones.MdiParent = this.ParentForm;
            mediciones.Show();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            
        }

        private void TratamientoActual_listbox_dias_SelectedIndexChanged(object sender, EventArgs e)
        {
            DiaAlimenticio dia = (DiaAlimenticio)TratamientoActual_listbox_dias.SelectedItem;
            agregarDieta_textbox_desayuno.Text = dia.Desayuno.Nombre;
            agregarDieta_textbox_colacion.Text = dia.Colacion.Nombre;
            agregarDieta_textbox_almuerzo.Text = dia.Almuerzo.Nombre;
            agregarDieta_textbox_merienda.Text = dia.Merienda.Nombre;
            agregarDieta_textbox_cena.Text = dia.Cena.Nombre;
            diaActual = dia;
            actualizarCaloriasMostradas();
        }

        private void actualizarCaloriasMostradas()
        {
            AgregarDieta_textbox_cantidad_calorias_totales.Text = bllDieta.calcularCalorias(dietaActual).ToString();
            AgregarDieta_textbox_cantidad_calorias_dia.Text = bllDieta.calcularCaloriasDia(diaActual).ToString();
        }

    }
}
