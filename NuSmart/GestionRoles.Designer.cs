namespace NuSmart
{
    partial class GestionRoles
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(GestionRoles));
            this.treeView2 = new System.Windows.Forms.TreeView();
            this.label4 = new System.Windows.Forms.Label();
            this.roles_txt_codigo_rol = new System.Windows.Forms.TextBox();
            this.button1 = new System.Windows.Forms.Button();
            this.roles_txt_codigo_seleccion = new System.Windows.Forms.TextBox();
            this.roles_btn_crear_rol = new System.Windows.Forms.Button();
            this.label3 = new System.Windows.Forms.Label();
            this.roles_btn_asociar_rol = new System.Windows.Forms.Button();
            this.roles_txt_descripcion_rol = new System.Windows.Forms.TextBox();
            this.roles_txt_descripcion_seleccion = new System.Windows.Forms.TextBox();
            this.treeView1 = new System.Windows.Forms.TreeView();
            this.roles_txt_codigo_tipo = new System.Windows.Forms.TextBox();
            this.comboBox1 = new System.Windows.Forms.ComboBox();
            this.label1 = new System.Windows.Forms.Label();
            this.button2 = new System.Windows.Forms.Button();
            this.button3 = new System.Windows.Forms.Button();
            this.label2 = new System.Windows.Forms.Label();
            this.roles_txt_codigo_seleccion_usuario = new System.Windows.Forms.TextBox();
            this.roles_txt_descripcion_seleccion_usuario = new System.Windows.Forms.TextBox();
            this.roles_txt_codigo_tipo_usuario = new System.Windows.Forms.TextBox();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.groupBox1.SuspendLayout();
            this.SuspendLayout();
            // 
            // treeView2
            // 
            this.treeView2.Location = new System.Drawing.Point(6, 401);
            this.treeView2.Name = "treeView2";
            this.treeView2.Size = new System.Drawing.Size(410, 220);
            this.treeView2.TabIndex = 40;
            this.treeView2.AfterSelect += new System.Windows.Forms.TreeViewEventHandler(this.treeView2_AfterSelect);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(421, 19);
            this.label4.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(61, 13);
            this.label4.TabIndex = 33;
            this.label4.Text = "Nuevo Rol:";
            // 
            // roles_txt_codigo_rol
            // 
            this.roles_txt_codigo_rol.Location = new System.Drawing.Point(424, 34);
            this.roles_txt_codigo_rol.Margin = new System.Windows.Forms.Padding(2);
            this.roles_txt_codigo_rol.Name = "roles_txt_codigo_rol";
            this.roles_txt_codigo_rol.Size = new System.Drawing.Size(50, 20);
            this.roles_txt_codigo_rol.TabIndex = 34;
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(352, 351);
            this.button1.Margin = new System.Windows.Forms.Padding(2);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(64, 32);
            this.button1.TabIndex = 32;
            this.button1.Text = "Borrar";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // roles_txt_codigo_seleccion
            // 
            this.roles_txt_codigo_seleccion.Enabled = false;
            this.roles_txt_codigo_seleccion.Location = new System.Drawing.Point(74, 327);
            this.roles_txt_codigo_seleccion.Margin = new System.Windows.Forms.Padding(2);
            this.roles_txt_codigo_seleccion.Name = "roles_txt_codigo_seleccion";
            this.roles_txt_codigo_seleccion.Size = new System.Drawing.Size(50, 20);
            this.roles_txt_codigo_seleccion.TabIndex = 30;
            this.roles_txt_codigo_seleccion.TextChanged += new System.EventHandler(this.roles_txt_codigo_seleccion_TextChanged);
            // 
            // roles_btn_crear_rol
            // 
            this.roles_btn_crear_rol.Location = new System.Drawing.Point(522, 58);
            this.roles_btn_crear_rol.Margin = new System.Windows.Forms.Padding(2);
            this.roles_btn_crear_rol.Name = "roles_btn_crear_rol";
            this.roles_btn_crear_rol.Size = new System.Drawing.Size(70, 43);
            this.roles_btn_crear_rol.TabIndex = 36;
            this.roles_btn_crear_rol.Text = "Crear Rol";
            this.roles_btn_crear_rol.UseVisualStyleBackColor = true;
            this.roles_btn_crear_rol.Click += new System.EventHandler(this.roles_btn_crear_rol_Click);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(5, 330);
            this.label3.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(60, 13);
            this.label3.TabIndex = 29;
            this.label3.Text = "Seleccion: ";
            this.label3.Click += new System.EventHandler(this.label3_Click);
            // 
            // roles_btn_asociar_rol
            // 
            this.roles_btn_asociar_rol.Location = new System.Drawing.Point(597, 58);
            this.roles_btn_asociar_rol.Name = "roles_btn_asociar_rol";
            this.roles_btn_asociar_rol.Size = new System.Drawing.Size(101, 43);
            this.roles_btn_asociar_rol.TabIndex = 37;
            this.roles_btn_asociar_rol.Text = "Asociar a Seleccion";
            this.roles_btn_asociar_rol.UseVisualStyleBackColor = true;
            this.roles_btn_asociar_rol.Click += new System.EventHandler(this.roles_btn_asociar_rol_Click);
            // 
            // roles_txt_descripcion_rol
            // 
            this.roles_txt_descripcion_rol.Location = new System.Drawing.Point(478, 34);
            this.roles_txt_descripcion_rol.Margin = new System.Windows.Forms.Padding(2);
            this.roles_txt_descripcion_rol.Name = "roles_txt_descripcion_rol";
            this.roles_txt_descripcion_rol.Size = new System.Drawing.Size(220, 20);
            this.roles_txt_descripcion_rol.TabIndex = 35;
            // 
            // roles_txt_descripcion_seleccion
            // 
            this.roles_txt_descripcion_seleccion.Enabled = false;
            this.roles_txt_descripcion_seleccion.Location = new System.Drawing.Point(130, 327);
            this.roles_txt_descripcion_seleccion.Margin = new System.Windows.Forms.Padding(2);
            this.roles_txt_descripcion_seleccion.Name = "roles_txt_descripcion_seleccion";
            this.roles_txt_descripcion_seleccion.Size = new System.Drawing.Size(218, 20);
            this.roles_txt_descripcion_seleccion.TabIndex = 31;
            this.roles_txt_descripcion_seleccion.TextChanged += new System.EventHandler(this.roles_txt_descripcion_seleccion_TextChanged);
            // 
            // treeView1
            // 
            this.treeView1.Location = new System.Drawing.Point(6, 19);
            this.treeView1.Name = "treeView1";
            this.treeView1.Size = new System.Drawing.Size(410, 303);
            this.treeView1.TabIndex = 28;
            this.treeView1.AfterSelect += new System.Windows.Forms.TreeViewEventHandler(this.treeView1_AfterSelect);
            // 
            // roles_txt_codigo_tipo
            // 
            this.roles_txt_codigo_tipo.Enabled = false;
            this.roles_txt_codigo_tipo.Location = new System.Drawing.Point(352, 327);
            this.roles_txt_codigo_tipo.Margin = new System.Windows.Forms.Padding(2);
            this.roles_txt_codigo_tipo.Name = "roles_txt_codigo_tipo";
            this.roles_txt_codigo_tipo.Size = new System.Drawing.Size(64, 20);
            this.roles_txt_codigo_tipo.TabIndex = 38;
            // 
            // comboBox1
            // 
            this.comboBox1.FormattingEnabled = true;
            this.comboBox1.Location = new System.Drawing.Point(424, 417);
            this.comboBox1.Name = "comboBox1";
            this.comboBox1.Size = new System.Drawing.Size(190, 21);
            this.comboBox1.TabIndex = 41;
            this.comboBox1.SelectedIndexChanged += new System.EventHandler(this.comboBox1_SelectedIndexChanged);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(421, 401);
            this.label1.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(46, 13);
            this.label1.TabIndex = 42;
            this.label1.Text = "Usuario:";
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(597, 492);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(101, 58);
            this.button2.TabIndex = 44;
            this.button2.Text = "Asociar Seleccion a Rol de Usuario Seleccionado";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // button3
            // 
            this.button3.Location = new System.Drawing.Point(491, 492);
            this.button3.Margin = new System.Windows.Forms.Padding(2);
            this.button3.Name = "button3";
            this.button3.Size = new System.Drawing.Size(101, 58);
            this.button3.TabIndex = 45;
            this.button3.Text = "Desaociar Rol de Usuario";
            this.button3.UseVisualStyleBackColor = true;
            this.button3.Click += new System.EventHandler(this.button3_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(421, 453);
            this.label2.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(145, 13);
            this.label2.TabIndex = 46;
            this.label2.Text = "Rol de Usuario Seleccionado";
            // 
            // roles_txt_codigo_seleccion_usuario
            // 
            this.roles_txt_codigo_seleccion_usuario.Enabled = false;
            this.roles_txt_codigo_seleccion_usuario.Location = new System.Drawing.Point(424, 468);
            this.roles_txt_codigo_seleccion_usuario.Margin = new System.Windows.Forms.Padding(2);
            this.roles_txt_codigo_seleccion_usuario.Name = "roles_txt_codigo_seleccion_usuario";
            this.roles_txt_codigo_seleccion_usuario.Size = new System.Drawing.Size(50, 20);
            this.roles_txt_codigo_seleccion_usuario.TabIndex = 47;
            // 
            // roles_txt_descripcion_seleccion_usuario
            // 
            this.roles_txt_descripcion_seleccion_usuario.Enabled = false;
            this.roles_txt_descripcion_seleccion_usuario.Location = new System.Drawing.Point(478, 468);
            this.roles_txt_descripcion_seleccion_usuario.Margin = new System.Windows.Forms.Padding(2);
            this.roles_txt_descripcion_seleccion_usuario.Name = "roles_txt_descripcion_seleccion_usuario";
            this.roles_txt_descripcion_seleccion_usuario.Size = new System.Drawing.Size(220, 20);
            this.roles_txt_descripcion_seleccion_usuario.TabIndex = 48;
            // 
            // roles_txt_codigo_tipo_usuario
            // 
            this.roles_txt_codigo_tipo_usuario.Enabled = false;
            this.roles_txt_codigo_tipo_usuario.Location = new System.Drawing.Point(702, 468);
            this.roles_txt_codigo_tipo_usuario.Margin = new System.Windows.Forms.Padding(2);
            this.roles_txt_codigo_tipo_usuario.Name = "roles_txt_codigo_tipo_usuario";
            this.roles_txt_codigo_tipo_usuario.Size = new System.Drawing.Size(64, 20);
            this.roles_txt_codigo_tipo_usuario.TabIndex = 49;
            // 
            // groupBox1
            // 
            this.groupBox1.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("groupBox1.BackgroundImage")));
            this.groupBox1.Controls.Add(this.roles_txt_codigo_tipo_usuario);
            this.groupBox1.Controls.Add(this.roles_txt_descripcion_seleccion_usuario);
            this.groupBox1.Controls.Add(this.roles_txt_codigo_seleccion_usuario);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Controls.Add(this.button3);
            this.groupBox1.Controls.Add(this.button2);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Controls.Add(this.comboBox1);
            this.groupBox1.Controls.Add(this.roles_txt_codigo_tipo);
            this.groupBox1.Controls.Add(this.treeView1);
            this.groupBox1.Controls.Add(this.roles_txt_descripcion_seleccion);
            this.groupBox1.Controls.Add(this.roles_txt_descripcion_rol);
            this.groupBox1.Controls.Add(this.roles_btn_asociar_rol);
            this.groupBox1.Controls.Add(this.label3);
            this.groupBox1.Controls.Add(this.roles_btn_crear_rol);
            this.groupBox1.Controls.Add(this.roles_txt_codigo_seleccion);
            this.groupBox1.Controls.Add(this.button1);
            this.groupBox1.Controls.Add(this.roles_txt_codigo_rol);
            this.groupBox1.Controls.Add(this.label4);
            this.groupBox1.Controls.Add(this.treeView2);
            this.groupBox1.Location = new System.Drawing.Point(12, 12);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(798, 627);
            this.groupBox1.TabIndex = 39;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Gestion de Roles";
            // 
            // GestionRoles
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(822, 651);
            this.Controls.Add(this.groupBox1);
            this.Name = "GestionRoles";
            this.Text = "GestionRoles";
            this.Load += new System.EventHandler(this.GestionRoles_Load);
            this.Click += new System.EventHandler(this.GestionRoles_Click);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TreeView treeView2;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox roles_txt_codigo_rol;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.TextBox roles_txt_codigo_seleccion;
        private System.Windows.Forms.Button roles_btn_crear_rol;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Button roles_btn_asociar_rol;
        private System.Windows.Forms.TextBox roles_txt_descripcion_rol;
        private System.Windows.Forms.TextBox roles_txt_descripcion_seleccion;
        private System.Windows.Forms.TreeView treeView1;
        private System.Windows.Forms.TextBox roles_txt_codigo_tipo;
        private System.Windows.Forms.ComboBox comboBox1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Button button3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox roles_txt_codigo_seleccion_usuario;
        private System.Windows.Forms.TextBox roles_txt_descripcion_seleccion_usuario;
        private System.Windows.Forms.TextBox roles_txt_codigo_tipo_usuario;
        private System.Windows.Forms.GroupBox groupBox1;
    }
}