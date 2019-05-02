using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NuSmart.BE;
using NuSmart.DAL;

namespace NuSmart.BLL
{
    public class BLLUsuario
    {
        public int calcularDVH()
        {
            return 0;
        }

        public Usuario conseguirUsuario(Usuario usuario)
        {
            Seguridad seguridad = new Seguridad();
            usuario.Password = seguridad.encriptar(usuario.Password);

            DALUsuario dalUsuario = new DALUsuario();
            Usuario usuarioConseguido = dalUsuario.conseguir(usuario);

            if (seguridad.validar(usuarioConseguido, usuario)) {
                Console.WriteLine("Login exitoso!");
                return usuarioConseguido;
            } else
            {
                return null;
            }
        }

        public bool EliminarUsuario(int id)
        {
            return false;
        }

        public int encriptarDatos(Usuario usuario)
        {
            return 0;
        }
        
        public int logout()
        {
            return 0;
        }

        public int validarUsuarioIngresado(Usuario user)
        {
            return 0;
        }
    }
}
