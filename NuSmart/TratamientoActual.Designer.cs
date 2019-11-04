namespace NuSmart
{
    partial class TratamientoActual
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
            this.label1 = new System.Windows.Forms.Label();
            this.button3 = new System.Windows.Forms.Button();
            this.button1 = new System.Windows.Forms.Button();
            this.label5 = new System.Windows.Forms.Label();
            this.TratamientoActual_listbox_dias = new System.Windows.Forms.ListBox();
            this.label6 = new System.Windows.Forms.Label();
            this.agregarDieta_textbox_desayuno = new System.Windows.Forms.TextBox();
            this.label7 = new System.Windows.Forms.Label();
            this.agregarDieta_textbox_colacion = new System.Windows.Forms.TextBox();
            this.label8 = new System.Windows.Forms.Label();
            this.agregarDieta_textbox_almuerzo = new System.Windows.Forms.TextBox();
            this.label9 = new System.Windows.Forms.Label();
            this.agregarDieta_textbox_merienda = new System.Windows.Forms.TextBox();
            this.label10 = new System.Windows.Forms.Label();
            this.agregarDieta_textbox_cena = new System.Windows.Forms.TextBox();
            this.button2 = new System.Windows.Forms.Button();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.label2 = new System.Windows.Forms.Label();
            this.TratamientoActual_lbl_dietaActual = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label11 = new System.Windows.Forms.Label();
            this.button4 = new System.Windows.Forms.Button();
            this.button5 = new System.Windows.Forms.Button();
            this.AgregarDieta_textbox_cantidad_calorias_totales = new System.Windows.Forms.Label();
            this.AgregarDieta_textbox_cantidad_calorias_dia = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 9);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(114, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "Resumen del Paciente";
            // 
            // button3
            // 
            this.button3.Location = new System.Drawing.Point(16, 125);
            this.button3.Name = "button3";
            this.button3.Size = new System.Drawing.Size(110, 37);
            this.button3.TabIndex = 6;
            this.button3.Text = "Nueva Medicion";
            this.button3.UseVisualStyleBackColor = true;
            this.button3.Click += new System.EventHandler(this.button3_Click);
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(162, 125);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(110, 37);
            this.button1.TabIndex = 4;
            this.button1.Text = "Ver Proyecciones";
            this.button1.UseVisualStyleBackColor = true;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(13, 201);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(65, 13);
            this.label5.TabIndex = 7;
            this.label5.Text = "Dieta Actual";
            // 
            // TratamientoActual_listbox_dias
            // 
            this.TratamientoActual_listbox_dias.FormattingEnabled = true;
            this.TratamientoActual_listbox_dias.Location = new System.Drawing.Point(16, 217);
            this.TratamientoActual_listbox_dias.Name = "TratamientoActual_listbox_dias";
            this.TratamientoActual_listbox_dias.Size = new System.Drawing.Size(112, 199);
            this.TratamientoActual_listbox_dias.TabIndex = 16;
            this.TratamientoActual_listbox_dias.SelectedIndexChanged += new System.EventHandler(this.TratamientoActual_listbox_dias_SelectedIndexChanged);
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(134, 217);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(55, 13);
            this.label6.TabIndex = 17;
            this.label6.Text = "Desayuno";
            // 
            // agregarDieta_textbox_desayuno
            // 
            this.agregarDieta_textbox_desayuno.Location = new System.Drawing.Point(137, 233);
            this.agregarDieta_textbox_desayuno.Name = "agregarDieta_textbox_desayuno";
            this.agregarDieta_textbox_desayuno.Size = new System.Drawing.Size(135, 20);
            this.agregarDieta_textbox_desayuno.TabIndex = 18;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(134, 256);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(48, 13);
            this.label7.TabIndex = 19;
            this.label7.Text = "Colacion";
            // 
            // agregarDieta_textbox_colacion
            // 
            this.agregarDieta_textbox_colacion.Location = new System.Drawing.Point(137, 272);
            this.agregarDieta_textbox_colacion.Name = "agregarDieta_textbox_colacion";
            this.agregarDieta_textbox_colacion.Size = new System.Drawing.Size(135, 20);
            this.agregarDieta_textbox_colacion.TabIndex = 20;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(134, 295);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(50, 13);
            this.label8.TabIndex = 21;
            this.label8.Text = "Almuerzo";
            // 
            // agregarDieta_textbox_almuerzo
            // 
            this.agregarDieta_textbox_almuerzo.Location = new System.Drawing.Point(137, 311);
            this.agregarDieta_textbox_almuerzo.Name = "agregarDieta_textbox_almuerzo";
            this.agregarDieta_textbox_almuerzo.Size = new System.Drawing.Size(135, 20);
            this.agregarDieta_textbox_almuerzo.TabIndex = 22;
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(134, 334);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(51, 13);
            this.label9.TabIndex = 23;
            this.label9.Text = "Merienda";
            // 
            // agregarDieta_textbox_merienda
            // 
            this.agregarDieta_textbox_merienda.Location = new System.Drawing.Point(137, 350);
            this.agregarDieta_textbox_merienda.Name = "agregarDieta_textbox_merienda";
            this.agregarDieta_textbox_merienda.Size = new System.Drawing.Size(135, 20);
            this.agregarDieta_textbox_merienda.TabIndex = 24;
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Location = new System.Drawing.Point(134, 373);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(32, 13);
            this.label10.TabIndex = 25;
            this.label10.Text = "Cena";
            // 
            // agregarDieta_textbox_cena
            // 
            this.agregarDieta_textbox_cena.Location = new System.Drawing.Point(137, 389);
            this.agregarDieta_textbox_cena.Name = "agregarDieta_textbox_cena";
            this.agregarDieta_textbox_cena.Size = new System.Drawing.Size(135, 20);
            this.agregarDieta_textbox_cena.TabIndex = 26;
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(312, 125);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(110, 37);
            this.button2.TabIndex = 27;
            this.button2.Text = "Manejar Ejercicios";
            this.button2.UseVisualStyleBackColor = true;
            // 
            // dataGridView1
            // 
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(15, 52);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.Size = new System.Drawing.Size(407, 67);
            this.dataGridView1.TabIndex = 28;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(13, 36);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(144, 13);
            this.label2.TabIndex = 29;
            this.label2.Text = "Ultima Medicion del Paciente";
            // 
            // TratamientoActual_lbl_dietaActual
            // 
            this.TratamientoActual_lbl_dietaActual.AutoSize = true;
            this.TratamientoActual_lbl_dietaActual.Location = new System.Drawing.Point(84, 201);
            this.TratamientoActual_lbl_dietaActual.Name = "TratamientoActual_lbl_dietaActual";
            this.TratamientoActual_lbl_dietaActual.Size = new System.Drawing.Size(35, 13);
            this.TratamientoActual_lbl_dietaActual.TabIndex = 30;
            this.TratamientoActual_lbl_dietaActual.Text = "label3";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(287, 217);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(85, 13);
            this.label4.TabIndex = 31;
            this.label4.Text = "Calorias Totales:";
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Location = new System.Drawing.Point(287, 240);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(83, 13);
            this.label11.TabIndex = 32;
            this.label11.Text = "Calorias del Dia:";
            // 
            // button4
            // 
            this.button4.Location = new System.Drawing.Point(290, 272);
            this.button4.Name = "button4";
            this.button4.Size = new System.Drawing.Size(132, 37);
            this.button4.TabIndex = 33;
            this.button4.Text = "Imprimir Dieta";
            this.button4.UseVisualStyleBackColor = true;
            // 
            // button5
            // 
            this.button5.Location = new System.Drawing.Point(290, 350);
            this.button5.Name = "button5";
            this.button5.Size = new System.Drawing.Size(132, 59);
            this.button5.TabIndex = 34;
            this.button5.Text = "Finalizar Tratamiento";
            this.button5.UseVisualStyleBackColor = true;
            this.button5.Click += new System.EventHandler(this.button5_Click);
            // 
            // AgregarDieta_textbox_cantidad_calorias_totales
            // 
            this.AgregarDieta_textbox_cantidad_calorias_totales.AutoSize = true;
            this.AgregarDieta_textbox_cantidad_calorias_totales.Location = new System.Drawing.Point(378, 217);
            this.AgregarDieta_textbox_cantidad_calorias_totales.Name = "AgregarDieta_textbox_cantidad_calorias_totales";
            this.AgregarDieta_textbox_cantidad_calorias_totales.Size = new System.Drawing.Size(35, 13);
            this.AgregarDieta_textbox_cantidad_calorias_totales.TabIndex = 35;
            this.AgregarDieta_textbox_cantidad_calorias_totales.Text = "label3";
            // 
            // AgregarDieta_textbox_cantidad_calorias_dia
            // 
            this.AgregarDieta_textbox_cantidad_calorias_dia.AutoSize = true;
            this.AgregarDieta_textbox_cantidad_calorias_dia.Location = new System.Drawing.Point(378, 240);
            this.AgregarDieta_textbox_cantidad_calorias_dia.Name = "AgregarDieta_textbox_cantidad_calorias_dia";
            this.AgregarDieta_textbox_cantidad_calorias_dia.Size = new System.Drawing.Size(35, 13);
            this.AgregarDieta_textbox_cantidad_calorias_dia.TabIndex = 36;
            this.AgregarDieta_textbox_cantidad_calorias_dia.Text = "label3";
            // 
            // TratamientoActual
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(434, 428);
            this.Controls.Add(this.AgregarDieta_textbox_cantidad_calorias_dia);
            this.Controls.Add(this.AgregarDieta_textbox_cantidad_calorias_totales);
            this.Controls.Add(this.button5);
            this.Controls.Add(this.button4);
            this.Controls.Add(this.label11);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.TratamientoActual_lbl_dietaActual);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.dataGridView1);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.TratamientoActual_listbox_dias);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.agregarDieta_textbox_desayuno);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.agregarDieta_textbox_colacion);
            this.Controls.Add(this.label8);
            this.Controls.Add(this.agregarDieta_textbox_almuerzo);
            this.Controls.Add(this.label9);
            this.Controls.Add(this.agregarDieta_textbox_merienda);
            this.Controls.Add(this.label10);
            this.Controls.Add(this.agregarDieta_textbox_cena);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.button3);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.label1);
            this.Name = "TratamientoActual";
            this.Text = "TratamientoActual";
            this.Load += new System.EventHandler(this.TratamientoActual_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button button3;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.ListBox TratamientoActual_listbox_dias;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.TextBox agregarDieta_textbox_desayuno;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.TextBox agregarDieta_textbox_colacion;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.TextBox agregarDieta_textbox_almuerzo;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.TextBox agregarDieta_textbox_merienda;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.TextBox agregarDieta_textbox_cena;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label TratamientoActual_lbl_dietaActual;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.Button button4;
        private System.Windows.Forms.Button button5;
        private System.Windows.Forms.Label AgregarDieta_textbox_cantidad_calorias_totales;
        private System.Windows.Forms.Label AgregarDieta_textbox_cantidad_calorias_dia;
    }
}