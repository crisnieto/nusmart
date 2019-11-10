namespace NuSmart
{
    partial class GraficoProyeccion
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
            System.Windows.Forms.DataVisualization.Charting.ChartArea chartArea1 = new System.Windows.Forms.DataVisualization.Charting.ChartArea();
            System.Windows.Forms.DataVisualization.Charting.Legend legend1 = new System.Windows.Forms.DataVisualization.Charting.Legend();
            System.Windows.Forms.DataVisualization.Charting.Series series1 = new System.Windows.Forms.DataVisualization.Charting.Series();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(GraficoProyeccion));
            this.chart1 = new System.Windows.Forms.DataVisualization.Charting.Chart();
            this.Proyeccion_textbox_pesoInicial = new System.Windows.Forms.TextBox();
            this.Proyeccion_textbox_bfpInicial = new System.Windows.Forms.TextBox();
            this.Proyeccion_textbox_bfpObjetivo = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.button1 = new System.Windows.Forms.Button();
            this.Proyeccion_textbox_primerPeso = new System.Windows.Forms.TextBox();
            this.Proyeccion_textbox_primerFecha = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.label8 = new System.Windows.Forms.Label();
            this.label9 = new System.Windows.Forms.Label();
            this.Proyeccion_textbox_segundaFecha = new System.Windows.Forms.TextBox();
            this.Proyeccion_textbox_segundoPeso = new System.Windows.Forms.TextBox();
            this.label10 = new System.Windows.Forms.Label();
            this.label11 = new System.Windows.Forms.Label();
            this.label12 = new System.Windows.Forms.Label();
            this.Proyeccion_textbox_terceraFecha = new System.Windows.Forms.TextBox();
            this.Proyeccion_textbox_tercerPeso = new System.Windows.Forms.TextBox();
            this.label13 = new System.Windows.Forms.Label();
            this.label14 = new System.Windows.Forms.Label();
            this.label15 = new System.Windows.Forms.Label();
            this.Proyeccion_textbox_cuartaFecha = new System.Windows.Forms.TextBox();
            this.Proyeccion_textbox_cuartoPeso = new System.Windows.Forms.TextBox();
            ((System.ComponentModel.ISupportInitialize)(this.chart1)).BeginInit();
            this.SuspendLayout();
            // 
            // chart1
            // 
            chartArea1.Name = "ChartArea1";
            this.chart1.ChartAreas.Add(chartArea1);
            legend1.Name = "Legend1";
            this.chart1.Legends.Add(legend1);
            this.chart1.Location = new System.Drawing.Point(15, 76);
            this.chart1.Name = "chart1";
            series1.ChartArea = "ChartArea1";
            series1.Legend = "Legend1";
            series1.Name = "Series1";
            this.chart1.Series.Add(series1);
            this.chart1.Size = new System.Drawing.Size(677, 344);
            this.chart1.TabIndex = 0;
            this.chart1.Text = "chart1";
            // 
            // Proyeccion_textbox_pesoInicial
            // 
            this.Proyeccion_textbox_pesoInicial.Enabled = false;
            this.Proyeccion_textbox_pesoInicial.Location = new System.Drawing.Point(15, 40);
            this.Proyeccion_textbox_pesoInicial.Name = "Proyeccion_textbox_pesoInicial";
            this.Proyeccion_textbox_pesoInicial.Size = new System.Drawing.Size(100, 20);
            this.Proyeccion_textbox_pesoInicial.TabIndex = 1;
            // 
            // Proyeccion_textbox_bfpInicial
            // 
            this.Proyeccion_textbox_bfpInicial.Location = new System.Drawing.Point(159, 40);
            this.Proyeccion_textbox_bfpInicial.Name = "Proyeccion_textbox_bfpInicial";
            this.Proyeccion_textbox_bfpInicial.Size = new System.Drawing.Size(116, 20);
            this.Proyeccion_textbox_bfpInicial.TabIndex = 2;
            // 
            // Proyeccion_textbox_bfpObjetivo
            // 
            this.Proyeccion_textbox_bfpObjetivo.Location = new System.Drawing.Point(313, 40);
            this.Proyeccion_textbox_bfpObjetivo.Name = "Proyeccion_textbox_bfpObjetivo";
            this.Proyeccion_textbox_bfpObjetivo.Size = new System.Drawing.Size(128, 20);
            this.Proyeccion_textbox_bfpObjetivo.TabIndex = 3;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 24);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(60, 13);
            this.label1.TabIndex = 4;
            this.label1.Text = "Peso inicial";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(156, 24);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(119, 13);
            this.label2.TabIndex = 5;
            this.label2.Text = "Porcentaje Grasa Inicial";
            this.label2.Click += new System.EventHandler(this.label2_Click);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(310, 24);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(131, 13);
            this.label3.TabIndex = 6;
            this.label3.Text = "Porcentaje Grasa Objetivo";
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(698, 24);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(119, 38);
            this.button1.TabIndex = 7;
            this.button1.Text = "Obtener Proyeccion";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // Proyeccion_textbox_primerPeso
            // 
            this.Proyeccion_textbox_primerPeso.Enabled = false;
            this.Proyeccion_textbox_primerPeso.Location = new System.Drawing.Point(698, 110);
            this.Proyeccion_textbox_primerPeso.Name = "Proyeccion_textbox_primerPeso";
            this.Proyeccion_textbox_primerPeso.Size = new System.Drawing.Size(63, 20);
            this.Proyeccion_textbox_primerPeso.TabIndex = 8;
            // 
            // Proyeccion_textbox_primerFecha
            // 
            this.Proyeccion_textbox_primerFecha.Enabled = false;
            this.Proyeccion_textbox_primerFecha.Location = new System.Drawing.Point(780, 110);
            this.Proyeccion_textbox_primerFecha.Name = "Proyeccion_textbox_primerFecha";
            this.Proyeccion_textbox_primerFecha.Size = new System.Drawing.Size(74, 20);
            this.Proyeccion_textbox_primerFecha.TabIndex = 9;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(698, 76);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(68, 13);
            this.label4.TabIndex = 10;
            this.label4.Text = "Primera Fase";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(698, 94);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(31, 13);
            this.label5.TabIndex = 11;
            this.label5.Text = "Peso";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(777, 94);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(51, 13);
            this.label6.TabIndex = 12;
            this.label6.Text = "Semanas";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(777, 174);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(51, 13);
            this.label7.TabIndex = 17;
            this.label7.Text = "Semanas";
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(698, 174);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(31, 13);
            this.label8.TabIndex = 16;
            this.label8.Text = "Peso";
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(698, 156);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(76, 13);
            this.label9.TabIndex = 15;
            this.label9.Text = "Segunda Fase";
            this.label9.Click += new System.EventHandler(this.label9_Click);
            // 
            // Proyeccion_textbox_segundaFecha
            // 
            this.Proyeccion_textbox_segundaFecha.Enabled = false;
            this.Proyeccion_textbox_segundaFecha.Location = new System.Drawing.Point(780, 190);
            this.Proyeccion_textbox_segundaFecha.Name = "Proyeccion_textbox_segundaFecha";
            this.Proyeccion_textbox_segundaFecha.Size = new System.Drawing.Size(74, 20);
            this.Proyeccion_textbox_segundaFecha.TabIndex = 14;
            // 
            // Proyeccion_textbox_segundoPeso
            // 
            this.Proyeccion_textbox_segundoPeso.Enabled = false;
            this.Proyeccion_textbox_segundoPeso.Location = new System.Drawing.Point(698, 190);
            this.Proyeccion_textbox_segundoPeso.Name = "Proyeccion_textbox_segundoPeso";
            this.Proyeccion_textbox_segundoPeso.Size = new System.Drawing.Size(63, 20);
            this.Proyeccion_textbox_segundoPeso.TabIndex = 13;
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Location = new System.Drawing.Point(777, 249);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(51, 13);
            this.label10.TabIndex = 22;
            this.label10.Text = "Semanas";
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Location = new System.Drawing.Point(698, 249);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(31, 13);
            this.label11.TabIndex = 21;
            this.label11.Text = "Peso";
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.Location = new System.Drawing.Point(698, 231);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(70, 13);
            this.label12.TabIndex = 20;
            this.label12.Text = "Tercera Fase";
            // 
            // Proyeccion_textbox_terceraFecha
            // 
            this.Proyeccion_textbox_terceraFecha.Enabled = false;
            this.Proyeccion_textbox_terceraFecha.Location = new System.Drawing.Point(780, 265);
            this.Proyeccion_textbox_terceraFecha.Name = "Proyeccion_textbox_terceraFecha";
            this.Proyeccion_textbox_terceraFecha.Size = new System.Drawing.Size(74, 20);
            this.Proyeccion_textbox_terceraFecha.TabIndex = 19;
            // 
            // Proyeccion_textbox_tercerPeso
            // 
            this.Proyeccion_textbox_tercerPeso.Enabled = false;
            this.Proyeccion_textbox_tercerPeso.Location = new System.Drawing.Point(698, 265);
            this.Proyeccion_textbox_tercerPeso.Name = "Proyeccion_textbox_tercerPeso";
            this.Proyeccion_textbox_tercerPeso.Size = new System.Drawing.Size(63, 20);
            this.Proyeccion_textbox_tercerPeso.TabIndex = 18;
            // 
            // label13
            // 
            this.label13.AutoSize = true;
            this.label13.Location = new System.Drawing.Point(777, 329);
            this.label13.Name = "label13";
            this.label13.Size = new System.Drawing.Size(51, 13);
            this.label13.TabIndex = 27;
            this.label13.Text = "Semanas";
            // 
            // label14
            // 
            this.label14.AutoSize = true;
            this.label14.Location = new System.Drawing.Point(698, 329);
            this.label14.Name = "label14";
            this.label14.Size = new System.Drawing.Size(31, 13);
            this.label14.TabIndex = 26;
            this.label14.Text = "Peso";
            // 
            // label15
            // 
            this.label15.AutoSize = true;
            this.label15.Location = new System.Drawing.Point(698, 311);
            this.label15.Name = "label15";
            this.label15.Size = new System.Drawing.Size(64, 13);
            this.label15.TabIndex = 25;
            this.label15.Text = "Cuarta Fase";
            // 
            // Proyeccion_textbox_cuartaFecha
            // 
            this.Proyeccion_textbox_cuartaFecha.Enabled = false;
            this.Proyeccion_textbox_cuartaFecha.Location = new System.Drawing.Point(780, 345);
            this.Proyeccion_textbox_cuartaFecha.Name = "Proyeccion_textbox_cuartaFecha";
            this.Proyeccion_textbox_cuartaFecha.Size = new System.Drawing.Size(74, 20);
            this.Proyeccion_textbox_cuartaFecha.TabIndex = 24;
            // 
            // Proyeccion_textbox_cuartoPeso
            // 
            this.Proyeccion_textbox_cuartoPeso.Enabled = false;
            this.Proyeccion_textbox_cuartoPeso.Location = new System.Drawing.Point(698, 345);
            this.Proyeccion_textbox_cuartoPeso.Name = "Proyeccion_textbox_cuartoPeso";
            this.Proyeccion_textbox_cuartoPeso.Size = new System.Drawing.Size(63, 20);
            this.Proyeccion_textbox_cuartoPeso.TabIndex = 23;
            // 
            // GraficoProyeccion
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("$this.BackgroundImage")));
            this.ClientSize = new System.Drawing.Size(856, 432);
            this.Controls.Add(this.label13);
            this.Controls.Add(this.label14);
            this.Controls.Add(this.label15);
            this.Controls.Add(this.Proyeccion_textbox_cuartaFecha);
            this.Controls.Add(this.Proyeccion_textbox_cuartoPeso);
            this.Controls.Add(this.label10);
            this.Controls.Add(this.label11);
            this.Controls.Add(this.label12);
            this.Controls.Add(this.Proyeccion_textbox_terceraFecha);
            this.Controls.Add(this.Proyeccion_textbox_tercerPeso);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.label8);
            this.Controls.Add(this.label9);
            this.Controls.Add(this.Proyeccion_textbox_segundaFecha);
            this.Controls.Add(this.Proyeccion_textbox_segundoPeso);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.Proyeccion_textbox_primerFecha);
            this.Controls.Add(this.Proyeccion_textbox_primerPeso);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.Proyeccion_textbox_bfpObjetivo);
            this.Controls.Add(this.Proyeccion_textbox_bfpInicial);
            this.Controls.Add(this.Proyeccion_textbox_pesoInicial);
            this.Controls.Add(this.chart1);
            this.Name = "GraficoProyeccion";
            this.Text = "Proyeccion";
            this.Load += new System.EventHandler(this.Proyeccion_Load);
            ((System.ComponentModel.ISupportInitialize)(this.chart1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataVisualization.Charting.Chart chart1;
        private System.Windows.Forms.TextBox Proyeccion_textbox_pesoInicial;
        private System.Windows.Forms.TextBox Proyeccion_textbox_bfpInicial;
        private System.Windows.Forms.TextBox Proyeccion_textbox_bfpObjetivo;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.TextBox Proyeccion_textbox_primerPeso;
        private System.Windows.Forms.TextBox Proyeccion_textbox_primerFecha;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.TextBox Proyeccion_textbox_segundaFecha;
        private System.Windows.Forms.TextBox Proyeccion_textbox_segundoPeso;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.Label label12;
        private System.Windows.Forms.TextBox Proyeccion_textbox_terceraFecha;
        private System.Windows.Forms.TextBox Proyeccion_textbox_tercerPeso;
        private System.Windows.Forms.Label label13;
        private System.Windows.Forms.Label label14;
        private System.Windows.Forms.Label label15;
        private System.Windows.Forms.TextBox Proyeccion_textbox_cuartaFecha;
        private System.Windows.Forms.TextBox Proyeccion_textbox_cuartoPeso;
    }
}