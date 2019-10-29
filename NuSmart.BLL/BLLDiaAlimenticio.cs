using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NuSmart.BE;
using NuSmart.DAL;

namespace NuSmart.BLL
{
    public class BLLDiaAlimenticio
    {
        DALDiaAlimenticio dalDiaAlimenticio;

        public BLLDiaAlimenticio()
        {
            dalDiaAlimenticio = new DALDiaAlimenticio();
        }

        public int guardar(DiaAlimenticio dia)
        {
            return dalDiaAlimenticio.guardar(dia);
        }

        public DiaAlimenticio obtener(int id, string nombre)
        {
            DiaAlimenticio diaAlimenticio = dalDiaAlimenticio.obtener(id);
            diaAlimenticio.Nombre = nombre;
            return diaAlimenticio;
        }
    }
}
