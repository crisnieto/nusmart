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
            this.FormBorderStyle = FormBorderStyle.FixedSingle;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.StartPosition = FormStartPosition.CenterScreen;
        }

        public virtual void Actualizar()
        {
            conseguirLeyendas();
        }

        private void conseguirLeyendas()
        {
            BLLIdioma bllIdioma = new BLLIdioma();

            foreach (Control control in this.Controls)
            {
                bllIdioma.conseguirLeyenda(control);
            }
        }


        private void InitializeComponent()
        {
            this.SuspendLayout();
            // 
            // FormObserver
            // 
            this.ClientSize = new System.Drawing.Size(274, 229);
            this.Name = "FormObserver";
            this.Load += new System.EventHandler(this.FormObserver_Load);
            this.ResumeLayout(false);

        }

        private void FormObserver_Load(object sender, EventArgs e)
        {

        }


        protected void reloadMainMenu(MenuStrip menu)
        {
            foreach (ToolStripMenuItem subitem in menu.Items) // Access each item
            {
                subitem.Text = bllIdioma.conseguirLeyendaMenu(subitem);
                if (subitem.HasDropDownItems)
                {
                    foreach (ToolStripMenuItem child in subitem.DropDownItems)
                    {
                        reloadMainMenu(child);
                    }
                }
            }
        }

        private void reloadMainMenu(ToolStripMenuItem item)
        {
            item.Text = bllIdioma.conseguirLeyendaMenu(item);
            if (item.HasDropDownItems)
            {
                foreach (ToolStripMenuItem subitem in item.DropDownItems) // access each item
                {
                    foreach (ToolStripMenuItem dropdownItem in subitem.DropDownItems)
                    {
                        reloadMainMenu(dropdownItem);
                    }
                }
            }
        }


    }
}

