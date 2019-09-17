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

        public int calcularDVH(Usuario usuario)
        {
            string concatenacion = usuario.Username + usuario.Password + Convert.ToString(usuario.Intentos) + Convert.ToString(usuario.Eliminado);
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
                throw new Exception(NuSmartMessage.formatearMensaje("Login_messagebox_error_login"));
            }
            try
            {
                if (!(seguridad.esBloqueado(usuarioConseguido)))
                {
                    if (seguridad.validar(usuarioConseguido, usuario))
                    {
                        usuarioConseguido.Roles = bllRol.conseguir(usuarioConseguido);
                        Sesion.Instancia().UsuarioActual = usuarioConseguido;
                        new BLLBitacora().crearNuevaBitacora("Login de Usuario", "Se detecto un evento de ingreso", Criticidad.Media);
                    }
                    else
                    {
                        agregarIntento(usuarioConseguido);
                        new BLLBitacora().crearNuevaBitacora("Login de Usuario", "Se detecto un login incorrecto", Criticidad.Media);
                        throw new Exception(NuSmartMessage.formatearMensaje("Login_messagebox_error_login"));
                    }

                }
                else
                {
                    new BLLBitacora().crearNuevaBitacora("Login de Usuario", "Se detecto un login incorrecto", Criticidad.Alta);
                    throw new Exception(NuSmartMessage.formatearMensaje("Login_messagebox_usuario_bloqueado"));
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
                throw new Exception(NuSmartMessage.formatearMensaje(exception.Message));

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
                throw new Exception(NuSmartMessage.formatearMensaje("Nutricionista_messagebox_usuario_inexistente"));
            }
        }

        public int actualizarPassword(Usuario usuario, string password)
        {
            try
            {
                Sesion.Instancia().verificarPermiso("GE110");
                usuario.Password = new Seguridad().encriptar(password);
                Console.WriteLine("Nueva contraseña encriptada: " + usuario.Password);
                usuario.Dvh = calcularDVH(usuario);
                dalUsuario.actualizarContraseña(usuario);
                new BLLBitacora().crearNuevaBitacora("Cambio de Password", "Se cambio la password del usuario " + usuario.Username, Criticidad.Media);
                return new DVVH().actualizarDVV("Usuario");
            }catch(Exception ex)
            {
                throw new Exception(NuSmartMessage.formatearMensaje("MiCuenta_messagebox_error_cambio_password"));
            }
         
        }

        public int crearUsuario(Usuario usuario)
        {
            usuario.Password = new Seguridad().encriptar(usuario.Password);
            usuario.Dvh = calcularDVH(usuario);
            dalUsuario.ingresar(usuario);
            return new DVVH().actualizarDVV("Usuario");
        }

        public int eliminarUsuario(Usuario usuario)
        {
            if(usuario.Username != "test"){
                usuario.Eliminado = true;
                usuario.Dvh = calcularDVH(usuario);
                dalUsuario.eliminar(usuario);
                return new DVVH().actualizarDVV("Usuario");
            }
            return 0;
        }

        public bool reiniciarIntentos(Usuario usuario) {
            try
            {
                usuario.Intentos = 0;
                usuario.Dvh = calcularDVH(usuario);
                dalUsuario.desbloquear(usuario);
                new DVVH().actualizarDVV("Usuario");
                return true;
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
                throw new Exception("Nutricionista_messagebox_reiniciar_intentos_usuario_error");
            }
        }


        public bool agregarIntento(Usuario usuario)
        {
            //TODO: Hacer algo mas elegante aca...
            if(usuario.Username != "test")
            {
                usuario.Intentos += 1;
                usuario.Dvh = calcularDVH(usuario);
                dalUsuario.agregarIntento(usuario);
                new DVVH().actualizarDVV("Usuario");
                return true;
            }
            return false;
        }

        public List<Usuario> conseguirUsuarios()
        {
            return dalUsuario.conseguirTodos();
        }

        public bool existe(Usuario usuario)
        {
            return dalUsuario.existe(usuario);
        }
    }
}
