using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NuSmart.BE;
using NuSmart.DAL;

namespace NuSmart.BLL
{
    public class BLLTurno
    {
        DALTurno dalTurno;

        public BLLTurno()
        {
            dalTurno = new DALTurno();
        }
        public List<Turno> obtenerTurnosPosibles(Paciente paciente ,DateTime fecha, String preferencia)
        {
            List<Turno> turnos = new List<Turno>();
            Nutricionista nutricionista = new BLLNutricionista().conseguir(Sesion.Instancia().UsuarioActual.Id);

            List<Horario> horariosConseguidos = new BLLHorario().obtenerHorariosDisponibles(nutricionista, fecha, preferencia);

            foreach(Horario horario in horariosConseguidos)
            {
                Turno turno = new Turno();
                turno.Fecha = fecha;
                turno.Nutricionista = nutricionista;
                turno.Paciente = paciente;
                turno.Horario = horario;
                turnos.Add(turno);
            }
            return turnos;
        }

        public void registrarTurno(Turno turno)
        {
            dalTurno.registrarTurno(turno);
        }

        public List<Turno> obtenerTurnos(DateTime fecha)
        {
            Nutricionista nutricionista = new BLLNutricionista().conseguir(Sesion.Instancia().UsuarioActual.Id);

            return dalTurno.obtenerTurnos(fecha, nutricionista);
        }

    }
}
