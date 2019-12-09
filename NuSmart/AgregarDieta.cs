using System;
using System.ComponentModel;
using System.Windows.Forms;
using System.Collections.Generic;
using NuSmart.BE;
using NuSmart.BLL;

namespace NuSmart
{
    public partial class AgregarDieta : FormObserver
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
            setup();
        }

        private void AgregarDieta_Load(object sender, EventArgs e)
        {
            try
            {
                cargando = true;
                dietas = new BindingList<Dieta>(bllDieta.conseguirDietas());
                listBox1.DataSource = dietas;
                cargando = false;
            }catch(Exception ex)
            {
                MessageBox.Show(NuSmartMessage.formatearMensaje("Error_messagebox_carga_formulario"));
                MessageBox.Show(ex.Message);
            }
        }

        private void listaDietas_SelectedIndexChanged(object sender, EventArgs e)
        {
            actualizarCamposDieta();
        }

        public void actualizarCamposDieta()
        {
            try
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
                }
                else
                {
                    AgregarDieta_radiobutton_desayuno.Enabled = AgregarDieta_radiobutton_colacion.Enabled = AgregarDieta_radiobutton_almuerzo.Enabled = AgregarDieta_radiobutton_merienda.Enabled = AgregarDieta_radiobutton_cena.Enabled = true;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
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

        private void diasListBox_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                DiaAlimenticio dia = (DiaAlimenticio)listBox2.SelectedItem;
                agregarDieta_textbox_desayuno.Text = dia.Desayuno.Nombre;
                agregarDieta_textbox_colacion.Text = dia.Colacion.Nombre;
                agregarDieta_textbox_almuerzo.Text = dia.Almuerzo.Nombre;
                agregarDieta_textbox_merienda.Text = dia.Merienda.Nombre;
                agregarDieta_textbox_cena.Text = dia.Cena.Nombre;
                diaActual = dia;
                actualizarCaloriasMostradas();
            }catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void AgregarDieta_button_generar_dieta_automatica_Click(object sender, EventArgs e)
        {
            try
            {
                dietas.Add(bllDieta.obtenerDietaAutomatica(estrategiaActual));
                listBox1.DataSource = dietas;
            }catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void radioButton4_CheckedChanged(object sender, EventArgs e)
        {
            obtenerPlatos("esDesayuno");
        }

        private void AgregarDieta_radiobutton_colacion_CheckedChanged(object sender, EventArgs e)
        {
            obtenerPlatos("esColacion");
        }

        private void AgregarDieta_radiobutton_almuerzo_CheckedChanged(object sender, EventArgs e)
        {
            obtenerPlatos("esPlatoPrincipal");
        }

        private void AgregarDieta_radiobutton_merienda_CheckedChanged(object sender, EventArgs e)
        {
            obtenerPlatos("esMerienda");
        }

        private void AgregarDieta_radiobutton_cena_CheckedChanged(object sender, EventArgs e)
        {
            obtenerPlatos("esPlatoPrincipal");
        }

        private void obtenerPlatos(string tipo)
        {
            try
            {
                cargando = true;
                dataGridView1.DataSource = bllPlato.obtenerTodos(tipo);
                cargando = false;
            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }


        private void dataGridView1_SelectionChanged(object sender, EventArgs e)
        {
            try
            {
                if (!cargando && dietaActual != null && diaActual != null && dietaActual.EsAutomatica)
                {
                    Plato platoSeleccionado = (Plato)dataGridView1.SelectedCells[0].OwningRow.DataBoundItem;
                    if (AgregarDieta_radiobutton_desayuno.Checked)
                    {
                        diaActual.Desayuno = platoSeleccionado;
                        agregarDieta_textbox_desayuno.Text = platoSeleccionado.Nombre;
                        actualizarCaloriasMostradas();
                    }
                    else if (AgregarDieta_radiobutton_colacion.Checked)
                    {
                        diaActual.Colacion = platoSeleccionado;
                        agregarDieta_textbox_colacion.Text = platoSeleccionado.Nombre;
                        actualizarCaloriasMostradas();
                    }
                    else if (AgregarDieta_radiobutton_almuerzo.Checked)
                    {
                        diaActual.Almuerzo = platoSeleccionado;
                        agregarDieta_textbox_almuerzo.Text = platoSeleccionado.Nombre;
                        actualizarCaloriasMostradas();
                    }
                    else if (AgregarDieta_radiobutton_merienda.Checked)
                    {
                        diaActual.Merienda = platoSeleccionado;
                        agregarDieta_textbox_merienda.Text = platoSeleccionado.Nombre;
                        actualizarCaloriasMostradas();
                    }
                    else if (AgregarDieta_radiobutton_cena.Checked)
                    {
                        diaActual.Cena = platoSeleccionado;
                        agregarDieta_textbox_cena.Text = platoSeleccionado.Nombre;
                        actualizarCaloriasMostradas();
                    }
                }
            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void AgregarDieta_radiobutton_bajar_CheckedChanged(object sender, EventArgs e)
        {
            estrategiaActual = BLLDieta.ADELGAZAR;
        }

        private void AgregarDieta_radiobutton_mantener_CheckedChanged(object sender, EventArgs e)
        {
            estrategiaActual = BLLDieta.MANTENER;
        }

        private void AgregarDieta_radiobutton_subir_CheckedChanged(object sender, EventArgs e)
        {
            estrategiaActual = BLLDieta.ENGORDAR;
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void AgregarDieta_button_iniciar_tratamiento_Click(object sender, EventArgs e)
        {
            try
            {
                if (dietaActual != null)
                {
                    if (dietaActual.EsAutomatica)
                    {
                        dietaActual.Id = bllDieta.guardar(dietaActual);
                    }
                    Tratamiento tratamiento = new Tratamiento();
                    tratamiento.FechaInicio = turnoActual.Fecha;
                    tratamiento.Dieta = dietaActual;
                    tratamiento.Paciente = turnoActual.Paciente;
                    bllTratamiento.guardar(tratamiento);

                    TratamientoActual tratamientoActual = new TratamientoActual(turnoActual);
                    tratamientoActual.MdiParent = this.ParentForm;
                    tratamientoActual.Show();
                    this.Close();
            }
            }catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }

        private void button3_Click(object sender, EventArgs e)
        {

        }

        private void button4_Click(object sender, EventArgs e)
        {

        }
    }
}
