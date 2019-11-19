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
    public partial class GenerarTurno : FormObserver
    {
        Paciente paciente;
        DateTime fechaSeleccionada;
        BLLTurno bllTurno;
        string preferencia;
        bool cargando = false;

        public GenerarTurno(Paciente paciente)
        {
            this.paciente = paciente;
            this.bllTurno = new BLLTurno();
            this.preferencia = "manana";
            InitializeComponent();
            setup();

        }

        private void GenerarTurno_Load(object sender, EventArgs e)
        {
            try
            {
                comboBox1.DropDownStyle = ComboBoxStyle.DropDownList;
                cargando = true;
                label3.Text = paciente.Nombre + " " + paciente.Apellido;
                preferencia = "manana";
                if((DateTime.Now.Hour >= 13 && DateTime.Now.Hour < 18) || (DateTime.Now.Hour == 12 && DateTime.Now.Minute > 30))
                {
                    preferencia = "tarde";
                    GenerarTurno_label_tarde.Checked = true;
                }
                else if(DateTime.Now.Hour >= 18)
                {
                    DateTime diaSiguiente = DateTime.Today.AddDays(1);
                    fechaSeleccionada = diaSiguiente;
                    monthCalendar1.SelectionStart = diaSiguiente;
                    monthCalendar1.SetDate(diaSiguiente);
                }
                else
                {
                    fechaSeleccionada = DateTime.Today;
                    monthCalendar1.SetDate(DateTime.Now);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(NuSmartMessage.formatearMensaje("Error_messagebox_carga_formulario") + ": " + ex.Message);
            }
            buscarSugerencias();
            cargando = false;

        }

        private void monthCalendar1_DateChanged(object sender, DateRangeEventArgs e)
        {
            if(!cargando)
            {
                fechaSeleccionada = monthCalendar1.SelectionRange.Start;
                buscarSugerencias();
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            comboBox1.DataSource = bllTurno.obtenerTurnosPosibles(paciente, fechaSeleccionada, preferencia);
        }

        private void button2_Click(object sender, EventArgs e)
        {
            try
            {
                Turno turnoSeleccionado = (Turno)comboBox1.SelectedItem;
                turnoSeleccionado.Motivo = GenerarTurno_textbox_motivoConsulta.Text;
                bllTurno.registrarTurno(turnoSeleccionado);
                comboBox1.DataSource = bllTurno.obtenerTurnosPosibles(paciente, fechaSeleccionada, preferencia);
                MessageBox.Show(NuSmartMessage.formatearMensaje("GenerarTurno_messagebox_creado"));
            }
            catch (Exception ex)
            {
                MessageBox.Show(NuSmartMessage.formatearMensaje("GenerarTurno_messagebox_errorTurno"));
            }
        }

        private void radioButton1_CheckedChanged(object sender, EventArgs e)
        {
            preferencia = "manana";
            fechaSeleccionada = monthCalendar1.SelectionRange.Start;
            if (GenerarTurno_label_manana.Checked && !cargando)
            {
                buscarSugerencias();
            }
        }

        private void radioButton2_CheckedChanged(object sender, EventArgs e)
        {
            preferencia = "tarde";
            fechaSeleccionada = monthCalendar1.SelectionRange.Start;
            if (GenerarTurno_label_tarde.Checked && !cargando)
            {
                buscarSugerencias();
            }
        }

        private void buscarSugerencias()
        {
            try
            {
                comboBox1.SelectedIndex = -1;
                comboBox1.DataSource = null;
                List<Turno> turnos = bllTurno.obtenerTurnosPosibles(paciente, fechaSeleccionada, preferencia);
                if (turnos.Count > 0)
                {
                    if (turnos[0].Fecha.Date != fechaSeleccionada.Date)
                    {
                        MessageBox.Show(NuSmartMessage.formatearMensaje("GenerarTurno_messagebox_siguiente_semana"));
                    }
                    comboBox1.DataSource = turnos;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}
