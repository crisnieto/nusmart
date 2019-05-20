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
        static Sesion _instancia;

        public Usuario UsuarioActual { get => _usuarioActual; set => _usuarioActual = value; }
        public Idioma IdiomaActual { get => _idiomaActual; set => _idiomaActual = value; }

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


    }
}
