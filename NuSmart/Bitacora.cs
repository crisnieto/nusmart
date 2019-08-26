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
            bllBitacora = new BLLBitacora();
            usuariosConBitacoras = bllBitacora.conseguirUsuarios();
            mostrarUsuariosConBitacoras();
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

        private void bitacora_btn_buscar_Click(object sender, EventArgs e)
        {
            try
            {
                Usuario usuario = (Usuario)listBox1.SelectedItem;

                dataGridView1.DataSource = bllBitacora.conseguirBitacorasConUsuario(usuario);
                dataGridView1.DefaultCellStyle.Format = "dd/MM/yyyy HH:mm:ss";
                return;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ocurrió un error al ejecutar la consulta. Verifique la selección de usuario y la conexión");
                Console.WriteLine(ex);
            }
        }
    }
}
