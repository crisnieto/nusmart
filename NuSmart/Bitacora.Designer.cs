namespace NuSmart
{
    partial class Bitacora
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Bitacora));
            this.Bitacora_label_hasta = new System.Windows.Forms.Label();
            this.Bitacora_label_desde = new System.Windows.Forms.Label();
            this.bitacora_datepicker_hasta = new System.Windows.Forms.DateTimePicker();
            this.bitacora_datepicker_desde = new System.Windows.Forms.DateTimePicker();
            this.Bitacora_label_criticidad = new System.Windows.Forms.Label();
            this.bitacora_radio_alta = new System.Windows.Forms.RadioButton();
            this.bitacora_radio_media = new System.Windows.Forms.RadioButton();
            this.bitacora_radio_baja = new System.Windows.Forms.RadioButton();
            this.Bitacora_radiobutton_todas = new System.Windows.Forms.RadioButton();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.Bitacora_label_usuarios = new System.Windows.Forms.Label();
            this.Bitacora_button_buscar = new System.Windows.Forms.Button();
            this.listBox1 = new System.Windows.Forms.ListBox();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // Bitacora_label_hasta
            // 
            this.Bitacora_label_hasta.AutoSize = true;
            this.Bitacora_label_hasta.Location = new System.Drawing.Point(274, 60);
            this.Bitacora_label_hasta.Name = "Bitacora_label_hasta";
            this.Bitacora_label_hasta.Size = new System.Drawing.Size(35, 13);
            this.Bitacora_label_hasta.TabIndex = 17;
            this.Bitacora_label_hasta.Text = "Hasta";
            // 
            // Bitacora_label_desde
            // 
            this.Bitacora_label_desde.AutoSize = true;
            this.Bitacora_label_desde.Location = new System.Drawing.Point(274, 15);
            this.Bitacora_label_desde.Name = "Bitacora_label_desde";
            this.Bitacora_label_desde.Size = new System.Drawing.Size(38, 13);
            this.Bitacora_label_desde.TabIndex = 16;
            this.Bitacora_label_desde.Text = "Desde";
            // 
            // bitacora_datepicker_hasta
            // 
            this.bitacora_datepicker_hasta.Location = new System.Drawing.Point(277, 76);
            this.bitacora_datepicker_hasta.Name = "bitacora_datepicker_hasta";
            this.bitacora_datepicker_hasta.Size = new System.Drawing.Size(200, 20);
            this.bitacora_datepicker_hasta.TabIndex = 15;
            this.bitacora_datepicker_hasta.Value = new System.DateTime(2019, 12, 31, 0, 0, 0, 0);
            // 
            // bitacora_datepicker_desde
            // 
            this.bitacora_datepicker_desde.Location = new System.Drawing.Point(277, 30);
            this.bitacora_datepicker_desde.Name = "bitacora_datepicker_desde";
            this.bitacora_datepicker_desde.Size = new System.Drawing.Size(200, 20);
            this.bitacora_datepicker_desde.TabIndex = 14;
            this.bitacora_datepicker_desde.Value = new System.DateTime(2019, 8, 31, 0, 0, 0, 0);
            this.bitacora_datepicker_desde.ValueChanged += new System.EventHandler(this.bitacora_datepicker_desde_ValueChanged);
            // 
            // Bitacora_label_criticidad
            // 
            this.Bitacora_label_criticidad.AutoSize = true;
            this.Bitacora_label_criticidad.Location = new System.Drawing.Point(164, 15);
            this.Bitacora_label_criticidad.Name = "Bitacora_label_criticidad";
            this.Bitacora_label_criticidad.Size = new System.Drawing.Size(50, 13);
            this.Bitacora_label_criticidad.TabIndex = 13;
            this.Bitacora_label_criticidad.Text = "Criticidad";
            // 
            // bitacora_radio_alta
            // 
            this.bitacora_radio_alta.AutoSize = true;
            this.bitacora_radio_alta.Location = new System.Drawing.Point(167, 99);
            this.bitacora_radio_alta.Name = "bitacora_radio_alta";
            this.bitacora_radio_alta.Size = new System.Drawing.Size(43, 17);
            this.bitacora_radio_alta.TabIndex = 12;
            this.bitacora_radio_alta.Text = "Alta";
            this.bitacora_radio_alta.UseVisualStyleBackColor = true;
            // 
            // bitacora_radio_media
            // 
            this.bitacora_radio_media.AutoSize = true;
            this.bitacora_radio_media.Location = new System.Drawing.Point(167, 76);
            this.bitacora_radio_media.Name = "bitacora_radio_media";
            this.bitacora_radio_media.Size = new System.Drawing.Size(54, 17);
            this.bitacora_radio_media.TabIndex = 11;
            this.bitacora_radio_media.Text = "Media";
            this.bitacora_radio_media.UseVisualStyleBackColor = true;
            // 
            // bitacora_radio_baja
            // 
            this.bitacora_radio_baja.AutoSize = true;
            this.bitacora_radio_baja.Location = new System.Drawing.Point(167, 53);
            this.bitacora_radio_baja.Name = "bitacora_radio_baja";
            this.bitacora_radio_baja.Size = new System.Drawing.Size(46, 17);
            this.bitacora_radio_baja.TabIndex = 10;
            this.bitacora_radio_baja.Text = "Baja";
            this.bitacora_radio_baja.UseVisualStyleBackColor = true;
            // 
            // Bitacora_radiobutton_todas
            // 
            this.Bitacora_radiobutton_todas.AutoSize = true;
            this.Bitacora_radiobutton_todas.Checked = true;
            this.Bitacora_radiobutton_todas.Location = new System.Drawing.Point(167, 30);
            this.Bitacora_radiobutton_todas.Name = "Bitacora_radiobutton_todas";
            this.Bitacora_radiobutton_todas.Size = new System.Drawing.Size(55, 17);
            this.Bitacora_radiobutton_todas.TabIndex = 9;
            this.Bitacora_radiobutton_todas.TabStop = true;
            this.Bitacora_radiobutton_todas.Text = "Todas";
            this.Bitacora_radiobutton_todas.UseVisualStyleBackColor = true;
            // 
            // dataGridView1
            // 
            this.dataGridView1.AllowUserToOrderColumns = true;
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(4, 144);
            this.dataGridView1.Margin = new System.Windows.Forms.Padding(2);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.RowTemplate.Height = 33;
            this.dataGridView1.Size = new System.Drawing.Size(598, 171);
            this.dataGridView1.TabIndex = 8;
            this.dataGridView1.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView1_CellContentClick);
            // 
            // Bitacora_label_usuarios
            // 
            this.Bitacora_label_usuarios.AutoSize = true;
            this.Bitacora_label_usuarios.Location = new System.Drawing.Point(2, 15);
            this.Bitacora_label_usuarios.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.Bitacora_label_usuarios.Name = "Bitacora_label_usuarios";
            this.Bitacora_label_usuarios.Size = new System.Drawing.Size(43, 13);
            this.Bitacora_label_usuarios.TabIndex = 7;
            this.Bitacora_label_usuarios.Text = "Usuario";
            // 
            // Bitacora_button_buscar
            // 
            this.Bitacora_button_buscar.Location = new System.Drawing.Point(498, 30);
            this.Bitacora_button_buscar.Margin = new System.Windows.Forms.Padding(2);
            this.Bitacora_button_buscar.Name = "Bitacora_button_buscar";
            this.Bitacora_button_buscar.Size = new System.Drawing.Size(100, 93);
            this.Bitacora_button_buscar.TabIndex = 6;
            this.Bitacora_button_buscar.Text = "Buscar Eventos";
            this.Bitacora_button_buscar.UseVisualStyleBackColor = true;
            this.Bitacora_button_buscar.Click += new System.EventHandler(this.bitacora_btn_buscar_Click);
            // 
            // listBox1
            // 
            this.listBox1.FormattingEnabled = true;
            this.listBox1.Location = new System.Drawing.Point(4, 30);
            this.listBox1.Margin = new System.Windows.Forms.Padding(2);
            this.listBox1.Name = "listBox1";
            this.listBox1.Size = new System.Drawing.Size(117, 82);
            this.listBox1.TabIndex = 5;
            // 
            // Bitacora
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("$this.BackgroundImage")));
            this.ClientSize = new System.Drawing.Size(605, 331);
            this.Controls.Add(this.Bitacora_label_hasta);
            this.Controls.Add(this.Bitacora_label_desde);
            this.Controls.Add(this.bitacora_datepicker_hasta);
            this.Controls.Add(this.bitacora_datepicker_desde);
            this.Controls.Add(this.Bitacora_label_criticidad);
            this.Controls.Add(this.bitacora_radio_alta);
            this.Controls.Add(this.bitacora_radio_media);
            this.Controls.Add(this.bitacora_radio_baja);
            this.Controls.Add(this.Bitacora_radiobutton_todas);
            this.Controls.Add(this.dataGridView1);
            this.Controls.Add(this.Bitacora_label_usuarios);
            this.Controls.Add(this.Bitacora_button_buscar);
            this.Controls.Add(this.listBox1);
            this.Name = "Bitacora";
            this.Text = "Bitacora";
            this.Load += new System.EventHandler(this.Bitacora_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.Label Bitacora_label_usuarios;
        private System.Windows.Forms.Button Bitacora_button_buscar;
        private System.Windows.Forms.ListBox listBox1;
        private System.Windows.Forms.RadioButton Bitacora_radiobutton_todas;
        private System.Windows.Forms.RadioButton bitacora_radio_baja;
        private System.Windows.Forms.RadioButton bitacora_radio_media;
        private System.Windows.Forms.RadioButton bitacora_radio_alta;
        private System.Windows.Forms.Label Bitacora_label_criticidad;
        private System.Windows.Forms.DateTimePicker bitacora_datepicker_desde;
        private System.Windows.Forms.DateTimePicker bitacora_datepicker_hasta;
        private System.Windows.Forms.Label Bitacora_label_desde;
        private System.Windows.Forms.Label Bitacora_label_hasta;
    }
}