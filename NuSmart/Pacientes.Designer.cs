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
            this.Pacientes_button_crear_turno = new System.Windows.Forms.Button();
            this.Pacientes_textbox_buscar = new System.Windows.Forms.TextBox();
            this.Pacientes_button_buscar = new System.Windows.Forms.Button();
            this.Pacientes_button_agregar = new System.Windows.Forms.Button();
            this.Pacientes_textbox_dni = new System.Windows.Forms.TextBox();
            this.Pacientes_textbox_nombre = new System.Windows.Forms.TextBox();
            this.Pacientes_textbox_apellido = new System.Windows.Forms.TextBox();
            this.Pacientes_label_dni = new System.Windows.Forms.Label();
            this.Pacientes_label_nombre = new System.Windows.Forms.Label();
            this.Pacientes_label_apellido = new System.Windows.Forms.Label();
            this.Pacientes_label_telefono = new System.Windows.Forms.Label();
            this.Pacientes_textbox_telefono = new System.Windows.Forms.TextBox();
            this.Pacientes_label_email = new System.Windows.Forms.Label();
            this.Pacientes_textbox_email = new System.Windows.Forms.TextBox();
            this.Pacientes_label_sexo = new System.Windows.Forms.Label();
            this.Pacientes_combobox_sexo = new System.Windows.Forms.ComboBox();
            this.Pacientes_button_modificar = new System.Windows.Forms.Button();
            this.Pacientes_button_eliminar = new System.Windows.Forms.Button();
            this.Pacientes_button_buscar_todos = new System.Windows.Forms.Button();
            this.monthCalendar1 = new System.Windows.Forms.MonthCalendar();
            this.Pacientes_label_fecha = new System.Windows.Forms.Label();
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
            // Pacientes_button_crear_turno
            // 
            this.Pacientes_button_crear_turno.Location = new System.Drawing.Point(593, 12);
            this.Pacientes_button_crear_turno.Name = "Pacientes_button_crear_turno";
            this.Pacientes_button_crear_turno.Size = new System.Drawing.Size(147, 61);
            this.Pacientes_button_crear_turno.TabIndex = 1;
            this.Pacientes_button_crear_turno.Text = "Crear Turno para Paciente Seleccionado";
            this.Pacientes_button_crear_turno.UseVisualStyleBackColor = true;
            this.Pacientes_button_crear_turno.Click += new System.EventHandler(this.paciente_btn_turno_Click);
            // 
            // Pacientes_textbox_buscar
            // 
            this.Pacientes_textbox_buscar.Location = new System.Drawing.Point(12, 21);
            this.Pacientes_textbox_buscar.Name = "Pacientes_textbox_buscar";
            this.Pacientes_textbox_buscar.Size = new System.Drawing.Size(114, 20);
            this.Pacientes_textbox_buscar.TabIndex = 2;
            // 
            // Pacientes_button_buscar
            // 
            this.Pacientes_button_buscar.Location = new System.Drawing.Point(132, 19);
            this.Pacientes_button_buscar.Name = "Pacientes_button_buscar";
            this.Pacientes_button_buscar.Size = new System.Drawing.Size(75, 23);
            this.Pacientes_button_buscar.TabIndex = 3;
            this.Pacientes_button_buscar.Text = "Buscar";
            this.Pacientes_button_buscar.UseVisualStyleBackColor = true;
            this.Pacientes_button_buscar.Click += new System.EventHandler(this.button1_Click);
            // 
            // Pacientes_button_agregar
            // 
            this.Pacientes_button_agregar.Location = new System.Drawing.Point(656, 79);
            this.Pacientes_button_agregar.Name = "Pacientes_button_agregar";
            this.Pacientes_button_agregar.Size = new System.Drawing.Size(84, 43);
            this.Pacientes_button_agregar.TabIndex = 4;
            this.Pacientes_button_agregar.Text = "Agregar";
            this.Pacientes_button_agregar.UseVisualStyleBackColor = true;
            this.Pacientes_button_agregar.Click += new System.EventHandler(this.button2_Click);
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
            // Pacientes_label_dni
            // 
            this.Pacientes_label_dni.AutoSize = true;
            this.Pacientes_label_dni.Location = new System.Drawing.Point(12, 63);
            this.Pacientes_label_dni.Name = "Pacientes_label_dni";
            this.Pacientes_label_dni.Size = new System.Drawing.Size(26, 13);
            this.Pacientes_label_dni.TabIndex = 8;
            this.Pacientes_label_dni.Text = "DNI";
            // 
            // Pacientes_label_nombre
            // 
            this.Pacientes_label_nombre.AutoSize = true;
            this.Pacientes_label_nombre.Location = new System.Drawing.Point(12, 112);
            this.Pacientes_label_nombre.Name = "Pacientes_label_nombre";
            this.Pacientes_label_nombre.Size = new System.Drawing.Size(44, 13);
            this.Pacientes_label_nombre.TabIndex = 9;
            this.Pacientes_label_nombre.Text = "Nombre";
            // 
            // Pacientes_label_apellido
            // 
            this.Pacientes_label_apellido.AutoSize = true;
            this.Pacientes_label_apellido.Location = new System.Drawing.Point(12, 164);
            this.Pacientes_label_apellido.Name = "Pacientes_label_apellido";
            this.Pacientes_label_apellido.Size = new System.Drawing.Size(44, 13);
            this.Pacientes_label_apellido.TabIndex = 10;
            this.Pacientes_label_apellido.Text = "Apellido";
            this.Pacientes_label_apellido.Click += new System.EventHandler(this.label3_Click);
            // 
            // Pacientes_label_telefono
            // 
            this.Pacientes_label_telefono.AutoSize = true;
            this.Pacientes_label_telefono.Location = new System.Drawing.Point(178, 66);
            this.Pacientes_label_telefono.Name = "Pacientes_label_telefono";
            this.Pacientes_label_telefono.Size = new System.Drawing.Size(49, 13);
            this.Pacientes_label_telefono.TabIndex = 12;
            this.Pacientes_label_telefono.Text = "Telefono";
            // 
            // Pacientes_textbox_telefono
            // 
            this.Pacientes_textbox_telefono.Location = new System.Drawing.Point(181, 82);
            this.Pacientes_textbox_telefono.Name = "Pacientes_textbox_telefono";
            this.Pacientes_textbox_telefono.Size = new System.Drawing.Size(114, 20);
            this.Pacientes_textbox_telefono.TabIndex = 11;
            // 
            // Pacientes_label_email
            // 
            this.Pacientes_label_email.AutoSize = true;
            this.Pacientes_label_email.Location = new System.Drawing.Point(178, 115);
            this.Pacientes_label_email.Name = "Pacientes_label_email";
            this.Pacientes_label_email.Size = new System.Drawing.Size(35, 13);
            this.Pacientes_label_email.TabIndex = 14;
            this.Pacientes_label_email.Text = "E-mail";
            // 
            // Pacientes_textbox_email
            // 
            this.Pacientes_textbox_email.Location = new System.Drawing.Point(181, 131);
            this.Pacientes_textbox_email.Name = "Pacientes_textbox_email";
            this.Pacientes_textbox_email.Size = new System.Drawing.Size(114, 20);
            this.Pacientes_textbox_email.TabIndex = 13;
            // 
            // Pacientes_label_sexo
            // 
            this.Pacientes_label_sexo.AutoSize = true;
            this.Pacientes_label_sexo.Location = new System.Drawing.Point(178, 167);
            this.Pacientes_label_sexo.Name = "Pacientes_label_sexo";
            this.Pacientes_label_sexo.Size = new System.Drawing.Size(31, 13);
            this.Pacientes_label_sexo.TabIndex = 16;
            this.Pacientes_label_sexo.Text = "Sexo";
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
            // Pacientes_button_modificar
            // 
            this.Pacientes_button_modificar.Location = new System.Drawing.Point(656, 149);
            this.Pacientes_button_modificar.Name = "Pacientes_button_modificar";
            this.Pacientes_button_modificar.Size = new System.Drawing.Size(84, 43);
            this.Pacientes_button_modificar.TabIndex = 18;
            this.Pacientes_button_modificar.Text = "Modificar Seleccionado";
            this.Pacientes_button_modificar.UseVisualStyleBackColor = true;
            this.Pacientes_button_modificar.Click += new System.EventHandler(this.button3_Click);
            // 
            // Pacientes_button_eliminar
            // 
            this.Pacientes_button_eliminar.Location = new System.Drawing.Point(656, 198);
            this.Pacientes_button_eliminar.Name = "Pacientes_button_eliminar";
            this.Pacientes_button_eliminar.Size = new System.Drawing.Size(84, 43);
            this.Pacientes_button_eliminar.TabIndex = 19;
            this.Pacientes_button_eliminar.Text = "Eliminar Seleccionado";
            this.Pacientes_button_eliminar.UseVisualStyleBackColor = true;
            this.Pacientes_button_eliminar.Visible = false;
            this.Pacientes_button_eliminar.Click += new System.EventHandler(this.button4_Click);
            // 
            // Pacientes_button_buscar_todos
            // 
            this.Pacientes_button_buscar_todos.Location = new System.Drawing.Point(213, 19);
            this.Pacientes_button_buscar_todos.Name = "Pacientes_button_buscar_todos";
            this.Pacientes_button_buscar_todos.Size = new System.Drawing.Size(82, 23);
            this.Pacientes_button_buscar_todos.TabIndex = 20;
            this.Pacientes_button_buscar_todos.Text = "Buscar Todos";
            this.Pacientes_button_buscar_todos.UseVisualStyleBackColor = true;
            this.Pacientes_button_buscar_todos.Click += new System.EventHandler(this.button5_Click);
            // 
            // monthCalendar1
            // 
            this.monthCalendar1.Location = new System.Drawing.Point(346, 79);
            this.monthCalendar1.Name = "monthCalendar1";
            this.monthCalendar1.TabIndex = 21;
            // 
            // Pacientes_label_fecha
            // 
            this.Pacientes_label_fecha.AutoSize = true;
            this.Pacientes_label_fecha.Location = new System.Drawing.Point(343, 66);
            this.Pacientes_label_fecha.Name = "Pacientes_label_fecha";
            this.Pacientes_label_fecha.Size = new System.Drawing.Size(93, 13);
            this.Pacientes_label_fecha.TabIndex = 22;
            this.Pacientes_label_fecha.Text = "Fecha Nacimiento";
            // 
            // Pacientes
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("$this.BackgroundImage")));
            this.ClientSize = new System.Drawing.Size(752, 504);
            this.Controls.Add(this.Pacientes_label_fecha);
            this.Controls.Add(this.monthCalendar1);
            this.Controls.Add(this.Pacientes_button_buscar_todos);
            this.Controls.Add(this.Pacientes_button_eliminar);
            this.Controls.Add(this.Pacientes_button_modificar);
            this.Controls.Add(this.Pacientes_combobox_sexo);
            this.Controls.Add(this.Pacientes_label_sexo);
            this.Controls.Add(this.Pacientes_label_email);
            this.Controls.Add(this.Pacientes_textbox_email);
            this.Controls.Add(this.Pacientes_label_telefono);
            this.Controls.Add(this.Pacientes_textbox_telefono);
            this.Controls.Add(this.Pacientes_label_apellido);
            this.Controls.Add(this.Pacientes_label_nombre);
            this.Controls.Add(this.Pacientes_label_dni);
            this.Controls.Add(this.Pacientes_textbox_apellido);
            this.Controls.Add(this.Pacientes_textbox_nombre);
            this.Controls.Add(this.Pacientes_textbox_dni);
            this.Controls.Add(this.Pacientes_button_agregar);
            this.Controls.Add(this.Pacientes_button_buscar);
            this.Controls.Add(this.Pacientes_textbox_buscar);
            this.Controls.Add(this.Pacientes_button_crear_turno);
            this.Controls.Add(this.dataGridView1);
            this.Name = "Pacientes";
            this.Load += new System.EventHandler(this.Pacientes_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.Button Pacientes_button_crear_turno;
        private System.Windows.Forms.TextBox Pacientes_textbox_buscar;
        private System.Windows.Forms.Button Pacientes_button_buscar;
        private System.Windows.Forms.Button Pacientes_button_agregar;
        private System.Windows.Forms.TextBox Pacientes_textbox_dni;
        private System.Windows.Forms.TextBox Pacientes_textbox_nombre;
        private System.Windows.Forms.TextBox Pacientes_textbox_apellido;
        private System.Windows.Forms.Label Pacientes_label_dni;
        private System.Windows.Forms.Label Pacientes_label_nombre;
        private System.Windows.Forms.Label Pacientes_label_apellido;
        private System.Windows.Forms.Label Pacientes_label_telefono;
        private System.Windows.Forms.TextBox Pacientes_textbox_telefono;
        private System.Windows.Forms.Label Pacientes_label_email;
        private System.Windows.Forms.TextBox Pacientes_textbox_email;
        private System.Windows.Forms.Label Pacientes_label_sexo;
        private System.Windows.Forms.ComboBox Pacientes_combobox_sexo;
        private System.Windows.Forms.Button Pacientes_button_modificar;
        private System.Windows.Forms.Button Pacientes_button_eliminar;
        private System.Windows.Forms.Button Pacientes_button_buscar_todos;
        private System.Windows.Forms.MonthCalendar monthCalendar1;
        private System.Windows.Forms.Label Pacientes_label_fecha;
    }
}