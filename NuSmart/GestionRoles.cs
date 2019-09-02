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


        public void actualizarSeleccion(Rol rol)
        {
            if (rol is Familia)
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

        private void button5_Click(object sender, EventArgs e)
        {
            if (bllRol.validarCodigoDeRol(roles_txt_codigo_permiso.Text))
            {
                Permiso nuevoPermiso = new Permiso();
                nuevoPermiso.Descripcion = roles_txt_descripcion_permiso.Text;
                nuevoPermiso.Codigo = roles_txt_codigo_permiso.Text;
                bllFamilia.agregarAFamilia(familiaSeleccionada, nuevoPermiso);
            }
            else
            {
                MessageBox.Show("Error: Ya existe el codigo ingresado!");
            }
        }


        private void GestionRoles_Load(object sender, EventArgs e)
        {
            PopularTreeView();
            //dataGridView1.DataSource = bllFamilia.conseguirFamilias();
            this.Width = 1000;
        }

    

        private void PopularTreeView()
        {
            List<Rol> roles = bllRol.conseguir();
            List<TreeNode> treenodes = new List<TreeNode>();

            foreach (Rol rol in roles)
            {
                if(rol is Familia)
                {
                    TreeNode treeNode = new TreeNode(rol.Descripcion, PopularHijos((Familia)rol));
                    treeNode.Tag = rol;
                    treeView1.Nodes.Add(treeNode);
                  
                }else
                {
                    TreeNode treeNode = new TreeNode(rol.Descripcion);
                    treeNode.Tag = rol;
                    treeView1.Nodes.Add(treeNode);
                }
            }
        }

        private TreeNode[] PopularHijos(Familia familia)
        {
            List<TreeNode> treeNodes = new List<TreeNode>();

            foreach (Rol rol in familia.Roles)
            {
                if (rol is Familia) {
                    TreeNode treeNode = new TreeNode(rol.Descripcion, PopularHijos((Familia)rol));
                    treeNode.Tag = rol;
                    treeNodes.Add(treeNode);
                }
                else
                {
                    TreeNode treeNode = new TreeNode(rol.Descripcion);
                    treeNode.Tag = rol;
                    treeNodes.Add(treeNode);
                }
            }
            return treeNodes.ToArray();
        }


        private void roles_btn_crear_familia_Click(object sender, EventArgs e)
        {
        }

        private void treeView1_AfterSelect(object sender, TreeViewEventArgs e)
        {

            TreeNode treeNode = treeView1.SelectedNode;
            

            if (treeNode.Tag is Familia)
            {
                familiaSeleccionada = (Familia)treeNode.Tag;
                roles_txt_codigo_familia.Text = familiaSeleccionada.Codigo;
                roles_txt_descripcion_familia.Text = familiaSeleccionada.Descripcion;
            }
            else
            {
                permisoSeleccionado = (Permiso)treeNode.Tag;
                roles_txt_codigo_permiso.Text = permisoSeleccionado.Codigo;
                roles_txt_descripcion_permiso.Text = permisoSeleccionado.Descripcion;
            }
        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void GestionRoles_Click(object sender, EventArgs e)
        {
            treeView1.SelectedNode = null;
            roles_txt_codigo_familia.Text = "";
            roles_txt_descripcion_familia.Text = "";

            roles_txt_codigo_permiso.Text = "";
            roles_txt_descripcion_permiso.Text = "";

        }
    }
}
