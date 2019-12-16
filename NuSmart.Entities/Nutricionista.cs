using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NuSmart.BE
{
    public class Nutricionista : Persona
    {
        int id;
        string matricula;
        string especializacion;
        Usuario usuario;
        int dvh;
        bool eliminado;

        public Nutricionista()
        {
            usuario = new Usuario();
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

        public string Apellido
        {
            get
            {
                return apellido;
            }

            set
            {
                apellido = value;
            }
        }

        public string Matricula
        {
            get
            {
                return matricula;
            }

            set
            {
                matricula = value;
            }
        }

        public int Dni
        {
            get
            {
                return dni;
            }

            set
            {
                dni = value;
            }
        }

        public string Especializacion
        {
            get
            {
                return especializacion;
            }

            set
            {
                especializacion = value;
            }
        }

        public Usuario Usuario
        {
            get
            {
                return usuario;
            }

            set
            {
                usuario = value;
            }
        }

        public string Sexo
        {
            get
            {
                return sexo;
            }

            set
            {
                sexo = value;
            }
        }

        public int Dvh
        {
            get
            {
                return dvh;
            }

            set
            {
                dvh = value;
            }
        }

        [Browsable(false)]
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
            return this.Nombre + " " + this.Apellido;
        }
    }
}
