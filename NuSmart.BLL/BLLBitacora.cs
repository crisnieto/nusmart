using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
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

        public bool guardarBitacora()
        {
            return true;
        }

        public int seleccionarPorTipo() {
            return 0;
        }
    }
}
