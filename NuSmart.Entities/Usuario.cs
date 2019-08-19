using System;
using System.Collections.Generic;
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

        public bool validar(string codigo)
        {
            bool valido = false;
            foreach(Rol rol in Roles){
                valido = busquedaRecursiva(rol, codigo);
                if(valido == true){
                    break;
                }
            };
            return valido;
        }
        public bool busquedaRecursiva(Rol rol, string codigo)
        {            
                if(rol.Codigo == codigo)
                {
                    return true;
                }

                if (rol is Familia)
                {
                    foreach(Rol nuevoRol in rol.mostrar())
                {
                    if (busquedaRecursiva(nuevoRol, codigo) == true) {
                        return true;
                    };
                };
            }
            return false;

        }

        public override string ToString()
        {
            return this.Username;
        }
    }
}
