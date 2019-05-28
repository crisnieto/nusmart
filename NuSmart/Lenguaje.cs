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
        bool flagCargando = true;
        public Lenguaje()
        {
            InitializeComponent();
            bllIdioma = new BLLIdioma();
            this.FormBorderStyle = FormBorderStyle.FixedSingle;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.StartPosition = FormStartPosition.CenterScreen;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            validarNavegación();
        }


        private void button2_Click(object sender, EventArgs e)
        {
            validarNavegación();
        }

        private void validarNavegación()
        {
            if (Sesion.Instancia().UsuarioActual == null)
            {
                //Estoy en la pantalla de inicio, tengo que ir al login
                new Login().Show();
            }
            else
            {
                bllIdioma.Notify();
            }
            this.Close();

        }

        private void Lenguaje_Load(object sender, EventArgs e)
        {
            BLLIdioma bllIdioma = new BLLIdioma();
            listBox1.DataSource = bllIdioma.conseguirIdiomas();
            listBox1.SelectedIndex = -1;
            flagCargando = false;
        }

        private void Lenguaje_FormClosed(object sender, FormClosedEventArgs e)
        {
            if (Application.OpenForms.Count == 0)
                Application.Exit();
        }

        public void listBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!flagCargando) { 
                Sesion.Instancia().IdiomaActual = bllIdioma.establecerIdioma(((Idioma)listBox1.SelectedItem).Id);
                validarNavegación();
            }
        }

        private void listBox1_Click(object sender, EventArgs e)
        {
        }
    }
}

