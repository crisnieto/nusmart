using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NuSmart.BE
{
    public class Leyenda
    {
        int _id;
        string _nombreControl;
        string _texto;
        bool _eliminado;

        [Browsable(false)]
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

        public string NombreControl
        {
            get
            {
                return _nombreControl;
            }

            set
            {
                _nombreControl = value;
            }
        }

        public string Texto
        {
            get
            {
                return _texto;
            }

            set
            {
                _texto = value;
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
    }
}
