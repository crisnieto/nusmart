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
            dalTratamiento.guardar(tratamiento);
        }

        public List<Tratamiento> obtenerTratamientosDePaciente(int idPaciente)
        {
            return dalTratamiento.obtenerTratamientosDePaciente(idPaciente); 
        }

        public Tratamiento obtenerTratamientoActivo(Paciente paciente)
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
        }

        public bool existeTratamientoActivo(Paciente paciente)
        {
            try
            {
                return obtenerTratamientoActivo(paciente) != null;
            }catch(Exception ex)
            {
                bllBitacora.crearNuevaBitacora("Busqueda de Tratamiento", "Ocurrio un error buscando tratamiento: " + ex.Message, Criticidad.Alta);
                throw new Exception(NuSmartMessage.formatearMensaje("Tratamiento_error_buscar_activo"));
            }
        }

        public void agregarRutina(Tratamiento tratamiento)
        {

            dalTratamiento.agregarRutina(tratamiento);
        }
    }
}
