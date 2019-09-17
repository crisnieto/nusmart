using System;
using System.Collections.Generic;
using System.ComponentModel;
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
        bool _eliminado;
        
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

        [Browsable(false)]
        public bool Eliminado
        {
            get
            {
                return _eliminado;
            }

            set
            {
                _eliminado = value;
            }
        }

        public override string ToString()
        {
            return this.NombreIdioma;
        }
    }
}
