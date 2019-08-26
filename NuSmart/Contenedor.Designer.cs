﻿namespace NuSmart
{
    partial class Contenedor
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
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.menu_micuenta = new System.Windows.Forms.ToolStripMenuItem();
            this.menu_gestion_micuenta = new System.Windows.Forms.ToolStripMenuItem();
            this.menu_cerrar_sesion = new System.Windows.Forms.ToolStripMenuItem();
            this.menu_turnos = new System.Windows.Forms.ToolStripMenuItem();
            this.menu_gestion_turnos = new System.Windows.Forms.ToolStripMenuItem();
            this.menu_pacientes = new System.Windows.Forms.ToolStripMenuItem();
            this.menu_gestion_pacientes = new System.Windows.Forms.ToolStripMenuItem();
            this.menu_nutricionistas = new System.Windows.Forms.ToolStripMenuItem();
            this.menu_gestion_nutricionistas = new System.Windows.Forms.ToolStripMenuItem();
            this.menu_dieta_ejercicio = new System.Windows.Forms.ToolStripMenuItem();
            this.menu_gestion_comidas = new System.Windows.Forms.ToolStripMenuItem();
            this.menu_gestion_dietas = new System.Windows.Forms.ToolStripMenuItem();
            this.menu_gestion_ejercicios = new System.Windows.Forms.ToolStripMenuItem();
            this.menu_gestion_bitacora = new System.Windows.Forms.ToolStripMenuItem();
            this.menu_gestion_backup = new System.Windows.Forms.ToolStripMenuItem();
            this.rolesToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.gestiónDeRolesToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.menu_idioma = new System.Windows.Forms.ToolStripMenuItem();
            this.menu_cambiar_idioma = new System.Windows.Forms.ToolStripMenuItem();
            this.gestionarIdiomasToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.gestionarEtiquetasToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.menuStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // menuStrip1
            // 
            this.menuStrip1.ImageScalingSize = new System.Drawing.Size(32, 32);
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.menu_micuenta,
            this.menu_turnos,
            this.menu_pacientes,
            this.menu_nutricionistas,
            this.menu_dieta_ejercicio,
            this.menu_gestion_bitacora,
            this.menu_gestion_backup,
            this.rolesToolStripMenuItem,
            this.menu_idioma});
            this.menuStrip1.Location = new System.Drawing.Point(0, 0);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Padding = new System.Windows.Forms.Padding(3, 1, 0, 1);
            this.menuStrip1.Size = new System.Drawing.Size(1149, 24);
            this.menuStrip1.TabIndex = 18;
            this.menuStrip1.Text = "menuStrip1";
            // 
            // menu_micuenta
            // 
            this.menu_micuenta.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.menu_gestion_micuenta,
            this.menu_cerrar_sesion});
            this.menu_micuenta.Name = "menu_micuenta";
            this.menu_micuenta.Size = new System.Drawing.Size(74, 22);
            this.menu_micuenta.Text = "Mi Cuenta";
            // 
            // menu_gestion_micuenta
            // 
            this.menu_gestion_micuenta.Name = "menu_gestion_micuenta";
            this.menu_gestion_micuenta.Size = new System.Drawing.Size(165, 22);
            this.menu_gestion_micuenta.Text = "Gestionar Cuenta";
            // 
            // menu_cerrar_sesion
            // 
            this.menu_cerrar_sesion.Name = "menu_cerrar_sesion";
            this.menu_cerrar_sesion.Size = new System.Drawing.Size(165, 22);
            this.menu_cerrar_sesion.Text = "Cerrar Sesión";
            this.menu_cerrar_sesion.Click += new System.EventHandler(this.menu_cerrar_sesion_Click);
            // 
            // menu_turnos
            // 
            this.menu_turnos.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.menu_gestion_turnos});
            this.menu_turnos.Name = "menu_turnos";
            this.menu_turnos.Size = new System.Drawing.Size(56, 22);
            this.menu_turnos.Text = "Turnos";
            // 
            // menu_gestion_turnos
            // 
            this.menu_gestion_turnos.Name = "menu_gestion_turnos";
            this.menu_gestion_turnos.Size = new System.Drawing.Size(167, 22);
            this.menu_gestion_turnos.Text = "Gestion de turnos";
            // 
            // menu_pacientes
            // 
            this.menu_pacientes.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.menu_gestion_pacientes});
            this.menu_pacientes.Name = "menu_pacientes";
            this.menu_pacientes.Size = new System.Drawing.Size(69, 22);
            this.menu_pacientes.Text = "Pacientes";
            // 
            // menu_gestion_pacientes
            // 
            this.menu_gestion_pacientes.Name = "menu_gestion_pacientes";
            this.menu_gestion_pacientes.Size = new System.Drawing.Size(183, 22);
            this.menu_gestion_pacientes.Text = "Gestión de Pacientes";
            // 
            // menu_nutricionistas
            // 
            this.menu_nutricionistas.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.menu_gestion_nutricionistas});
            this.menu_nutricionistas.Name = "menu_nutricionistas";
            this.menu_nutricionistas.Size = new System.Drawing.Size(92, 22);
            this.menu_nutricionistas.Text = "Nutricionistas";
            // 
            // menu_gestion_nutricionistas
            // 
            this.menu_gestion_nutricionistas.Name = "menu_gestion_nutricionistas";
            this.menu_gestion_nutricionistas.Size = new System.Drawing.Size(206, 22);
            this.menu_gestion_nutricionistas.Text = "Gestión de Nutricionistas";
            // 
            // menu_dieta_ejercicio
            // 
            this.menu_dieta_ejercicio.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.menu_gestion_comidas,
            this.menu_gestion_dietas,
            this.menu_gestion_ejercicios});
            this.menu_dieta_ejercicio.Name = "menu_dieta_ejercicio";
            this.menu_dieta_ejercicio.Size = new System.Drawing.Size(107, 22);
            this.menu_dieta_ejercicio.Text = "Dieta y Ejercicios";
            // 
            // menu_gestion_comidas
            // 
            this.menu_gestion_comidas.Name = "menu_gestion_comidas";
            this.menu_gestion_comidas.Size = new System.Drawing.Size(187, 22);
            this.menu_gestion_comidas.Text = "Gestión de Alimentos";
            // 
            // menu_gestion_dietas
            // 
            this.menu_gestion_dietas.Name = "menu_gestion_dietas";
            this.menu_gestion_dietas.Size = new System.Drawing.Size(187, 22);
            this.menu_gestion_dietas.Text = "Gestión de Dieta";
            // 
            // menu_gestion_ejercicios
            // 
            this.menu_gestion_ejercicios.Name = "menu_gestion_ejercicios";
            this.menu_gestion_ejercicios.Size = new System.Drawing.Size(187, 22);
            this.menu_gestion_ejercicios.Text = "Gestión de Ejercicios";
            // 
            // menu_gestion_bitacora
            // 
            this.menu_gestion_bitacora.Name = "menu_gestion_bitacora";
            this.menu_gestion_bitacora.Size = new System.Drawing.Size(62, 22);
            this.menu_gestion_bitacora.Text = "Bitácora";
            this.menu_gestion_bitacora.Click += new System.EventHandler(this.menu_gestion_bitacora_Click);
            // 
            // menu_gestion_backup
            // 
            this.menu_gestion_backup.Name = "menu_gestion_backup";
            this.menu_gestion_backup.Size = new System.Drawing.Size(58, 22);
            this.menu_gestion_backup.Text = "Backup";
            // 
            // rolesToolStripMenuItem
            // 
            this.rolesToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.gestiónDeRolesToolStripMenuItem});
            this.rolesToolStripMenuItem.Name = "rolesToolStripMenuItem";
            this.rolesToolStripMenuItem.Size = new System.Drawing.Size(47, 22);
            this.rolesToolStripMenuItem.Text = "Roles";
            // 
            // gestiónDeRolesToolStripMenuItem
            // 
            this.gestiónDeRolesToolStripMenuItem.Name = "gestiónDeRolesToolStripMenuItem";
            this.gestiónDeRolesToolStripMenuItem.Size = new System.Drawing.Size(161, 22);
            this.gestiónDeRolesToolStripMenuItem.Text = "Gestión de Roles";
            // 
            // menu_idioma
            // 
            this.menu_idioma.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.menu_cambiar_idioma,
            this.gestionarIdiomasToolStripMenuItem,
            this.gestionarEtiquetasToolStripMenuItem});
            this.menu_idioma.Name = "menu_idioma";
            this.menu_idioma.Size = new System.Drawing.Size(56, 22);
            this.menu_idioma.Text = "Idioma";
            // 
            // menu_cambiar_idioma
            // 
            this.menu_cambiar_idioma.Name = "menu_cambiar_idioma";
            this.menu_cambiar_idioma.Size = new System.Drawing.Size(175, 22);
            this.menu_cambiar_idioma.Text = "Cambiar Idioma";
            // 
            // gestionarIdiomasToolStripMenuItem
            // 
            this.gestionarIdiomasToolStripMenuItem.Name = "gestionarIdiomasToolStripMenuItem";
            this.gestionarIdiomasToolStripMenuItem.Size = new System.Drawing.Size(175, 22);
            this.gestionarIdiomasToolStripMenuItem.Text = "Gestionar Idiomas";
            // 
            // gestionarEtiquetasToolStripMenuItem
            // 
            this.gestionarEtiquetasToolStripMenuItem.Name = "gestionarEtiquetasToolStripMenuItem";
            this.gestionarEtiquetasToolStripMenuItem.Size = new System.Drawing.Size(175, 22);
            this.gestionarEtiquetasToolStripMenuItem.Text = "Gestionar Etiquetas";
            // 
            // Contenedor
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1149, 515);
            this.Controls.Add(this.menuStrip1);
            this.IsMdiContainer = true;
            this.Name = "Contenedor";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Contenedor";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.Load += new System.EventHandler(this.Contenedor_Load);
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.ToolStripMenuItem menu_micuenta;
        private System.Windows.Forms.ToolStripMenuItem menu_gestion_micuenta;
        private System.Windows.Forms.ToolStripMenuItem menu_cerrar_sesion;
        private System.Windows.Forms.ToolStripMenuItem menu_turnos;
        private System.Windows.Forms.ToolStripMenuItem menu_gestion_turnos;
        private System.Windows.Forms.ToolStripMenuItem menu_pacientes;
        private System.Windows.Forms.ToolStripMenuItem menu_gestion_pacientes;
        private System.Windows.Forms.ToolStripMenuItem menu_nutricionistas;
        private System.Windows.Forms.ToolStripMenuItem menu_gestion_nutricionistas;
        private System.Windows.Forms.ToolStripMenuItem menu_dieta_ejercicio;
        private System.Windows.Forms.ToolStripMenuItem menu_gestion_comidas;
        private System.Windows.Forms.ToolStripMenuItem menu_gestion_dietas;
        private System.Windows.Forms.ToolStripMenuItem menu_gestion_ejercicios;
        private System.Windows.Forms.ToolStripMenuItem menu_gestion_bitacora;
        private System.Windows.Forms.ToolStripMenuItem menu_gestion_backup;
        private System.Windows.Forms.ToolStripMenuItem rolesToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem gestiónDeRolesToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem menu_idioma;
        private System.Windows.Forms.ToolStripMenuItem menu_cambiar_idioma;
        private System.Windows.Forms.ToolStripMenuItem gestionarIdiomasToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem gestionarEtiquetasToolStripMenuItem;
    }
}