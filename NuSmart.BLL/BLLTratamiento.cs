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

        public BLLTratamiento()
        {
            dalTratamiento = new DALTratamiento();
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
            return tratamientoActivo;
        }

        public bool existeTratamientoActivo(Paciente paciente)
        {
            return obtenerTratamientoActivo(paciente) != null;
        }

    }
}
