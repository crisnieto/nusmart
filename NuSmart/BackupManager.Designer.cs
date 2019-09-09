namespace NuSmart
{
    partial class BackupManager
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(BackupManager));
            this.backup_lbl_title = new System.Windows.Forms.Label();
            this.backup_btn_restaurar = new System.Windows.Forms.Button();
            this.backup_btn_crear = new System.Windows.Forms.Button();
            this.saveFileDialog1 = new System.Windows.Forms.SaveFileDialog();
            this.openFileDialog1 = new System.Windows.Forms.OpenFileDialog();
            this.SuspendLayout();
            // 
            // backup_lbl_title
            // 
            this.backup_lbl_title.AutoSize = true;
            this.backup_lbl_title.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.backup_lbl_title.Location = new System.Drawing.Point(213, 9);
            this.backup_lbl_title.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.backup_lbl_title.Name = "backup_lbl_title";
            this.backup_lbl_title.Size = new System.Drawing.Size(169, 24);
            this.backup_lbl_title.TabIndex = 11;
            this.backup_lbl_title.Text = "Gestion de Backup";
            // 
            // backup_btn_restaurar
            // 
            this.backup_btn_restaurar.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.backup_btn_restaurar.Location = new System.Drawing.Point(398, 103);
            this.backup_btn_restaurar.Margin = new System.Windows.Forms.Padding(2);
            this.backup_btn_restaurar.Name = "backup_btn_restaurar";
            this.backup_btn_restaurar.Size = new System.Drawing.Size(182, 110);
            this.backup_btn_restaurar.TabIndex = 10;
            this.backup_btn_restaurar.Text = "Restaurar Base de Datos";
            this.backup_btn_restaurar.UseVisualStyleBackColor = true;
            this.backup_btn_restaurar.Click += new System.EventHandler(this.backup_btn_restaurar_Click);
            // 
            // backup_btn_crear
            // 
            this.backup_btn_crear.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.backup_btn_crear.Location = new System.Drawing.Point(11, 103);
            this.backup_btn_crear.Margin = new System.Windows.Forms.Padding(2);
            this.backup_btn_crear.Name = "backup_btn_crear";
            this.backup_btn_crear.Size = new System.Drawing.Size(182, 110);
            this.backup_btn_crear.TabIndex = 9;
            this.backup_btn_crear.Text = "Crear Backup";
            this.backup_btn_crear.UseVisualStyleBackColor = true;
            this.backup_btn_crear.Click += new System.EventHandler(this.backup_btn_crear_Click);
            // 
            // openFileDialog1
            // 
            this.openFileDialog1.FileName = "openFileDialog1";
            // 
            // BackupManager
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("$this.BackgroundImage")));
            this.ClientSize = new System.Drawing.Size(591, 294);
            this.Controls.Add(this.backup_lbl_title);
            this.Controls.Add(this.backup_btn_restaurar);
            this.Controls.Add(this.backup_btn_crear);
            this.Name = "BackupManager";
            this.Text = "BackupManager";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label backup_lbl_title;
        private System.Windows.Forms.Button backup_btn_restaurar;
        private System.Windows.Forms.Button backup_btn_crear;
        private System.Windows.Forms.SaveFileDialog saveFileDialog1;
        private System.Windows.Forms.OpenFileDialog openFileDialog1;
    }
}