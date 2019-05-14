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
    public partial class Lenguaje : Form
    {
        BLLIdioma bllIdioma;
        public Lenguaje()
        {
            InitializeComponent();
            bllIdioma = new BLLIdioma();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Sesion.Instancia().IdiomaActual = bllIdioma.conseguirIdioma(1);
            new Login().Show();
            this.Hide();
        }

        private void Lenguaje_Load(object sender, EventArgs e)
        {
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Sesion.Instancia().IdiomaActual = bllIdioma.conseguirIdioma(2);
            new Login().Show();
            this.Hide();
        }
    }
}
