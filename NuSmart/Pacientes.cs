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
    public partial class Pacientes : Form
    {
        BLLPaciente bllPaciente;
        Paciente pacienteSeleccionado;

        public Pacientes()
        {
            bllPaciente = new BLLPaciente();
            InitializeComponent();
        }

        private void Pacientes_Load(object sender, EventArgs e)
        {
            dataGridView1.DataSource = bllPaciente.obtenerTodos();
        }

        private void paciente_btn_turno_Click(object sender, EventArgs e)
        {
            new GenerarTurno(pacienteSeleccionado).Show();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void dataGridView1_SelectionChanged(object sender, EventArgs e)
        {
            pacienteSeleccionado = (Paciente)dataGridView1.CurrentRow.DataBoundItem;
        }
    }
}
