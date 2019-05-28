namespace NuSmart
{
    partial class GestionIdioma
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
            this.gestion_idioma_txt_idioma = new System.Windows.Forms.TextBox();
            this.gestion_idioma_lbl_idioma = new System.Windows.Forms.Label();
            this.gestion_idioma_lbl_descripcion = new System.Windows.Forms.Label();
            this.gestion_idioma_txt_descripcion = new System.Windows.Forms.TextBox();
            this.gestion_idioma_btn_guardar = new System.Windows.Forms.Button();
            this.gestion_idioma_btn_modificar = new System.Windows.Forms.Button();
            this.gestion_idioma_btn_eliminar = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // dataGridView1
            // 
            this.dataGridView1.AllowUserToAddRows = false;
            this.dataGridView1.AllowUserToDeleteRows = false;
            this.dataGridView1.AllowUserToResizeColumns = false;
            this.dataGridView1.AllowUserToResizeRows = false;
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(12, 26);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.ReadOnly = true;
            this.dataGridView1.RowTemplate.Height = 33;
            this.dataGridView1.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dataGridView1.Size = new System.Drawing.Size(719, 251);
            this.dataGridView1.TabIndex = 0;
            this.dataGridView1.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView1_CellContentClick);
            this.dataGridView1.SelectionChanged += new System.EventHandler(this.dataGridView1_SelectionChanged);
            // 
            // gestion_idioma_txt_idioma
            // 
            this.gestion_idioma_txt_idioma.Location = new System.Drawing.Point(12, 337);
            this.gestion_idioma_txt_idioma.Name = "gestion_idioma_txt_idioma";
            this.gestion_idioma_txt_idioma.Size = new System.Drawing.Size(263, 31);
            this.gestion_idioma_txt_idioma.TabIndex = 1;
            // 
            // gestion_idioma_lbl_idioma
            // 
            this.gestion_idioma_lbl_idioma.AutoSize = true;
            this.gestion_idioma_lbl_idioma.Location = new System.Drawing.Point(12, 309);
            this.gestion_idioma_lbl_idioma.Name = "gestion_idioma_lbl_idioma";
            this.gestion_idioma_lbl_idioma.Size = new System.Drawing.Size(75, 25);
            this.gestion_idioma_lbl_idioma.TabIndex = 2;
            this.gestion_idioma_lbl_idioma.Text = "Idioma";
            // 
            // gestion_idioma_lbl_descripcion
            // 
            this.gestion_idioma_lbl_descripcion.AutoSize = true;
            this.gestion_idioma_lbl_descripcion.Location = new System.Drawing.Point(328, 309);
            this.gestion_idioma_lbl_descripcion.Name = "gestion_idioma_lbl_descripcion";
            this.gestion_idioma_lbl_descripcion.Size = new System.Drawing.Size(125, 25);
            this.gestion_idioma_lbl_descripcion.TabIndex = 4;
            this.gestion_idioma_lbl_descripcion.Text = "Descripcion";
            // 
            // gestion_idioma_txt_descripcion
            // 
            this.gestion_idioma_txt_descripcion.Location = new System.Drawing.Point(328, 337);
            this.gestion_idioma_txt_descripcion.Name = "gestion_idioma_txt_descripcion";
            this.gestion_idioma_txt_descripcion.Size = new System.Drawing.Size(403, 31);
            this.gestion_idioma_txt_descripcion.TabIndex = 3;
            // 
            // gestion_idioma_btn_guardar
            // 
            this.gestion_idioma_btn_guardar.Location = new System.Drawing.Point(12, 393);
            this.gestion_idioma_btn_guardar.Name = "gestion_idioma_btn_guardar";
            this.gestion_idioma_btn_guardar.Size = new System.Drawing.Size(119, 92);
            this.gestion_idioma_btn_guardar.TabIndex = 5;
            this.gestion_idioma_btn_guardar.Text = "Crear Idioma";
            this.gestion_idioma_btn_guardar.UseVisualStyleBackColor = true;
            this.gestion_idioma_btn_guardar.Click += new System.EventHandler(this.gestion_idioma_btn_guardar_Click);
            // 
            // gestion_idioma_btn_modificar
            // 
            this.gestion_idioma_btn_modificar.Location = new System.Drawing.Point(328, 393);
            this.gestion_idioma_btn_modificar.Name = "gestion_idioma_btn_modificar";
            this.gestion_idioma_btn_modificar.Size = new System.Drawing.Size(193, 92);
            this.gestion_idioma_btn_modificar.TabIndex = 6;
            this.gestion_idioma_btn_modificar.Text = "Modificar seleccionado";
            this.gestion_idioma_btn_modificar.UseVisualStyleBackColor = true;
            this.gestion_idioma_btn_modificar.Click += new System.EventHandler(this.gestion_idioma_btn_modificar_Click);
            // 
            // gestion_idioma_btn_eliminar
            // 
            this.gestion_idioma_btn_eliminar.Location = new System.Drawing.Point(546, 393);
            this.gestion_idioma_btn_eliminar.Name = "gestion_idioma_btn_eliminar";
            this.gestion_idioma_btn_eliminar.Size = new System.Drawing.Size(185, 92);
            this.gestion_idioma_btn_eliminar.TabIndex = 7;
            this.gestion_idioma_btn_eliminar.Text = "Eliminar Seleccionado";
            this.gestion_idioma_btn_eliminar.UseVisualStyleBackColor = true;
            this.gestion_idioma_btn_eliminar.Click += new System.EventHandler(this.gestion_idioma_btn_eliminar_Click);
            // 
            // GestionIdioma
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(12F, 25F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.Ivory;
            this.ClientSize = new System.Drawing.Size(743, 523);
            this.Controls.Add(this.gestion_idioma_btn_eliminar);
            this.Controls.Add(this.gestion_idioma_btn_modificar);
            this.Controls.Add(this.gestion_idioma_btn_guardar);
            this.Controls.Add(this.gestion_idioma_lbl_descripcion);
            this.Controls.Add(this.gestion_idioma_txt_descripcion);
            this.Controls.Add(this.gestion_idioma_lbl_idioma);
            this.Controls.Add(this.gestion_idioma_txt_idioma);
            this.Controls.Add(this.dataGridView1);
            this.Name = "GestionIdioma";
            this.Text = "GestionIdioma";
            this.Load += new System.EventHandler(this.GestionIdioma_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.TextBox gestion_idioma_txt_idioma;
        private System.Windows.Forms.Label gestion_idioma_lbl_idioma;
        private System.Windows.Forms.Label gestion_idioma_lbl_descripcion;
        private System.Windows.Forms.TextBox gestion_idioma_txt_descripcion;
        private System.Windows.Forms.Button gestion_idioma_btn_guardar;
        private System.Windows.Forms.Button gestion_idioma_btn_modificar;
        private System.Windows.Forms.Button gestion_idioma_btn_eliminar;
    }
}