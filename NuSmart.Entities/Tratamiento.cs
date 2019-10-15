using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NuSmart.BE
{
    class Tratamiento
    {
        int id;
        DateTime fechaInicio;
        DateTime fechaFinalizado;

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

        public DateTime FechaInicio
        {
            get
            {
                return fechaInicio;
            }

            set
            {
                fechaInicio = value;
            }
        }

        public DateTime FechaFinalizado
        {
            get
            {
                return fechaFinalizado;
            }

            set
            {
                fechaFinalizado = value;
            }
        }
    }
}
