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
        public BLLRol bllRol;
        public DALUsuario dalUsuario;

        public BLLUsuario()
        {
            bllRol = new BLLRol();
            dalUsuario = new DALUsuario();
        }

        public int calcularDVH()
        {
            return 0;
        }

        public Usuario conseguirUsuarioLogIn(Usuario usuario)
        {
            try {
                Seguridad seguridad = new Seguridad();
                usuario.Password = seguridad.encriptar(usuario.Password);

                Usuario usuarioConseguido = dalUsuario.conseguir(usuario.Username);

                if (seguridad.validar(usuarioConseguido, usuario))
                {
                    Console.WriteLine("Login exitoso!");
                    usuarioConseguido.Roles = bllRol.conseguir(usuarioConseguido);
                    calcularDVH(usuarioConseguido);
                    return usuarioConseguido;
                }
                else
                {
                    throw new Exception("No se pudo loguear correctamente");
                }
            } catch (Exception exception)
            {
                Console.Write(exception);
                throw new Exception("No se pudo loguear correctamente");

            }
        }

        public Usuario conseguir(string usuario)
        {
            return dalUsuario.conseguir(usuario);
        }

        public int actualizarPassword(Usuario usuario, string password)
        {
            Console.WriteLine("Nueva contraseña: " + password);
            usuario.Password = new Seguridad().encriptar(password);
            Console.WriteLine("Nueva contraseña encriptada: " + usuario.Password);
            usuario.DVH = calcularDVH(usuario);
            dalUsuario.actualizarContraseña(usuario);
            return new DVVH().actualizarDVV("Usuario");
        }

        public int crearUsuario(Usuario usuario, string password)
        {
            usuario.Password = new Seguridad().encriptar(password);
            usuario.DVH = calcularDVH(usuario);
            dalUsuario.ingresar(usuario);
            return new DVVH().actualizarDVV("Usuario");

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

        public int calcularDVH(Usuario user)
        {
            string concatenacion = user.Username + user.Password;
            Seguridad seguridad = new Seguridad();
            string md5 = seguridad.encriptar(concatenacion);


            //En este punto, verifico cada uno de los caracteres del MD5 obtenido, y los transformo al numero de codigo ASCII
            //multiplicado por su posicion en la cadena original
            byte[] asciiBytes = Encoding.ASCII.GetBytes(md5);

            int DVH = 0;
            int posicion = 0;

            foreach (byte b in asciiBytes)
            {
                posicion += 1;
                DVH = DVH + (int)b * posicion;
            }

            Console.WriteLine("DVH CONSEGUIDO = {0}", DVH);
            return DVH;
        }
    }
}
