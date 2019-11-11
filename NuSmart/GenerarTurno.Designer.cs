namespace NuSmart
{
    partial class GenerarTurno
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(GenerarTurno));
            this.monthCalendar1 = new System.Windows.Forms.MonthCalendar();
            this.GenerarTurno_label_titulo = new System.Windows.Forms.Label();
            this.GenerarTurno_label_dia = new System.Windows.Forms.Label();
            this.GenerarTurno_label_manana = new System.Windows.Forms.RadioButton();
            this.GenerarTurno_label_tarde = new System.Windows.Forms.RadioButton();
            this.label3 = new System.Windows.Forms.Label();
            this.comboBox1 = new System.Windows.Forms.ComboBox();
            this.GenerarTurno_label_crear_turno = new System.Windows.Forms.Button();
            this.GenerarTurno_label_motivo = new System.Windows.Forms.Label();
            this.GenerarTurno_textbox_motivoConsulta = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // monthCalendar1
            // 
            this.monthCalendar1.Location = new System.Drawing.Point(18, 92);
            this.monthCalendar1.Name = "monthCalendar1";
            this.monthCalendar1.TabIndex = 0;
            this.monthCalendar1.DateChanged += new System.Windows.Forms.DateRangeEventHandler(this.monthCalendar1_DateChanged);
            // 
            // GenerarTurno_label_titulo
            // 
            this.GenerarTurno_label_titulo.AutoSize = true;
            this.GenerarTurno_label_titulo.Location = new System.Drawing.Point(15, 9);
            this.GenerarTurno_label_titulo.Name = "GenerarTurno_label_titulo";
            this.GenerarTurno_label_titulo.Size = new System.Drawing.Size(158, 13);
            this.GenerarTurno_label_titulo.TabIndex = 1;
            this.GenerarTurno_label_titulo.Text = "Turno sugerido para el Paciente";
            // 
            // GenerarTurno_label_dia
            // 
            this.GenerarTurno_label_dia.AutoSize = true;
            this.GenerarTurno_label_dia.Location = new System.Drawing.Point(15, 70);
            this.GenerarTurno_label_dia.Name = "GenerarTurno_label_dia";
            this.GenerarTurno_label_dia.Size = new System.Drawing.Size(138, 13);
            this.GenerarTurno_label_dia.TabIndex = 2;
            this.GenerarTurno_label_dia.Text = "Seleccione Dia Preferencial";
            // 
            // GenerarTurno_label_manana
            // 
            this.GenerarTurno_label_manana.AutoSize = true;
            this.GenerarTurno_label_manana.Checked = true;
            this.GenerarTurno_label_manana.Location = new System.Drawing.Point(67, 266);
            this.GenerarTurno_label_manana.Name = "GenerarTurno_label_manana";
            this.GenerarTurno_label_manana.Size = new System.Drawing.Size(64, 17);
            this.GenerarTurno_label_manana.TabIndex = 3;
            this.GenerarTurno_label_manana.TabStop = true;
            this.GenerarTurno_label_manana.Text = "Manana";
            this.GenerarTurno_label_manana.UseVisualStyleBackColor = true;
            this.GenerarTurno_label_manana.CheckedChanged += new System.EventHandler(this.radioButton1_CheckedChanged);
            // 
            // GenerarTurno_label_tarde
            // 
            this.GenerarTurno_label_tarde.AutoSize = true;
            this.GenerarTurno_label_tarde.Location = new System.Drawing.Point(137, 266);
            this.GenerarTurno_label_tarde.Name = "GenerarTurno_label_tarde";
            this.GenerarTurno_label_tarde.Size = new System.Drawing.Size(53, 17);
            this.GenerarTurno_label_tarde.TabIndex = 4;
            this.GenerarTurno_label_tarde.TabStop = true;
            this.GenerarTurno_label_tarde.Text = "Tarde";
            this.GenerarTurno_label_tarde.UseVisualStyleBackColor = true;
            this.GenerarTurno_label_tarde.CheckedChanged += new System.EventHandler(this.radioButton2_CheckedChanged);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(15, 34);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(46, 18);
            this.label3.TabIndex = 6;
            this.label3.Text = "label3";
            // 
            // comboBox1
            // 
            this.comboBox1.FormattingEnabled = true;
            this.comboBox1.Location = new System.Drawing.Point(295, 92);
            this.comboBox1.Name = "comboBox1";
            this.comboBox1.Size = new System.Drawing.Size(178, 21);
            this.comboBox1.TabIndex = 7;
            // 
            // GenerarTurno_label_crear_turno
            // 
            this.GenerarTurno_label_crear_turno.Location = new System.Drawing.Point(295, 141);
            this.GenerarTurno_label_crear_turno.Name = "GenerarTurno_label_crear_turno";
            this.GenerarTurno_label_crear_turno.Size = new System.Drawing.Size(178, 37);
            this.GenerarTurno_label_crear_turno.TabIndex = 8;
            this.GenerarTurno_label_crear_turno.Text = "Crear Turno";
            this.GenerarTurno_label_crear_turno.UseVisualStyleBackColor = true;
            this.GenerarTurno_label_crear_turno.Click += new System.EventHandler(this.button2_Click);
            // 
            // GenerarTurno_label_motivo
            // 
            this.GenerarTurno_label_motivo.AutoSize = true;
            this.GenerarTurno_label_motivo.Location = new System.Drawing.Point(292, 9);
            this.GenerarTurno_label_motivo.Name = "GenerarTurno_label_motivo";
            this.GenerarTurno_label_motivo.Size = new System.Drawing.Size(98, 13);
            this.GenerarTurno_label_motivo.TabIndex = 9;
            this.GenerarTurno_label_motivo.Text = "Motivo de Consulta";
            // 
            // GenerarTurno_textbox_motivoConsulta
            // 
            this.GenerarTurno_textbox_motivoConsulta.Location = new System.Drawing.Point(295, 35);
            this.GenerarTurno_textbox_motivoConsulta.Name = "GenerarTurno_textbox_motivoConsulta";
            this.GenerarTurno_textbox_motivoConsulta.Size = new System.Drawing.Size(178, 20);
            this.GenerarTurno_textbox_motivoConsulta.TabIndex = 10;
            // 
            // GenerarTurno
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("$this.BackgroundImage")));
            this.ClientSize = new System.Drawing.Size(487, 330);
            this.Controls.Add(this.GenerarTurno_textbox_motivoConsulta);
            this.Controls.Add(this.GenerarTurno_label_motivo);
            this.Controls.Add(this.GenerarTurno_label_crear_turno);
            this.Controls.Add(this.comboBox1);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.GenerarTurno_label_tarde);
            this.Controls.Add(this.GenerarTurno_label_manana);
            this.Controls.Add(this.GenerarTurno_label_dia);
            this.Controls.Add(this.GenerarTurno_label_titulo);
            this.Controls.Add(this.monthCalendar1);
            this.Name = "GenerarTurno";
            this.Text = "GenerarTurno";
            this.Load += new System.EventHandler(this.GenerarTurno_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.MonthCalendar monthCalendar1;
        private System.Windows.Forms.Label GenerarTurno_label_titulo;
        private System.Windows.Forms.Label GenerarTurno_label_dia;
        private System.Windows.Forms.RadioButton GenerarTurno_label_manana;
        private System.Windows.Forms.RadioButton GenerarTurno_label_tarde;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.ComboBox comboBox1;
        private System.Windows.Forms.Button GenerarTurno_label_crear_turno;
        private System.Windows.Forms.Label GenerarTurno_label_motivo;
        private System.Windows.Forms.TextBox GenerarTurno_textbox_motivoConsulta;
    }
}