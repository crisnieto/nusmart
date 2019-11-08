using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NuSmart.BE;
using NuSmart.DAL;

namespace NuSmart.BLL
{
    public class BLLRutina
    {

        public DALRutina dalRutina;
        public BLLDiaEjercicio bllDiaEjercicio;

        public BLLRutina()
        {
            dalRutina = new DALRutina();
            bllDiaEjercicio = new BLLDiaEjercicio();
        }

        public List<Rutina> obtenerTodos()
        {
            List<Rutina> rutinas = dalRutina.obtenerTodos();
            foreach (Rutina rutina in rutinas)
            {
                rutina.DiaEjercicioLunes = bllDiaEjercicio.obtenerDiaEjercicio(rutina.DiaEjercicioLunes.Id);
                rutina.DiaEjercicioMartes = bllDiaEjercicio.obtenerDiaEjercicio(rutina.DiaEjercicioMartes.Id);
                rutina.DiaEjercicioMiercoles = bllDiaEjercicio.obtenerDiaEjercicio(rutina.DiaEjercicioMiercoles.Id);
                rutina.DiaEjercicioJueves = bllDiaEjercicio.obtenerDiaEjercicio(rutina.DiaEjercicioJueves.Id);
                rutina.DiaEjercicioViernes = bllDiaEjercicio.obtenerDiaEjercicio(rutina.DiaEjercicioViernes.Id);
                rutina.DiaEjercicioSabado = bllDiaEjercicio.obtenerDiaEjercicio(rutina.DiaEjercicioSabado.Id);
                rutina.DiaEjercicioDomingo = bllDiaEjercicio.obtenerDiaEjercicio(rutina.DiaEjercicioDomingo.Id);
            }

            return rutinas;
        }

        public void agregar(Rutina rutina)
        {
            dalRutina.agregar(rutina);
        }
    }
}
