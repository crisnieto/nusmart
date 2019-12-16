namespace NuSmart
{
    partial class Mediciones
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Mediciones));
            this.Mediciones_label_paciente = new System.Windows.Forms.Label();
            this.Mediciones_label_titulo = new System.Windows.Forms.Label();
            this.Mediciones_label_motivo = new System.Windows.Forms.Label();
            this.Mediciones_textbox_motivoConsulta = new System.Windows.Forms.TextBox();
            this.Mediciones_label_mediciones = new System.Windows.Forms.Label();
            this.Mediciones_textbox_peso = new System.Windows.Forms.TextBox();
            this.Mediciones_label_peso = new System.Windows.Forms.Label();
            this.Mediciones_textbox_altura = new System.Windows.Forms.TextBox();
            this.Mediciones_label_altura = new System.Windows.Forms.Label();
            this.Mediciones_textbox_edad = new System.Windows.Forms.TextBox();
            this.Mediciones_label_edad = new System.Windows.Forms.Label();
            this.Mediciones_button_calcular_bmi = new System.Windows.Forms.Button();
            this.Mediciones_button_calcular_bfp = new System.Windows.Forms.Button();
            this.Mediciones_textbox_cintura = new System.Windows.Forms.TextBox();
            this.Mediciones_label_cintura = new System.Windows.Forms.Label();
            this.Mediciones_textbox_cadera = new System.Windows.Forms.TextBox();
            this.Mediciones_label_cadera = new System.Windows.Forms.Label();
            this.Mediciones_label_valor_bmi = new System.Windows.Forms.Label();
            this.Mediciones_label_estado_bmi = new System.Windows.Forms.Label();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.Mediciones_label_ultimas_mediciones = new System.Windows.Forms.Label();
            this.Mediciones_button_guardar_mediciones = new System.Windows.Forms.Button();
            this.Mediciones_lbl_valorBmiObtenido = new System.Windows.Forms.Label();
            this.Mediciones_label_estado_bfp = new System.Windows.Forms.Label();
            this.Mediciones_lbl_estadoBmiObtenido = new System.Windows.Forms.Label();
            this.Mediciones_lbl_estadoBfpObtenido = new System.Windows.Forms.Label();
            this.Mediciones_lbl_valorBfpObtenido = new System.Windows.Forms.Label();
            this.Mediciones_label_valor_bfp = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // Mediciones_label_paciente
            // 
            this.Mediciones_label_paciente.AutoSize = true;
            this.Mediciones_label_paciente.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Mediciones_label_paciente.Location = new System.Drawing.Point(14, 9);
            this.Mediciones_label_paciente.Name = "Mediciones_label_paciente";
            this.Mediciones_label_paciente.Size = new System.Drawing.Size(174, 16);
            this.Mediciones_label_paciente.TabIndex = 0;
            this.Mediciones_label_paciente.Text = "Mediciones_label_paciente";
            // 
            // Mediciones_label_titulo
            // 
            this.Mediciones_label_titulo.AutoSize = true;
            this.Mediciones_label_titulo.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Mediciones_label_titulo.Location = new System.Drawing.Point(12, 57);
            this.Mediciones_label_titulo.Name = "Mediciones_label_titulo";
            this.Mediciones_label_titulo.Size = new System.Drawing.Size(259, 20);
            this.Mediciones_label_titulo.TabIndex = 1;
            this.Mediciones_label_titulo.Text = "Informacion Basica del Tratamiento";
            // 
            // Mediciones_label_motivo
            // 
            this.Mediciones_label_motivo.AutoSize = true;
            this.Mediciones_label_motivo.Location = new System.Drawing.Point(13, 92);
            this.Mediciones_label_motivo.Name = "Mediciones_label_motivo";
            this.Mediciones_label_motivo.Size = new System.Drawing.Size(98, 13);
            this.Mediciones_label_motivo.TabIndex = 2;
            this.Mediciones_label_motivo.Text = "Motivo de Consulta";
            // 
            // Mediciones_textbox_motivoConsulta
            // 
            this.Mediciones_textbox_motivoConsulta.Enabled = false;
            this.Mediciones_textbox_motivoConsulta.Location = new System.Drawing.Point(117, 89);
            this.Mediciones_textbox_motivoConsulta.Name = "Mediciones_textbox_motivoConsulta";
            this.Mediciones_textbox_motivoConsulta.Size = new System.Drawing.Size(290, 20);
            this.Mediciones_textbox_motivoConsulta.TabIndex = 3;
            // 
            // Mediciones_label_mediciones
            // 
            this.Mediciones_label_mediciones.AutoSize = true;
            this.Mediciones_label_mediciones.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Mediciones_label_mediciones.Location = new System.Drawing.Point(12, 177);
            this.Mediciones_label_mediciones.Name = "Mediciones_label_mediciones";
            this.Mediciones_label_mediciones.Size = new System.Drawing.Size(89, 20);
            this.Mediciones_label_mediciones.TabIndex = 6;
            this.Mediciones_label_mediciones.Text = "Mediciones";
            // 
            // Mediciones_textbox_peso
            // 
            this.Mediciones_textbox_peso.Location = new System.Drawing.Point(60, 211);
            this.Mediciones_textbox_peso.Name = "Mediciones_textbox_peso";
            this.Mediciones_textbox_peso.Size = new System.Drawing.Size(51, 20);
            this.Mediciones_textbox_peso.TabIndex = 8;
            this.Mediciones_textbox_peso.TextChanged += new System.EventHandler(this.textBox3_TextChanged);
            this.Mediciones_textbox_peso.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.Mediciones_textbox_peso_KeyPress);
            // 
            // Mediciones_label_peso
            // 
            this.Mediciones_label_peso.AutoSize = true;
            this.Mediciones_label_peso.Location = new System.Drawing.Point(17, 214);
            this.Mediciones_label_peso.Name = "Mediciones_label_peso";
            this.Mediciones_label_peso.Size = new System.Drawing.Size(31, 13);
            this.Mediciones_label_peso.TabIndex = 7;
            this.Mediciones_label_peso.Text = "Peso";
            // 
            // Mediciones_textbox_altura
            // 
            this.Mediciones_textbox_altura.Location = new System.Drawing.Point(60, 233);
            this.Mediciones_textbox_altura.Name = "Mediciones_textbox_altura";
            this.Mediciones_textbox_altura.Size = new System.Drawing.Size(51, 20);
            this.Mediciones_textbox_altura.TabIndex = 10;
            this.Mediciones_textbox_altura.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.Mediciones_textbox_altura_KeyPress);
            // 
            // Mediciones_label_altura
            // 
            this.Mediciones_label_altura.AutoSize = true;
            this.Mediciones_label_altura.Location = new System.Drawing.Point(14, 236);
            this.Mediciones_label_altura.Name = "Mediciones_label_altura";
            this.Mediciones_label_altura.Size = new System.Drawing.Size(34, 13);
            this.Mediciones_label_altura.TabIndex = 9;
            this.Mediciones_label_altura.Text = "Altura";
            // 
            // Mediciones_textbox_edad
            // 
            this.Mediciones_textbox_edad.Enabled = false;
            this.Mediciones_textbox_edad.Location = new System.Drawing.Point(156, 233);
            this.Mediciones_textbox_edad.Name = "Mediciones_textbox_edad";
            this.Mediciones_textbox_edad.Size = new System.Drawing.Size(47, 20);
            this.Mediciones_textbox_edad.TabIndex = 12;
            this.Mediciones_textbox_edad.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.Mediciones_textbox_edad_KeyPress);
            // 
            // Mediciones_label_edad
            // 
            this.Mediciones_label_edad.AutoSize = true;
            this.Mediciones_label_edad.Location = new System.Drawing.Point(120, 236);
            this.Mediciones_label_edad.Name = "Mediciones_label_edad";
            this.Mediciones_label_edad.Size = new System.Drawing.Size(32, 13);
            this.Mediciones_label_edad.TabIndex = 11;
            this.Mediciones_label_edad.Text = "Edad";
            // 
            // Mediciones_button_calcular_bmi
            // 
            this.Mediciones_button_calcular_bmi.Location = new System.Drawing.Point(16, 286);
            this.Mediciones_button_calcular_bmi.Name = "Mediciones_button_calcular_bmi";
            this.Mediciones_button_calcular_bmi.Size = new System.Drawing.Size(100, 58);
            this.Mediciones_button_calcular_bmi.TabIndex = 13;
            this.Mediciones_button_calcular_bmi.Text = "Calcular BMI";
            this.Mediciones_button_calcular_bmi.UseVisualStyleBackColor = true;
            this.Mediciones_button_calcular_bmi.Click += new System.EventHandler(this.Mediciones_button_calcular_bmi_Click);
            // 
            // Mediciones_button_calcular_bfp
            // 
            this.Mediciones_button_calcular_bfp.Location = new System.Drawing.Point(306, 286);
            this.Mediciones_button_calcular_bfp.Name = "Mediciones_button_calcular_bfp";
            this.Mediciones_button_calcular_bfp.Size = new System.Drawing.Size(100, 58);
            this.Mediciones_button_calcular_bfp.TabIndex = 14;
            this.Mediciones_button_calcular_bfp.Text = "Calcular BFP";
            this.Mediciones_button_calcular_bfp.UseVisualStyleBackColor = true;
            this.Mediciones_button_calcular_bfp.Click += new System.EventHandler(this.Mediciones_button_calcular_bfp_Click);
            // 
            // Mediciones_textbox_cintura
            // 
            this.Mediciones_textbox_cintura.Location = new System.Drawing.Point(416, 246);
            this.Mediciones_textbox_cintura.Name = "Mediciones_textbox_cintura";
            this.Mediciones_textbox_cintura.Size = new System.Drawing.Size(60, 20);
            this.Mediciones_textbox_cintura.TabIndex = 18;
            this.Mediciones_textbox_cintura.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.Mediciones_textbox_cintura_KeyPress);
            // 
            // Mediciones_label_cintura
            // 
            this.Mediciones_label_cintura.AutoSize = true;
            this.Mediciones_label_cintura.Location = new System.Drawing.Point(304, 249);
            this.Mediciones_label_cintura.Name = "Mediciones_label_cintura";
            this.Mediciones_label_cintura.Size = new System.Drawing.Size(102, 13);
            this.Mediciones_label_cintura.TabIndex = 17;
            this.Mediciones_label_cintura.Text = "Perimetro de Cintura";
            // 
            // Mediciones_textbox_cadera
            // 
            this.Mediciones_textbox_cadera.Location = new System.Drawing.Point(415, 207);
            this.Mediciones_textbox_cadera.Name = "Mediciones_textbox_cadera";
            this.Mediciones_textbox_cadera.Size = new System.Drawing.Size(61, 20);
            this.Mediciones_textbox_cadera.TabIndex = 16;
            this.Mediciones_textbox_cadera.KeyDown += new System.Windows.Forms.KeyEventHandler(this.Mediciones_textbox_cadera_KeyDown);
            this.Mediciones_textbox_cadera.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.Mediciones_textbox_cadera_KeyPress);
            // 
            // Mediciones_label_cadera
            // 
            this.Mediciones_label_cadera.AutoSize = true;
            this.Mediciones_label_cadera.Location = new System.Drawing.Point(304, 210);
            this.Mediciones_label_cadera.Name = "Mediciones_label_cadera";
            this.Mediciones_label_cadera.Size = new System.Drawing.Size(103, 13);
            this.Mediciones_label_cadera.TabIndex = 15;
            this.Mediciones_label_cadera.Text = "Perimetro de Cadera";
            // 
            // Mediciones_label_valor_bmi
            // 
            this.Mediciones_label_valor_bmi.AutoSize = true;
            this.Mediciones_label_valor_bmi.Location = new System.Drawing.Point(131, 295);
            this.Mediciones_label_valor_bmi.Name = "Mediciones_label_valor_bmi";
            this.Mediciones_label_valor_bmi.Size = new System.Drawing.Size(34, 13);
            this.Mediciones_label_valor_bmi.TabIndex = 19;
            this.Mediciones_label_valor_bmi.Text = "Valor:";
            // 
            // Mediciones_label_estado_bmi
            // 
            this.Mediciones_label_estado_bmi.AutoSize = true;
            this.Mediciones_label_estado_bmi.Location = new System.Drawing.Point(122, 322);
            this.Mediciones_label_estado_bmi.Name = "Mediciones_label_estado_bmi";
            this.Mediciones_label_estado_bmi.Size = new System.Drawing.Size(43, 13);
            this.Mediciones_label_estado_bmi.TabIndex = 20;
            this.Mediciones_label_estado_bmi.Text = "Estado:";
            // 
            // dataGridView1
            // 
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(12, 371);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.Size = new System.Drawing.Size(625, 150);
            this.dataGridView1.TabIndex = 21;
            // 
            // Mediciones_label_ultimas_mediciones
            // 
            this.Mediciones_label_ultimas_mediciones.AutoSize = true;
            this.Mediciones_label_ultimas_mediciones.Location = new System.Drawing.Point(14, 355);
            this.Mediciones_label_ultimas_mediciones.Name = "Mediciones_label_ultimas_mediciones";
            this.Mediciones_label_ultimas_mediciones.Size = new System.Drawing.Size(101, 13);
            this.Mediciones_label_ultimas_mediciones.TabIndex = 22;
            this.Mediciones_label_ultimas_mediciones.Text = "Ultimas Mediciones:";
            // 
            // Mediciones_button_guardar_mediciones
            // 
            this.Mediciones_button_guardar_mediciones.Location = new System.Drawing.Point(552, 198);
            this.Mediciones_button_guardar_mediciones.Name = "Mediciones_button_guardar_mediciones";
            this.Mediciones_button_guardar_mediciones.Size = new System.Drawing.Size(85, 59);
            this.Mediciones_button_guardar_mediciones.TabIndex = 23;
            this.Mediciones_button_guardar_mediciones.Text = "Guardar Mediciones";
            this.Mediciones_button_guardar_mediciones.UseVisualStyleBackColor = true;
            this.Mediciones_button_guardar_mediciones.Click += new System.EventHandler(this.Mediciones_button_guardar_mediciones_Click);
            // 
            // Mediciones_lbl_valorBmiObtenido
            // 
            this.Mediciones_lbl_valorBmiObtenido.AutoSize = true;
            this.Mediciones_lbl_valorBmiObtenido.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Mediciones_lbl_valorBmiObtenido.Location = new System.Drawing.Point(171, 295);
            this.Mediciones_lbl_valorBmiObtenido.Name = "Mediciones_lbl_valorBmiObtenido";
            this.Mediciones_lbl_valorBmiObtenido.Size = new System.Drawing.Size(0, 13);
            this.Mediciones_lbl_valorBmiObtenido.TabIndex = 24;
            // 
            // Mediciones_label_estado_bfp
            // 
            this.Mediciones_label_estado_bfp.AutoSize = true;
            this.Mediciones_label_estado_bfp.Location = new System.Drawing.Point(413, 322);
            this.Mediciones_label_estado_bfp.Name = "Mediciones_label_estado_bfp";
            this.Mediciones_label_estado_bfp.Size = new System.Drawing.Size(43, 13);
            this.Mediciones_label_estado_bfp.TabIndex = 25;
            this.Mediciones_label_estado_bfp.Text = "Estado:";
            // 
            // Mediciones_lbl_estadoBmiObtenido
            // 
            this.Mediciones_lbl_estadoBmiObtenido.AutoSize = true;
            this.Mediciones_lbl_estadoBmiObtenido.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Mediciones_lbl_estadoBmiObtenido.Location = new System.Drawing.Point(171, 322);
            this.Mediciones_lbl_estadoBmiObtenido.Name = "Mediciones_lbl_estadoBmiObtenido";
            this.Mediciones_lbl_estadoBmiObtenido.Size = new System.Drawing.Size(0, 13);
            this.Mediciones_lbl_estadoBmiObtenido.TabIndex = 26;
            // 
            // Mediciones_lbl_estadoBfpObtenido
            // 
            this.Mediciones_lbl_estadoBfpObtenido.AutoSize = true;
            this.Mediciones_lbl_estadoBfpObtenido.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Mediciones_lbl_estadoBfpObtenido.Location = new System.Drawing.Point(462, 322);
            this.Mediciones_lbl_estadoBfpObtenido.Name = "Mediciones_lbl_estadoBfpObtenido";
            this.Mediciones_lbl_estadoBfpObtenido.Size = new System.Drawing.Size(0, 13);
            this.Mediciones_lbl_estadoBfpObtenido.TabIndex = 27;
            // 
            // Mediciones_lbl_valorBfpObtenido
            // 
            this.Mediciones_lbl_valorBfpObtenido.AutoSize = true;
            this.Mediciones_lbl_valorBfpObtenido.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Mediciones_lbl_valorBfpObtenido.Location = new System.Drawing.Point(453, 295);
            this.Mediciones_lbl_valorBfpObtenido.Name = "Mediciones_lbl_valorBfpObtenido";
            this.Mediciones_lbl_valorBfpObtenido.Size = new System.Drawing.Size(0, 13);
            this.Mediciones_lbl_valorBfpObtenido.TabIndex = 29;
            // 
            // Mediciones_label_valor_bfp
            // 
            this.Mediciones_label_valor_bfp.AutoSize = true;
            this.Mediciones_label_valor_bfp.Location = new System.Drawing.Point(413, 295);
            this.Mediciones_label_valor_bfp.Name = "Mediciones_label_valor_bfp";
            this.Mediciones_label_valor_bfp.Size = new System.Drawing.Size(34, 13);
            this.Mediciones_label_valor_bfp.TabIndex = 28;
            this.Mediciones_label_valor_bfp.Text = "Valor:";
            // 
            // Mediciones
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("$this.BackgroundImage")));
            this.ClientSize = new System.Drawing.Size(649, 533);
            this.Controls.Add(this.Mediciones_lbl_valorBfpObtenido);
            this.Controls.Add(this.Mediciones_label_valor_bfp);
            this.Controls.Add(this.Mediciones_lbl_estadoBfpObtenido);
            this.Controls.Add(this.Mediciones_lbl_estadoBmiObtenido);
            this.Controls.Add(this.Mediciones_label_estado_bfp);
            this.Controls.Add(this.Mediciones_lbl_valorBmiObtenido);
            this.Controls.Add(this.Mediciones_button_guardar_mediciones);
            this.Controls.Add(this.Mediciones_label_ultimas_mediciones);
            this.Controls.Add(this.dataGridView1);
            this.Controls.Add(this.Mediciones_label_estado_bmi);
            this.Controls.Add(this.Mediciones_label_valor_bmi);
            this.Controls.Add(this.Mediciones_textbox_cintura);
            this.Controls.Add(this.Mediciones_label_cintura);
            this.Controls.Add(this.Mediciones_textbox_cadera);
            this.Controls.Add(this.Mediciones_label_cadera);
            this.Controls.Add(this.Mediciones_button_calcular_bfp);
            this.Controls.Add(this.Mediciones_button_calcular_bmi);
            this.Controls.Add(this.Mediciones_textbox_edad);
            this.Controls.Add(this.Mediciones_label_edad);
            this.Controls.Add(this.Mediciones_textbox_altura);
            this.Controls.Add(this.Mediciones_label_altura);
            this.Controls.Add(this.Mediciones_textbox_peso);
            this.Controls.Add(this.Mediciones_label_peso);
            this.Controls.Add(this.Mediciones_label_mediciones);
            this.Controls.Add(this.Mediciones_textbox_motivoConsulta);
            this.Controls.Add(this.Mediciones_label_motivo);
            this.Controls.Add(this.Mediciones_label_titulo);
            this.Controls.Add(this.Mediciones_label_paciente);
            this.Name = "Mediciones";
            this.Load += new System.EventHandler(this.Mediciones_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label Mediciones_label_paciente;
        private System.Windows.Forms.Label Mediciones_label_titulo;
        private System.Windows.Forms.Label Mediciones_label_motivo;
        private System.Windows.Forms.TextBox Mediciones_textbox_motivoConsulta;
        private System.Windows.Forms.Label Mediciones_label_mediciones;
        private System.Windows.Forms.TextBox Mediciones_textbox_peso;
        private System.Windows.Forms.Label Mediciones_label_peso;
        private System.Windows.Forms.TextBox Mediciones_textbox_altura;
        private System.Windows.Forms.Label Mediciones_label_altura;
        private System.Windows.Forms.TextBox Mediciones_textbox_edad;
        private System.Windows.Forms.Label Mediciones_label_edad;
        private System.Windows.Forms.Button Mediciones_button_calcular_bmi;
        private System.Windows.Forms.Button Mediciones_button_calcular_bfp;
        private System.Windows.Forms.TextBox Mediciones_textbox_cintura;
        private System.Windows.Forms.Label Mediciones_label_cintura;
        private System.Windows.Forms.TextBox Mediciones_textbox_cadera;
        private System.Windows.Forms.Label Mediciones_label_cadera;
        private System.Windows.Forms.Label Mediciones_label_valor_bmi;
        private System.Windows.Forms.Label Mediciones_label_estado_bmi;
        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.Label Mediciones_label_ultimas_mediciones;
        private System.Windows.Forms.Button Mediciones_button_guardar_mediciones;
        private System.Windows.Forms.Label Mediciones_lbl_valorBmiObtenido;
        private System.Windows.Forms.Label Mediciones_label_estado_bfp;
        private System.Windows.Forms.Label Mediciones_lbl_estadoBmiObtenido;
        private System.Windows.Forms.Label Mediciones_lbl_estadoBfpObtenido;
        private System.Windows.Forms.Label Mediciones_lbl_valorBfpObtenido;
        private System.Windows.Forms.Label Mediciones_label_valor_bfp;
    }
}