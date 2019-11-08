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
        DALDiaEjercicio dalDiaEjercicio;

        public BLLDiaEjercicio()
        {
            dalDiaEjercicio = new DALDiaEjercicio();
        }

        public void agregar(DiaEjercicio diaEjercicio)
        {
            dalDiaEjercicio.agregar(diaEjercicio);
        }

        public DiaEjercicio obtenerDiaEjercicio(int idDiaEjercicio) {
           return dalDiaEjercicio.obtener(idDiaEjercicio);
        }
    }
}
