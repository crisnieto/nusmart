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
    public partial class AgregarDieta : Form
    {

        BLLDieta bllDieta;
        Turno turnoActual;
        Dieta dietaActual;
        BindingList<Dieta> dietas;

        public AgregarDieta(Turno turno)
        {
            turnoActual = turno;
            bllDieta = new BLLDieta();
            InitializeComponent();
        }

        private void AgregarDieta_Load(object sender, EventArgs e)
        {
            dietas = new BindingList<Dieta>(bllDieta.conseguirDietas());
            listBox1.DataSource = dietas;
        }

        private void listBox1_SelectedIndexChanged(object sender, EventArgs e)
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
            AgregarDieta_textbox_cantidad_calorias_totales.Text = bllDieta.calcularCalorias(dietaActual).ToString();
        }

        private void listBox2_SelectedIndexChanged(object sender, EventArgs e)
        {
            DiaAlimenticio dia = (DiaAlimenticio)listBox2.SelectedItem;
            agregarDieta_textbox_desayuno.Text = dia.Desayuno.Nombre;
            agregarDieta_textbox_colacion.Text = dia.Colacion.Nombre;
            agregarDieta_textbox_almuerzo.Text = dia.Almuerzo.Nombre;
            agregarDieta_textbox_merienda.Text = dia.Merienda.Nombre;
            agregarDieta_textbox_cena.Text = dia.Cena.Nombre;
            AgregarDieta_textbox_cantidad_calorias_dia.Text = bllDieta.calcularCaloriasDia(dia).ToString();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            dietas.Add(bllDieta.obtenerDietaAutomatica(BLLDieta.ADELGAZAR));
            listBox1.DataSource = dietas;
        }
}
}
