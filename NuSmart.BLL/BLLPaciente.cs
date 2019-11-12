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
        BLLBitacora bllBitacora;

        public BLLPaciente()
        {
            dalPaciente = new DALPaciente();
            bllBitacora = new BLLBitacora();
        }

        public void agregar(Paciente paciente)
        {
            Sesion.Instancia().verificarPermiso("OP004");
            if (!tieneEdadValida(paciente))
            {
                throw new Exception(NuSmartMessage.formatearMensaje("Pacientes_messagebox_errorEdad"));
            }
            try
            {
                dalPaciente.agregar(paciente);
                bllBitacora.crearNuevaBitacora("Creacion de Paciente", "Se creo el paciente con DNI " + paciente.Dni , Criticidad.Media);
            }
            catch (Exception ex)
            {
                bllBitacora.crearNuevaBitacora("Creacion de Paciente", "Se produjo un error al crear un paciente " + ex.Message, Criticidad.Alta);
                throw new Exception(NuSmartMessage.formatearMensaje("Pacientes_messagebox_errorDatos"));
            }
        }

        public void modificar(Paciente paciente)
        {
            Sesion.Instancia().verificarPermiso("OP005");
            try
            {
                dalPaciente.modificar(paciente);
                bllBitacora.crearNuevaBitacora("Modificacion de Paciente", "Se modifico el paciente con DNI " + paciente.Dni, Criticidad.Media);
            }
            catch (Exception ex)
            {
                bllBitacora.crearNuevaBitacora("Modificacion de Paciente", "Se produjo un error al modificar un paciente " + ex.Message, Criticidad.Alta);
                throw new Exception(NuSmartMessage.formatearMensaje("Pacientes_messagebox_errorDatos"));
            }
        }

        public void eliminar(Paciente paciente)
        {
            try
            {
                paciente.Eliminado = true;
                dalPaciente.eliminar(paciente);
                bllBitacora.crearNuevaBitacora("Eliminacion de Paciente", "Se elimino el paciente con DNI " + paciente.Dni, Criticidad.Media);
            }
            catch (Exception ex)
            {
                bllBitacora.crearNuevaBitacora("Eliminacion de Paciente", "Se produjo un error al modificar un paciente " + ex.Message, Criticidad.Alta);
                throw new Exception(NuSmartMessage.formatearMensaje("Pacientes_messagebox_errorSeleccion"));
            }
        }

        public List<Paciente> obtenerTodos()
        {
            Sesion.Instancia().verificarPermiso("OP043");
            return dalPaciente.obtenerTodos();
        }

        public Paciente obtener(int dni)
        {
            Sesion.Instancia().verificarPermiso("OP043");
            try
            {
                return dalPaciente.obtener(dni);
            }catch(Exception ex)
            {
                bllBitacora.crearNuevaBitacora("Busqueda de Paciente", "Ocurrio un error buscando un paciente " + ex.Message, Criticidad.Media);
                throw new Exception(NuSmartMessage.formatearMensaje("Pacientes_messagebox_errorDatos"));
            }
        }

        public bool tieneEdadValida(Paciente paciente)
        {
            return !(paciente.Edad() < 10);
        }
    }
}
