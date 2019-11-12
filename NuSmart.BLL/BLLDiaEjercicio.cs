using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NuSmart.BE;
using NuSmart.DAL;

namespace NuSmart.BLL
{
    public class BLLDiaEjercicio
    {
        BLLEjercicio bllEjercicio;
        DALDiaEjercicio dalDiaEjercicio;

        public BLLDiaEjercicio()
        {
            dalDiaEjercicio = new DALDiaEjercicio();
            bllEjercicio = new BLLEjercicio();
        }

        public int agregar(DiaEjercicio diaEjercicio)
        {
            Sesion.Instancia().verificarPermiso("OP021");
            if(diaEjercicio.Ejercicio.Id > 0) 
            {
                return dalDiaEjercicio.agregar(diaEjercicio);
            }
            return 0;
        }

        public DiaEjercicio obtenerDiaEjercicio(int idDiaEjercicio) {
            Sesion.Instancia().verificarPermiso("OP025");
            DiaEjercicio dia = dalDiaEjercicio.obtener(idDiaEjercicio);
            if(dia.Id > 0)
            {
                dia.Ejercicio = bllEjercicio.obtener(dia.Ejercicio.Id);
            }
            return dia;
        }
    }
}
