using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NuSmart.BE;
using NuSmart.DAL;

namespace NuSmart.BLL
{
    public class BLLPaciente
    {

        DALPaciente dalPaciente;

        public BLLPaciente()
        {
            dalPaciente = new DALPaciente();
        }

        public void agregar(Paciente paciente)
        {
            dalPaciente.agregar(paciente);
        }

        public void modificar(Paciente paciente)
        {
            dalPaciente.modificar(paciente);
        }

        public void eliminar(Paciente paciente)
        {
            dalPaciente.eliminar(paciente);
        }

        public List<Paciente> obtenerTodos()
        {
            return dalPaciente.obtenerTodos();
        }

        public Paciente obtener(int dni)
        {
            return dalPaciente.obtener(dni);
        }
    }
}
