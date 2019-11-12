using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NuSmart.DAL;
using NuSmart.BE;

namespace NuSmart.BLL
{
    public class BLLEjercicio
    {
        DALEjercicio dalEjercicio;
        BLLBitacora bllBitacora;

        public BLLEjercicio()
        {
            dalEjercicio = new DALEjercicio();
            bllBitacora = new BLLBitacora();
        }

        public void agregar(Ejercicio ejercicio)
        {
            try
            {
                dalEjercicio.agregar(ejercicio);
                bllBitacora.crearNuevaBitacora("Obtener Ejercicios", "Se guardo un nuevo ejercicio: " + ejercicio.Nombre, Criticidad.Baja);
            }
            catch (Exception ex)
            {
                bllBitacora.crearNuevaBitacora("Obtener Ejercicios", "Ocurrio un error al intentar agregar un nuevo ejercicio: " + ex.Message, Criticidad.Alta);
                throw new Exception(NuSmartMessage.formatearMensaje("Ejercicios_error_agregar"));
            }

        }

        public List<Ejercicio> obtenerTodos()
        {
            try
            {
                return dalEjercicio.obtenerTodos();
            }catch(Exception ex)
            {
                bllBitacora.crearNuevaBitacora("Obtener Ejercicios", "Ocurrio un error al buscar los ejercicios: " + ex.Message, Criticidad.Alta);
                throw new Exception(NuSmartMessage.formatearMensaje("Ejercicios_error_busqueda"));
            }
        }

        public Ejercicio obtener(int id)
        {
            try
            {
                return dalEjercicio.obtener(id);
            }catch(Exception ex)
            {
                bllBitacora.crearNuevaBitacora("Obtener Ejercicios", "Ocurrio un error al buscar el ejercicio con id: " + id + " error: " + ex.Message, Criticidad.Alta);
                throw new Exception(NuSmartMessage.formatearMensaje("Ejercicios_error_busqueda"));
            }
        }
    }
}
