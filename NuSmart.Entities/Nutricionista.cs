using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NuSmart.BE
{
    public class Nutricionista
    {
        int _id;
        string _nombre;
        string _apellido;
        string _matricula;
        int _dni;
        string _especializacion;
        Usuario usuario;
        string _sexo;
        int _dvh;
        bool _eliminado;

        public Nutricionista()
        {
            usuario = new Usuario();
        }

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

        public string Nombre
        {
            get
            {
                return _nombre;
            }

            set
            {
                _nombre = value;
            }
        }

        public string Apellido
        {
            get
            {
                return _apellido;
            }

            set
            {
                _apellido = value;
            }
        }

        public string Matricula
        {
            get
            {
                return _matricula;
            }

            set
            {
                _matricula = value;
            }
        }

        public int Dni
        {
            get
            {
                return _dni;
            }

            set
            {
                _dni = value;
            }
        }

        public string Especializacion
        {
            get
            {
                return _especializacion;
            }

            set
            {
                _especializacion = value;
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
                return _sexo;
            }

            set
            {
                _sexo = value;
            }
        }

        public int Dvh
        {
            get
            {
                return _dvh;
            }

            set
            {
                _dvh = value;
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
