using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NuSmart.BE
{
    public class Turno
    {
        int id;
        Nutricionista nutricionista;
        Paciente paciente;
        Horario horario;
        DateTime fecha;
        Medicion medicion;
        string motivo;
        bool eliminado;

        public Nutricionista Nutricionista
        {
            get
            {
                return nutricionista;
            }

            set
            {
                nutricionista = value;
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

        public Horario Horario
        {
            get
            {
                return horario;
            }

            set
            {
                horario = value;
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

        public Medicion Medicion
        {
            get
            {
                return medicion;
            }

            set
            {
                medicion = value;
            }
        }

        public string Motivo
        {
            get
            {
                return motivo;
            }

            set
            {
                motivo = value;
            }
        }

        public bool Eliminado
        {
            get
            {
                return eliminado;
            }

            set
            {
                eliminado = value;
            }
        }

        public override string ToString()
        {
            if (Id == 0)
            {
                return fecha.ToShortDateString() + ": " + Horario.ToString();
            }
            else
            {
                return Horario.ToString() + " - " + Paciente.Nombre + " " + Paciente.Apellido;
            }
        }
    }
}
