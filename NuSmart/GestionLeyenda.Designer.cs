namespace NuSmart
{
    partial class GestionLeyenda
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
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.dataGridView2 = new System.Windows.Forms.DataGridView();
            this.gestion_leyenda_btn_guardar_leyenda = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            this.button3 = new System.Windows.Forms.Button();
            this.gestion_leyendas_lbl_idioma_seleccionado = new System.Windows.Forms.Label();
            this.gestion_leyendas_txt_idioma_seleccionado = new System.Windows.Forms.TextBox();
            this.gestion_leyendas_txt_leyenda_seleccionada = new System.Windows.Forms.TextBox();
            this.gestion_leyenda_lbl_leyenda_seleccionada = new System.Windows.Forms.Label();
            this.gestion_leyenda_lbl_texto = new System.Windows.Forms.Label();
            this.gestion_leyenda_txt_texto = new System.Windows.Forms.TextBox();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView2)).BeginInit();
            this.SuspendLayout();
            // 
            // dataGridView1
            // 
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(12, 36);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.RowTemplate.Height = 33;
            this.dataGridView1.Size = new System.Drawing.Size(1012, 175);
            this.dataGridView1.TabIndex = 0;
            this.dataGridView1.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView1_CellContentClick);
            this.dataGridView1.SelectionChanged += new System.EventHandler(this.dataGridView1_SelectionChanged);
            // 
            // dataGridView2
            // 
            this.dataGridView2.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView2.Location = new System.Drawing.Point(12, 263);
            this.dataGridView2.Name = "dataGridView2";
            this.dataGridView2.RowTemplate.Height = 33;
            this.dataGridView2.Size = new System.Drawing.Size(588, 529);
            this.dataGridView2.TabIndex = 1;
            this.dataGridView2.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView2_CellContentClick);
            this.dataGridView2.SelectionChanged += new System.EventHandler(this.dataGridView2_SelectionChanged);
            // 
            // gestion_leyenda_btn_guardar_leyenda
            // 
            this.gestion_leyenda_btn_guardar_leyenda.Location = new System.Drawing.Point(611, 698);
            this.gestion_leyenda_btn_guardar_leyenda.Name = "gestion_leyenda_btn_guardar_leyenda";
            this.gestion_leyenda_btn_guardar_leyenda.Size = new System.Drawing.Size(116, 94);
            this.gestion_leyenda_btn_guardar_leyenda.TabIndex = 2;
            this.gestion_leyenda_btn_guardar_leyenda.Text = "Guardar Etiqueta";
            this.gestion_leyenda_btn_guardar_leyenda.UseVisualStyleBackColor = true;
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(786, 698);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(116, 94);
            this.button2.TabIndex = 3;
            this.button2.Text = "Modificar Etiqueta";
            this.button2.UseVisualStyleBackColor = true;
            // 
            // button3
            // 
            this.button3.Location = new System.Drawing.Point(908, 698);
            this.button3.Name = "button3";
            this.button3.Size = new System.Drawing.Size(116, 94);
            this.button3.TabIndex = 4;
            this.button3.Text = "Eliminar Etiqueta";
            this.button3.UseVisualStyleBackColor = true;
            // 
            // gestion_leyendas_lbl_idioma_seleccionado
            // 
            this.gestion_leyendas_lbl_idioma_seleccionado.AutoSize = true;
            this.gestion_leyendas_lbl_idioma_seleccionado.Location = new System.Drawing.Point(606, 287);
            this.gestion_leyendas_lbl_idioma_seleccionado.Name = "gestion_leyendas_lbl_idioma_seleccionado";
            this.gestion_leyendas_lbl_idioma_seleccionado.Size = new System.Drawing.Size(217, 25);
            this.gestion_leyendas_lbl_idioma_seleccionado.TabIndex = 5;
            this.gestion_leyendas_lbl_idioma_seleccionado.Text = "Idioma Seleccionado:";
            // 
            // gestion_leyendas_txt_idioma_seleccionado
            // 
            this.gestion_leyendas_txt_idioma_seleccionado.Enabled = false;
            this.gestion_leyendas_txt_idioma_seleccionado.Location = new System.Drawing.Point(611, 315);
            this.gestion_leyendas_txt_idioma_seleccionado.Name = "gestion_leyendas_txt_idioma_seleccionado";
            this.gestion_leyendas_txt_idioma_seleccionado.Size = new System.Drawing.Size(346, 31);
            this.gestion_leyendas_txt_idioma_seleccionado.TabIndex = 6;
            this.gestion_leyendas_txt_idioma_seleccionado.TextChanged += new System.EventHandler(this.textBox1_TextChanged);
            // 
            // gestion_leyendas_txt_leyenda_seleccionada
            // 
            this.gestion_leyendas_txt_leyenda_seleccionada.Location = new System.Drawing.Point(611, 431);
            this.gestion_leyendas_txt_leyenda_seleccionada.Name = "gestion_leyendas_txt_leyenda_seleccionada";
            this.gestion_leyendas_txt_leyenda_seleccionada.Size = new System.Drawing.Size(346, 31);
            this.gestion_leyendas_txt_leyenda_seleccionada.TabIndex = 8;
            // 
            // gestion_leyenda_lbl_leyenda_seleccionada
            // 
            this.gestion_leyenda_lbl_leyenda_seleccionada.AutoSize = true;
            this.gestion_leyenda_lbl_leyenda_seleccionada.Location = new System.Drawing.Point(611, 403);
            this.gestion_leyenda_lbl_leyenda_seleccionada.Name = "gestion_leyenda_lbl_leyenda_seleccionada";
            this.gestion_leyenda_lbl_leyenda_seleccionada.Size = new System.Drawing.Size(237, 25);
            this.gestion_leyenda_lbl_leyenda_seleccionada.TabIndex = 7;
            this.gestion_leyenda_lbl_leyenda_seleccionada.Text = "Leyenda Seleccionado:";
            // 
            // gestion_leyenda_lbl_texto
            // 
            this.gestion_leyenda_lbl_texto.AutoSize = true;
            this.gestion_leyenda_lbl_texto.Location = new System.Drawing.Point(611, 503);
            this.gestion_leyenda_lbl_texto.Name = "gestion_leyenda_lbl_texto";
            this.gestion_leyenda_lbl_texto.Size = new System.Drawing.Size(66, 25);
            this.gestion_leyenda_lbl_texto.TabIndex = 9;
            this.gestion_leyenda_lbl_texto.Text = "Texto";
            // 
            // gestion_leyenda_txt_texto
            // 
            this.gestion_leyenda_txt_texto.Location = new System.Drawing.Point(611, 531);
            this.gestion_leyenda_txt_texto.Name = "gestion_leyenda_txt_texto";
            this.gestion_leyenda_txt_texto.Size = new System.Drawing.Size(346, 31);
            this.gestion_leyenda_txt_texto.TabIndex = 10;
            // 
            // GestionLeyenda
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(12F, 25F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1036, 804);
            this.Controls.Add(this.gestion_leyenda_txt_texto);
            this.Controls.Add(this.gestion_leyenda_lbl_texto);
            this.Controls.Add(this.gestion_leyendas_txt_leyenda_seleccionada);
            this.Controls.Add(this.gestion_leyenda_lbl_leyenda_seleccionada);
            this.Controls.Add(this.gestion_leyendas_txt_idioma_seleccionado);
            this.Controls.Add(this.gestion_leyendas_lbl_idioma_seleccionado);
            this.Controls.Add(this.button3);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.gestion_leyenda_btn_guardar_leyenda);
            this.Controls.Add(this.dataGridView2);
            this.Controls.Add(this.dataGridView1);
            this.Name = "GestionLeyenda";
            this.Text = "GestionLeyenda";
            this.Load += new System.EventHandler(this.GestionLeyenda_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView2)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.DataGridView dataGridView2;
        private System.Windows.Forms.Button gestion_leyenda_btn_guardar_leyenda;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Button button3;
        private System.Windows.Forms.Label gestion_leyendas_lbl_idioma_seleccionado;
        private System.Windows.Forms.TextBox gestion_leyendas_txt_idioma_seleccionado;
        private System.Windows.Forms.TextBox gestion_leyendas_txt_leyenda_seleccionada;
        private System.Windows.Forms.Label gestion_leyenda_lbl_leyenda_seleccionada;
        private System.Windows.Forms.Label gestion_leyenda_lbl_texto;
        private System.Windows.Forms.TextBox gestion_leyenda_txt_texto;
    }
}