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
            this.saveFileDialog1 = new System.Windows.Forms.SaveFileDialog();
            this.openFileDialog1 = new System.Windows.Forms.OpenFileDialog();
            this.BackupManager_label_titulo = new System.Windows.Forms.Label();
            this.BackupManager_button_restaurar = new System.Windows.Forms.Button();
            this.BackupManager_button_crear_backup = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // openFileDialog1
            // 
            this.openFileDialog1.FileName = "openFileDialog1";
            // 
            // BackupManager_label_titulo
            // 
            this.BackupManager_label_titulo.AutoSize = true;
            this.BackupManager_label_titulo.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.BackupManager_label_titulo.Location = new System.Drawing.Point(213, 9);
            this.BackupManager_label_titulo.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.BackupManager_label_titulo.Name = "BackupManager_label_titulo";
            this.BackupManager_label_titulo.Size = new System.Drawing.Size(169, 24);
            this.BackupManager_label_titulo.TabIndex = 11;
            this.BackupManager_label_titulo.Text = "Gestion de Backup";
            // 
            // BackupManager_button_restaurar
            // 
            this.BackupManager_button_restaurar.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.BackupManager_button_restaurar.Location = new System.Drawing.Point(398, 103);
            this.BackupManager_button_restaurar.Margin = new System.Windows.Forms.Padding(2);
            this.BackupManager_button_restaurar.Name = "BackupManager_button_restaurar";
            this.BackupManager_button_restaurar.Size = new System.Drawing.Size(182, 110);
            this.BackupManager_button_restaurar.TabIndex = 10;
            this.BackupManager_button_restaurar.Text = "Restaurar Base de Datos";
            this.BackupManager_button_restaurar.UseVisualStyleBackColor = true;
            this.BackupManager_button_restaurar.Click += new System.EventHandler(this.backup_btn_restaurar_Click);
            // 
            // BackupManager_button_crear_backup
            // 
            this.BackupManager_button_crear_backup.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.BackupManager_button_crear_backup.Location = new System.Drawing.Point(11, 103);
            this.BackupManager_button_crear_backup.Margin = new System.Windows.Forms.Padding(2);
            this.BackupManager_button_crear_backup.Name = "BackupManager_button_crear_backup";
            this.BackupManager_button_crear_backup.Size = new System.Drawing.Size(182, 110);
            this.BackupManager_button_crear_backup.TabIndex = 9;
            this.BackupManager_button_crear_backup.Text = "Crear Backup";
            this.BackupManager_button_crear_backup.UseVisualStyleBackColor = true;
            this.BackupManager_button_crear_backup.Click += new System.EventHandler(this.backup_btn_crear_Click);
            // 
            // BackupManager
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("$this.BackgroundImage")));
            this.ClientSize = new System.Drawing.Size(591, 294);
            this.Controls.Add(this.BackupManager_label_titulo);
            this.Controls.Add(this.BackupManager_button_restaurar);
            this.Controls.Add(this.BackupManager_button_crear_backup);
            this.Name = "BackupManager";
            this.Text = "BackupManager";
            this.Load += new System.EventHandler(this.BackupManager_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label BackupManager_label_titulo;
        private System.Windows.Forms.Button BackupManager_button_restaurar;
        private System.Windows.Forms.Button BackupManager_button_crear_backup;
        private System.Windows.Forms.SaveFileDialog saveFileDialog1;
        private System.Windows.Forms.OpenFileDialog openFileDialog1;
    }
}