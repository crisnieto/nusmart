using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NuSmart.BE
{
    public class DiaEjercicio
    {
        int id;
        Ejercicio ejercicio;
        int duracion;
        int calorias;

        public DiaEjercicio()
        {
            Ejercicio = new Ejercicio();
        }

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

        public Ejercicio Ejercicio
        {
            get
            {
                return ejercicio;
            }

            set
            {
                ejercicio = value;
            }
        }

        public int Duracion
        {
            get
            {
                return duracion;
            }

            set
            {
                duracion = value;
            }
        }

        public int Calorias
        {
            get
            {
                return duracion * ejercicio.CaloriasQuemadas / 60;
            }

            set
            {
                calorias = value;
            }
        }
    }
}
