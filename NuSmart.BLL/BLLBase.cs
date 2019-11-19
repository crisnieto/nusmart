using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NuSmart.BE;

namespace NuSmart.BLL
{
    public abstract class BLLBase
    {
        protected BLLBitacora bitacoraErrores;

        public BLLBase()
        {
           bitacoraErrores = new BLLBitacora();
        }


        public void verificarPermiso(string operacion)
        {
            try
            {
                Sesion.Instancia().verificarPermiso(operacion);
            }catch(Exception ex)
            {
                bitacoraErrores.crearNuevaBitacora("Error de Permisos", ex.Message, Criticidad.Alta);
                throw ex;
            }

        }

    }
}
