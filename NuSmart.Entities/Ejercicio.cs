using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NuSmart.BE
{
    public class Ejercicio
    {
        int id;
        string nombre;
        int caloriasQuemadas;

        public int Id
        {
            get
            {
                return id;
            }

            set
            {
                id = value;
            }
        }

        public string Nombre
        {
            get
            {
                return nombre;
            }

            set
            {
                nombre = value;
            }
        }


        public int CaloriasQuemadas
        {
            get
            {
                return caloriasQuemadas;
            }

            set
            {
                caloriasQuemadas = value;
            }
        }
    }
}
