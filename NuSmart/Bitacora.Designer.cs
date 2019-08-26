namespace NuSmart
{
    partial class Bitacora
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
            this.bitacora_lbl_usuarios = new System.Windows.Forms.Label();
            this.bitacora_btn_buscar = new System.Windows.Forms.Button();
            this.listBox1 = new System.Windows.Forms.ListBox();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // dataGridView1
            // 
            this.dataGridView1.AllowUserToOrderColumns = true;
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(4, 144);
            this.dataGridView1.Margin = new System.Windows.Forms.Padding(2);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.RowTemplate.Height = 33;
            this.dataGridView1.Size = new System.Drawing.Size(598, 171);
            this.dataGridView1.TabIndex = 8;
            this.dataGridView1.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView1_CellContentClick);
            // 
            // bitacora_lbl_usuarios
            // 
            this.bitacora_lbl_usuarios.AutoSize = true;
            this.bitacora_lbl_usuarios.Location = new System.Drawing.Point(2, 15);
            this.bitacora_lbl_usuarios.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.bitacora_lbl_usuarios.Name = "bitacora_lbl_usuarios";
            this.bitacora_lbl_usuarios.Size = new System.Drawing.Size(43, 13);
            this.bitacora_lbl_usuarios.TabIndex = 7;
            this.bitacora_lbl_usuarios.Text = "Usuario";
            // 
            // bitacora_btn_buscar
            // 
            this.bitacora_btn_buscar.Location = new System.Drawing.Point(498, 30);
            this.bitacora_btn_buscar.Margin = new System.Windows.Forms.Padding(2);
            this.bitacora_btn_buscar.Name = "bitacora_btn_buscar";
            this.bitacora_btn_buscar.Size = new System.Drawing.Size(100, 93);
            this.bitacora_btn_buscar.TabIndex = 6;
            this.bitacora_btn_buscar.Text = "Buscar Eventos";
            this.bitacora_btn_buscar.UseVisualStyleBackColor = true;
            this.bitacora_btn_buscar.Click += new System.EventHandler(this.bitacora_btn_buscar_Click);
            // 
            // listBox1
            // 
            this.listBox1.FormattingEnabled = true;
            this.listBox1.Location = new System.Drawing.Point(4, 30);
            this.listBox1.Margin = new System.Windows.Forms.Padding(2);
            this.listBox1.Name = "listBox1";
            this.listBox1.Size = new System.Drawing.Size(242, 95);
            this.listBox1.TabIndex = 5;
            // 
            // Bitacora
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(605, 331);
            this.Controls.Add(this.dataGridView1);
            this.Controls.Add(this.bitacora_lbl_usuarios);
            this.Controls.Add(this.bitacora_btn_buscar);
            this.Controls.Add(this.listBox1);
            this.Name = "Bitacora";
            this.Text = "Bitacora";
            this.Load += new System.EventHandler(this.Bitacora_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.Label bitacora_lbl_usuarios;
        private System.Windows.Forms.Button bitacora_btn_buscar;
        private System.Windows.Forms.ListBox listBox1;
    }
}