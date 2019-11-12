using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NuSmart.BE;
using NuSmart.DAL;

namespace NuSmart.BLL
{
    public class BLLTratamiento
    {
        DALTratamiento dalTratamiento;
        BLLRutina bllRutina;
        BLLBitacora bllBitacora;

        public BLLTratamiento()
        {
            dalTratamiento = new DALTratamiento();
            bllRutina = new BLLRutina();
            bllBitacora = new BLLBitacora();
        }

        public void guardar(Tratamiento tratamiento)
        {
            Sesion.Instancia().verificarPermiso("OP041");
            try
            {
                dalTratamiento.guardar(tratamiento);
            }catch(Exception ex)
            {
                bllBitacora.crearNuevaBitacora("Finalizar Tratamiento", "Ocurrio un error intentando guardar un tratamiento: " + ex.Message, Criticidad.Alta);
                throw new Exception(NuSmartMessage.formatearMensaje("Tratamiento_error_guardar"));
            }
        }

        public List<Tratamiento> obtenerTratamientosDePaciente(int idPaciente)
        {
            return dalTratamiento.obtenerTratamientosDePaciente(idPaciente); 
        }

        public Tratamiento obtenerTratamientoActivo(Paciente paciente)
        {
            try
            {
                List<Tratamiento> tratamientos = obtenerTratamientosDePaciente(paciente.Id);
                Tratamiento tratamientoActivo = null;
                foreach (Tratamiento tratamiento in tratamientos)
                {
                    if (tratamiento.FechaFinalizado == null)
                    {
                        tratamientoActivo = tratamiento;
                        tratamientoActivo.Paciente = paciente;
                        break;
                    }
                }
                if (tratamientoActivo != null && tratamientoActivo.Rutina != null)
                {
                    Rutina rutinaObtenida = bllRutina.obtener(tratamientoActivo.Rutina.Id);
                    tratamientoActivo.Rutina = rutinaObtenida;
                }
                return tratamientoActivo;
            }catch(Exception ex)
            {
                bllBitacora.crearNuevaBitacora("Busqueda de Tratamiento", "Ocurrio un error buscando tratamiento: " + ex.Message, Criticidad.Alta);
                throw new Exception(NuSmartMessage.formatearMensaje("Tratamiento_error_buscar_activo"));
            }
        }

        public bool existeTratamientoActivo(Paciente paciente, DateTime fecha)
        {
            Tratamiento tratamientoActivo;

            tratamientoActivo = obtenerTratamientoActivo(paciente);
 
            if (tratamientoActivo != null)
            {
                if (DateTime.Compare(tratamientoActivo.FechaInicio.Date, fecha) > 0)
                {
                    throw new Exception(NuSmartMessage.formatearMensaje("Tratamiento_error_fecha_tratamiento"));
                }
                return true;
            }else
            {
                return false;
            }
        }

        public void agregarRutina(Tratamiento tratamiento)
        {
            try
            {
                dalTratamiento.agregarRutina(tratamiento);
            }catch(Exception ex)
            {
                bllBitacora.crearNuevaBitacora("Asociar Rutina a Tratamiento", "Ocurrio un error intentando asociar el tratamiento con id: " + tratamiento.Id + " a una rutina: " + ex.Message, Criticidad.Alta);
                throw new Exception(NuSmartMessage.formatearMensaje("Tratamiento_error_asociar"));
            }
        }

        public void finalizarTratamiento(Tratamiento tratamiento)
        {
            Sesion.Instancia().verificarPermiso("OP042");
            try
            {
                dalTratamiento.finalizarTratamiento(tratamiento);
                bllBitacora.crearNuevaBitacora("Finalizar Tratamiento", "Se finalizo el tratamiento con id: " + tratamiento.Id, Criticidad.Media);

            }
            catch (Exception ex)
            {
                bllBitacora.crearNuevaBitacora("Finalizar Tratamiento", "Ocurrio un error intentando finalizar el tratamiento con id: "+ tratamiento.Id + " error: " + ex.Message, Criticidad.Alta);
                throw new Exception(NuSmartMessage.formatearMensaje("Tratamiento_error_finalizar"));
            }
        }
    }
}
