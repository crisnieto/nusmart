using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using NuSmart.BLL;
using NuSmart.BE;

namespace NuSmart
{
    public partial class MisTurnos : FormObserver
    {
        BLLTurno bllTurnos;
        BLLNutricionista bllNutricionista;
        Turno turnoSeleccionado;

        public MisTurnos()
        {
            bllTurnos = new BLLTurno();
            bllNutricionista = new BLLNutricionista();
            InitializeComponent();
            setup();
        }

        private void MIsTurnos_Load(object sender, EventArgs e)
        {
            try
            {
                monthCalendar1.SetDate(DateTime.Now);
                MisTurnos_label_nutricionista.Text = bllNutricionista.conseguir(Sesion.Instancia().UsuarioActual.Id).ToString();
                listBox1.DataSource = bllTurnos.obtenerTurnos(monthCalendar1.SelectionRange.Start);
            }catch(Exception ex)
            {
                MessageBox.Show(NuSmartMessage.formatearMensaje("Error_messagebox_carga_formulario"));
            }
        }

        private void monthCalendar1_DateChanged(object sender, DateRangeEventArgs e)
        {
            try
            {
                listBox1.DataSource = bllTurnos.obtenerTurnos(monthCalendar1.SelectionRange.Start);
            }catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                if (listBox1.SelectedItems.Count > 0 && turnoSeleccionado != null)
                {
                    if (new BLLTratamiento().existeTratamientoActivo(turnoSeleccionado.Paciente, turnoSeleccionado.Fecha))
                    {
                        TratamientoActual tratamientoActual = new TratamientoActual(turnoSeleccionado);
                        tratamientoActual.MdiParent = this.ParentForm;
                        tratamientoActual.Show();
                    }
                    else
                    {
                        Mediciones medicionesForm = new Mediciones(turnoSeleccionado);
                        medicionesForm.MdiParent = this.ParentForm;
                        medicionesForm.Show();
                    }
                }
                else
                {
                    MessageBox.Show(NuSmartMessage.formatearMensaje("MisTurnos_messagebox_seleccione_turno"));
                }
            }catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }


        }

        private void listBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (listBox1.Items.Count > 0)
                {
                    MisTurnos_button_iniciar.Enabled = true;
                    turnoSeleccionado = (Turno)listBox1.SelectedItem;
                }
                else
                {
                    turnoSeleccionado = null;
                }
            }catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}
