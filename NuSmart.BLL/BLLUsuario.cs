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
        public DALUsuario dalUsuario;

        public BLLUsuario()
        {
            dalUsuario = new DALUsuario();
        }

        public int calcularDVH()
        {
            return 0;
        }

        /**
         * conseguirUsuarioLogIn
         * 1. Se busca el usuario en la base de datos
         * 2. Se pasa a verificar si se encuentra bloqueado por exceso de intentos
         * 3. Se valida que efectivamente el usuario conseguido de la base de datos y el ingresado, son iguales, a traves de la capa de seguridad
         * 4. Se valida si tiene reintentos pero no este bloqueado, y se resetea a 0 en caso de que los tenga
         * 
         * 
         * 1.1 Si no se encuentra el usuario, se catchea la excepcion y se muestra un error generico indicando que no se pudo loguear
         * 2.1 Si se encuentra bloqueado, se muestra un mensaje indicando que el usuario se encuentra bloqueado
         * 3.1 Si no se valida correctamente con la clase de seguridad, se informa con un mensaje de error generico indicando que no se pudo loguear 
         */
        public Usuario conseguirUsuarioLogIn(Usuario usuario)
        {
            Seguridad seguridad = new Seguridad();
            Usuario usuarioConseguido;

            usuario.Password = seguridad.encriptar(usuario.Password);

            try
            {
                usuarioConseguido = dalUsuario.conseguir(usuario.Username);
            }
            catch (Exception exception)
            {
                Console.Write(exception);
                throw new Exception("No se pudo loguear correctamente");
            }
            try
            {
                if (!(seguridad.esBloqueado(usuarioConseguido)))
                {
                    if (seguridad.validar(usuarioConseguido, usuario))
                    {
                        Sesion.Instancia().UsuarioActual = usuarioConseguido;
                        new BLLBitacora().crearNuevaBitacora("Login de Usuario", "Se detecto un evento de ingreso", Criticidad.Media);
                        Console.WriteLine("Login exitoso!");
                    }
                    else
                    {
                        agregarIntento(usuarioConseguido);
                        new BLLBitacora().crearNuevaBitacora("Login de Usuario", "Se detecto un login incorrecto", Criticidad.Media);
                        throw new Exception("No se pudo loguear correctamente");
                    }

                }
                else
                {
                    new BLLBitacora().crearNuevaBitacora("Login de Usuario", "Se detecto un login incorrecto", Criticidad.Alta);
                    throw new Exception("El usuario se encuentra bloqueado, por favor contactarse con un Administrador");
                }

                if (usuarioConseguido.Intentos > 0)
                {
                    reiniciarIntentos(usuarioConseguido);
                }

                return usuarioConseguido;

            }
            catch (Exception exception)
            {
                Console.Write(exception);
                throw new Exception(exception.Message);

            }
        }


        public Usuario conseguir(string usuario)
        {
            try
            {
                return dalUsuario.conseguir(usuario);
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
                throw new Exception("El usuario no fue encontrado");
            }
        }

        public int actualizarPassword(Usuario usuario, string password)
        {
            usuario.Password = new Seguridad().encriptar(password);
            Console.WriteLine("Nueva contraseña encriptada: " + usuario.Password);
            usuario.Dvh = 1234; //TODO: Calcular DVH
            dalUsuario.actualizarContraseña(usuario);
            //TODO: Actalizar DVV
            return 0;
        }

        public int crearUsuario(Usuario usuario, string password)
        {
            usuario.Password = new Seguridad().encriptar(password);
            usuario.Dvh = 1234; //TODO: Calcular Integridad DVH
            dalUsuario.ingresar(usuario);
            //TODO: Actualizar DVV
            return 0;
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

        public bool reiniciarIntentos(Usuario usuario) {
            try
            {
                usuario.Intentos = 0;
                //TODO: Calcular DVH cuando se cambia un atributo
                return dalUsuario.desbloquear(usuario);
            }catch(Exception e)
            {
                Console.WriteLine(e.Message);
                return false;
            }
            
        }


        public bool agregarIntento(Usuario usuario)
        {
            if(usuario.Username != "test")
            {
              return dalUsuario.agregarIntento(usuario);
            }
            return false;
        }
    }
}
