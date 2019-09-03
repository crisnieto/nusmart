using System;
using System.Collections.Generic;
using NuSmart.BE;
using NuSmart.DAL;


namespace NuSmart.BLL
{
    public class BLLBitacora
    {

        public int borrarAntiguo()
        {
            return 0;
        }
        public int crearNuevaBitacora(string actividad, string descripcion, Criticidad criticidad)
        {
            Bitacora bitacora = new Bitacora();
            bitacora.Actividad = actividad;
            bitacora.Descripción = descripcion;
            bitacora.Fecha = DateTime.Now;    
            bitacora.Usuario = Sesion.Instancia().UsuarioActual;
            
            bitacora.TipoCriticidad = criticidad.Value;
            DALBitacora dalBitacora = new DALBitacora();
            return dalBitacora.guardarBitacora(bitacora);
        }

        public List<Usuario> conseguirUsuarios()
        {
            Sesion.Instancia().verificarPermiso("OP45");
            DALBitacora dalBitacora = new DALBitacora();
            return dalBitacora.conseguirUsuarios();
        }

        public List<Bitacora> conseguirBitacorasConUsuario(Usuario usuario, DateTime fechaInicio, DateTime fechaFin, string criticidad = null)
        {
            Sesion.Instancia().verificarPermiso("OP45");
            DALBitacora dalBitacora = new DALBitacora();
            return dalBitacora.conseguirBitacorasConUsuario(usuario, fechaInicio, fechaFin, criticidad);
        }


        public bool guardarBitacora()
        {
            return true;
        }

        public int seleccionarPorTipo()
        {
            return 0;
        }
    }
}
