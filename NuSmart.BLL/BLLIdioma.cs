﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NuSmart.BE;
using NuSmart.DAL;
using System.Windows.Forms;

namespace NuSmart.BLL
{
    public class BLLIdioma
    {

        public Idioma conseguirIdioma(int idiomaId)
        {
            DALIdioma dalIdioma = new DALIdioma();
            BLLLeyenda bllLeyenda = new BLLLeyenda();
            
            //Va a buscar en la BD e instancia el singleton Idioma. Referencio el singleton a la variable idioma
            //para hacerlo mas semantico
            Idioma idioma = dalIdioma.conseguir(idiomaId);
            idioma.Leyendas = bllLeyenda.conseguirLeyendasParaIdioma(idioma.Id);
            return idioma;
        }

        public void Attach(Form observer)
        {
            Idioma.Instancia().Observers.Add(observer);
            
        }

        public void Detach(Form observer)
        {
            Idioma.Instancia().Observers.Remove(observer);
        }

        public void Notify()
        {
            foreach (Form o in Idioma.Instancia().Observers)
            {
                o.Update();
            }
        }

        public string conseguirLeyenda(Control control)
        {
            Leyenda leyenda = Idioma.Instancia().Leyendas.Find(i => i.Nombre == control.Name);
            if (leyenda != null){
                return leyenda.Texto;
            }
            else
            {
                return control.Text;
            }
        }
    }
}
