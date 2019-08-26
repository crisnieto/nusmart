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
            this.txtUsuario = new System.Windows.Forms.TextBox();
            this.txtPassword = new System.Windows.Forms.MaskedTextBox();
            this.login_lbl_usuario = new System.Windows.Forms.Label();
            this.login_lbl_password = new System.Windows.Forms.Label();
            this.login_btn_login = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // txtUsuario
            // 
            this.txtUsuario.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.125F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtUsuario.Location = new System.Drawing.Point(166, 142);
            this.txtUsuario.Name = "txtUsuario";
            this.txtUsuario.Size = new System.Drawing.Size(278, 23);
            this.txtUsuario.TabIndex = 0;
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
            // login_lbl_usuario
            // 
            this.login_lbl_usuario.AutoSize = true;
            this.login_lbl_usuario.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.125F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.login_lbl_usuario.Location = new System.Drawing.Point(163, 126);
            this.login_lbl_usuario.Name = "login_lbl_usuario";
            this.login_lbl_usuario.Size = new System.Drawing.Size(57, 17);
            this.login_lbl_usuario.TabIndex = 2;
            this.login_lbl_usuario.Text = "Usuario";
            // 
            // login_lbl_password
            // 
            this.login_lbl_password.AutoSize = true;
            this.login_lbl_password.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.125F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.login_lbl_password.Location = new System.Drawing.Point(163, 194);
            this.login_lbl_password.Name = "login_lbl_password";
            this.login_lbl_password.Size = new System.Drawing.Size(69, 17);
            this.login_lbl_password.TabIndex = 3;
            this.login_lbl_password.Text = "Password";
            this.login_lbl_password.Click += new System.EventHandler(this.login_lbl_password_Click);
            // 
            // login_btn_login
            // 
            this.login_btn_login.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.125F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.login_btn_login.Location = new System.Drawing.Point(261, 279);
            this.login_btn_login.Name = "login_btn_login";
            this.login_btn_login.Size = new System.Drawing.Size(88, 37);
            this.login_btn_login.TabIndex = 4;
            this.login_btn_login.Text = "Log In";
            this.login_btn_login.UseVisualStyleBackColor = true;
            this.login_btn_login.Click += new System.EventHandler(this.btnLogin_Click);
            // 
            // Login
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("$this.BackgroundImage")));
            this.ClientSize = new System.Drawing.Size(584, 371);
            this.Controls.Add(this.login_btn_login);
            this.Controls.Add(this.login_lbl_password);
            this.Controls.Add(this.login_lbl_usuario);
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
        private System.Windows.Forms.Label login_lbl_usuario;
        private System.Windows.Forms.Label login_lbl_password;
        private System.Windows.Forms.Button login_btn_login;
    }
}

