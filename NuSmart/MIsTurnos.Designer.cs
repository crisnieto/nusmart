namespace NuSmart
{
    partial class MisTurnos
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(MisTurnos));
            this.MisTurnos_label_nutricionista = new System.Windows.Forms.Label();
            this.monthCalendar1 = new System.Windows.Forms.MonthCalendar();
            this.MisTurnos_label_titulo = new System.Windows.Forms.Label();
            this.listBox1 = new System.Windows.Forms.ListBox();
            this.MisTurnos_button_iniciar = new System.Windows.Forms.Button();
            this.MisTurnos_button_borrar = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // MisTurnos_label_nutricionista
            // 
            this.MisTurnos_label_nutricionista.AutoSize = true;
            this.MisTurnos_label_nutricionista.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.MisTurnos_label_nutricionista.Location = new System.Drawing.Point(12, 9);
            this.MisTurnos_label_nutricionista.Name = "MisTurnos_label_nutricionista";
            this.MisTurnos_label_nutricionista.Size = new System.Drawing.Size(51, 20);
            this.MisTurnos_label_nutricionista.TabIndex = 0;
            this.MisTurnos_label_nutricionista.Text = "label1";
            // 
            // monthCalendar1
            // 
            this.monthCalendar1.Location = new System.Drawing.Point(16, 38);
            this.monthCalendar1.Name = "monthCalendar1";
            this.monthCalendar1.TabIndex = 1;
            this.monthCalendar1.DateChanged += new System.Windows.Forms.DateRangeEventHandler(this.monthCalendar1_DateChanged);
            // 
            // MisTurnos_label_titulo
            // 
            this.MisTurnos_label_titulo.AutoSize = true;
            this.MisTurnos_label_titulo.Location = new System.Drawing.Point(282, 38);
            this.MisTurnos_label_titulo.Name = "MisTurnos_label_titulo";
            this.MisTurnos_label_titulo.Size = new System.Drawing.Size(58, 13);
            this.MisTurnos_label_titulo.TabIndex = 2;
            this.MisTurnos_label_titulo.Text = "Mis turnos:";
            // 
            // listBox1
            // 
            this.listBox1.FormattingEnabled = true;
            this.listBox1.Location = new System.Drawing.Point(285, 54);
            this.listBox1.Name = "listBox1";
            this.listBox1.Size = new System.Drawing.Size(263, 147);
            this.listBox1.TabIndex = 3;
            this.listBox1.SelectedIndexChanged += new System.EventHandler(this.listBox1_SelectedIndexChanged);
            // 
            // MisTurnos_button_iniciar
            // 
            this.MisTurnos_button_iniciar.Enabled = false;
            this.MisTurnos_button_iniciar.Location = new System.Drawing.Point(285, 207);
            this.MisTurnos_button_iniciar.Name = "MisTurnos_button_iniciar";
            this.MisTurnos_button_iniciar.Size = new System.Drawing.Size(263, 42);
            this.MisTurnos_button_iniciar.TabIndex = 4;
            this.MisTurnos_button_iniciar.Text = "Iniciar Turno";
            this.MisTurnos_button_iniciar.UseVisualStyleBackColor = true;
            this.MisTurnos_button_iniciar.Click += new System.EventHandler(this.button1_Click);
            // 
            // MisTurnos_button_borrar
            // 
            this.MisTurnos_button_borrar.Enabled = false;
            this.MisTurnos_button_borrar.Location = new System.Drawing.Point(16, 207);
            this.MisTurnos_button_borrar.Name = "MisTurnos_button_borrar";
            this.MisTurnos_button_borrar.Size = new System.Drawing.Size(227, 42);
            this.MisTurnos_button_borrar.TabIndex = 5;
            this.MisTurnos_button_borrar.Text = "Borrar Turno";
            this.MisTurnos_button_borrar.UseVisualStyleBackColor = true;
            this.MisTurnos_button_borrar.Click += new System.EventHandler(this.button1_Click_1);
            // 
            // MisTurnos
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("$this.BackgroundImage")));
            this.ClientSize = new System.Drawing.Size(560, 258);
            this.Controls.Add(this.MisTurnos_button_borrar);
            this.Controls.Add(this.MisTurnos_button_iniciar);
            this.Controls.Add(this.listBox1);
            this.Controls.Add(this.MisTurnos_label_titulo);
            this.Controls.Add(this.monthCalendar1);
            this.Controls.Add(this.MisTurnos_label_nutricionista);
            this.Name = "MisTurnos";
            this.Text = "MIsTurnos";
            this.Load += new System.EventHandler(this.MIsTurnos_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label MisTurnos_label_nutricionista;
        private System.Windows.Forms.MonthCalendar monthCalendar1;
        private System.Windows.Forms.Label MisTurnos_label_titulo;
        private System.Windows.Forms.ListBox listBox1;
        private System.Windows.Forms.Button MisTurnos_button_iniciar;
        private System.Windows.Forms.Button MisTurnos_button_borrar;
    }
}