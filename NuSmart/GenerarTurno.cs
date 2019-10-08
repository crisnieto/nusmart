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
    public partial class GenerarTurno : Form
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
            monthCalendar1.SetDate(DateTime.Now);

        }

        private void GenerarTurno_Load(object sender, EventArgs e)
        {
            label3.Text = paciente.Nombre + " " + paciente.Apellido;
        }

        private void monthCalendar1_DateChanged(object sender, DateRangeEventArgs e)
        {
            fechaSeleccionada = monthCalendar1.SelectionRange.Start;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            comboBox1.DataSource = bllTurno.obtenerTurnosPosibles(paciente, fechaSeleccionada, preferencia);
        }

        private void button2_Click(object sender, EventArgs e)
        {
            bllTurno.registrarTurno((Turno)comboBox1.SelectedItem);
            comboBox1.DataSource = bllTurno.obtenerTurnosPosibles(paciente, fechaSeleccionada, preferencia);
        }

        private void radioButton1_CheckedChanged(object sender, EventArgs e)
        {
            preferencia = "manana";
        }

        private void radioButton2_CheckedChanged(object sender, EventArgs e)
        {
            preferencia = "tarde";
        }
    }
}
