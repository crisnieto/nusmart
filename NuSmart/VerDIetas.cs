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
    public partial class VerDietas : FormObserver
    {

        BLLDieta bllDieta;
        BLLPlato bllPlato;
        BLLTratamiento bllTratamiento;
        Turno turnoActual;
        Dieta dietaActual;
        DiaAlimenticio diaActual;
        BindingList<Dieta> dietas;
        bool cargando;

        public VerDietas()
        {
            bllDieta = new BLLDieta();
            bllPlato = new BLLPlato();
            bllTratamiento = new BLLTratamiento();
            InitializeComponent();
            setup();
        }

        private void VerDIetas_Load(object sender, EventArgs e)
        {
            try
            {
                cargando = true;
                dietas = new BindingList<Dieta>(bllDieta.conseguirDietas());
                listBox1.DataSource = dietas;
                cargando = false;
            }
            catch (Exception ex)
            {
                MessageBox.Show(NuSmartMessage.formatearMensaje("Error_messagebox_carga_formulario"));
                MessageBox.Show(ex.Message);
            }
        }


        public VerDietas(Turno turno)
        {
            turnoActual = turno;
            bllDieta = new BLLDieta();
            bllPlato = new BLLPlato();
            bllTratamiento = new BLLTratamiento();
            InitializeComponent();
            setup();
        }

        private void actualizarCaloriasMostradas()
        {
            try
            {
                AgregarDieta_textbox_cantidad_calorias_totales.Text = bllDieta.calcularCalorias(dietaActual).ToString();
                AgregarDieta_textbox_cantidad_calorias_dia.Text = bllDieta.calcularCaloriasDia(diaActual).ToString();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }


        private void AgregarDieta_radiobutton_desayuno_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void listBox1_SelectedIndexChanged_1(object sender, EventArgs e)
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
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void listBox2_SelectedIndexChanged(object sender, EventArgs e)
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
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}
