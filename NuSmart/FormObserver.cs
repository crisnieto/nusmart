using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using NuSmart.BLL;

namespace NuSmart
{
    public class FormObserver : Form , BE.IObserver
    {
        BLLIdioma bllIdioma;
        public void setup()
        {
            bllIdioma = new BLLIdioma();
            bllIdioma.Attach(this);
            this.conseguirLeyendas();
        }

        public void Actualizar()
        {
            conseguirLeyendas();
        }

        private void conseguirLeyendas()
        {
            BLLIdioma bllIdioma = new BLLIdioma();

            foreach (Control control in this.Controls)
            {
                control.Text = bllIdioma.conseguirLeyenda(control);
            }
        }

        private void InitializeComponent()
        {
            this.SuspendLayout();
            // 
            // FormObserver
            // 
            this.ClientSize = new System.Drawing.Size(284, 261);
            this.Name = "FormObserver";
            this.FormClosed += new System.Windows.Forms.FormClosedEventHandler(this.FormObserver_FormClosed);
            this.Load += new System.EventHandler(this.FormObserver_Load);
            this.ResumeLayout(false);

        }

        private void FormObserver_Load(object sender, EventArgs e)
        {


        }

        private void FormObserver_FormClosed(object sender, FormClosedEventArgs e)
        {
        }
    }
}

