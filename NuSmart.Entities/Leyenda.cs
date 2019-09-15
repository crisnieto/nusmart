using System;
using System.Collections.Generic;
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
    }
}
