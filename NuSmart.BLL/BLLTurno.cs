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
        BLLHorario bllHorario;

        public BLLTurno()
        {
            dalTurno = new DALTurno();
            bllBitacora = new BLLBitacora();
            bllHorario = new BLLHorario();
        }
        public List<Turno> obtenerTurnosPosibles(Paciente paciente ,DateTime fecha, String preferencia)
        {
            Sesion.Instancia().verificarPermiso("OP001");
            try
            { 
                List<Turno> turnos = new List<Turno>();

                if(fecha.DayOfWeek == DayOfWeek.Saturday || fecha.DayOfWeek == DayOfWeek.Sunday)
                {
                    return turnos;
                }

                if(DateTime.Compare(fecha.Date, DateTime.Today.Date) < 0)
                {
                    throw new Exception("No es posible crear un turno para una fecha posterior a la actual");
                }

                Nutricionista nutricionista = new BLLNutricionista().conseguir(Sesion.Instancia().UsuarioActual.Id);

                List<Horario> horariosConseguidos = bllHorario.obtenerHorariosDisponibles(nutricionista, fecha, preferencia);

                if(horariosConseguidos.Count == 0)
                {
                    fecha = fecha.AddDays(7);
                    horariosConseguidos = bllHorario.obtenerHorariosDisponibles(nutricionista, fecha, preferencia);
                }

                foreach (Horario horario in horariosConseguidos)
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
                throw new Exception(NuSmartMessage.formatearMensaje("Error_messagebox_busqueda") + ": " + ex.Message);
            }
        }

        public void registrarTurno(Turno turno)
        {
            Sesion.Instancia().verificarPermiso("OP001");

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
            Sesion.Instancia().verificarPermiso("OP044");
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

        public void borrarTurno(Turno turno)
        {
            Sesion.Instancia().verificarPermiso("OP003");
            try
            {
                dalTurno.eliminar(turno);
                bllBitacora.crearNuevaBitacora("Eliminado de Turno", "Se elimino el turno con id: " + turno.Id, Criticidad.Alta);
            }
            catch (Exception ex)
            {
                bllBitacora.crearNuevaBitacora("Eliminado de Turno", "Error al eliminar turno del nutricionista: " + ex.Message, Criticidad.Alta);
                throw new Exception(NuSmartMessage.formatearMensaje("AgregarTurno_error_eliminado"));
            }
        }
    }
}
