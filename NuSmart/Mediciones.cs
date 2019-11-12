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
    public partial class Mediciones : FormObserver
    {
        Turno turno;
        BLLMedicion bllMedicion;
        BLLTratamiento bllTratamiento;
        public Mediciones(Turno turno)
        {
            this.turno = turno;
            bllMedicion = new BLLMedicion();
            bllTratamiento = new BLLTratamiento();
            InitializeComponent();
            setup();
        }

        private void Mediciones_Load(object sender, EventArgs e)
        {
            try
            {
                Mediciones_label_paciente.Text = turno.Paciente.ToString();
                Mediciones_textbox_edad.Text = turno.Paciente.Edad().ToString();
                Mediciones_textbox_motivoConsulta.Text = turno.Motivo;
                conseguirMedicionesAnteriores();
            } catch(Exception ex)
            {
                MessageBox.Show(NuSmartMessage.formatearMensaje("Error_messagebox_carga_formulario"));
                MessageBox.Show(ex.Message);
            }
        }

        private void conseguirMedicionesAnteriores()
        {
            dataGridView1.DataSource = bllMedicion.conseguirMediciones(turno.Paciente);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                Medicion medicionActual = obtenerMedicion();
                bllMedicion.calcularBMI(medicionActual);
                Mediciones_lbl_valorBmiObtenido.Text = medicionActual.Bmi.ToString();
                Mediciones_lbl_estadoBmiObtenido.Text = medicionActual.CategoriaBmi;
            }catch(Exception ex)
            {
                MessageBox.Show(NuSmartMessage.formatearMensaje("Mediciones_messagebox_error_medidas_introducidas"));
            }
        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {

        }

        private Medicion obtenerMedicion()
        {
            Medicion medicion = new Medicion();
       
            medicion.Peso = Convert.ToDouble(Mediciones_textbox_peso.Text);
            medicion.Altura = Convert.ToDouble(Mediciones_textbox_altura.Text);
           
            medicion.Cintura = Convert.ToDouble(Mediciones_textbox_cintura.Text);
            medicion.Cadera = Convert.ToDouble(Mediciones_textbox_cadera.Text);

            if(!(medicion.Peso > 0 && medicion.Altura > 0 && medicion.Cintura >= 0 && medicion.Cadera >= 0))
            {
                throw new Exception();
            }

            return medicion;
        }

        private void button2_Click(object sender, EventArgs e)
        {          
            try
            {
                Medicion medicionActual = obtenerMedicion();

                bllMedicion.calcularBFP(medicionActual, turno.Paciente.Edad(), turno.Paciente.Sexo);
                Mediciones_lbl_estadoBfpObtenido.Text = medicionActual.CategoriaBfp;
                Mediciones_lbl_valorBfpObtenido.Text = medicionActual.Bfp.ToString();
            }catch(Exception ex)
            {
                MessageBox.Show(NuSmartMessage.formatearMensaje("Mediciones_messagebox_error_medidas_introducidas"));
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            try
            {
                turno.Medicion = obtenerMedicion();
                bllMedicion.calcularBMI(turno.Medicion);
                bllMedicion.calcularBFP(turno.Medicion, turno.Paciente.Edad(), turno.Paciente.Sexo);

                bllMedicion.guardarMedicionDeTurno(turno);
                if (new BLLTratamiento().existeTratamientoActivo(turno.Paciente, turno.Fecha))
                {
                    TratamientoActual tratamientoActual = new TratamientoActual(turno);
                    tratamientoActual.MdiParent = this.ParentForm;
                    tratamientoActual.Show();
                    this.Close();
                }
                else
                {
                    AgregarDieta dietaForm = new AgregarDieta(turno);
                    dietaForm.MdiParent = this.ParentForm;
                    dietaForm.Show();
                    this.Close();
                }

            }catch(Exception ex)
            {
                MessageBox.Show(NuSmartMessage.formatearMensaje("Mediciones_messagebox_error_medidas_introducidas"));
                MessageBox.Show(ex.Message);
            }


        }
    }
}
