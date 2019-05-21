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
            this.backup_btn_crear = new System.Windows.Forms.Button();
            this.folderBrowserDialog1 = new System.Windows.Forms.FolderBrowserDialog();
            this.saveFileDialog1 = new System.Windows.Forms.SaveFileDialog();
            this.backup_btn_restaurar = new System.Windows.Forms.Button();
            this.openFileDialog1 = new System.Windows.Forms.OpenFileDialog();
            this.backup_lbl_title = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // backup_btn_crear
            // 
            this.backup_btn_crear.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.backup_btn_crear.Location = new System.Drawing.Point(12, 240);
            this.backup_btn_crear.Name = "backup_btn_crear";
            this.backup_btn_crear.Size = new System.Drawing.Size(363, 212);
            this.backup_btn_crear.TabIndex = 6;
            this.backup_btn_crear.Text = "Crear Backup";
            this.backup_btn_crear.UseVisualStyleBackColor = true;
            this.backup_btn_crear.Click += new System.EventHandler(this.button2_Click);
            // 
            // backup_btn_restaurar
            // 
            this.backup_btn_restaurar.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.backup_btn_restaurar.Location = new System.Drawing.Point(838, 240);
            this.backup_btn_restaurar.Name = "backup_btn_restaurar";
            this.backup_btn_restaurar.Size = new System.Drawing.Size(363, 212);
            this.backup_btn_restaurar.TabIndex = 7;
            this.backup_btn_restaurar.Text = "Restaurar Base de Datos";
            this.backup_btn_restaurar.UseVisualStyleBackColor = true;
            this.backup_btn_restaurar.Click += new System.EventHandler(this.button3_Click);
            // 
            // openFileDialog1
            // 
            this.openFileDialog1.FileName = "openFileDialog1";
            // 
            // backup_lbl_title
            // 
            this.backup_lbl_title.AutoSize = true;
            this.backup_lbl_title.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.backup_lbl_title.Location = new System.Drawing.Point(456, 9);
            this.backup_lbl_title.Name = "backup_lbl_title";
            this.backup_lbl_title.Size = new System.Drawing.Size(340, 44);
            this.backup_lbl_title.TabIndex = 8;
            this.backup_lbl_title.Text = "Gestion de Backup";
            this.backup_lbl_title.Click += new System.EventHandler(this.label1_Click);
            // 
            // BackupManager
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(12F, 25F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("$this.BackgroundImage")));
            this.ClientSize = new System.Drawing.Size(1213, 607);
            this.Controls.Add(this.backup_lbl_title);
            this.Controls.Add(this.backup_btn_restaurar);
            this.Controls.Add(this.backup_btn_crear);
            this.Name = "BackupManager";
            this.Text = "BackupManager";
            this.Load += new System.EventHandler(this.BackupManager_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.Button backup_btn_crear;
        private System.Windows.Forms.FolderBrowserDialog folderBrowserDialog1;
        private System.Windows.Forms.SaveFileDialog saveFileDialog1;
        private System.Windows.Forms.Button backup_btn_restaurar;
        private System.Windows.Forms.OpenFileDialog openFileDialog1;
        private System.Windows.Forms.Label backup_lbl_title;
    }
}