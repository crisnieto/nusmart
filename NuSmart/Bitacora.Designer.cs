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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Bitacora));
            this.listBox1 = new System.Windows.Forms.ListBox();
            this.bitacora_btn_buscar = new System.Windows.Forms.Button();
            this.bitacora_lbl_usuarios = new System.Windows.Forms.Label();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // listBox1
            // 
            this.listBox1.FormattingEnabled = true;
            this.listBox1.ItemHeight = 25;
            this.listBox1.Location = new System.Drawing.Point(17, 55);
            this.listBox1.Name = "listBox1";
            this.listBox1.Size = new System.Drawing.Size(480, 179);
            this.listBox1.TabIndex = 0;
            this.listBox1.SelectedIndexChanged += new System.EventHandler(this.listBox1_SelectedIndexChanged);
            // 
            // bitacora_btn_buscar
            // 
            this.bitacora_btn_buscar.Location = new System.Drawing.Point(1004, 55);
            this.bitacora_btn_buscar.Name = "bitacora_btn_buscar";
            this.bitacora_btn_buscar.Size = new System.Drawing.Size(199, 179);
            this.bitacora_btn_buscar.TabIndex = 1;
            this.bitacora_btn_buscar.Text = "Buscar Eventos";
            this.bitacora_btn_buscar.UseVisualStyleBackColor = true;
            this.bitacora_btn_buscar.Click += new System.EventHandler(this.button1_Click);
            // 
            // bitacora_lbl_usuarios
            // 
            this.bitacora_lbl_usuarios.AutoSize = true;
            this.bitacora_lbl_usuarios.Location = new System.Drawing.Point(12, 27);
            this.bitacora_lbl_usuarios.Name = "bitacora_lbl_usuarios";
            this.bitacora_lbl_usuarios.Size = new System.Drawing.Size(86, 25);
            this.bitacora_lbl_usuarios.TabIndex = 3;
            this.bitacora_lbl_usuarios.Text = "Usuario";
            // 
            // dataGridView1
            // 
            this.dataGridView1.AllowUserToOrderColumns = true;
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(17, 275);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.RowTemplate.Height = 33;
            this.dataGridView1.Size = new System.Drawing.Size(1196, 328);
            this.dataGridView1.TabIndex = 4;
            this.dataGridView1.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView1_CellContentClick);
            // 
            // Bitacora
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(12F, 25F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("$this.BackgroundImage")));
            this.ClientSize = new System.Drawing.Size(1225, 615);
            this.Controls.Add(this.dataGridView1);
            this.Controls.Add(this.bitacora_lbl_usuarios);
            this.Controls.Add(this.bitacora_btn_buscar);
            this.Controls.Add(this.listBox1);
            this.Name = "Bitacora";
            this.Load += new System.EventHandler(this.Bitacora_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ListBox listBox1;
        private System.Windows.Forms.Button bitacora_btn_buscar;
        private System.Windows.Forms.Label bitacora_lbl_usuarios;
        private System.Windows.Forms.DataGridView dataGridView1;
    }
}