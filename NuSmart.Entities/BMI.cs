using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NuSmart.BE
{
    public class BMI
    {
        double indice;
        string categoria;

        public double Indice
        {
            get
            {
                return indice;
            }

            set
            {
                indice = value;
            }
        }

        public string Categoria
        {
            get
            {
                return categoria;
            }

            set
            {
                categoria = value;
            }
        }
    }
}
