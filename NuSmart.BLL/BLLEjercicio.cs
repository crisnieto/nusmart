using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NuSmart.DAL;
using NuSmart.BE;

namespace NuSmart.BLL
{
    public class BLLEjercicio
    {
        DALEjercicio dalEjercicio;

        public BLLEjercicio()
        {
            dalEjercicio = new DALEjercicio();
        }

        public void agregar(Ejercicio ejercicio)
        {
            dalEjercicio.agregar(ejercicio);
        }

        public List<Ejercicio> obtenerTodos()
        {
            return dalEjercicio.obtenerTodos();
        }

        public Ejercicio obtener(int id)
        {
            return dalEjercicio.obtener(id);
        }
    }
}
