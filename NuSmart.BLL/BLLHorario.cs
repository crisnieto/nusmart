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
            List<Horario> horarios = dalHorario.obtenerHorariosDisponibles(nutricionista, fecha, preferencia);

            List<Horario> horariosFiltrados = new List<Horario>();
            foreach(Horario horario in horarios)
            {
                if(DateTime.Compare(fecha.Date, DateTime.Today.Date) == 0)
                {
                    if (horario.Tiempo.Hour > DateTime.Now.Hour || (horario.Tiempo.Hour == DateTime.Now.Hour && horario.Tiempo.Minute >= DateTime.Now.Minute))
                    {
                        horariosFiltrados.Add(horario);
                    }
                }else if(DateTime.Compare(fecha.Date, DateTime.Today.Date) > 0)
                {
                    horariosFiltrados.Add(horario);
                }
            }
            return horariosFiltrados;
        }
    }
}
