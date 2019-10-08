using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NuSmart.BE;
using NuSmart.DAL;

namespace NuSmart.BLL
{
    public class BLLHorario
    {
        DALHorario dalHorario;

        public BLLHorario()
        {
            dalHorario = new DALHorario();
        }

        public List<Horario> obtenerHorariosDisponibles(Nutricionista nutricionista, DateTime fecha, string preferencia)
        {
            return dalHorario.obtenerHorariosDisponibles(nutricionista, fecha, preferencia);
        }
    }
}
