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
    public partial class MisTurnos : Form
    {
        BLLTurno bllTurnos;
        BLLNutricionista bllNutricionista;

        public MisTurnos()
        {
            bllTurnos = new BLLTurno();
            bllNutricionista = new BLLNutricionista();

            InitializeComponent();
        }

        private void MIsTurnos_Load(object sender, EventArgs e)
        {
            monthCalendar1.SetDate(DateTime.Now);
            label1.Text = bllNutricionista.conseguir(Sesion.Instancia().UsuarioActual.Id).ToString();
            listBox1.DataSource = bllTurnos.obtenerTurnos(monthCalendar1.SelectionRange.Start);
        }

        private void monthCalendar1_DateChanged(object sender, DateRangeEventArgs e)
        {
            listBox1.DataSource = bllTurnos.obtenerTurnos(monthCalendar1.SelectionRange.Start);
        }
    }
}
