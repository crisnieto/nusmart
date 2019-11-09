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
            return dalDiaEjercicio.agregar(diaEjercicio);
        }

        public DiaEjercicio obtenerDiaEjercicio(int idDiaEjercicio) {
            DiaEjercicio dia = dalDiaEjercicio.obtener(idDiaEjercicio);
            dia.Ejercicio = bllEjercicio.obtener(dia.Ejercicio.Id);
            return dia;
        }
    }
}
