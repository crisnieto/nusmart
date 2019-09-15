using System;

namespace NuSmart
{
    partial class Login
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Login));
            this.Login_button_login = new System.Windows.Forms.Button();
            this.Login_label_password = new System.Windows.Forms.Label();
            this.Login_label_usuario = new System.Windows.Forms.Label();
            this.txtPassword = new System.Windows.Forms.MaskedTextBox();
            this.txtUsuario = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // Login_button_login
            // 
            this.Login_button_login.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.125F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Login_button_login.Location = new System.Drawing.Point(261, 279);
            this.Login_button_login.Name = "Login_button_login";
            this.Login_button_login.Size = new System.Drawing.Size(88, 37);
            this.Login_button_login.TabIndex = 4;
            this.Login_button_login.Text = "Log In";
            this.Login_button_login.UseVisualStyleBackColor = true;
            this.Login_button_login.Click += new System.EventHandler(this.btnLogin_Click);
            // 
            // Login_label_password
            // 
            this.Login_label_password.AutoSize = true;
            this.Login_label_password.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.125F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Login_label_password.Location = new System.Drawing.Point(163, 194);
            this.Login_label_password.Name = "Login_label_password";
            this.Login_label_password.Size = new System.Drawing.Size(69, 17);
            this.Login_label_password.TabIndex = 3;
            this.Login_label_password.Text = "Password";
            this.Login_label_password.Click += new System.EventHandler(this.login_lbl_password_Click);
            // 
            // Login_label_usuario
            // 
            this.Login_label_usuario.AutoSize = true;
            this.Login_label_usuario.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.125F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Login_label_usuario.Location = new System.Drawing.Point(163, 126);
            this.Login_label_usuario.Name = "Login_label_usuario";
            this.Login_label_usuario.Size = new System.Drawing.Size(57, 17);
            this.Login_label_usuario.TabIndex = 2;
            this.Login_label_usuario.Text = "Usuario";
            // 
            // txtPassword
            // 
            this.txtPassword.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.125F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtPassword.Location = new System.Drawing.Point(166, 210);
            this.txtPassword.Name = "txtPassword";
            this.txtPassword.PasswordChar = '*';
            this.txtPassword.Size = new System.Drawing.Size(278, 23);
            this.txtPassword.TabIndex = 1;
            // 
            // txtUsuario
            // 
            this.txtUsuario.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.125F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtUsuario.Location = new System.Drawing.Point(166, 142);
            this.txtUsuario.Name = "txtUsuario";
            this.txtUsuario.Size = new System.Drawing.Size(278, 23);
            this.txtUsuario.TabIndex = 0;
            // 
            // Login
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("$this.BackgroundImage")));
            this.ClientSize = new System.Drawing.Size(584, 371);
            this.Controls.Add(this.Login_button_login);
            this.Controls.Add(this.Login_label_password);
            this.Controls.Add(this.Login_label_usuario);
            this.Controls.Add(this.txtPassword);
            this.Controls.Add(this.txtUsuario);
            this.Name = "Login";
            this.SizeGripStyle = System.Windows.Forms.SizeGripStyle.Show;
            this.FormClosed += new System.Windows.Forms.FormClosedEventHandler(this.Login_FormClosed);
            this.Load += new System.EventHandler(this.Login_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox txtUsuario;
        private System.Windows.Forms.MaskedTextBox txtPassword;
        private System.Windows.Forms.Label Login_label_usuario;
        private System.Windows.Forms.Label Login_label_password;
        private System.Windows.Forms.Button Login_button_login;
    }
}

