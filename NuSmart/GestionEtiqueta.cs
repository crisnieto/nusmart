﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using NuSmart.BLL;
using NuSmart.BE;

namespace NuSmart
{
    public partial class GestionEtiqueta : FormObserver
    {
        BLLIdioma bllIdioma;
        BLLLeyenda bllLeyenda;
        Idioma idiomaSeleccionado;
        Leyenda leyendaSeleccionada;

        public GestionEtiqueta()
        {
            InitializeComponent();
            setup();
            bllIdioma = new BLLIdioma();
            bllLeyenda = new BLLLeyenda();

        }

        private void GestionEtiqueta_Load(object sender, EventArgs e)
        {
            try
            {
                comboBox1.DataSource = bllIdioma.conseguirIdiomas();
                dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
                dataGridView1.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
                dataGridView1.MultiSelect = false;
                dataGridView1.ReadOnly = true;
                dataGridView2.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
                dataGridView2.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
                dataGridView2.MultiSelect = false;
                recargarEtiquetas();
            }catch(Exception ex)
            {
                MessageBox.Show(NuSmartMessage.formatearMensaje(ex.Message));
            }
        }

        private void recargarEtiquetas()
        {
            try
            {
                dataGridView1.DataSource = bllLeyenda.conseguirLeyendasParaIdioma(idiomaSeleccionado.Id);
                dataGridView2.DataSource = bllLeyenda.conseguirLeyendasFaltantes(idiomaSeleccionado.Id);
                if(dataGridView2.Rows.Count > 0)
                {
                    dataGridView2.Columns[0].ReadOnly = true;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            idiomaSeleccionado = (Idioma)comboBox1.SelectedItem;
            recargarEtiquetas();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            leyendaSeleccionada = (Leyenda)dataGridView1.CurrentRow.DataBoundItem;
            GestionEtiqueta_textbox_nombre_control.Text = leyendaSeleccionada.NombreControl;
            GestionEtiqueta_textbox_texto_leyenda.Text = leyendaSeleccionada.Texto;
        }

        private void GestionEtiqueta_textbox_nombre_control_TextChanged(object sender, EventArgs e)
        {

        }

        private void GestionEtiqueta_textbox_texto_leyenda_TextChanged(object sender, EventArgs e)
        {

        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            leyendaSeleccionada = (Leyenda)dataGridView1.CurrentRow.DataBoundItem;
            GestionEtiqueta_textbox_nombre_control.Text = leyendaSeleccionada.NombreControl;
            GestionEtiqueta_textbox_texto_leyenda.Text = leyendaSeleccionada.Texto;
        }

        private void button3_Click(object sender, EventArgs e)
        {
            try
            {
                bllLeyenda.eliminarLeyenda(leyendaSeleccionada);
                recargarEtiquetas();
                bllIdioma.Notify();
                Sesion.Instancia().IdiomaActual.Leyendas = bllLeyenda.conseguirLeyendasParaIdioma(Sesion.Instancia().IdiomaActual.Id);
                bllIdioma.Notify();
            }catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void button4_Click(object sender, EventArgs e)
        {
            try
            {
                leyendaSeleccionada.NombreControl = GestionEtiqueta_textbox_nombre_control.Text;
                leyendaSeleccionada.Texto = GestionEtiqueta_textbox_texto_leyenda.Text;
                bllLeyenda.modificarLeyenda(leyendaSeleccionada);
                recargarEtiquetas();
                Sesion.Instancia().IdiomaActual.Leyendas = bllLeyenda.conseguirLeyendasParaIdioma(Sesion.Instancia().IdiomaActual.Id);
                bllIdioma.Notify();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {

            try
            {

                Leyenda leyenda = new Leyenda();
                leyenda.NombreControl = GestionEtiqueta_textbox_nombre_control.Text;
                leyenda.Texto = GestionEtiqueta_textbox_texto_leyenda.Text;
                bllLeyenda.crearLeyenda(leyenda, idiomaSeleccionado);
                recargarEtiquetas();
                Sesion.Instancia().IdiomaActual.Leyendas = bllLeyenda.conseguirLeyendasParaIdioma(Sesion.Instancia().IdiomaActual.Id);
                bllIdioma.Notify();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            } 
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                List<Leyenda> leyendas = (List<Leyenda>)dataGridView2.DataSource;
                bllLeyenda.guardar(leyendas, idiomaSeleccionado);
                recargarEtiquetas();
                Sesion.Instancia().IdiomaActual.Leyendas = bllLeyenda.conseguirLeyendasParaIdioma(Sesion.Instancia().IdiomaActual.Id);
                bllIdioma.Notify();
            }catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}
