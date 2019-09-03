using System;
using System.Collections.Generic;
using System.Windows.Forms;
using NuSmart.BE;
using NuSmart.BLL;

namespace NuSmart
{

    public partial class GestionRoles : FormObserver
    {
        BLLRol bllRol;
        BLLUsuario bllUsuario;
        Rol rolSeleccionado;
        Rol rolUsuarioSeleccionado;
        Usuario usuarioSeleccionado;

        public GestionRoles()
        {
            InitializeComponent();
            setup();
            bllRol = new BLLRol();
            bllUsuario = new BLLUsuario();
        }

        private void GestionRoles_Load(object sender, EventArgs e)
        {
            popularTreeView(treeView1, bllRol.conseguir());
            obtenerUsuarios();
        }

        private void popularTreeView(TreeView treeview, List<Rol> roles)
        {
            treeview.Nodes.Clear();
            List<TreeNode> treenodes = new List<TreeNode>();

            foreach (Rol rol in roles)
            {
                if (rol is Familia)
                {
                    TreeNode treeNode = new TreeNode(rol.Descripcion, popularHijos((Familia)rol));
                    treeNode.Tag = rol;
                    treeview.Nodes.Add(treeNode);

                }
                else
                {
                    TreeNode treeNode = new TreeNode(rol.Descripcion);
                    treeNode.Tag = rol;
                    treeview.Nodes.Add(treeNode);
                }
            }
        }

        private TreeNode[] popularHijos(Familia familia)
        {
            List<TreeNode> treeNodes = new List<TreeNode>();

            foreach (Rol rol in familia.Roles)
            {
                if (rol is Familia)
                {
                    TreeNode treeNode = new TreeNode(rol.Descripcion, popularHijos((Familia)rol));
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

        private void treeView1_AfterSelect(object sender, TreeViewEventArgs e)
        {

            TreeNode treeNode = treeView1.SelectedNode;


            if (treeNode.Tag is Familia)
            {
                roles_txt_codigo_tipo.Text = "Familia";
            }
            else
            {
                roles_txt_codigo_tipo.Text = "Permiso";
            }
            rolSeleccionado = (Rol)treeNode.Tag;

            roles_txt_codigo_seleccion.Text = rolSeleccionado.Codigo;
            roles_txt_descripcion_seleccion.Text = rolSeleccionado.Descripcion;
        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void GestionRoles_Click(object sender, EventArgs e)
        {
            limpiarSelecciones();
        }

        private void limpiarSelecciones()
        {
            treeView1.SelectedNode = null;
            treeView2.SelectedNode = null;
            rolSeleccionado = null;
            rolUsuarioSeleccionado = null;
            roles_txt_codigo_seleccion.Text = "";
            roles_txt_descripcion_seleccion.Text = "";
            roles_txt_codigo_tipo.Text = "";
            roles_txt_codigo_seleccion_usuario.Text = "";
            roles_txt_descripcion_seleccion_usuario.Text = "";
            roles_txt_codigo_tipo_usuario.Text = "";
        }

        private void button1_Click(object sender, EventArgs e)
        {
            bllRol.eliminar(rolSeleccionado);
            popularTreeView(treeView1, bllRol.conseguir());
            popularTreeView(treeView2, bllRol.conseguir(usuarioSeleccionado));
        }

        private void roles_btn_crear_rol_Click(object sender, EventArgs e)
        {
            try
            {
                Permiso permiso = new Permiso();
                permiso.Codigo = roles_txt_codigo_rol.Text;
                permiso.Descripcion = roles_txt_descripcion_rol.Text;
                bllRol.crearRol(permiso);
                popularTreeView(treeView1, bllRol.conseguir());
                limpiarSelecciones();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ocurrio un error en la consulta");
            }
        }

        private void roles_btn_asociar_rol_Click(object sender, EventArgs e)
        {
            try
            {
                Permiso permiso = new Permiso();
                permiso.Codigo = roles_txt_codigo_rol.Text;
                permiso.Descripcion = roles_txt_descripcion_rol.Text;
                bllRol.crearRol(permiso, rolSeleccionado);
                popularTreeView(treeView1, bllRol.conseguir());
                limpiarSelecciones();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ocurrio un error en la consulta");
            }
        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {
            treeView1.SelectedNode = null;
            rolSeleccionado = null;
            roles_txt_codigo_seleccion.Text = "";
            roles_txt_descripcion_seleccion.Text = "";
        }

        private void obtenerUsuarios()
        {
            comboBox1.DataSource = bllUsuario.conseguirUsuarios();
        }

        private void roles_btn_obtener_usuarios_Click(object sender, EventArgs e)
        {
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            usuarioSeleccionado = (Usuario)comboBox1.SelectedItem;
            List<Rol> roles = bllRol.conseguir(usuarioSeleccionado);
            usuarioSeleccionado.Roles = roles;
            popularTreeView(treeView2, roles);
        }

        private void button2_Click(object sender, EventArgs e)
        {
            try {
                bllRol.asociarAUsuario(rolSeleccionado, usuarioSeleccionado);
                List<Rol> roles = bllRol.conseguir(usuarioSeleccionado);
                usuarioSeleccionado.Roles = roles;
                popularTreeView(treeView2, bllRol.conseguir(usuarioSeleccionado));
                limpiarSelecciones();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void treeView2_AfterSelect(object sender, TreeViewEventArgs e)
        {
            TreeNode treeNode = treeView2.SelectedNode;


            if (treeNode.Tag is Familia)
            {
                roles_txt_codigo_tipo_usuario.Text = "Familia";
            }
            else
            {
                roles_txt_codigo_tipo_usuario.Text = "Permiso";
            }
            rolUsuarioSeleccionado = (Rol)treeNode.Tag;

            roles_txt_codigo_seleccion_usuario.Text = rolUsuarioSeleccionado.Codigo;
            roles_txt_descripcion_seleccion_usuario.Text = rolUsuarioSeleccionado.Descripcion;
        }

        private void button3_Click(object sender, EventArgs e)
        {
            try
            {
                bllRol.desasociarDeUsuario(rolUsuarioSeleccionado, usuarioSeleccionado);
                List<Rol> roles = bllRol.conseguir(usuarioSeleccionado);
                usuarioSeleccionado.Roles = roles;
                popularTreeView(treeView2, bllRol.conseguir(usuarioSeleccionado));
                limpiarSelecciones();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void roles_txt_codigo_seleccion_TextChanged(object sender, EventArgs e)
        {

        }

        private void roles_txt_descripcion_seleccion_TextChanged(object sender, EventArgs e)
        {

        }
    }
}

