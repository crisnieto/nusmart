using System;
using System.Collections.Generic;
using System.Windows.Forms;


using NuSmart.BE;
using NuSmart.BLL;

namespace NuSmart
{
    public partial class Bitacora : FormObserver
    {
        BLLBitacora bllBitacora;
        List<BE.Usuario> usuariosConBitacoras;
        List<BE.Bitacora> bitacorasConseguidas;
        public Bitacora()
        {
            InitializeComponent();
            setup();
        }

        private void Bitacora_Load(object sender, EventArgs e)
        {
            try
            {
                Sesion.Instancia().verificarPermiso("OP45");
                bllBitacora = new BLLBitacora();
                dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.AllCells;
                dataGridView1.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
                dataGridView1.MultiSelect = false;
                dataGridView1.ReadOnly = true;
                usuariosConBitacoras = bllBitacora.conseguirUsuarios();
                mostrarUsuariosConBitacoras();
            }
            catch (Exception ex)
            {
                MessageBox.Show(NuSmartMessage.formatearMensaje("Error_messagebox_carga_formulario"));
            }
        }

        private void listBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void mostrarUsuariosConBitacoras()
        {
            foreach (Usuario usuario in usuariosConBitacoras)
            {
                listBox1.Items.Add(usuario);
            }
        }


        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void bitacora_lbl_usuarios_Click(object sender, EventArgs e)
        {

        }

        /** 
         * Nota: Se toma el valor solo de Date del datepicker_desde para que use como punto de partida por default 00:00:00. Hasta toma el Value completo, que tiene el horario actual. 
         *
         */ 
        private void bitacora_btn_buscar_Click(object sender, EventArgs e)
        {
            try
            {
                DateTime hasta = bitacora_datepicker_hasta.Value.Date;
                hasta = hasta.AddHours(23 - hasta.Hour);
                hasta = hasta.AddMinutes(59 - hasta.Minute);

                DateTime desde = bitacora_datepicker_desde.Value.Date;

                if (listBox1.SelectedItem != null)
                {
                    Usuario usuario = (Usuario)listBox1.SelectedItem;
                    dataGridView1.DataSource = bllBitacora.conseguirBitacorasConUsuario(usuario, desde, hasta, conseguirFiltroCriticidad());
                    dataGridView1.DefaultCellStyle.Format = "dd/MM/yyyy HH:mm:ss";
                }
                else
                {
                    dataGridView1.DataSource = bllBitacora.conseguirBitacorasSinUsuario(desde, hasta, conseguirFiltroCriticidad());
                    dataGridView1.DefaultCellStyle.Format = "dd/MM/yyyy HH:mm:ss";
                }
                return;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                Console.WriteLine(ex);
            }
        }

        private string conseguirFiltroCriticidad()
        {
            if (Bitacora_radiobutton_criticidad_alta.Checked)
            {
                return "Alta";
            }else if (Bitacora_radiobutton_criticidad_media.Checked)
            {
                return "Media";
            }else if (Bitacora_radiobutton_criticidad_baja.Checked)
            {
                return "Baja";
            }
            return null;
        }

        private void bitacora_datepicker_desde_ValueChanged(object sender, EventArgs e)
        {

        }

        private void Bitacora_MouseClick(object sender, MouseEventArgs e)
        {
            listBox1.ClearSelected();
        }

    }
}
