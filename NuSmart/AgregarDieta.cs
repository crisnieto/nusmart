using System;
using System.ComponentModel;
using System.Windows.Forms;
using NuSmart.BE;
using NuSmart.BLL;

namespace NuSmart
{
    public partial class AgregarDieta : Form
    {
        BLLDieta bllDieta;
        BLLPlato bllPlato;
        BLLTratamiento bllTratamiento;
        Turno turnoActual;
        Dieta dietaActual;
        DiaAlimenticio diaActual;
        BindingList<Dieta> dietas;
        int estrategiaActual;
        bool cargando;

        public AgregarDieta(Turno turno)
        {
            turnoActual = turno;
            bllDieta = new BLLDieta();
            bllPlato = new BLLPlato();
            bllTratamiento = new BLLTratamiento();
            InitializeComponent();
        }

        private void AgregarDieta_Load(object sender, EventArgs e)
        {
            cargando = true;
            dietas = new BindingList<Dieta>(bllDieta.conseguirDietas());
            listBox1.DataSource = dietas;
            cargando = false;
        }

        private void listBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            listBox2.Items.Clear();
            dietaActual = (Dieta)listBox1.SelectedItem;
            listBox2.Items.Add(dietaActual.Lunes);
            listBox2.Items.Add(dietaActual.Martes);
            listBox2.Items.Add(dietaActual.Miercoles);
            listBox2.Items.Add(dietaActual.Jueves);
            listBox2.Items.Add(dietaActual.Viernes);
            listBox2.Items.Add(dietaActual.Sabado);
            listBox2.Items.Add(dietaActual.Domingo);
            listBox2.SelectedIndex = 0;
            actualizarCaloriasMostradas();
            if (!dietaActual.EsAutomatica)
            {
                AgregarDieta_radiobutton_desayuno.Enabled = AgregarDieta_radiobutton_colacion.Enabled = AgregarDieta_radiobutton_almuerzo.Enabled = AgregarDieta_radiobutton_merienda.Enabled = AgregarDieta_radiobutton_cena.Enabled = false;
            }else
            {
                AgregarDieta_radiobutton_desayuno.Enabled = AgregarDieta_radiobutton_colacion.Enabled = AgregarDieta_radiobutton_almuerzo.Enabled = AgregarDieta_radiobutton_merienda.Enabled = AgregarDieta_radiobutton_cena.Enabled = true;
            }
        }

        private void actualizarCaloriasMostradas()
        {
            AgregarDieta_textbox_cantidad_calorias_totales.Text = bllDieta.calcularCalorias(dietaActual).ToString();
            AgregarDieta_textbox_cantidad_calorias_dia.Text = bllDieta.calcularCaloriasDia(diaActual).ToString();
        }

        private void listBox2_SelectedIndexChanged(object sender, EventArgs e)
        {
            DiaAlimenticio dia = (DiaAlimenticio)listBox2.SelectedItem;
            agregarDieta_textbox_desayuno.Text = dia.Desayuno.Nombre;
            agregarDieta_textbox_colacion.Text = dia.Colacion.Nombre;
            agregarDieta_textbox_almuerzo.Text = dia.Almuerzo.Nombre;
            agregarDieta_textbox_merienda.Text = dia.Merienda.Nombre;
            agregarDieta_textbox_cena.Text = dia.Cena.Nombre;
            diaActual = dia;
            actualizarCaloriasMostradas();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            dietas.Add(bllDieta.obtenerDietaAutomatica(estrategiaActual));
            listBox1.DataSource = dietas;
        }

        private void radioButton4_CheckedChanged(object sender, EventArgs e)
        {
            cargando = true;
            dataGridView1.DataSource = bllPlato.obtenerTodos("esDesayuno");
            cargando = false;
        }

        private void AgregarDieta_radiobutton_colacion_CheckedChanged(object sender, EventArgs e)
        {
            cargando = true;
            dataGridView1.DataSource = bllPlato.obtenerTodos("esColacion");
            cargando = false;
        }

        private void AgregarDieta_radiobutton_almuerzo_CheckedChanged(object sender, EventArgs e)
        {
            cargando = true;
            dataGridView1.DataSource = bllPlato.obtenerTodos("esPlatoPrincipal");
            cargando = false;
        }

        private void AgregarDieta_radiobutton_merienda_CheckedChanged(object sender, EventArgs e)
        {
            cargando = true;
            dataGridView1.DataSource = bllPlato.obtenerTodos("esMerienda");
            cargando = false;
        }

        private void AgregarDieta_radiobutton_cena_CheckedChanged(object sender, EventArgs e)
        {
            cargando = true;
            dataGridView1.DataSource = bllPlato.obtenerTodos("esPlatoPrincipal");
            cargando = false;
        }

        private void dataGridView1_SelectionChanged(object sender, EventArgs e)
        {
            if (!cargando && dietaActual != null && diaActual != null && dietaActual.EsAutomatica)
            {
                Plato platoSeleccionado = (Plato)dataGridView1.SelectedCells[0].OwningRow.DataBoundItem;
                if (AgregarDieta_radiobutton_desayuno.Checked)
                {
                    diaActual.Desayuno = platoSeleccionado;
                    agregarDieta_textbox_desayuno.Text = platoSeleccionado.Nombre;
                }else if (AgregarDieta_radiobutton_colacion.Checked)
                {
                    diaActual.Colacion = platoSeleccionado;
                    agregarDieta_textbox_colacion.Text = platoSeleccionado.Nombre;
                }
                else if (AgregarDieta_radiobutton_almuerzo.Checked)
                {
                    diaActual.Almuerzo = platoSeleccionado;
                    agregarDieta_textbox_almuerzo.Text = platoSeleccionado.Nombre;
                }
                else if (AgregarDieta_radiobutton_merienda.Checked)
                {
                    diaActual.Merienda = platoSeleccionado;
                    agregarDieta_textbox_merienda.Text = platoSeleccionado.Nombre;
                }
                else if (AgregarDieta_radiobutton_cena.Checked)
                {
                    diaActual.Cena = platoSeleccionado;
                    agregarDieta_textbox_cena.Text = platoSeleccionado.Nombre;
                }
            }
        }

        private void radioButton1_CheckedChanged(object sender, EventArgs e)
        {
            estrategiaActual = BLLDieta.ADELGAZAR;
        }

        private void radioButton2_CheckedChanged(object sender, EventArgs e)
        {
            estrategiaActual = BLLDieta.MANTENER;
        }

        private void radioButton3_CheckedChanged(object sender, EventArgs e)
        {
            estrategiaActual = BLLDieta.ENGORDAR;
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            if(dietaActual != null)
            {
                if (dietaActual.EsAutomatica)
                {
                    dietaActual.Id = bllDieta.guardar(dietaActual);
                }
                Tratamiento tratamiento = new Tratamiento();
                tratamiento.FechaInicio = DateTime.Today;
                tratamiento.Dieta = dietaActual;
                tratamiento.Paciente = turnoActual.Paciente;
                bllTratamiento.guardar(tratamiento);
            }
        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }
    }
}
