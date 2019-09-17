namespace NuSmart
{
    partial class GestionEtiqueta
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(GestionEtiqueta));
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.comboBox1 = new System.Windows.Forms.ComboBox();
            this.GestionEtiqueta_label_idioma = new System.Windows.Forms.Label();
            this.GestionEtiqueta_textbox_nombre_control = new System.Windows.Forms.TextBox();
            this.GestionEtiqueta_label_nombre_control = new System.Windows.Forms.Label();
            this.GestionEtiqueta_textbox_texto_leyenda = new System.Windows.Forms.TextBox();
            this.GestionEtiqueta_label_texto_leyenda = new System.Windows.Forms.Label();
            this.GestionEtiqueta_button_crear = new System.Windows.Forms.Button();
            this.GestionEtiqueta_button_borrar = new System.Windows.Forms.Button();
            this.GestionEtiqueta_button_modificar = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // dataGridView1
            // 
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(12, 144);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.Size = new System.Drawing.Size(693, 340);
            this.dataGridView1.TabIndex = 0;
            this.dataGridView1.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView1_CellClick);
            this.dataGridView1.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView1_CellContentClick);
            // 
            // comboBox1
            // 
            this.comboBox1.FormattingEnabled = true;
            this.comboBox1.Location = new System.Drawing.Point(12, 24);
            this.comboBox1.Name = "comboBox1";
            this.comboBox1.Size = new System.Drawing.Size(121, 21);
            this.comboBox1.TabIndex = 1;
            this.comboBox1.SelectedIndexChanged += new System.EventHandler(this.comboBox1_SelectedIndexChanged);
            // 
            // GestionEtiqueta_label_idioma
            // 
            this.GestionEtiqueta_label_idioma.AutoSize = true;
            this.GestionEtiqueta_label_idioma.Location = new System.Drawing.Point(9, 9);
            this.GestionEtiqueta_label_idioma.Name = "GestionEtiqueta_label_idioma";
            this.GestionEtiqueta_label_idioma.Size = new System.Drawing.Size(94, 13);
            this.GestionEtiqueta_label_idioma.TabIndex = 2;
            this.GestionEtiqueta_label_idioma.Text = "Seleccione Idioma";
            // 
            // GestionEtiqueta_textbox_nombre_control
            // 
            this.GestionEtiqueta_textbox_nombre_control.Location = new System.Drawing.Point(424, 25);
            this.GestionEtiqueta_textbox_nombre_control.Name = "GestionEtiqueta_textbox_nombre_control";
            this.GestionEtiqueta_textbox_nombre_control.Size = new System.Drawing.Size(190, 20);
            this.GestionEtiqueta_textbox_nombre_control.TabIndex = 4;
            this.GestionEtiqueta_textbox_nombre_control.TextChanged += new System.EventHandler(this.GestionEtiqueta_textbox_nombre_control_TextChanged);
            // 
            // GestionEtiqueta_label_nombre_control
            // 
            this.GestionEtiqueta_label_nombre_control.AutoSize = true;
            this.GestionEtiqueta_label_nombre_control.Location = new System.Drawing.Point(421, 9);
            this.GestionEtiqueta_label_nombre_control.Name = "GestionEtiqueta_label_nombre_control";
            this.GestionEtiqueta_label_nombre_control.Size = new System.Drawing.Size(96, 13);
            this.GestionEtiqueta_label_nombre_control.TabIndex = 5;
            this.GestionEtiqueta_label_nombre_control.Text = "Nombre del control";
            // 
            // GestionEtiqueta_textbox_texto_leyenda
            // 
            this.GestionEtiqueta_textbox_texto_leyenda.Location = new System.Drawing.Point(424, 70);
            this.GestionEtiqueta_textbox_texto_leyenda.Name = "GestionEtiqueta_textbox_texto_leyenda";
            this.GestionEtiqueta_textbox_texto_leyenda.Size = new System.Drawing.Size(190, 20);
            this.GestionEtiqueta_textbox_texto_leyenda.TabIndex = 6;
            this.GestionEtiqueta_textbox_texto_leyenda.TextChanged += new System.EventHandler(this.GestionEtiqueta_textbox_texto_leyenda_TextChanged);
            // 
            // GestionEtiqueta_label_texto_leyenda
            // 
            this.GestionEtiqueta_label_texto_leyenda.AutoSize = true;
            this.GestionEtiqueta_label_texto_leyenda.Location = new System.Drawing.Point(421, 54);
            this.GestionEtiqueta_label_texto_leyenda.Name = "GestionEtiqueta_label_texto_leyenda";
            this.GestionEtiqueta_label_texto_leyenda.Size = new System.Drawing.Size(104, 13);
            this.GestionEtiqueta_label_texto_leyenda.TabIndex = 7;
            this.GestionEtiqueta_label_texto_leyenda.Text = "Texto de la Leyenda";
            // 
            // GestionEtiqueta_button_crear
            // 
            this.GestionEtiqueta_button_crear.Location = new System.Drawing.Point(620, 20);
            this.GestionEtiqueta_button_crear.Name = "GestionEtiqueta_button_crear";
            this.GestionEtiqueta_button_crear.Size = new System.Drawing.Size(85, 29);
            this.GestionEtiqueta_button_crear.TabIndex = 8;
            this.GestionEtiqueta_button_crear.Text = "Crear";
            this.GestionEtiqueta_button_crear.UseVisualStyleBackColor = true;
            this.GestionEtiqueta_button_crear.Click += new System.EventHandler(this.button2_Click);
            // 
            // GestionEtiqueta_button_borrar
            // 
            this.GestionEtiqueta_button_borrar.Location = new System.Drawing.Point(529, 99);
            this.GestionEtiqueta_button_borrar.Name = "GestionEtiqueta_button_borrar";
            this.GestionEtiqueta_button_borrar.Size = new System.Drawing.Size(85, 39);
            this.GestionEtiqueta_button_borrar.TabIndex = 9;
            this.GestionEtiqueta_button_borrar.Text = "Borrar Seleccion";
            this.GestionEtiqueta_button_borrar.UseVisualStyleBackColor = true;
            this.GestionEtiqueta_button_borrar.Click += new System.EventHandler(this.button3_Click);
            // 
            // GestionEtiqueta_button_modificar
            // 
            this.GestionEtiqueta_button_modificar.Location = new System.Drawing.Point(438, 99);
            this.GestionEtiqueta_button_modificar.Name = "GestionEtiqueta_button_modificar";
            this.GestionEtiqueta_button_modificar.Size = new System.Drawing.Size(85, 39);
            this.GestionEtiqueta_button_modificar.TabIndex = 10;
            this.GestionEtiqueta_button_modificar.Text = "Modificar Seleccion";
            this.GestionEtiqueta_button_modificar.UseVisualStyleBackColor = true;
            this.GestionEtiqueta_button_modificar.Click += new System.EventHandler(this.button4_Click);
            // 
            // GestionEtiqueta
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("$this.BackgroundImage")));
            this.ClientSize = new System.Drawing.Size(717, 496);
            this.Controls.Add(this.GestionEtiqueta_button_modificar);
            this.Controls.Add(this.GestionEtiqueta_button_borrar);
            this.Controls.Add(this.GestionEtiqueta_button_crear);
            this.Controls.Add(this.GestionEtiqueta_label_texto_leyenda);
            this.Controls.Add(this.GestionEtiqueta_textbox_texto_leyenda);
            this.Controls.Add(this.GestionEtiqueta_label_nombre_control);
            this.Controls.Add(this.GestionEtiqueta_textbox_nombre_control);
            this.Controls.Add(this.GestionEtiqueta_label_idioma);
            this.Controls.Add(this.comboBox1);
            this.Controls.Add(this.dataGridView1);
            this.Name = "GestionEtiqueta";
            this.Load += new System.EventHandler(this.GestionEtiqueta_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.ComboBox comboBox1;
        private System.Windows.Forms.Label GestionEtiqueta_label_idioma;
        private System.Windows.Forms.TextBox GestionEtiqueta_textbox_nombre_control;
        private System.Windows.Forms.Label GestionEtiqueta_label_nombre_control;
        private System.Windows.Forms.TextBox GestionEtiqueta_textbox_texto_leyenda;
        private System.Windows.Forms.Label GestionEtiqueta_label_texto_leyenda;
        private System.Windows.Forms.Button GestionEtiqueta_button_crear;
        private System.Windows.Forms.Button GestionEtiqueta_button_borrar;
        private System.Windows.Forms.Button GestionEtiqueta_button_modificar;
    }
}