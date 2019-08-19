using System;
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
        private List<Leyenda> leyendas = new List<Leyenda>();

        
        public int Id
        {
            get
            {
                return _id;
            }

            set
            {
                _id = value;
            }
        }

        public string DescripcionIdioma
        {
            get
            {
                return _descripcionIdioma;
            }

            set
            {
                _descripcionIdioma = value;
            }
        }

        public string NombreIdioma
        {
            get
            {
                return _nombreIdioma;
            }

            set
            {
                _nombreIdioma = value;
            }
        }

        public List<Leyenda> Leyendas
        {
            get
            {
                return leyendas;
            }

            set
            {
                leyendas = value;
            }
        }

        public override string ToString()
        {
            return this.NombreIdioma;
        }
    }
}
