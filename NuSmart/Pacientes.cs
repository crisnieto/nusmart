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
    public partial class Pacientes : FormObserver
    {
        BLLPaciente bllPaciente;
        Paciente pacienteSeleccionado;
        List<Paciente> pacientes;

        public Pacientes()
        {
            bllPaciente = new BLLPaciente();
            InitializeComponent();
            setup();
        }

        private void Pacientes_Load(object sender, EventArgs e)
        {
            try { 
            Pacientes_combobox_sexo.DropDownStyle = ComboBoxStyle.DropDownList;
            dataGridView1.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            obtenerTodos();
            }catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void obtenerTodos()
        {
            pacientes = bllPaciente.obtenerTodos();
            dataGridView1.DataSource = pacientes;
        }

        private void paciente_btn_turno_Click(object sender, EventArgs e)
        {
            if(pacienteSeleccionado != null)
            {
                GenerarTurno generarTurno = new GenerarTurno(pacienteSeleccionado);
                generarTurno.MdiParent = this.ParentForm;
                generarTurno.Show();
            }
            else
            {
                MessageBox.Show(NuSmartMessage.formatearMensaje("Pacientes_messagebox_errorSeleccion"));
            }
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

            try
            {
                paciente.Nombre = Pacientes_textbox_nombre.Text;
                paciente.Apellido = Pacientes_textbox_apellido.Text;
                paciente.Dni = Convert.ToInt32(Pacientes_textbox_dni.Text);
                paciente.Email = Pacientes_textbox_email.Text;
                paciente.Sexo = Pacientes_combobox_sexo.SelectedItem.ToString();
                paciente.Telefono = Convert.ToInt32(Pacientes_textbox_telefono.Text);
                paciente.FechaNacimiento = monthCalendar1.SelectionRange.Start;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

            try
            {
                bllPaciente.agregar(paciente);
                obtenerTodos();
            }catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
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
                MessageBox.Show(NuSmartMessage.formatearMensaje("Pacientes_messagebox_errorDatos"));
            }
        }

        private void button5_Click(object sender, EventArgs e)
        {
            pacientes = bllPaciente.obtenerTodos();
            dataGridView1.DataSource = pacientes;
        }

        private void button3_Click(object sender, EventArgs e)
        {
            try
            {
                Paciente paciente = (Paciente)dataGridView1.SelectedCells[0].OwningRow.DataBoundItem;
                bllPaciente.modificar(paciente);
                obtenerTodos();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
         }

        private void button4_Click(object sender, EventArgs e)
        {
            try
            {
                Paciente paciente = (Paciente)dataGridView1.SelectedCells[0].OwningRow.DataBoundItem;
                bllPaciente.eliminar(paciente);
                obtenerTodos();
            }catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void Pacientes_textbox_buscar_KeyPress(object sender, KeyPressEventArgs e)
        {
            validarNumerico(e);
        }

        private void Pacientes_textbox_dni_KeyPress(object sender, KeyPressEventArgs e)
        {
            validarNumerico(e);
        }

        private void Pacientes_textbox_telefono_KeyPress(object sender, KeyPressEventArgs e)
        {
            validarNumerico(e);
        }

        private void Pacientes_textbox_nombre_KeyPress(object sender, KeyPressEventArgs e)
        {
            validarLetras(e);
        }

        private void Pacientes_textbox_apellido_KeyPress(object sender, KeyPressEventArgs e)
        {
            validarLetras(e);
        }
    }
}
