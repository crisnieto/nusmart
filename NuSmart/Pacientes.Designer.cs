namespace NuSmart
{
    partial class Pacientes
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Pacientes));
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.paciente_btn_turno = new System.Windows.Forms.Button();
            this.Pacientes_textbox_buscar = new System.Windows.Forms.TextBox();
            this.button1 = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            this.Pacientes_textbox_dni = new System.Windows.Forms.TextBox();
            this.Pacientes_textbox_nombre = new System.Windows.Forms.TextBox();
            this.Pacientes_textbox_apellido = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.Pacientes_textbox_telefono = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.Pacientes_textbox_email = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.Pacientes_combobox_sexo = new System.Windows.Forms.ComboBox();
            this.button3 = new System.Windows.Forms.Button();
            this.button4 = new System.Windows.Forms.Button();
            this.button5 = new System.Windows.Forms.Button();
            this.monthCalendar1 = new System.Windows.Forms.MonthCalendar();
            this.label7 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // dataGridView1
            // 
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(12, 257);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.Size = new System.Drawing.Size(728, 235);
            this.dataGridView1.TabIndex = 0;
            this.dataGridView1.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView1_CellContentClick);
            this.dataGridView1.SelectionChanged += new System.EventHandler(this.dataGridView1_SelectionChanged);
            // 
            // paciente_btn_turno
            // 
            this.paciente_btn_turno.Location = new System.Drawing.Point(656, 12);
            this.paciente_btn_turno.Name = "paciente_btn_turno";
            this.paciente_btn_turno.Size = new System.Drawing.Size(91, 36);
            this.paciente_btn_turno.TabIndex = 1;
            this.paciente_btn_turno.Text = "Crear Turno";
            this.paciente_btn_turno.UseVisualStyleBackColor = true;
            this.paciente_btn_turno.Click += new System.EventHandler(this.paciente_btn_turno_Click);
            // 
            // Pacientes_textbox_buscar
            // 
            this.Pacientes_textbox_buscar.Location = new System.Drawing.Point(12, 21);
            this.Pacientes_textbox_buscar.Name = "Pacientes_textbox_buscar";
            this.Pacientes_textbox_buscar.Size = new System.Drawing.Size(114, 20);
            this.Pacientes_textbox_buscar.TabIndex = 2;
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(132, 19);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(75, 23);
            this.button1.TabIndex = 3;
            this.button1.Text = "Buscar";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(656, 79);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(84, 43);
            this.button2.TabIndex = 4;
            this.button2.Text = "Agregar";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // Pacientes_textbox_dni
            // 
            this.Pacientes_textbox_dni.Location = new System.Drawing.Point(12, 79);
            this.Pacientes_textbox_dni.Name = "Pacientes_textbox_dni";
            this.Pacientes_textbox_dni.Size = new System.Drawing.Size(114, 20);
            this.Pacientes_textbox_dni.TabIndex = 5;
            // 
            // Pacientes_textbox_nombre
            // 
            this.Pacientes_textbox_nombre.Location = new System.Drawing.Point(12, 128);
            this.Pacientes_textbox_nombre.Name = "Pacientes_textbox_nombre";
            this.Pacientes_textbox_nombre.Size = new System.Drawing.Size(114, 20);
            this.Pacientes_textbox_nombre.TabIndex = 6;
            // 
            // Pacientes_textbox_apellido
            // 
            this.Pacientes_textbox_apellido.Location = new System.Drawing.Point(12, 180);
            this.Pacientes_textbox_apellido.Name = "Pacientes_textbox_apellido";
            this.Pacientes_textbox_apellido.Size = new System.Drawing.Size(114, 20);
            this.Pacientes_textbox_apellido.TabIndex = 7;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 63);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(26, 13);
            this.label1.TabIndex = 8;
            this.label1.Text = "DNI";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(12, 112);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(44, 13);
            this.label2.TabIndex = 9;
            this.label2.Text = "Nombre";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(12, 164);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(44, 13);
            this.label3.TabIndex = 10;
            this.label3.Text = "Apellido";
            this.label3.Click += new System.EventHandler(this.label3_Click);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(178, 66);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(49, 13);
            this.label4.TabIndex = 12;
            this.label4.Text = "Telefono";
            // 
            // Pacientes_textbox_telefono
            // 
            this.Pacientes_textbox_telefono.Location = new System.Drawing.Point(181, 82);
            this.Pacientes_textbox_telefono.Name = "Pacientes_textbox_telefono";
            this.Pacientes_textbox_telefono.Size = new System.Drawing.Size(114, 20);
            this.Pacientes_textbox_telefono.TabIndex = 11;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(178, 115);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(35, 13);
            this.label5.TabIndex = 14;
            this.label5.Text = "E-mail";
            // 
            // Pacientes_textbox_email
            // 
            this.Pacientes_textbox_email.Location = new System.Drawing.Point(181, 131);
            this.Pacientes_textbox_email.Name = "Pacientes_textbox_email";
            this.Pacientes_textbox_email.Size = new System.Drawing.Size(114, 20);
            this.Pacientes_textbox_email.TabIndex = 13;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(178, 167);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(31, 13);
            this.label6.TabIndex = 16;
            this.label6.Text = "Sexo";
            // 
            // Pacientes_combobox_sexo
            // 
            this.Pacientes_combobox_sexo.FormattingEnabled = true;
            this.Pacientes_combobox_sexo.Items.AddRange(new object[] {
            "M",
            "F"});
            this.Pacientes_combobox_sexo.Location = new System.Drawing.Point(181, 182);
            this.Pacientes_combobox_sexo.Name = "Pacientes_combobox_sexo";
            this.Pacientes_combobox_sexo.Size = new System.Drawing.Size(72, 21);
            this.Pacientes_combobox_sexo.TabIndex = 17;
            // 
            // button3
            // 
            this.button3.Location = new System.Drawing.Point(656, 149);
            this.button3.Name = "button3";
            this.button3.Size = new System.Drawing.Size(84, 43);
            this.button3.TabIndex = 18;
            this.button3.Text = "Modificar Seleccionado";
            this.button3.UseVisualStyleBackColor = true;
            this.button3.Click += new System.EventHandler(this.button3_Click);
            // 
            // button4
            // 
            this.button4.Location = new System.Drawing.Point(656, 198);
            this.button4.Name = "button4";
            this.button4.Size = new System.Drawing.Size(84, 43);
            this.button4.TabIndex = 19;
            this.button4.Text = "Eliminar Seleccionado";
            this.button4.UseVisualStyleBackColor = true;
            this.button4.Click += new System.EventHandler(this.button4_Click);
            // 
            // button5
            // 
            this.button5.Location = new System.Drawing.Point(213, 19);
            this.button5.Name = "button5";
            this.button5.Size = new System.Drawing.Size(82, 23);
            this.button5.TabIndex = 20;
            this.button5.Text = "Buscar Todos";
            this.button5.UseVisualStyleBackColor = true;
            this.button5.Click += new System.EventHandler(this.button5_Click);
            // 
            // monthCalendar1
            // 
            this.monthCalendar1.Location = new System.Drawing.Point(346, 79);
            this.monthCalendar1.Name = "monthCalendar1";
            this.monthCalendar1.TabIndex = 21;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(343, 66);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(93, 13);
            this.label7.TabIndex = 22;
            this.label7.Text = "Fecha Nacimiento";
            // 
            // Pacientes
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("$this.BackgroundImage")));
            this.ClientSize = new System.Drawing.Size(752, 504);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.monthCalendar1);
            this.Controls.Add(this.button5);
            this.Controls.Add(this.button4);
            this.Controls.Add(this.button3);
            this.Controls.Add(this.Pacientes_combobox_sexo);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.Pacientes_textbox_email);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.Pacientes_textbox_telefono);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.Pacientes_textbox_apellido);
            this.Controls.Add(this.Pacientes_textbox_nombre);
            this.Controls.Add(this.Pacientes_textbox_dni);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.Pacientes_textbox_buscar);
            this.Controls.Add(this.paciente_btn_turno);
            this.Controls.Add(this.dataGridView1);
            this.Name = "Pacientes";
            this.Text = "Pacientes";
            this.Load += new System.EventHandler(this.Pacientes_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.Button paciente_btn_turno;
        private System.Windows.Forms.TextBox Pacientes_textbox_buscar;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.TextBox Pacientes_textbox_dni;
        private System.Windows.Forms.TextBox Pacientes_textbox_nombre;
        private System.Windows.Forms.TextBox Pacientes_textbox_apellido;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox Pacientes_textbox_telefono;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox Pacientes_textbox_email;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.ComboBox Pacientes_combobox_sexo;
        private System.Windows.Forms.Button button3;
        private System.Windows.Forms.Button button4;
        private System.Windows.Forms.Button button5;
        private System.Windows.Forms.MonthCalendar monthCalendar1;
        private System.Windows.Forms.Label label7;
    }
}