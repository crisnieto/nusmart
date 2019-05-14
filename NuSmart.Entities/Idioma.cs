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
        static Idioma _instancia;
        string _nombreIdioma;
        private List<Form> _observers = new List<Form>();
        private List<Leyenda> leyendas = new List<Leyenda>();


        protected Idioma()
        {

        }

        public static Idioma Instancia()
        {
            if(_instancia == null)
            {
                _instancia = new Idioma();
            }
            return _instancia;
        }

        public string DescripcionIdioma { get => _descripcionIdioma; set => _descripcionIdioma = value; }
        public string NombreIdioma { get => _nombreIdioma; set => _nombreIdioma = value; }
        public int Id { get => _id; set => _id = value; }
        public List<Form> Observers { get => _observers; set => _observers = value; }
        public List<Leyenda> Leyendas { get => leyendas; set => leyendas = value; }
    }
}
