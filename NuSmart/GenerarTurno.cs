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

        public GenerarTurno(Paciente paciente)
        {
            this.paciente = paciente;
            this.bllTurno = new BLLTurno();
            this.preferencia = "manana";
            InitializeComponent();
            setup();
            monthCalendar1.SetDate(DateTime.Now);

        }

        private void GenerarTurno_Load(object sender, EventArgs e)
        {
            try
            {
                label3.Text = paciente.Nombre + " " + paciente.Apellido;
                preferencia = "manana";
                buscarSugerencias();
            }catch(Exception ex)
            {
                MessageBox.Show(NuSmartMessage.formatearMensaje("Error_messagebox_carga_formulario"));
            }

        }

        private void monthCalendar1_DateChanged(object sender, DateRangeEventArgs e)
        {
            fechaSeleccionada = monthCalendar1.SelectionRange.Start;
            buscarSugerencias();
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
            }catch(Exception ex)
            {
                MessageBox.Show("GenerarTurno_messagebox_errorTurno");
            }
        }

        private void radioButton1_CheckedChanged(object sender, EventArgs e)
        {
            preferencia = "manana";
            buscarSugerencias();
        }

        private void radioButton2_CheckedChanged(object sender, EventArgs e)
        {
            preferencia = "tarde";
            buscarSugerencias();
        }

        private void buscarSugerencias()
        {
            try
            {
                comboBox1.SelectedIndex = -1;
                comboBox1.DataSource = null;
                comboBox1.DataSource = bllTurno.obtenerTurnosPosibles(paciente, fechaSeleccionada, preferencia);
            }catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}
