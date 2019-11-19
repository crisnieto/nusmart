using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NuSmart.DAL;
using NuSmart.BE;

namespace NuSmart.BLL
{
    public class BLLNutricionista
    {
        BLLUsuario bllUsuario;
        DALNutricionista dalNutricionista;
        BLLBitacora bllBitacora;

        public BLLNutricionista()
        {
            dalNutricionista = new DALNutricionista();
            bllUsuario = new BLLUsuario();
            bllBitacora = new BLLBitacora();
        }

        /// <summary>
        /// conseguir se encarga de solicitar a la DAL la obtencion de un nutricionista en particular de la base de datos.
        /// </summary>
        /// <param name="idUsuario"></param>
        /// <returns></returns>
        public Nutricionista conseguir(int idUsuario)
        {
            return dalNutricionista.conseguir(idUsuario);
        }


        /// <summary>
        /// conseguirTodos solicita a la DAL que retorne la lista de toods los Nutricionistas que existen en la base de datos.
        /// </summary>
        /// <returns></returns>
        public List<Nutricionista> conseguirTodos()
        {
            return dalNutricionista.conseguirTodos();
        }
        

        /// <summary>
        /// calcularDVH se encarga de calcular el digito verificador horizontal en base a una entidad Nutricionista.
        /// Para el calculo de DVH se realiza una concatenacion de los atributos del nutricionista, a su vez convirtiendo cada atributo que no sea string a tipo string
        /// Una vez realizada la concatenacion, es responsabilidad de la entidad Seguridad en retornar la encriptacion de dicha concatenacion.
        /// Una vez hecho eso, y obtenido el String de la concatenacion, por cada caracter, se obtiene el codigo ASCII que lo representa (int)
        /// y se suma cada codigo ASCII. El resultado es el Digito Verificador Horizontal
        /// </summary>
        /// <param name="nutricionista"></param>
        /// <returns></returns>
        public int calcularDVH(Nutricionista nutricionista)
        {
            string concatenacion = Convert.ToString(nutricionista.Dni) + nutricionista.Especializacion + nutricionista.Matricula + nutricionista.Apellido + Convert.ToString(nutricionista.Usuario.Id) + nutricionista.Nombre + nutricionista.Sexo + Convert.ToString(nutricionista.Eliminado);
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

        /// <summary>
        /// ingresar se encarga de solicitar a la DAL el guardado del nutricionista.
        /// Primero se verifca que tanto el usuario como el nutricionista no existan.
        /// Luego, se procede a crear el usuario y el nutricionista asociado.
        /// </summary>
        /// <param name="nutricionista"></param>
        /// <returns></returns>
        public bool ingresar(Nutricionista nutricionista)
        {
            Sesion.Instancia().verificarPermiso("OP038");

            try
            {
                if (!(bllUsuario.existe(nutricionista.Usuario)) && !(existe(nutricionista)))
                {
                    bllUsuario.crearUsuario(nutricionista.Usuario);
                    nutricionista.Usuario = bllUsuario.conseguir(nutricionista.Usuario.Username);
                    nutricionista.Dvh = calcularDVH(nutricionista);
                    dalNutricionista.ingresar(nutricionista);
                    new DVVH().actualizarDVV("Nutricionista");
                    bllBitacora.crearNuevaBitacora("Creacion de Nutricionista", "Se creo el nutricionista con usuario: " + nutricionista.Usuario.Username, Criticidad.Media);
                    return true;
                }
                else
                {
                    throw new Exception(NuSmartMessage.formatearMensaje("Nutricionista_messagebox_usuario_ya_existe"));
                }
            }
            catch (Exception ex)
            {
                bllBitacora.crearNuevaBitacora("Creacion de Nutricionista", "Error en la creacion de Nutricionista: " + ex.Message, Criticidad.Alta);
                throw ex;
            }
        }


        /// <summary>
        /// modificar se encarga de solicitar a la DAL la modificacion del nutricionista entrante por parametro.
        /// </summary>
        /// <param name="nutricionista"></param>
        /// <returns></returns>
        public int modificar(Nutricionista nutricionista)
        {
            Sesion.Instancia().verificarPermiso("OP040");
            try
            {
                nutricionista.Dvh = calcularDVH(nutricionista);
                dalNutricionista.modificar(nutricionista);
                int result = new DVVH().actualizarDVV("Nutricionista");
                bllBitacora.crearNuevaBitacora("Modificacion de Nutricionista", "Se modifico el Nutricionista con ID: " + nutricionista.Id, Criticidad.Alta);
                return result;
            }
            catch (Exception ex)
            {
                bllBitacora.crearNuevaBitacora("Modificacion de Nutricionista", "Error en la modificacion de Nutricionista: " + ex.Message, Criticidad.Alta);
                throw new Exception(NuSmartMessage.formatearMensaje(ex.Message));
            }
        }


        /// <summary>
        /// existe se encarga de realizar una solicitud a la DAL para verificar si existe o no un Nutricionista en base de datos.
        /// </summary>
        /// <param name="nutricionista"></param>
        /// <returns></returns>
        public bool existe(Nutricionista nutricionista)
        {
            return dalNutricionista.existe(nutricionista);
        }


        /// <summary>
        /// Eliminar se encarga de 
        /// </summary>
        /// <param name="nutricionista"></param>
        /// <returns></returns>
        public bool eliminar(Nutricionista nutricionista)
        {
            Sesion.Instancia().verificarPermiso("OP039");

            try
            {
                if(Sesion.Instancia().UsuarioActual.Username != nutricionista.Usuario.Username)
                {
                    nutricionista.Eliminado = true;
                    nutricionista.Dvh = calcularDVH(nutricionista);
                    dalNutricionista.eliminar(nutricionista);
                    new DVVH().actualizarDVV("Nutricionista");
                    bllUsuario.eliminarUsuario(nutricionista.Usuario);
                }else
                {
                    throw new Exception(NuSmartMessage.formatearMensaje("Nutricionista_messagebox_error_borrado_actual"));
                }

                return true;
            }catch(Exception e)
            {
                bllBitacora.crearNuevaBitacora("Eliminacion de Nutricionista", "Error en la eliminacion de Nutricionista: " + e.Message, Criticidad.Alta);

                throw new Exception(NuSmartMessage.formatearMensaje(e.Message));
            }
        }
    }

}
