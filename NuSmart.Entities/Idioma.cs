﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace NuSmart.BE
{
    public class Idioma
    {
        int _id;
        string _descripcionIdioma;
        string _nombreIdioma;
        private List<Form> _observers = new List<Form>();
        private List<Leyenda> leyendas = new List<Leyenda>();


        public string DescripcionIdioma { get => _descripcionIdioma; set => _descripcionIdioma = value; }
        public string NombreIdioma { get => _nombreIdioma; set => _nombreIdioma = value; }
        public int Id { get => _id; set => _id = value; }
        public List<Form> Observers { get => _observers; set => _observers = value; }
        public List<Leyenda> Leyendas { get => leyendas; set => leyendas = value; }
    }
}