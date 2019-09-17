using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NuSmart.BE
{
    public class Usuario
    {
        int _id;
        int _dvh;
        string _password;
        string _username;
        List<Rol> roles;
        int _intentos;
        bool _eliminado;

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

        public string Password
        {
            get
            {
                return _password;
            }

            set
            {
                _password = value;
            }
        }

        public string Username
        {
            get
            {
                return _username;
            }

            set
            {
                _username = value;
            }
        }

        public List<Rol> Roles
        {
            get
            {
                return roles;
            }

            set
            {
                roles = value;
            }
        }

        public int Intentos
        {
            get
            {
                return _intentos;
            }

            set
            {
                _intentos = value;
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

        public override string ToString()
        {
            return this.Username;
        }
    }
}
