using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NuSmart.BE;

namespace NuSmart.BLL
{
    abstract class BLLBase
    {        
        public BLLBase()
        {
        }

        public void validarPermiso(String codigoRol)
        {
            Rol rol = new Permiso();
            rol.Codigo = codigoRol;
            if (Sesion.Instancia().validar(codigoRol))
            {
                
            }
        }
    }
}
