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
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.dataGridView2 = new System.Windows.Forms.DataGridView();
            this.label1 = new System.Windows.Forms.Label();
            this.roles_txt_codigo_familia = new System.Windows.Forms.TextBox();
            this.button1 = new System.Windows.Forms.Button();
            this.roles_txt_descripcion_familia = new System.Windows.Forms.TextBox();
            this.button2 = new System.Windows.Forms.Button();
            this.label2 = new System.Windows.Forms.Label();
            this.roles_txt_codigo_permiso = new System.Windows.Forms.TextBox();
            this.roles_txt_descripcion_permiso = new System.Windows.Forms.TextBox();
            this.button3 = new System.Windows.Forms.Button();
            this.button4 = new System.Windows.Forms.Button();
            this.button5 = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView2)).BeginInit();
            this.SuspendLayout();
            // 
            // dataGridView1
            // 
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(12, 88);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.RowTemplate.Height = 33;
            this.dataGridView1.Size = new System.Drawing.Size(1015, 471);
            this.dataGridView1.TabIndex = 0;
            this.dataGridView1.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView1_CellContentClick);
            this.dataGridView1.SelectionChanged += new System.EventHandler(this.dataGridView1_SelectionChanged);
            // 
            // dataGridView2
            // 
            this.dataGridView2.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView2.Location = new System.Drawing.Point(1065, 88);
            this.dataGridView2.Name = "dataGridView2";
            this.dataGridView2.RowTemplate.Height = 33;
            this.dataGridView2.Size = new System.Drawing.Size(913, 471);
            this.dataGridView2.TabIndex = 1;
            this.dataGridView2.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView2_CellContentClick);
            this.dataGridView2.SelectionChanged += new System.EventHandler(this.dataGridView2_SelectionChanged);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 589);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(223, 25);
            this.label1.TabIndex = 2;
            this.label1.Text = "Familia Seleccionada:";
            // 
            // roles_txt_codigo_familia
            // 
            this.roles_txt_codigo_familia.Location = new System.Drawing.Point(241, 589);
            this.roles_txt_codigo_familia.Name = "roles_txt_codigo_familia";
            this.roles_txt_codigo_familia.Size = new System.Drawing.Size(96, 31);
            this.roles_txt_codigo_familia.TabIndex = 4;
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(17, 648);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(140, 61);
            this.button1.TabIndex = 5;
            this.button1.Text = "Borrar";
            this.button1.UseVisualStyleBackColor = true;
            // 
            // roles_txt_descripcion_familia
            // 
            this.roles_txt_descripcion_familia.Location = new System.Drawing.Point(343, 589);
            this.roles_txt_descripcion_familia.Name = "roles_txt_descripcion_familia";
            this.roles_txt_descripcion_familia.Size = new System.Drawing.Size(200, 31);
            this.roles_txt_descripcion_familia.TabIndex = 6;
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(172, 648);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(140, 61);
            this.button2.TabIndex = 7;
            this.button2.Text = "Modificar";
            this.button2.UseVisualStyleBackColor = true;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(644, 589);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(226, 25);
            this.label2.TabIndex = 8;
            this.label2.Text = "Permiso Seleccionado";
            // 
            // roles_txt_codigo_permiso
            // 
            this.roles_txt_codigo_permiso.Location = new System.Drawing.Point(876, 586);
            this.roles_txt_codigo_permiso.Name = "roles_txt_codigo_permiso";
            this.roles_txt_codigo_permiso.Size = new System.Drawing.Size(96, 31);
            this.roles_txt_codigo_permiso.TabIndex = 9;
            // 
            // roles_txt_descripcion_permiso
            // 
            this.roles_txt_descripcion_permiso.Location = new System.Drawing.Point(978, 586);
            this.roles_txt_descripcion_permiso.Name = "roles_txt_descripcion_permiso";
            this.roles_txt_descripcion_permiso.Size = new System.Drawing.Size(205, 31);
            this.roles_txt_descripcion_permiso.TabIndex = 10;
            // 
            // button3
            // 
            this.button3.Location = new System.Drawing.Point(649, 648);
            this.button3.Name = "button3";
            this.button3.Size = new System.Drawing.Size(140, 61);
            this.button3.TabIndex = 11;
            this.button3.Text = "Borrar";
            this.button3.UseVisualStyleBackColor = true;
            this.button3.Click += new System.EventHandler(this.button3_Click);
            // 
            // button4
            // 
            this.button4.Location = new System.Drawing.Point(808, 648);
            this.button4.Name = "button4";
            this.button4.Size = new System.Drawing.Size(140, 61);
            this.button4.TabIndex = 12;
            this.button4.Text = "Modificar";
            this.button4.UseVisualStyleBackColor = true;
            // 
            // button5
            // 
            this.button5.Location = new System.Drawing.Point(963, 648);
            this.button5.Name = "button5";
            this.button5.Size = new System.Drawing.Size(202, 131);
            this.button5.TabIndex = 13;
            this.button5.Text = "Agregar a Familia Seleccionada";
            this.button5.UseVisualStyleBackColor = true;
            this.button5.Click += new System.EventHandler(this.button5_Click);
            // 
            // GestionRoles
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(12F, 25F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(2030, 791);
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
            this.Controls.Add(this.dataGridView2);
            this.Controls.Add(this.dataGridView1);
            this.Name = "GestionRoles";
            this.StartPosition = System.Windows.Forms.FormStartPosition.WindowsDefaultBounds;
            this.Load += new System.EventHandler(this.Roles_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView2)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.DataGridView dataGridView2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox roles_txt_codigo_familia;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.TextBox roles_txt_descripcion_familia;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox roles_txt_codigo_permiso;
        private System.Windows.Forms.TextBox roles_txt_descripcion_permiso;
        private System.Windows.Forms.Button button3;
        private System.Windows.Forms.Button button4;
        private System.Windows.Forms.Button button5;
    }
}