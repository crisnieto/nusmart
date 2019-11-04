using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NuSmart.BE
{
    public class Tratamiento
    {
        int id;
        Dieta dieta;
        DateTime fechaInicio;
        Nullable<DateTime> fechaFinalizado;
        Paciente paciente;

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

        public Nullable<DateTime> FechaFinalizado
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

        public Dieta Dieta
        {
            get
            {
                return dieta;
            }

            set
            {
                dieta = value;
            }
        }

        public Paciente Paciente
        {
            get
            {
                return paciente;
            }

            set
            {
                paciente = value;
            }
        }
    }
}
