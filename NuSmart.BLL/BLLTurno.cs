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
        BLLBitacora bllBitacora;

        public BLLTurno()
        {
            dalTurno = new DALTurno();
            bllBitacora = new BLLBitacora();
        }
        public List<Turno> obtenerTurnosPosibles(Paciente paciente ,DateTime fecha, String preferencia)
        {
                try { 
                List<Turno> turnos = new List<Turno>();

                if(fecha.DayOfWeek == DayOfWeek.Saturday || fecha.DayOfWeek == DayOfWeek.Sunday)
                {
                    return turnos;
                }

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
            } catch(Exception ex)
            {
                bllBitacora.crearNuevaBitacora("Busqueda De Turnos", "Error en la busqueda de turnos: " + ex.Message, Criticidad.Alta);
                throw new Exception(NuSmartMessage.formatearMensaje("Error_messagebox_busqueda"));
            }
        }

        public void registrarTurno(Turno turno)
        {
            try
            {
                dalTurno.registrarTurno(turno);
                bllBitacora.crearNuevaBitacora("Creacion de turno", "Se creo un turno para el paciente con id " + turno.Paciente.Id, Criticidad.Alta);
            }
            catch (Exception ex)
            {
                bllBitacora.crearNuevaBitacora("Creacion de turno", "Error de creacion de turno: " + ex.Message, Criticidad.Alta);
                throw new Exception(NuSmartMessage.formatearMensaje("AgregarTurno_messagebox_errorTurno"));
            }
        }

        public List<Turno> obtenerTurnos(DateTime fecha)
        {
            try
            {
                Nutricionista nutricionista = new BLLNutricionista().conseguir(Sesion.Instancia().UsuarioActual.Id);
                return dalTurno.obtenerTurnos(fecha, nutricionista);
            }catch(Exception ex)
            {
                bllBitacora.crearNuevaBitacora("Busqueda De Turnos de Nutricionista", "Error en la busqueda de turnos del nutricionista: " + ex.Message, Criticidad.Alta);
                throw new Exception(NuSmartMessage.formatearMensaje("Error_messagebox_busqueda"));
            }
        }
    }
}
