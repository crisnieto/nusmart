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
    public partial class GestionRoles : FormObserver
    {

        BLLFamilia bllFamilia;
        BLLRol bllRol;

        Familia familiaSeleccionada;
        Permiso permisoSeleccionado;
        
        public GestionRoles()
        {
            InitializeComponent();
            setup();
            bllFamilia = new BLLFamilia();
            bllRol = new BLLRol();
        }

        private void Roles_Load(object sender, EventArgs e)
        {
            dataGridView1.DataSource = bllFamilia.conseguirFamilias();
            this.Width = 1000;
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void dataGridView1_SelectionChanged(object sender, EventArgs e)
        {
            if(dataGridView1.SelectedCells.Count > 0)
            {
                dataGridView1.Columns[0].AutoSizeMode = DataGridViewAutoSizeColumnMode.AllCells;
                Familia familiaSeleccionada = (Familia)dataGridView1.CurrentRow.DataBoundItem;
                dataGridView2.DataSource = bllRol.conseguirRolesHijosdeFamilia(familiaSeleccionada);
                actualizarSeleccion((Rol)dataGridView1.CurrentRow.DataBoundItem);
            }
        }

        public void actualizarSeleccion(Rol rol)
        {
            if(rol is Familia)
            {
                familiaSeleccionada = (Familia)rol;
                roles_txt_codigo_familia.Text = rol.Codigo;
                roles_txt_descripcion_familia.Text = rol.Descripcion;
            }
            else
            {
                permisoSeleccionado = (Permiso)rol;
                roles_txt_codigo_permiso.Text = rol.Codigo;
                roles_txt_descripcion_permiso.Text = rol.Descripcion;
            }
        }

        private void dataGridView2_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void dataGridView2_SelectionChanged(object sender, EventArgs e)
        {
            if (dataGridView2.SelectedCells.Count > 0)
            {
                dataGridView2.Columns[0].AutoSizeMode = DataGridViewAutoSizeColumnMode.AllCells;
                actualizarSeleccion((Rol)dataGridView2.CurrentRow.DataBoundItem);
            }
        }

        public void actualizarGrids()
        {
            dataGridView1.DataSource = bllFamilia.conseguirFamilias();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            if (bllRol.validarCodigoDeRol(roles_txt_codigo_permiso.Text))
            {
                Permiso nuevoPermiso = new Permiso();
                nuevoPermiso.Descripcion = roles_txt_descripcion_permiso.Text;
                nuevoPermiso.Codigo = roles_txt_codigo_permiso.Text;
                bllFamilia.agregarAFamilia(familiaSeleccionada, nuevoPermiso);
                actualizarGrids();
            }
            else
            {
                MessageBox.Show("Error: Ya existe el codigo ingresado!");
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            bllRol.eliminar(permisoSeleccionado);
            actualizarGrids();
        }
    }
}
