namespace NuSmart
{
    partial class AgregarDieta
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
            this.radioButton1 = new System.Windows.Forms.RadioButton();
            this.radioButton2 = new System.Windows.Forms.RadioButton();
            this.radioButton3 = new System.Windows.Forms.RadioButton();
            this.button1 = new System.Windows.Forms.Button();
            this.listBox1 = new System.Windows.Forms.ListBox();
            this.listBox2 = new System.Windows.Forms.ListBox();
            this.label1 = new System.Windows.Forms.Label();
            this.agregarDieta_textbox_desayuno = new System.Windows.Forms.TextBox();
            this.agregarDieta_textbox_colacion = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.agregarDieta_textbox_almuerzo = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.agregarDieta_textbox_merienda = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.agregarDieta_textbox_cena = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.button3 = new System.Windows.Forms.Button();
            this.button4 = new System.Windows.Forms.Button();
            this.button5 = new System.Windows.Forms.Button();
            this.label6 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.AgregarDieta_textbox_cantidad_calorias_dia = new System.Windows.Forms.Label();
            this.AgregarDieta_textbox_cantidad_calorias_totales = new System.Windows.Forms.Label();
            this.button2 = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // radioButton1
            // 
            this.radioButton1.AutoSize = true;
            this.radioButton1.Location = new System.Drawing.Point(12, 30);
            this.radioButton1.Name = "radioButton1";
            this.radioButton1.Size = new System.Drawing.Size(91, 17);
            this.radioButton1.TabIndex = 0;
            this.radioButton1.TabStop = true;
            this.radioButton1.Text = "Bajar de Peso";
            this.radioButton1.UseVisualStyleBackColor = true;
            // 
            // radioButton2
            // 
            this.radioButton2.AutoSize = true;
            this.radioButton2.Location = new System.Drawing.Point(12, 53);
            this.radioButton2.Name = "radioButton2";
            this.radioButton2.Size = new System.Drawing.Size(102, 17);
            this.radioButton2.TabIndex = 1;
            this.radioButton2.TabStop = true;
            this.radioButton2.Text = "Mantener Forma";
            this.radioButton2.UseVisualStyleBackColor = true;
            // 
            // radioButton3
            // 
            this.radioButton3.AutoSize = true;
            this.radioButton3.Location = new System.Drawing.Point(12, 76);
            this.radioButton3.Name = "radioButton3";
            this.radioButton3.Size = new System.Drawing.Size(91, 17);
            this.radioButton3.TabIndex = 2;
            this.radioButton3.TabStop = true;
            this.radioButton3.Text = "Subir de Peso";
            this.radioButton3.UseVisualStyleBackColor = true;
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(12, 99);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(112, 56);
            this.button1.TabIndex = 3;
            this.button1.Text = "Generar Dieta Automatica";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // listBox1
            // 
            this.listBox1.FormattingEnabled = true;
            this.listBox1.Location = new System.Drawing.Point(304, 30);
            this.listBox1.Name = "listBox1";
            this.listBox1.Size = new System.Drawing.Size(185, 108);
            this.listBox1.TabIndex = 4;
            this.listBox1.SelectedIndexChanged += new System.EventHandler(this.listBox1_SelectedIndexChanged);
            // 
            // listBox2
            // 
            this.listBox2.FormattingEnabled = true;
            this.listBox2.Location = new System.Drawing.Point(12, 240);
            this.listBox2.Name = "listBox2";
            this.listBox2.Size = new System.Drawing.Size(112, 199);
            this.listBox2.TabIndex = 5;
            this.listBox2.SelectedIndexChanged += new System.EventHandler(this.listBox2_SelectedIndexChanged);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(130, 240);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(55, 13);
            this.label1.TabIndex = 6;
            this.label1.Text = "Desayuno";
            // 
            // agregarDieta_textbox_desayuno
            // 
            this.agregarDieta_textbox_desayuno.Location = new System.Drawing.Point(133, 256);
            this.agregarDieta_textbox_desayuno.Name = "agregarDieta_textbox_desayuno";
            this.agregarDieta_textbox_desayuno.Size = new System.Drawing.Size(135, 20);
            this.agregarDieta_textbox_desayuno.TabIndex = 7;
            // 
            // agregarDieta_textbox_colacion
            // 
            this.agregarDieta_textbox_colacion.Location = new System.Drawing.Point(133, 295);
            this.agregarDieta_textbox_colacion.Name = "agregarDieta_textbox_colacion";
            this.agregarDieta_textbox_colacion.Size = new System.Drawing.Size(135, 20);
            this.agregarDieta_textbox_colacion.TabIndex = 9;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(130, 279);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(48, 13);
            this.label2.TabIndex = 8;
            this.label2.Text = "Colacion";
            // 
            // agregarDieta_textbox_almuerzo
            // 
            this.agregarDieta_textbox_almuerzo.Location = new System.Drawing.Point(133, 334);
            this.agregarDieta_textbox_almuerzo.Name = "agregarDieta_textbox_almuerzo";
            this.agregarDieta_textbox_almuerzo.Size = new System.Drawing.Size(135, 20);
            this.agregarDieta_textbox_almuerzo.TabIndex = 11;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(130, 318);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(50, 13);
            this.label3.TabIndex = 10;
            this.label3.Text = "Almuerzo";
            // 
            // agregarDieta_textbox_merienda
            // 
            this.agregarDieta_textbox_merienda.Location = new System.Drawing.Point(133, 373);
            this.agregarDieta_textbox_merienda.Name = "agregarDieta_textbox_merienda";
            this.agregarDieta_textbox_merienda.Size = new System.Drawing.Size(135, 20);
            this.agregarDieta_textbox_merienda.TabIndex = 13;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(130, 357);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(51, 13);
            this.label4.TabIndex = 12;
            this.label4.Text = "Merienda";
            // 
            // agregarDieta_textbox_cena
            // 
            this.agregarDieta_textbox_cena.Location = new System.Drawing.Point(133, 412);
            this.agregarDieta_textbox_cena.Name = "agregarDieta_textbox_cena";
            this.agregarDieta_textbox_cena.Size = new System.Drawing.Size(135, 20);
            this.agregarDieta_textbox_cena.TabIndex = 15;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(130, 396);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(32, 13);
            this.label5.TabIndex = 14;
            this.label5.Text = "Cena";
            // 
            // button3
            // 
            this.button3.Location = new System.Drawing.Point(304, 144);
            this.button3.Name = "button3";
            this.button3.Size = new System.Drawing.Size(78, 30);
            this.button3.TabIndex = 17;
            this.button3.Text = "Ver Dieta";
            this.button3.UseVisualStyleBackColor = true;
            // 
            // button4
            // 
            this.button4.Location = new System.Drawing.Point(388, 144);
            this.button4.Name = "button4";
            this.button4.Size = new System.Drawing.Size(101, 30);
            this.button4.TabIndex = 18;
            this.button4.Text = "Nueva Dieta";
            this.button4.UseVisualStyleBackColor = true;
            // 
            // button5
            // 
            this.button5.Location = new System.Drawing.Point(304, 180);
            this.button5.Name = "button5";
            this.button5.Size = new System.Drawing.Size(185, 30);
            this.button5.TabIndex = 19;
            this.button5.Text = "Generar Dieta Automatica";
            this.button5.UseVisualStyleBackColor = true;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(301, 240);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(83, 13);
            this.label6.TabIndex = 20;
            this.label6.Text = "Calorias del Dia:";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(301, 279);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(85, 13);
            this.label7.TabIndex = 21;
            this.label7.Text = "Calorias Totales:";
            // 
            // AgregarDieta_textbox_cantidad_calorias_dia
            // 
            this.AgregarDieta_textbox_cantidad_calorias_dia.AutoSize = true;
            this.AgregarDieta_textbox_cantidad_calorias_dia.Location = new System.Drawing.Point(390, 240);
            this.AgregarDieta_textbox_cantidad_calorias_dia.Name = "AgregarDieta_textbox_cantidad_calorias_dia";
            this.AgregarDieta_textbox_cantidad_calorias_dia.Size = new System.Drawing.Size(0, 13);
            this.AgregarDieta_textbox_cantidad_calorias_dia.TabIndex = 22;
            // 
            // AgregarDieta_textbox_cantidad_calorias_totales
            // 
            this.AgregarDieta_textbox_cantidad_calorias_totales.AutoSize = true;
            this.AgregarDieta_textbox_cantidad_calorias_totales.Location = new System.Drawing.Point(392, 279);
            this.AgregarDieta_textbox_cantidad_calorias_totales.Name = "AgregarDieta_textbox_cantidad_calorias_totales";
            this.AgregarDieta_textbox_cantidad_calorias_totales.Size = new System.Drawing.Size(0, 13);
            this.AgregarDieta_textbox_cantidad_calorias_totales.TabIndex = 23;
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(307, 357);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(182, 75);
            this.button2.TabIndex = 24;
            this.button2.Text = "Iniciar Tratamiento";
            this.button2.UseVisualStyleBackColor = true;
            // 
            // AgregarDieta
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(501, 459);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.AgregarDieta_textbox_cantidad_calorias_totales);
            this.Controls.Add(this.AgregarDieta_textbox_cantidad_calorias_dia);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.button5);
            this.Controls.Add(this.button4);
            this.Controls.Add(this.button3);
            this.Controls.Add(this.agregarDieta_textbox_cena);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.agregarDieta_textbox_merienda);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.agregarDieta_textbox_almuerzo);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.agregarDieta_textbox_colacion);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.agregarDieta_textbox_desayuno);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.listBox2);
            this.Controls.Add(this.listBox1);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.radioButton3);
            this.Controls.Add(this.radioButton2);
            this.Controls.Add(this.radioButton1);
            this.Name = "AgregarDieta";
            this.Text = "AgregarDieta";
            this.Load += new System.EventHandler(this.AgregarDieta_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.RadioButton radioButton1;
        private System.Windows.Forms.RadioButton radioButton2;
        private System.Windows.Forms.RadioButton radioButton3;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.ListBox listBox1;
        private System.Windows.Forms.ListBox listBox2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox agregarDieta_textbox_desayuno;
        private System.Windows.Forms.TextBox agregarDieta_textbox_colacion;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox agregarDieta_textbox_almuerzo;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox agregarDieta_textbox_merienda;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox agregarDieta_textbox_cena;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Button button3;
        private System.Windows.Forms.Button button4;
        private System.Windows.Forms.Button button5;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label AgregarDieta_textbox_cantidad_calorias_dia;
        private System.Windows.Forms.Label AgregarDieta_textbox_cantidad_calorias_totales;
        private System.Windows.Forms.Button button2;
    }
}