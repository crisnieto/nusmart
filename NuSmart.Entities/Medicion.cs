using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NuSmart.BE
{
    public class Medicion
    {
        double altura;
        double peso;
        double cintura;
        double cadera;
        double bmi;
        string categoriaBmi;
        double bfp;
        string categoriaBfp;
        DateTime fecha;

        public double Altura
        {
            get
            {
                return altura;
            }

            set
            {
                altura = value;
            }
        }

        public double Peso
        {
            get
            {
                return peso;
            }

            set
            {
                peso = value;
            }
        }

        public double Cintura
        {
            get
            {
                return cintura;
            }

            set
            {
                cintura = value;
            }
        }

        public double Cadera
        {
            get
            {
                return cadera;
            }

            set
            {
                cadera = value;
            }
        }

        public DateTime Fecha
        {
            get
            {
                return fecha;
            }

            set
            {
                fecha = value;
            }
        }

        public double Bmi
        {
            get
            {
                return bmi;
            }

            set
            {
                bmi = value;
            }
        }

        public string CategoriaBmi
        {
            get
            {
                return categoriaBmi;
            }

            set
            {
                categoriaBmi = value;
            }
        }

        public double Bfp
        {
            get
            {
                return bfp;
            }

            set
            {
                bfp = value;
            }
        }

        public string CategoriaBfp
        {
            get
            {
                return categoriaBfp;
            }

            set
            {
                categoriaBfp = value;
            }
        }
    }
}
