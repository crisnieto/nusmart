using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NuSmart.DAL;
using NuSmart.BE;

namespace NuSmart.BLL
{
    public class BLLEjercicio : BLLBase
    {
        DALEjercicio dalEjercicio;

        public BLLEjercicio()
        {
            dalEjercicio = new DALEjercicio();
        }

        public void agregar(Ejercicio ejercicio)
        {
            verificarPermiso("OP016");
            try
            {
                dalEjercicio.agregar(ejercicio);
                crearNuevaBitacora("Obtener Ejercicios", "Se guardo un nuevo ejercicio: " + ejercicio.Nombre, Criticidad.Baja);
            }
            catch (Exception ex)
            {
                crearNuevaBitacora("Obtener Ejercicios", "Ocurrio un error al intentar agregar un nuevo ejercicio: " + ex.Message, Criticidad.Alta);
                throw new Exception(NuSmartMessage.formatearMensaje("Ejercicios_error_agregar"));
            }

        }

        public List<Ejercicio> obtenerTodos()
        {
            verificarPermiso("OP015");
            try
            {
                return dalEjercicio.obtenerTodos();
            }catch(Exception ex)
            {
                crearNuevaBitacora("Obtener Ejercicios", "Ocurrio un error al buscar los ejercicios: " + ex.Message, Criticidad.Alta);
                throw new Exception(NuSmartMessage.formatearMensaje("Ejercicios_error_busqueda"));
            }
        }

        public Ejercicio obtener(int id)
        {
            verificarPermiso("OP015");
            try
            {
                return dalEjercicio.obtener(id);
            }catch(Exception ex)
            {
                crearNuevaBitacora("Obtener Ejercicios", "Ocurrio un error al buscar el ejercicio con id: " + id + " error: " + ex.Message, Criticidad.Alta);
                throw new Exception(NuSmartMessage.formatearMensaje("Ejercicios_error_busqueda"));
            }
        }
    }
}
