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
        List<Paciente> pacientes;

        public Pacientes()
        {
            bllPaciente = new BLLPaciente();
            InitializeComponent();
        }

        private void Pacientes_Load(object sender, EventArgs e)
        {
            obtenerTodos();
        }

        private void obtenerTodos()
        {
            pacientes = bllPaciente.obtenerTodos();
            dataGridView1.DataSource = pacientes;
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

        private void button2_Click(object sender, EventArgs e)
        {
            Paciente paciente = new Paciente();
            paciente.Nombre = Pacientes_textbox_nombre.Text;
            paciente.Apellido = Pacientes_textbox_apellido.Text;
            paciente.Dni = Convert.ToInt32(Pacientes_textbox_dni.Text);
            paciente.Email = Pacientes_textbox_email.Text;
            paciente.Sexo = Pacientes_combobox_sexo.SelectedItem.ToString();
            paciente.Telefono = Convert.ToInt32(Pacientes_textbox_telefono.Text);
            paciente.FechaNacimiento = monthCalendar1.SelectionRange.Start;

            bllPaciente.agregar(paciente);
            obtenerTodos();
        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
               
                Paciente paciente = bllPaciente.obtener(Convert.ToInt32(Pacientes_textbox_buscar.Text));
                List<Paciente> pacienteBuscado = new List<Paciente>();
                pacienteBuscado.Add(paciente);
                dataGridView1.DataSource = pacienteBuscado;
            }catch(Exception ex)
            {
                MessageBox.Show("Verifique el valor ingreado");
            }
        }

        private void button5_Click(object sender, EventArgs e)
        {
            pacientes = bllPaciente.obtenerTodos();
            dataGridView1.DataSource = pacientes;
        }
    }
}
