using System;
using System.Collections.Generic;
using NuSmart.BE;
using NuSmart.DAL;


namespace NuSmart.BLL
{
    public class BLLBitacora
    {

        /// <summary>
        /// crearNuevaBitacora es el encargado de registrar una nueva Bitacora u actividad en la base de datos a fin de tener un registro de actividad.
        /// </summary>
        /// <param name="actividad"></param>
        /// <param name="descripcion"></param>
        /// <param name="criticidad"></param>
        /// <returns></returns>
        public int crearNuevaBitacora(string actividad, string descripcion, Criticidad criticidad)
        {
            try
            {
                Bitacora bitacora = new Bitacora();
                bitacora.Actividad = actividad;
                bitacora.Descripción = descripcion;
                bitacora.Fecha = DateTime.Now;
                bitacora.Usuario = Sesion.Instancia().UsuarioActual;

                bitacora.TipoCriticidad = criticidad.Value;
                DALBitacora dalBitacora = new DALBitacora();
                return dalBitacora.guardarBitacora(bitacora);
            }catch(Exception ex)
            {
                //Si se falla en el guardado de Bitacora, no deberia ser un error que sea un Throw hacia las capas superiores.
                //Deberia continuar funcionando el programa.
                Console.WriteLine(ex.Message);
            }
            return 0;
        }

        /// <summary>
        /// conseguirUsuarios se encarga de obtener todos los usuarios donde se ha registrado alguna actividad en algun momento.
        /// </summary>
        /// <returns></returns>
        public List<Usuario> conseguirUsuarios()
        {
            Sesion.Instancia().verificarPermiso("OP45");
            DALBitacora dalBitacora = new DALBitacora();
            return dalBitacora.conseguirUsuarios();
        }

        /// <summary>
        /// conseguirBitacorasConUsuario se encarga de obtener todas las actividades (Lista de entidad Bitacora)
        /// registradas para un usuario en particular
        /// </summary>
        /// <param name="usuario"></param>
        /// <param name="fechaInicio"></param>
        /// <param name="fechaFin"></param>
        /// <param name="criticidad"></param>
        /// <returns></returns>
        public List<Bitacora> conseguirBitacorasConUsuario(Usuario usuario, DateTime fechaInicio, DateTime fechaFin, string criticidad = null)
        {
            try
            {
                Sesion.Instancia().verificarPermiso("OP45");
                DALBitacora dalBitacora = new DALBitacora();
                return dalBitacora.conseguirBitacorasConUsuario(usuario, fechaInicio, fechaFin, criticidad);
            }catch(Exception ex)
            {
                Console.WriteLine(ex.Message);
                throw new Exception(NuSmartMessage.formatearMensaje("Bitacora_messagebox_busqueda_error"));
            }
        }


        /// <summary>
        /// conseguirBitacoras Se encarga de obtener absolutamente todas las bitacoras sin filtrar por usuario.
        /// </summary>
        /// <param name="fechaInicio"></param>
        /// <param name="fechaFin"></param>
        /// <param name="criticidad"></param>
        /// <returns></returns>
        public List<Bitacora> conseguirBitacorasSinUsuario(DateTime fechaInicio, DateTime fechaFin, string criticidad = null)
        {
            try
            {
                Sesion.Instancia().verificarPermiso("OP45");
                DALBitacora dalBitacora = new DALBitacora();
                return dalBitacora.conseguirBitacorasSinUsuario(fechaInicio, fechaFin, criticidad);

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                throw new Exception(NuSmartMessage.formatearMensaje("Bitacora_messagebox_busqueda_error"));
            }
        }
    }
}
