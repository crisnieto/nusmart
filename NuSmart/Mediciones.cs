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
    public partial class Mediciones : Form
    {
        Turno turno;
        BLLMedicion bllMedicion;
        public Mediciones(Turno turno)
        {
            this.turno = turno;
            bllMedicion = new BLLMedicion();
            InitializeComponent();
        }

        private void Mediciones_Load(object sender, EventArgs e)
        {
            Mediciones_label_paciente.Text = turno.Paciente.ToString();
            Mediciones_textbox_edad.Text = turno.Paciente.Edad().ToString();
            Mediciones_textbox_motivoConsulta.Text = turno.Motivo;
            conseguirMedicionesAnteriores();
        }

        private void conseguirMedicionesAnteriores()
        {
            dataGridView1.DataSource = bllMedicion.conseguirMediciones(turno.Paciente);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Medicion medicionActual = obtenerMedicion();
            BMI bmi = bllMedicion.calcularBMI(medicionActual.Peso, medicionActual.Altura);
            Mediciones_lbl_valorBmiObtenido.Text = bmi.Indice.ToString();
            Mediciones_lbl_estadoBmiObtenido.Text = bmi.Categoria;

        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {

        }

        private Medicion obtenerMedicion()
        {
            Medicion medicion = new Medicion();
            try
            {
                medicion.Peso = Convert.ToDouble(Mediciones_textbox_peso.Text);
                medicion.Altura = Convert.ToDouble(Mediciones_textbox_altura.Text);
            }
            catch (Exception ex)
            {
                MessageBox.Show("Verifique los valores introducidos");
            }

            try
            {
                medicion.Cintura = Convert.ToDouble(Mediciones_textbox_cintura.Text);
                medicion.Cadera = Convert.ToDouble(Mediciones_textbox_cadera.Text);
            }catch(Exception ex)
            {

            }
            return medicion;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Medicion medicionActual = obtenerMedicion();

            Mediciones_lbl_estadoBfpObtenido.Text = bllMedicion.calcularBFP(medicionActual.Peso, medicionActual.Altura, turno.Paciente.Edad() , turno.Paciente.Sexo);
        }

        private void button3_Click(object sender, EventArgs e)
        {
            turno.Medicion = obtenerMedicion();
            bllMedicion.guardarMedicionDeTurno(turno);

            AgregarDieta dietaForm = new AgregarDieta(turno);
            dietaForm.MdiParent = this.ParentForm;
            dietaForm.Show();

        }
    }
}
