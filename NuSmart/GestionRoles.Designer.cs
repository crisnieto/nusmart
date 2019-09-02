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
            this.roles_btn_crear_familia = new System.Windows.Forms.Button();
            this.button5 = new System.Windows.Forms.Button();
            this.button4 = new System.Windows.Forms.Button();
            this.button3 = new System.Windows.Forms.Button();
            this.roles_txt_descripcion_permiso = new System.Windows.Forms.TextBox();
            this.roles_txt_codigo_permiso = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.button2 = new System.Windows.Forms.Button();
            this.roles_txt_descripcion_familia = new System.Windows.Forms.TextBox();
            this.button1 = new System.Windows.Forms.Button();
            this.roles_txt_codigo_familia = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
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
            // roles_btn_crear_familia
            // 
            this.roles_btn_crear_familia.Location = new System.Drawing.Point(761, 82);
            this.roles_btn_crear_familia.Name = "roles_btn_crear_familia";
            this.roles_btn_crear_familia.Size = new System.Drawing.Size(101, 73);
            this.roles_btn_crear_familia.TabIndex = 27;
            this.roles_btn_crear_familia.Text = "Agregar a Familia Seleccionada";
            this.roles_btn_crear_familia.UseVisualStyleBackColor = true;
            this.roles_btn_crear_familia.Click += new System.EventHandler(this.roles_btn_crear_familia_Click);
            // 
            // button5
            // 
            this.button5.Location = new System.Drawing.Point(761, 231);
            this.button5.Margin = new System.Windows.Forms.Padding(2);
            this.button5.Name = "button5";
            this.button5.Size = new System.Drawing.Size(101, 73);
            this.button5.TabIndex = 26;
            this.button5.Text = "Agregar a Familia Seleccionada";
            this.button5.UseVisualStyleBackColor = true;
            // 
            // button4
            // 
            this.button4.Location = new System.Drawing.Point(687, 272);
            this.button4.Margin = new System.Windows.Forms.Padding(2);
            this.button4.Name = "button4";
            this.button4.Size = new System.Drawing.Size(70, 32);
            this.button4.TabIndex = 25;
            this.button4.Text = "Modificar";
            this.button4.UseVisualStyleBackColor = true;
            // 
            // button3
            // 
            this.button3.Location = new System.Drawing.Point(687, 231);
            this.button3.Margin = new System.Windows.Forms.Padding(2);
            this.button3.Name = "button3";
            this.button3.Size = new System.Drawing.Size(70, 32);
            this.button3.TabIndex = 24;
            this.button3.Text = "Borrar";
            this.button3.UseVisualStyleBackColor = true;
            // 
            // roles_txt_descripcion_permiso
            // 
            this.roles_txt_descripcion_permiso.Location = new System.Drawing.Point(645, 199);
            this.roles_txt_descripcion_permiso.Margin = new System.Windows.Forms.Padding(2);
            this.roles_txt_descripcion_permiso.Name = "roles_txt_descripcion_permiso";
            this.roles_txt_descripcion_permiso.Size = new System.Drawing.Size(217, 20);
            this.roles_txt_descripcion_permiso.TabIndex = 23;
            // 
            // roles_txt_codigo_permiso
            // 
            this.roles_txt_codigo_permiso.Location = new System.Drawing.Point(591, 199);
            this.roles_txt_codigo_permiso.Margin = new System.Windows.Forms.Padding(2);
            this.roles_txt_codigo_permiso.Name = "roles_txt_codigo_permiso";
            this.roles_txt_codigo_permiso.Size = new System.Drawing.Size(50, 20);
            this.roles_txt_codigo_permiso.TabIndex = 22;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(543, 202);
            this.label2.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(47, 13);
            this.label2.TabIndex = 21;
            this.label2.Text = "Permiso:";
            this.label2.Click += new System.EventHandler(this.label2_Click);
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(686, 123);
            this.button2.Margin = new System.Windows.Forms.Padding(2);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(70, 32);
            this.button2.TabIndex = 20;
            this.button2.Text = "Modificar";
            this.button2.UseVisualStyleBackColor = true;
            // 
            // roles_txt_descripcion_familia
            // 
            this.roles_txt_descripcion_familia.Location = new System.Drawing.Point(645, 57);
            this.roles_txt_descripcion_familia.Margin = new System.Windows.Forms.Padding(2);
            this.roles_txt_descripcion_familia.Name = "roles_txt_descripcion_familia";
            this.roles_txt_descripcion_familia.Size = new System.Drawing.Size(218, 20);
            this.roles_txt_descripcion_familia.TabIndex = 19;
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(686, 82);
            this.button1.Margin = new System.Windows.Forms.Padding(2);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(70, 32);
            this.button1.TabIndex = 18;
            this.button1.Text = "Borrar";
            this.button1.UseVisualStyleBackColor = true;
            // 
            // roles_txt_codigo_familia
            // 
            this.roles_txt_codigo_familia.Location = new System.Drawing.Point(589, 57);
            this.roles_txt_codigo_familia.Margin = new System.Windows.Forms.Padding(2);
            this.roles_txt_codigo_familia.Name = "roles_txt_codigo_familia";
            this.roles_txt_codigo_familia.Size = new System.Drawing.Size(50, 20);
            this.roles_txt_codigo_familia.TabIndex = 17;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(543, 60);
            this.label1.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(42, 13);
            this.label1.TabIndex = 16;
            this.label1.Text = "Familia:";
            // 
            // GestionRoles
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(963, 507);
            this.Controls.Add(this.treeView1);
            this.Controls.Add(this.roles_btn_crear_familia);
            this.Controls.Add(this.button5);
            this.Controls.Add(this.button4);
            this.Controls.Add(this.button3);
            this.Controls.Add(this.roles_txt_descripcion_permiso);
            this.Controls.Add(this.roles_txt_codigo_permiso);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.roles_txt_descripcion_familia);
            this.Controls.Add(this.button1);
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

        private System.Windows.Forms.Button button5;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.TextBox roles_txt_descripcion_familia;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.TextBox roles_txt_codigo_familia;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button roles_btn_crear_familia;
        private System.Windows.Forms.TreeView treeView1;
        private System.Windows.Forms.Button button4;
        private System.Windows.Forms.Button button3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox roles_txt_codigo_permiso;
        private System.Windows.Forms.TextBox roles_txt_descripcion_permiso;
    }
}