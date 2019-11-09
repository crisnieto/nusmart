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
                obtenerDiasEjercicioDeRutina(rutina);
            }

            return rutinas;
        }

        public void obtenerDiasEjercicioDeRutina(Rutina rutina)
        {
            rutina.DiaEjercicioLunes = bllDiaEjercicio.obtenerDiaEjercicio(rutina.DiaEjercicioLunes.Id);
            rutina.DiaEjercicioMartes = bllDiaEjercicio.obtenerDiaEjercicio(rutina.DiaEjercicioMartes.Id);
            rutina.DiaEjercicioMiercoles = bllDiaEjercicio.obtenerDiaEjercicio(rutina.DiaEjercicioMiercoles.Id);
            rutina.DiaEjercicioJueves = bllDiaEjercicio.obtenerDiaEjercicio(rutina.DiaEjercicioJueves.Id);
            rutina.DiaEjercicioViernes = bllDiaEjercicio.obtenerDiaEjercicio(rutina.DiaEjercicioViernes.Id);
            rutina.DiaEjercicioSabado = bllDiaEjercicio.obtenerDiaEjercicio(rutina.DiaEjercicioSabado.Id);
            rutina.DiaEjercicioDomingo = bllDiaEjercicio.obtenerDiaEjercicio(rutina.DiaEjercicioDomingo.Id);
        }

        public void agregar(Rutina rutina)
        {
            rutina.DiaEjercicioLunes.Id = bllDiaEjercicio.agregar(rutina.DiaEjercicioLunes);
            rutina.DiaEjercicioMartes.Id = bllDiaEjercicio.agregar(rutina.DiaEjercicioMartes);
            rutina.DiaEjercicioMiercoles.Id = bllDiaEjercicio.agregar(rutina.DiaEjercicioMiercoles);
            rutina.DiaEjercicioJueves.Id = bllDiaEjercicio.agregar(rutina.DiaEjercicioJueves);
            rutina.DiaEjercicioViernes.Id = bllDiaEjercicio.agregar(rutina.DiaEjercicioViernes);
            rutina.DiaEjercicioSabado.Id = bllDiaEjercicio.agregar(rutina.DiaEjercicioSabado);
            rutina.DiaEjercicioDomingo.Id = bllDiaEjercicio.agregar(rutina.DiaEjercicioDomingo);
            
            dalRutina.agregar(rutina);
        }

        public int calcularCaloriasQuemadas(Rutina rutina)
        {
            return rutina.DiaEjercicioLunes.Calorias +
                rutina.DiaEjercicioMartes.Calorias +
                rutina.DiaEjercicioMiercoles.Calorias +
                rutina.DiaEjercicioJueves.Calorias +
                rutina.DiaEjercicioViernes.Calorias +
                rutina.DiaEjercicioSabado.Calorias +
                rutina.DiaEjercicioDomingo.Calorias;
        }

        public Rutina obtener(int id)
        {
            Rutina rutina = dalRutina.obtener(id);

            if(rutina != null)
            {
                obtenerDiasEjercicioDeRutina(rutina);
            }

            return rutina;
        }
    }
}
