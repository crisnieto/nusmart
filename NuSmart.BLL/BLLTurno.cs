using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NuSmart.BE;
using NuSmart.DAL;

namespace NuSmart.BLL
{
    public class BLLTurno : BLLBase
    {
        DALTurno dalTurno;
        BLLHorario bllHorario;

        public BLLTurno()
        {
            dalTurno = new DALTurno();
            bllHorario = new BLLHorario();
        }


        public List<Turno> obtenerTurnosPosibles(Paciente paciente ,DateTime fecha, String preferencia)
        {

            verificarPermiso("OP044");

            try
            { 
                List<Turno> turnos = new List<Turno>();

                if (validarFinDeSemana(fecha))
                {
                    return turnos;
                }

                validarFechaPosterior(fecha);

                Nutricionista nutricionista = new BLLNutricionista().conseguir(Sesion.Instancia().UsuarioActual.Id);

                List<Horario> horariosConseguidos = bllHorario.obtenerHorariosDisponibles(nutricionista, fecha, preferencia);

                if(horariosConseguidos.Count == 0)
                {
                    fecha = agregarSemana(fecha);
                    horariosConseguidos = bllHorario.obtenerHorariosDisponibles(nutricionista, fecha, preferencia);
                }

                foreach (Horario horario in horariosConseguidos)
                {
                    
                    turnos.Add(crearTurnoPosible(horario, nutricionista, paciente, fecha));
                }
                return turnos;
            } catch(Exception ex)
            {
                crearNuevaBitacora("Busqueda De Turnos", "Error en la busqueda de turnos: " + ex.Message, Criticidad.Alta);
                throw new Exception(NuSmartMessage.formatearMensaje("Error_messagebox_busqueda") + ": " + ex.Message);
            }
        }

        public Turno crearTurnoPosible(Horario horario, Nutricionista nutricionista, Paciente paciente, DateTime fecha)
        {
            Turno turno = new Turno();
            turno.Fecha = fecha;
            turno.Nutricionista = nutricionista;
            turno.Paciente = paciente;
            turno.Horario = horario;
            return turno;
        }

        public bool validarFinDeSemana(DateTime fecha)
        {
            if (fecha.DayOfWeek == DayOfWeek.Saturday || fecha.DayOfWeek == DayOfWeek.Sunday)
            {
                return true;
            }
            return false;
        }

        public DateTime agregarSemana(DateTime fecha)
        {
            return fecha.AddDays(7);
        }

        public void validarFechaPosterior(DateTime fecha)
        {
            if (DateTime.Compare(fecha.Date, DateTime.Today.Date) < 0)
            {
                throw new Exception(NuSmartMessage.formatearMensaje("AgregarTurno_messagebox_fecha_anterior_error"));
            }
        }

        public void registrarTurno(Turno turno)
        {
            verificarPermiso("OP001");

            try
            {
                dalTurno.registrarTurno(turno);
                crearNuevaBitacora("Creacion de turno", "Se creo un turno para el paciente con id " + turno.Paciente.Id, Criticidad.Alta);
            }
            catch (Exception ex)
            {
                crearNuevaBitacora("Creacion de turno", "Error de creacion de turno: " + ex.Message, Criticidad.Alta);
                throw new Exception(NuSmartMessage.formatearMensaje("AgregarTurno_messagebox_errorTurno"));
            }
        }

        public List<Turno> obtenerTurnos(DateTime fecha)
        {

            verificarPermiso("OP044");

            try
            {
                Nutricionista nutricionista = new BLLNutricionista().conseguir(Sesion.Instancia().UsuarioActual.Id);
                return dalTurno.obtenerTurnos(fecha, nutricionista);
            }catch(Exception ex)
            {
                crearNuevaBitacora("Busqueda De Turnos de Nutricionista", "Error en la busqueda de turnos del nutricionista: " + ex.Message, Criticidad.Alta);
                throw new Exception(NuSmartMessage.formatearMensaje("Error_messagebox_busqueda"));
            }
        }

        public void borrarTurno(Turno turno)
        {
            verificarPermiso("OP003");

            try
            {
                dalTurno.eliminar(turno);
                crearNuevaBitacora("Eliminado de Turno", "Se elimino el turno con id: " + turno.Id, Criticidad.Alta);
            }
            catch (Exception ex)
            {
                crearNuevaBitacora("Eliminado de Turno", "Error al eliminar turno del nutricionista: " + ex.Message, Criticidad.Alta);
                throw new Exception(NuSmartMessage.formatearMensaje("AgregarTurno_error_eliminado"));
            }
        }
    }
}
