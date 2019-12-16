using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NuSmart.BE
{
    public class Sesion
    {
        Usuario _usuarioActual;
        Idioma _idiomaActual;
        private List<IObserver> _observers = new List<IObserver>();
        static Sesion _instancia;

        public Usuario UsuarioActual
        {
            get
            {
                return _usuarioActual;
            }

            set
            {
                _usuarioActual = value;
            }
        }

        public Idioma IdiomaActual
        {
            get
            {
                return _idiomaActual;
            }

            set
            {
                _idiomaActual = value;
            }
        }

        public List<IObserver> Observers
        {
            get
            {
                return _observers;
            }

            set
            {
                _observers = value;
            }
        }

        protected Sesion()
        {

        }

        public static Sesion Instancia()
        {
            if (_instancia == null)
            {
                _instancia = new Sesion();
            }
            return _instancia;
        }

        public void Eliminar()
        {
            _instancia = null;
            UsuarioActual = null;
            IdiomaActual = null;
        }

        public bool validar(string codigo)
        {
            bool valido = false;
            foreach (Rol rol in UsuarioActual.Roles)
            {
                valido = busquedaRecursiva(rol, codigo);
                if (valido == true)
                {
                    break;
                }
            };
            return valido;
        }


        public void verificarPermiso(string codigo)
        {
            if (!validar(codigo))
            {
                string mensaje = NuSmartMessage.formatearMensaje("Roles_messagebox_usuario_sin_permisos") + ": " + codigo;
                throw new Exception(mensaje);
            }
        }

        public bool busquedaRecursiva(Rol rol, string codigo)
        {
            if (rol.Codigo == codigo)
            {
                return true;
            }

            if (rol is Familia)
            {
                foreach (Rol nuevoRol in rol.mostrar())
                {
                    if (busquedaRecursiva(nuevoRol, codigo) == true)
                    {
                        return true;
                    };
                };
            }
            return false;
        }


    }
}
