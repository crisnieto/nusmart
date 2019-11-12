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
            this.Proyeccion_label_peso_inicial = new System.Windows.Forms.Label();
            this.Proyeccion_label_bfp = new System.Windows.Forms.Label();
            this.Proyeccion_label_bfp_objetivo = new System.Windows.Forms.Label();
            this.Proyeccion_button_proyeccion = new System.Windows.Forms.Button();
            this.Proyeccion_textbox_primerPeso = new System.Windows.Forms.TextBox();
            this.Proyeccion_textbox_primerFecha = new System.Windows.Forms.TextBox();
            this.Proyeccion_label_primera_fase = new System.Windows.Forms.Label();
            this.Proyeccion_label_peso_1 = new System.Windows.Forms.Label();
            this.Proyeccion_label_dias_1 = new System.Windows.Forms.Label();
            this.Proyeccion_label_dias_2 = new System.Windows.Forms.Label();
            this.Proyeccion_label_peso_2 = new System.Windows.Forms.Label();
            this.Proyeccion_label_segunda_fase = new System.Windows.Forms.Label();
            this.Proyeccion_textbox_segundaFecha = new System.Windows.Forms.TextBox();
            this.Proyeccion_textbox_segundoPeso = new System.Windows.Forms.TextBox();
            this.Proyeccion_label_dias_3 = new System.Windows.Forms.Label();
            this.Proyeccion_label_peso_3 = new System.Windows.Forms.Label();
            this.Proyeccion_label_tercera_fase = new System.Windows.Forms.Label();
            this.Proyeccion_textbox_terceraFecha = new System.Windows.Forms.TextBox();
            this.Proyeccion_textbox_tercerPeso = new System.Windows.Forms.TextBox();
            this.Proyeccion_label_dias_4 = new System.Windows.Forms.Label();
            this.Proyeccion_label_peso_4 = new System.Windows.Forms.Label();
            this.Proyeccion_label_cuarta_fase = new System.Windows.Forms.Label();
            this.Proyeccion_textbox_cuartaFecha = new System.Windows.Forms.TextBox();
            this.Proyeccion_textbox_cuartoPeso = new System.Windows.Forms.TextBox();
            this.Proyeccion_label_eje_x = new System.Windows.Forms.Label();
            this.Proyeccion_label_eje_y = new System.Windows.Forms.Label();
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
            // Proyeccion_label_peso_inicial
            // 
            this.Proyeccion_label_peso_inicial.AutoSize = true;
            this.Proyeccion_label_peso_inicial.Location = new System.Drawing.Point(12, 24);
            this.Proyeccion_label_peso_inicial.Name = "Proyeccion_label_peso_inicial";
            this.Proyeccion_label_peso_inicial.Size = new System.Drawing.Size(60, 13);
            this.Proyeccion_label_peso_inicial.TabIndex = 4;
            this.Proyeccion_label_peso_inicial.Text = "Peso inicial";
            // 
            // Proyeccion_label_bfp
            // 
            this.Proyeccion_label_bfp.AutoSize = true;
            this.Proyeccion_label_bfp.Location = new System.Drawing.Point(156, 24);
            this.Proyeccion_label_bfp.Name = "Proyeccion_label_bfp";
            this.Proyeccion_label_bfp.Size = new System.Drawing.Size(119, 13);
            this.Proyeccion_label_bfp.TabIndex = 5;
            this.Proyeccion_label_bfp.Text = "Porcentaje Grasa Inicial";
            this.Proyeccion_label_bfp.Click += new System.EventHandler(this.label2_Click);
            // 
            // Proyeccion_label_bfp_objetivo
            // 
            this.Proyeccion_label_bfp_objetivo.AutoSize = true;
            this.Proyeccion_label_bfp_objetivo.Location = new System.Drawing.Point(310, 24);
            this.Proyeccion_label_bfp_objetivo.Name = "Proyeccion_label_bfp_objetivo";
            this.Proyeccion_label_bfp_objetivo.Size = new System.Drawing.Size(131, 13);
            this.Proyeccion_label_bfp_objetivo.TabIndex = 6;
            this.Proyeccion_label_bfp_objetivo.Text = "Porcentaje Grasa Objetivo";
            // 
            // Proyeccion_button_proyeccion
            // 
            this.Proyeccion_button_proyeccion.Location = new System.Drawing.Point(698, 24);
            this.Proyeccion_button_proyeccion.Name = "Proyeccion_button_proyeccion";
            this.Proyeccion_button_proyeccion.Size = new System.Drawing.Size(119, 38);
            this.Proyeccion_button_proyeccion.TabIndex = 7;
            this.Proyeccion_button_proyeccion.Text = "Obtener Proyeccion";
            this.Proyeccion_button_proyeccion.UseVisualStyleBackColor = true;
            this.Proyeccion_button_proyeccion.Click += new System.EventHandler(this.button1_Click);
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
            // Proyeccion_label_primera_fase
            // 
            this.Proyeccion_label_primera_fase.AutoSize = true;
            this.Proyeccion_label_primera_fase.Location = new System.Drawing.Point(698, 76);
            this.Proyeccion_label_primera_fase.Name = "Proyeccion_label_primera_fase";
            this.Proyeccion_label_primera_fase.Size = new System.Drawing.Size(68, 13);
            this.Proyeccion_label_primera_fase.TabIndex = 10;
            this.Proyeccion_label_primera_fase.Text = "Primera Fase";
            // 
            // Proyeccion_label_peso_1
            // 
            this.Proyeccion_label_peso_1.AutoSize = true;
            this.Proyeccion_label_peso_1.Location = new System.Drawing.Point(698, 94);
            this.Proyeccion_label_peso_1.Name = "Proyeccion_label_peso_1";
            this.Proyeccion_label_peso_1.Size = new System.Drawing.Size(31, 13);
            this.Proyeccion_label_peso_1.TabIndex = 11;
            this.Proyeccion_label_peso_1.Text = "Peso";
            // 
            // Proyeccion_label_dias_1
            // 
            this.Proyeccion_label_dias_1.AutoSize = true;
            this.Proyeccion_label_dias_1.Location = new System.Drawing.Point(777, 94);
            this.Proyeccion_label_dias_1.Name = "Proyeccion_label_dias_1";
            this.Proyeccion_label_dias_1.Size = new System.Drawing.Size(28, 13);
            this.Proyeccion_label_dias_1.TabIndex = 12;
            this.Proyeccion_label_dias_1.Text = "Dias";
            // 
            // Proyeccion_label_dias_2
            // 
            this.Proyeccion_label_dias_2.AutoSize = true;
            this.Proyeccion_label_dias_2.Location = new System.Drawing.Point(777, 174);
            this.Proyeccion_label_dias_2.Name = "Proyeccion_label_dias_2";
            this.Proyeccion_label_dias_2.Size = new System.Drawing.Size(28, 13);
            this.Proyeccion_label_dias_2.TabIndex = 17;
            this.Proyeccion_label_dias_2.Text = "Dias";
            // 
            // Proyeccion_label_peso_2
            // 
            this.Proyeccion_label_peso_2.AutoSize = true;
            this.Proyeccion_label_peso_2.Location = new System.Drawing.Point(698, 174);
            this.Proyeccion_label_peso_2.Name = "Proyeccion_label_peso_2";
            this.Proyeccion_label_peso_2.Size = new System.Drawing.Size(31, 13);
            this.Proyeccion_label_peso_2.TabIndex = 16;
            this.Proyeccion_label_peso_2.Text = "Peso";
            // 
            // Proyeccion_label_segunda_fase
            // 
            this.Proyeccion_label_segunda_fase.AutoSize = true;
            this.Proyeccion_label_segunda_fase.Location = new System.Drawing.Point(698, 156);
            this.Proyeccion_label_segunda_fase.Name = "Proyeccion_label_segunda_fase";
            this.Proyeccion_label_segunda_fase.Size = new System.Drawing.Size(76, 13);
            this.Proyeccion_label_segunda_fase.TabIndex = 15;
            this.Proyeccion_label_segunda_fase.Text = "Segunda Fase";
            this.Proyeccion_label_segunda_fase.Click += new System.EventHandler(this.label9_Click);
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
            // Proyeccion_label_dias_3
            // 
            this.Proyeccion_label_dias_3.AutoSize = true;
            this.Proyeccion_label_dias_3.Location = new System.Drawing.Point(777, 249);
            this.Proyeccion_label_dias_3.Name = "Proyeccion_label_dias_3";
            this.Proyeccion_label_dias_3.Size = new System.Drawing.Size(28, 13);
            this.Proyeccion_label_dias_3.TabIndex = 22;
            this.Proyeccion_label_dias_3.Text = "Dias";
            // 
            // Proyeccion_label_peso_3
            // 
            this.Proyeccion_label_peso_3.AutoSize = true;
            this.Proyeccion_label_peso_3.Location = new System.Drawing.Point(698, 249);
            this.Proyeccion_label_peso_3.Name = "Proyeccion_label_peso_3";
            this.Proyeccion_label_peso_3.Size = new System.Drawing.Size(31, 13);
            this.Proyeccion_label_peso_3.TabIndex = 21;
            this.Proyeccion_label_peso_3.Text = "Peso";
            // 
            // Proyeccion_label_tercera_fase
            // 
            this.Proyeccion_label_tercera_fase.AutoSize = true;
            this.Proyeccion_label_tercera_fase.Location = new System.Drawing.Point(698, 231);
            this.Proyeccion_label_tercera_fase.Name = "Proyeccion_label_tercera_fase";
            this.Proyeccion_label_tercera_fase.Size = new System.Drawing.Size(70, 13);
            this.Proyeccion_label_tercera_fase.TabIndex = 20;
            this.Proyeccion_label_tercera_fase.Text = "Tercera Fase";
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
            // Proyeccion_label_dias_4
            // 
            this.Proyeccion_label_dias_4.AutoSize = true;
            this.Proyeccion_label_dias_4.Location = new System.Drawing.Point(777, 325);
            this.Proyeccion_label_dias_4.Name = "Proyeccion_label_dias_4";
            this.Proyeccion_label_dias_4.Size = new System.Drawing.Size(28, 13);
            this.Proyeccion_label_dias_4.TabIndex = 27;
            this.Proyeccion_label_dias_4.Text = "Dias";
            // 
            // Proyeccion_label_peso_4
            // 
            this.Proyeccion_label_peso_4.AutoSize = true;
            this.Proyeccion_label_peso_4.Location = new System.Drawing.Point(698, 325);
            this.Proyeccion_label_peso_4.Name = "Proyeccion_label_peso_4";
            this.Proyeccion_label_peso_4.Size = new System.Drawing.Size(31, 13);
            this.Proyeccion_label_peso_4.TabIndex = 26;
            this.Proyeccion_label_peso_4.Text = "Peso";
            // 
            // Proyeccion_label_cuarta_fase
            // 
            this.Proyeccion_label_cuarta_fase.AutoSize = true;
            this.Proyeccion_label_cuarta_fase.Location = new System.Drawing.Point(698, 307);
            this.Proyeccion_label_cuarta_fase.Name = "Proyeccion_label_cuarta_fase";
            this.Proyeccion_label_cuarta_fase.Size = new System.Drawing.Size(64, 13);
            this.Proyeccion_label_cuarta_fase.TabIndex = 25;
            this.Proyeccion_label_cuarta_fase.Text = "Cuarta Fase";
            // 
            // Proyeccion_textbox_cuartaFecha
            // 
            this.Proyeccion_textbox_cuartaFecha.Enabled = false;
            this.Proyeccion_textbox_cuartaFecha.Location = new System.Drawing.Point(780, 341);
            this.Proyeccion_textbox_cuartaFecha.Name = "Proyeccion_textbox_cuartaFecha";
            this.Proyeccion_textbox_cuartaFecha.Size = new System.Drawing.Size(74, 20);
            this.Proyeccion_textbox_cuartaFecha.TabIndex = 24;
            // 
            // Proyeccion_textbox_cuartoPeso
            // 
            this.Proyeccion_textbox_cuartoPeso.Enabled = false;
            this.Proyeccion_textbox_cuartoPeso.Location = new System.Drawing.Point(698, 341);
            this.Proyeccion_textbox_cuartoPeso.Name = "Proyeccion_textbox_cuartoPeso";
            this.Proyeccion_textbox_cuartoPeso.Size = new System.Drawing.Size(63, 20);
            this.Proyeccion_textbox_cuartoPeso.TabIndex = 23;
            // 
            // Proyeccion_label_eje_x
            // 
            this.Proyeccion_label_eje_x.AutoSize = true;
            this.Proyeccion_label_eje_x.Location = new System.Drawing.Point(698, 407);
            this.Proyeccion_label_eje_x.Name = "Proyeccion_label_eje_x";
            this.Proyeccion_label_eje_x.Size = new System.Drawing.Size(146, 13);
            this.Proyeccion_label_eje_x.TabIndex = 28;
            this.Proyeccion_label_eje_x.Text = "Eje X expresado en Semanas";
            // 
            // Proyeccion_label_eje_y
            // 
            this.Proyeccion_label_eje_y.AutoSize = true;
            this.Proyeccion_label_eje_y.Location = new System.Drawing.Point(698, 384);
            this.Proyeccion_label_eje_y.Name = "Proyeccion_label_eje_y";
            this.Proyeccion_label_eje_y.Size = new System.Drawing.Size(124, 13);
            this.Proyeccion_label_eje_y.TabIndex = 29;
            this.Proyeccion_label_eje_y.Text = "Eje Y expresado en Kilos";
            // 
            // GraficoProyeccion
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("$this.BackgroundImage")));
            this.ClientSize = new System.Drawing.Size(856, 432);
            this.Controls.Add(this.Proyeccion_label_eje_y);
            this.Controls.Add(this.Proyeccion_label_eje_x);
            this.Controls.Add(this.Proyeccion_label_dias_4);
            this.Controls.Add(this.Proyeccion_label_peso_4);
            this.Controls.Add(this.Proyeccion_label_cuarta_fase);
            this.Controls.Add(this.Proyeccion_textbox_cuartaFecha);
            this.Controls.Add(this.Proyeccion_textbox_cuartoPeso);
            this.Controls.Add(this.Proyeccion_label_dias_3);
            this.Controls.Add(this.Proyeccion_label_peso_3);
            this.Controls.Add(this.Proyeccion_label_tercera_fase);
            this.Controls.Add(this.Proyeccion_textbox_terceraFecha);
            this.Controls.Add(this.Proyeccion_textbox_tercerPeso);
            this.Controls.Add(this.Proyeccion_label_dias_2);
            this.Controls.Add(this.Proyeccion_label_peso_2);
            this.Controls.Add(this.Proyeccion_label_segunda_fase);
            this.Controls.Add(this.Proyeccion_textbox_segundaFecha);
            this.Controls.Add(this.Proyeccion_textbox_segundoPeso);
            this.Controls.Add(this.Proyeccion_label_dias_1);
            this.Controls.Add(this.Proyeccion_label_peso_1);
            this.Controls.Add(this.Proyeccion_label_primera_fase);
            this.Controls.Add(this.Proyeccion_textbox_primerFecha);
            this.Controls.Add(this.Proyeccion_textbox_primerPeso);
            this.Controls.Add(this.Proyeccion_button_proyeccion);
            this.Controls.Add(this.Proyeccion_label_bfp_objetivo);
            this.Controls.Add(this.Proyeccion_label_bfp);
            this.Controls.Add(this.Proyeccion_label_peso_inicial);
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
        private System.Windows.Forms.Label Proyeccion_label_peso_inicial;
        private System.Windows.Forms.Label Proyeccion_label_bfp;
        private System.Windows.Forms.Label Proyeccion_label_bfp_objetivo;
        private System.Windows.Forms.Button Proyeccion_button_proyeccion;
        private System.Windows.Forms.TextBox Proyeccion_textbox_primerPeso;
        private System.Windows.Forms.TextBox Proyeccion_textbox_primerFecha;
        private System.Windows.Forms.Label Proyeccion_label_primera_fase;
        private System.Windows.Forms.Label Proyeccion_label_peso_1;
        private System.Windows.Forms.Label Proyeccion_label_dias_1;
        private System.Windows.Forms.Label Proyeccion_label_dias_2;
        private System.Windows.Forms.Label Proyeccion_label_peso_2;
        private System.Windows.Forms.Label Proyeccion_label_segunda_fase;
        private System.Windows.Forms.TextBox Proyeccion_textbox_segundaFecha;
        private System.Windows.Forms.TextBox Proyeccion_textbox_segundoPeso;
        private System.Windows.Forms.Label Proyeccion_label_dias_3;
        private System.Windows.Forms.Label Proyeccion_label_peso_3;
        private System.Windows.Forms.Label Proyeccion_label_tercera_fase;
        private System.Windows.Forms.TextBox Proyeccion_textbox_terceraFecha;
        private System.Windows.Forms.TextBox Proyeccion_textbox_tercerPeso;
        private System.Windows.Forms.Label Proyeccion_label_dias_4;
        private System.Windows.Forms.Label Proyeccion_label_peso_4;
        private System.Windows.Forms.Label Proyeccion_label_cuarta_fase;
        private System.Windows.Forms.TextBox Proyeccion_textbox_cuartaFecha;
        private System.Windows.Forms.TextBox Proyeccion_textbox_cuartoPeso;
        private System.Windows.Forms.Label Proyeccion_label_eje_x;
        private System.Windows.Forms.Label Proyeccion_label_eje_y;
    }
}