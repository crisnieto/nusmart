namespace NuSmart
{
    partial class Turnos
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
            this.agenda_btn_erase_appointment = new System.Windows.Forms.Button();
            this.agenda_btn_start_appointment = new System.Windows.Forms.Button();
            this.agenda_lbl_username = new System.Windows.Forms.Label();
            this.agenda_lbl_appointments = new System.Windows.Forms.Label();
            this.listBox1 = new System.Windows.Forms.ListBox();
            this.monthCalendar1 = new System.Windows.Forms.MonthCalendar();
            this.SuspendLayout();
            // 
            // agenda_btn_erase_appointment
            // 
            this.agenda_btn_erase_appointment.Location = new System.Drawing.Point(530, 334);
            this.agenda_btn_erase_appointment.Margin = new System.Windows.Forms.Padding(6);
            this.agenda_btn_erase_appointment.Name = "agenda_btn_erase_appointment";
            this.agenda_btn_erase_appointment.Size = new System.Drawing.Size(174, 67);
            this.agenda_btn_erase_appointment.TabIndex = 12;
            this.agenda_btn_erase_appointment.Text = "Borrar turno";
            this.agenda_btn_erase_appointment.UseVisualStyleBackColor = true;
            // 
            // agenda_btn_start_appointment
            // 
            this.agenda_btn_start_appointment.Location = new System.Drawing.Point(530, 262);
            this.agenda_btn_start_appointment.Margin = new System.Windows.Forms.Padding(6);
            this.agenda_btn_start_appointment.Name = "agenda_btn_start_appointment";
            this.agenda_btn_start_appointment.Size = new System.Drawing.Size(404, 60);
            this.agenda_btn_start_appointment.TabIndex = 11;
            this.agenda_btn_start_appointment.Text = "Iniciar Turno";
            this.agenda_btn_start_appointment.UseVisualStyleBackColor = true;
            // 
            // agenda_lbl_username
            // 
            this.agenda_lbl_username.AutoSize = true;
            this.agenda_lbl_username.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.agenda_lbl_username.Location = new System.Drawing.Point(-66, -30);
            this.agenda_lbl_username.Margin = new System.Windows.Forms.Padding(6, 0, 6, 0);
            this.agenda_lbl_username.Name = "agenda_lbl_username";
            this.agenda_lbl_username.Size = new System.Drawing.Size(254, 31);
            this.agenda_lbl_username.TabIndex = 10;
            this.agenda_lbl_username.Text = "Nombre del Usuario";
            // 
            // agenda_lbl_appointments
            // 
            this.agenda_lbl_appointments.AutoSize = true;
            this.agenda_lbl_appointments.Location = new System.Drawing.Point(525, 65);
            this.agenda_lbl_appointments.Margin = new System.Windows.Forms.Padding(6, 0, 6, 0);
            this.agenda_lbl_appointments.Name = "agenda_lbl_appointments";
            this.agenda_lbl_appointments.Size = new System.Drawing.Size(161, 25);
            this.agenda_lbl_appointments.TabIndex = 9;
            this.agenda_lbl_appointments.Text = "Tus turnos hoy:";
            // 
            // listBox1
            // 
            this.listBox1.FormattingEnabled = true;
            this.listBox1.ItemHeight = 25;
            this.listBox1.Location = new System.Drawing.Point(534, 96);
            this.listBox1.Margin = new System.Windows.Forms.Padding(6);
            this.listBox1.Name = "listBox1";
            this.listBox1.Size = new System.Drawing.Size(400, 154);
            this.listBox1.TabIndex = 8;
            // 
            // monthCalendar1
            // 
            this.monthCalendar1.Location = new System.Drawing.Point(27, 65);
            this.monthCalendar1.Margin = new System.Windows.Forms.Padding(18, 17, 18, 17);
            this.monthCalendar1.Name = "monthCalendar1";
            this.monthCalendar1.TabIndex = 7;
            // 
            // Turnos
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(12F, 25F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1285, 612);
            this.Controls.Add(this.agenda_btn_erase_appointment);
            this.Controls.Add(this.agenda_btn_start_appointment);
            this.Controls.Add(this.agenda_lbl_username);
            this.Controls.Add(this.agenda_lbl_appointments);
            this.Controls.Add(this.listBox1);
            this.Controls.Add(this.monthCalendar1);
            this.Name = "Turnos";
            this.Text = "Turnos";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button agenda_btn_erase_appointment;
        private System.Windows.Forms.Button agenda_btn_start_appointment;
        private System.Windows.Forms.Label agenda_lbl_username;
        private System.Windows.Forms.Label agenda_lbl_appointments;
        private System.Windows.Forms.ListBox listBox1;
        private System.Windows.Forms.MonthCalendar monthCalendar1;
    }
}