namespace NuSmart
{
    partial class Agenda
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Agenda));
            this.agenda_btn_backup = new System.Windows.Forms.Button();
            this.agenda_btn_bitacora = new System.Windows.Forms.Button();
            this.button4 = new System.Windows.Forms.Button();
            this.button3 = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            this.agenda_btn_gestion_pacientes = new System.Windows.Forms.Button();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.listBox1 = new System.Windows.Forms.ListBox();
            this.monthCalendar1 = new System.Windows.Forms.MonthCalendar();
            this.SuspendLayout();
            // 
            // agenda_btn_backup
            // 
            this.agenda_btn_backup.Location = new System.Drawing.Point(250, 508);
            this.agenda_btn_backup.Margin = new System.Windows.Forms.Padding(6);
            this.agenda_btn_backup.Name = "agenda_btn_backup";
            this.agenda_btn_backup.Size = new System.Drawing.Size(247, 67);
            this.agenda_btn_backup.TabIndex = 9;
            this.agenda_btn_backup.Text = "Backup";
            this.agenda_btn_backup.UseVisualStyleBackColor = true;
            this.agenda_btn_backup.Click += new System.EventHandler(this.button6_Click);
            // 
            // agenda_btn_bitacora
            // 
            this.agenda_btn_bitacora.Location = new System.Drawing.Point(250, 421);
            this.agenda_btn_bitacora.Margin = new System.Windows.Forms.Padding(6);
            this.agenda_btn_bitacora.Name = "agenda_btn_bitacora";
            this.agenda_btn_bitacora.Size = new System.Drawing.Size(247, 67);
            this.agenda_btn_bitacora.TabIndex = 8;
            this.agenda_btn_bitacora.Text = "Bitacora";
            this.agenda_btn_bitacora.UseVisualStyleBackColor = true;
            this.agenda_btn_bitacora.Click += new System.EventHandler(this.button5_Click);
            // 
            // button4
            // 
            this.button4.Location = new System.Drawing.Point(27, 418);
            this.button4.Margin = new System.Windows.Forms.Padding(6);
            this.button4.Name = "button4";
            this.button4.Size = new System.Drawing.Size(120, 67);
            this.button4.TabIndex = 7;
            this.button4.Text = "Cerrar Sesión";
            this.button4.UseVisualStyleBackColor = true;
            this.button4.Click += new System.EventHandler(this.button4_Click);
            // 
            // button3
            // 
            this.button3.Location = new System.Drawing.Point(582, 500);
            this.button3.Margin = new System.Windows.Forms.Padding(6);
            this.button3.Name = "button3";
            this.button3.Size = new System.Drawing.Size(174, 67);
            this.button3.TabIndex = 6;
            this.button3.Text = "Borrar turno";
            this.button3.UseVisualStyleBackColor = true;
            this.button3.Click += new System.EventHandler(this.button3_Click);
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(582, 421);
            this.button2.Margin = new System.Windows.Forms.Padding(6);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(404, 60);
            this.button2.TabIndex = 5;
            this.button2.Text = "Iniciar Turno";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // agenda_btn_gestion_pacientes
            // 
            this.agenda_btn_gestion_pacientes.Location = new System.Drawing.Point(582, 23);
            this.agenda_btn_gestion_pacientes.Margin = new System.Windows.Forms.Padding(6);
            this.agenda_btn_gestion_pacientes.Name = "agenda_btn_gestion_pacientes";
            this.agenda_btn_gestion_pacientes.Size = new System.Drawing.Size(396, 60);
            this.agenda_btn_gestion_pacientes.TabIndex = 4;
            this.agenda_btn_gestion_pacientes.Text = "Gestion de Pacientes";
            this.agenda_btn_gestion_pacientes.UseVisualStyleBackColor = true;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(28, 40);
            this.label2.Margin = new System.Windows.Forms.Padding(6, 0, 6, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(202, 25);
            this.label2.TabIndex = 3;
            this.label2.Text = "Nombre del Usuario";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(576, 146);
            this.label1.Margin = new System.Windows.Forms.Padding(6, 0, 6, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(161, 25);
            this.label1.TabIndex = 2;
            this.label1.Text = "Tus turnos hoy:";
            // 
            // listBox1
            // 
            this.listBox1.FormattingEnabled = true;
            this.listBox1.ItemHeight = 25;
            this.listBox1.Location = new System.Drawing.Point(582, 202);
            this.listBox1.Margin = new System.Windows.Forms.Padding(6);
            this.listBox1.Name = "listBox1";
            this.listBox1.Size = new System.Drawing.Size(400, 204);
            this.listBox1.TabIndex = 1;
            // 
            // monthCalendar1
            // 
            this.monthCalendar1.Location = new System.Drawing.Point(27, 82);
            this.monthCalendar1.Margin = new System.Windows.Forms.Padding(18, 17, 18, 17);
            this.monthCalendar1.Name = "monthCalendar1";
            this.monthCalendar1.TabIndex = 0;
            // 
            // Agenda
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(12F, 25F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.Cornsilk;
            this.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("$this.BackgroundImage")));
            this.ClientSize = new System.Drawing.Size(1010, 590);
            this.Controls.Add(this.agenda_btn_backup);
            this.Controls.Add(this.agenda_btn_bitacora);
            this.Controls.Add(this.button4);
            this.Controls.Add(this.button3);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.agenda_btn_gestion_pacientes);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.listBox1);
            this.Controls.Add(this.monthCalendar1);
            this.Margin = new System.Windows.Forms.Padding(6);
            this.Name = "Agenda";
            this.Text = "Agenda";
            this.FormClosed += new System.Windows.Forms.FormClosedEventHandler(this.Agenda_FormClosed);
            this.Load += new System.EventHandler(this.Agenda_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.MonthCalendar monthCalendar1;
        private System.Windows.Forms.ListBox listBox1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Button agenda_btn_gestion_pacientes;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Button button3;
        private System.Windows.Forms.Button button4;
        private System.Windows.Forms.Button agenda_btn_bitacora;
        private System.Windows.Forms.Button agenda_btn_backup;
    }
}