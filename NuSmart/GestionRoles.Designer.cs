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
            this.treeView1 = new System.Windows.Forms.TreeView();
            this.roles_btn_asociar_familia = new System.Windows.Forms.Button();
            this.roles_btn_asociar_permiso = new System.Windows.Forms.Button();
            this.roles_btn_borrar_permiso = new System.Windows.Forms.Button();
            this.roles_txt_descripcion_permiso = new System.Windows.Forms.TextBox();
            this.roles_txt_codigo_permiso = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.roles_txt_descripcion_familia = new System.Windows.Forms.TextBox();
            this.roles_btn_borrar_familia = new System.Windows.Forms.Button();
            this.roles_txt_codigo_familia = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.roles_txt_codigo_seleccion = new System.Windows.Forms.TextBox();
            this.roles_txt_descripcion_seleccion = new System.Windows.Forms.TextBox();
            this.button1 = new System.Windows.Forms.Button();
            this.roles_txt_descripcion_rol = new System.Windows.Forms.TextBox();
            this.roles_txt_codigo_rol = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.roles_btn_crear_rol = new System.Windows.Forms.Button();
            this.roles_btn_asociar_rol = new System.Windows.Forms.Button();
            this.roles_txt_codigo_tipo = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // treeView1
            // 
            this.treeView1.Location = new System.Drawing.Point(12, 12);
            this.treeView1.Name = "treeView1";
            this.treeView1.Size = new System.Drawing.Size(505, 464);
            this.treeView1.TabIndex = 28;
            this.treeView1.AfterSelect += new System.Windows.Forms.TreeViewEventHandler(this.treeView1_AfterSelect);
            // 
            // roles_btn_asociar_familia
            // 
            this.roles_btn_asociar_familia.Location = new System.Drawing.Point(758, 262);
            this.roles_btn_asociar_familia.Name = "roles_btn_asociar_familia";
            this.roles_btn_asociar_familia.Size = new System.Drawing.Size(101, 73);
            this.roles_btn_asociar_familia.TabIndex = 27;
            this.roles_btn_asociar_familia.Text = "Crear o Agregar a Familia Seleccionada";
            this.roles_btn_asociar_familia.UseVisualStyleBackColor = true;
            this.roles_btn_asociar_familia.Click += new System.EventHandler(this.roles_btn_crear_familia_Click);
            // 
            // roles_btn_asociar_permiso
            // 
            this.roles_btn_asociar_permiso.Location = new System.Drawing.Point(758, 411);
            this.roles_btn_asociar_permiso.Margin = new System.Windows.Forms.Padding(2);
            this.roles_btn_asociar_permiso.Name = "roles_btn_asociar_permiso";
            this.roles_btn_asociar_permiso.Size = new System.Drawing.Size(101, 73);
            this.roles_btn_asociar_permiso.TabIndex = 26;
            this.roles_btn_asociar_permiso.Text = "Agregar a Familia Seleccionada";
            this.roles_btn_asociar_permiso.UseVisualStyleBackColor = true;
            // 
            // roles_btn_borrar_permiso
            // 
            this.roles_btn_borrar_permiso.Location = new System.Drawing.Point(684, 411);
            this.roles_btn_borrar_permiso.Margin = new System.Windows.Forms.Padding(2);
            this.roles_btn_borrar_permiso.Name = "roles_btn_borrar_permiso";
            this.roles_btn_borrar_permiso.Size = new System.Drawing.Size(70, 32);
            this.roles_btn_borrar_permiso.TabIndex = 24;
            this.roles_btn_borrar_permiso.Text = "Borrar";
            this.roles_btn_borrar_permiso.UseVisualStyleBackColor = true;
            this.roles_btn_borrar_permiso.Click += new System.EventHandler(this.roles_btn_borrar_permiso_Click);
            // 
            // roles_txt_descripcion_permiso
            // 
            this.roles_txt_descripcion_permiso.Location = new System.Drawing.Point(642, 379);
            this.roles_txt_descripcion_permiso.Margin = new System.Windows.Forms.Padding(2);
            this.roles_txt_descripcion_permiso.Name = "roles_txt_descripcion_permiso";
            this.roles_txt_descripcion_permiso.Size = new System.Drawing.Size(217, 20);
            this.roles_txt_descripcion_permiso.TabIndex = 23;
            // 
            // roles_txt_codigo_permiso
            // 
            this.roles_txt_codigo_permiso.Location = new System.Drawing.Point(588, 379);
            this.roles_txt_codigo_permiso.Margin = new System.Windows.Forms.Padding(2);
            this.roles_txt_codigo_permiso.Name = "roles_txt_codigo_permiso";
            this.roles_txt_codigo_permiso.Size = new System.Drawing.Size(50, 20);
            this.roles_txt_codigo_permiso.TabIndex = 22;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(540, 382);
            this.label2.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(47, 13);
            this.label2.TabIndex = 21;
            this.label2.Text = "Permiso:";
            this.label2.Click += new System.EventHandler(this.label2_Click);
            // 
            // roles_txt_descripcion_familia
            // 
            this.roles_txt_descripcion_familia.Location = new System.Drawing.Point(642, 237);
            this.roles_txt_descripcion_familia.Margin = new System.Windows.Forms.Padding(2);
            this.roles_txt_descripcion_familia.Name = "roles_txt_descripcion_familia";
            this.roles_txt_descripcion_familia.Size = new System.Drawing.Size(218, 20);
            this.roles_txt_descripcion_familia.TabIndex = 19;
            // 
            // roles_btn_borrar_familia
            // 
            this.roles_btn_borrar_familia.Location = new System.Drawing.Point(683, 262);
            this.roles_btn_borrar_familia.Margin = new System.Windows.Forms.Padding(2);
            this.roles_btn_borrar_familia.Name = "roles_btn_borrar_familia";
            this.roles_btn_borrar_familia.Size = new System.Drawing.Size(70, 32);
            this.roles_btn_borrar_familia.TabIndex = 18;
            this.roles_btn_borrar_familia.Text = "Borrar";
            this.roles_btn_borrar_familia.UseVisualStyleBackColor = true;
            this.roles_btn_borrar_familia.Click += new System.EventHandler(this.roles_btn_borrar_familia_Click);
            // 
            // roles_txt_codigo_familia
            // 
            this.roles_txt_codigo_familia.Location = new System.Drawing.Point(586, 237);
            this.roles_txt_codigo_familia.Margin = new System.Windows.Forms.Padding(2);
            this.roles_txt_codigo_familia.Name = "roles_txt_codigo_familia";
            this.roles_txt_codigo_familia.Size = new System.Drawing.Size(50, 20);
            this.roles_txt_codigo_familia.TabIndex = 17;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(527, 240);
            this.label1.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(42, 13);
            this.label1.TabIndex = 16;
            this.label1.Text = "Familia:";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(527, 31);
            this.label3.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(60, 13);
            this.label3.TabIndex = 29;
            this.label3.Text = "Seleccion: ";
            // 
            // roles_txt_codigo_seleccion
            // 
            this.roles_txt_codigo_seleccion.Location = new System.Drawing.Point(588, 28);
            this.roles_txt_codigo_seleccion.Margin = new System.Windows.Forms.Padding(2);
            this.roles_txt_codigo_seleccion.Name = "roles_txt_codigo_seleccion";
            this.roles_txt_codigo_seleccion.Size = new System.Drawing.Size(50, 20);
            this.roles_txt_codigo_seleccion.TabIndex = 30;
            // 
            // roles_txt_descripcion_seleccion
            // 
            this.roles_txt_descripcion_seleccion.Location = new System.Drawing.Point(642, 28);
            this.roles_txt_descripcion_seleccion.Margin = new System.Windows.Forms.Padding(2);
            this.roles_txt_descripcion_seleccion.Name = "roles_txt_descripcion_seleccion";
            this.roles_txt_descripcion_seleccion.Size = new System.Drawing.Size(218, 20);
            this.roles_txt_descripcion_seleccion.TabIndex = 31;
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(642, 52);
            this.button1.Margin = new System.Windows.Forms.Padding(2);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(70, 32);
            this.button1.TabIndex = 32;
            this.button1.Text = "Borrar";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // roles_txt_descripcion_rol
            // 
            this.roles_txt_descripcion_rol.Location = new System.Drawing.Point(642, 114);
            this.roles_txt_descripcion_rol.Margin = new System.Windows.Forms.Padding(2);
            this.roles_txt_descripcion_rol.Name = "roles_txt_descripcion_rol";
            this.roles_txt_descripcion_rol.Size = new System.Drawing.Size(218, 20);
            this.roles_txt_descripcion_rol.TabIndex = 35;
            // 
            // roles_txt_codigo_rol
            // 
            this.roles_txt_codigo_rol.Location = new System.Drawing.Point(586, 114);
            this.roles_txt_codigo_rol.Margin = new System.Windows.Forms.Padding(2);
            this.roles_txt_codigo_rol.Name = "roles_txt_codigo_rol";
            this.roles_txt_codigo_rol.Size = new System.Drawing.Size(50, 20);
            this.roles_txt_codigo_rol.TabIndex = 34;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(527, 117);
            this.label4.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(61, 13);
            this.label4.TabIndex = 33;
            this.label4.Text = "Nuevo Rol:";
            // 
            // roles_btn_crear_rol
            // 
            this.roles_btn_crear_rol.Location = new System.Drawing.Point(642, 139);
            this.roles_btn_crear_rol.Margin = new System.Windows.Forms.Padding(2);
            this.roles_btn_crear_rol.Name = "roles_btn_crear_rol";
            this.roles_btn_crear_rol.Size = new System.Drawing.Size(70, 32);
            this.roles_btn_crear_rol.TabIndex = 36;
            this.roles_btn_crear_rol.Text = "Crear Rol";
            this.roles_btn_crear_rol.UseVisualStyleBackColor = true;
            this.roles_btn_crear_rol.Click += new System.EventHandler(this.roles_btn_crear_rol_Click);
            // 
            // roles_btn_asociar_rol
            // 
            this.roles_btn_asociar_rol.Location = new System.Drawing.Point(717, 139);
            this.roles_btn_asociar_rol.Name = "roles_btn_asociar_rol";
            this.roles_btn_asociar_rol.Size = new System.Drawing.Size(101, 43);
            this.roles_btn_asociar_rol.TabIndex = 37;
            this.roles_btn_asociar_rol.Text = "Asociar a Seleccion";
            this.roles_btn_asociar_rol.UseVisualStyleBackColor = true;
            this.roles_btn_asociar_rol.Click += new System.EventHandler(this.roles_btn_asociar_rol_Click);
            // 
            // roles_txt_codigo_tipo
            // 
            this.roles_txt_codigo_tipo.Location = new System.Drawing.Point(888, 28);
            this.roles_txt_codigo_tipo.Margin = new System.Windows.Forms.Padding(2);
            this.roles_txt_codigo_tipo.Name = "roles_txt_codigo_tipo";
            this.roles_txt_codigo_tipo.Size = new System.Drawing.Size(64, 20);
            this.roles_txt_codigo_tipo.TabIndex = 38;
            // 
            // GestionRoles
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(963, 507);
            this.Controls.Add(this.roles_txt_codigo_tipo);
            this.Controls.Add(this.roles_btn_asociar_rol);
            this.Controls.Add(this.roles_btn_crear_rol);
            this.Controls.Add(this.roles_txt_descripcion_rol);
            this.Controls.Add(this.roles_txt_codigo_rol);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.roles_txt_descripcion_seleccion);
            this.Controls.Add(this.roles_txt_codigo_seleccion);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.treeView1);
            this.Controls.Add(this.roles_btn_asociar_familia);
            this.Controls.Add(this.roles_btn_asociar_permiso);
            this.Controls.Add(this.roles_btn_borrar_permiso);
            this.Controls.Add(this.roles_txt_descripcion_permiso);
            this.Controls.Add(this.roles_txt_codigo_permiso);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.roles_txt_descripcion_familia);
            this.Controls.Add(this.roles_btn_borrar_familia);
            this.Controls.Add(this.roles_txt_codigo_familia);
            this.Controls.Add(this.label1);
            this.Name = "GestionRoles";
            this.Text = "GestionRoles";
            this.Load += new System.EventHandler(this.GestionRoles_Load);
            this.Click += new System.EventHandler(this.GestionRoles_Click);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button roles_btn_asociar_permiso;
        private System.Windows.Forms.TextBox roles_txt_descripcion_familia;
        private System.Windows.Forms.Button roles_btn_borrar_familia;
        private System.Windows.Forms.TextBox roles_txt_codigo_familia;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button roles_btn_asociar_familia;
        private System.Windows.Forms.TreeView treeView1;
        private System.Windows.Forms.Button roles_btn_borrar_permiso;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox roles_txt_codigo_permiso;
        private System.Windows.Forms.TextBox roles_txt_descripcion_permiso;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox roles_txt_codigo_seleccion;
        private System.Windows.Forms.TextBox roles_txt_descripcion_seleccion;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.TextBox roles_txt_descripcion_rol;
        private System.Windows.Forms.TextBox roles_txt_codigo_rol;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Button roles_btn_crear_rol;
        private System.Windows.Forms.Button roles_btn_asociar_rol;
        private System.Windows.Forms.TextBox roles_txt_codigo_tipo;
    }
}