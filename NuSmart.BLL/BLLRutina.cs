using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NuSmart.BE;
using NuSmart.DAL;

namespace NuSmart.BLL
{
    public class BLLRutina : BLLBase
    {

        public DALRutina dalRutina;
        public BLLDiaEjercicio bllDiaEjercicio;
        public BLLBitacora bllBitacora;

        public BLLRutina()
        {
            dalRutina = new DALRutina();
            bllDiaEjercicio = new BLLDiaEjercicio();
            bllBitacora = new BLLBitacora();
        }

        public List<Rutina> obtenerTodos()
        {
            verificarPermiso("OP025");

            List<Rutina> rutinas;
            try
            {
                rutinas = dalRutina.obtenerTodos();
            }
            catch (Exception ex)
            {
                bllBitacora.crearNuevaBitacora("Obtener Rutina", "Se produjo un error al intentar obtener todas la rutinas: " + ex.Message, Criticidad.Alta);
                throw new Exception(NuSmartMessage.formatearMensaje("Rutina_error_busqueda"));
            }

            if(rutinas != null)
            {
                foreach (Rutina rutina in rutinas)
                {
                    obtenerDiasEjercicioDeRutina(rutina);
                }
            }

            return rutinas;

        }

        public void obtenerDiasEjercicioDeRutina(Rutina rutina)
        {
            verificarPermiso("OP025");
            try
            {
                rutina.DiaEjercicioLunes = bllDiaEjercicio.obtenerDiaEjercicio(rutina.DiaEjercicioLunes.Id);
                rutina.DiaEjercicioMartes = bllDiaEjercicio.obtenerDiaEjercicio(rutina.DiaEjercicioMartes.Id);
                rutina.DiaEjercicioMiercoles = bllDiaEjercicio.obtenerDiaEjercicio(rutina.DiaEjercicioMiercoles.Id);
                rutina.DiaEjercicioJueves = bllDiaEjercicio.obtenerDiaEjercicio(rutina.DiaEjercicioJueves.Id);
                rutina.DiaEjercicioViernes = bllDiaEjercicio.obtenerDiaEjercicio(rutina.DiaEjercicioViernes.Id);
                rutina.DiaEjercicioSabado = bllDiaEjercicio.obtenerDiaEjercicio(rutina.DiaEjercicioSabado.Id);
                rutina.DiaEjercicioDomingo = bllDiaEjercicio.obtenerDiaEjercicio(rutina.DiaEjercicioDomingo.Id);
            }catch(Exception ex)
            {
                bllBitacora.crearNuevaBitacora("Buscar Dias de Ejercicio", "Se produjo un error al buscar dias de ejercicio: " + ex.Message, Criticidad.Alta);
                throw new Exception(NuSmartMessage.formatearMensaje("Rutina_error_buscar_dias"));
            }

        }

        public void agregar(Rutina rutina)
        {
            verificarPermiso("OP021");

            if(rutina.Nombre == null || rutina.Nombre == "")
            {
                Exception ex = new Exception(NuSmartMessage.formatearMensaje("Rutina_error_guardar"));
                bllBitacora.crearNuevaBitacora("Agregar Rutina", "Se produjo un error al guardar una rutina: " + ex.Message, Criticidad.Alta);
                throw ex;
            }

            try
            {
                if (rutina.DiaEjercicioLunes.Ejercicio != null)
                {
                    validarDuracion(rutina.DiaEjercicioLunes);
                    rutina.DiaEjercicioLunes.Id = bllDiaEjercicio.agregar(rutina.DiaEjercicioLunes);
                }
                if (rutina.DiaEjercicioMartes.Ejercicio != null)
                {
                    validarDuracion(rutina.DiaEjercicioMartes);
                    rutina.DiaEjercicioMartes.Id = bllDiaEjercicio.agregar(rutina.DiaEjercicioMartes);
                }
                if (rutina.DiaEjercicioMiercoles.Ejercicio != null)
                {
                    validarDuracion(rutina.DiaEjercicioMiercoles);
                    rutina.DiaEjercicioMiercoles.Id = bllDiaEjercicio.agregar(rutina.DiaEjercicioMiercoles);
                }
                if (rutina.DiaEjercicioJueves.Ejercicio != null)
                {
                    validarDuracion(rutina.DiaEjercicioJueves);
                    rutina.DiaEjercicioJueves.Id = bllDiaEjercicio.agregar(rutina.DiaEjercicioJueves);
                }
                if (rutina.DiaEjercicioViernes.Ejercicio != null)
                {
                    validarDuracion(rutina.DiaEjercicioViernes);
                    rutina.DiaEjercicioViernes.Id = bllDiaEjercicio.agregar(rutina.DiaEjercicioViernes);
                }
                if (rutina.DiaEjercicioSabado.Ejercicio != null)
                {
                    validarDuracion(rutina.DiaEjercicioSabado);
                    rutina.DiaEjercicioSabado.Id = bllDiaEjercicio.agregar(rutina.DiaEjercicioSabado);
                }
                if (rutina.DiaEjercicioDomingo.Ejercicio != null)
                {
                    validarDuracion(rutina.DiaEjercicioDomingo);
                    rutina.DiaEjercicioDomingo.Id = bllDiaEjercicio.agregar(rutina.DiaEjercicioDomingo);
                }


                dalRutina.agregar(rutina);
                bllBitacora.crearNuevaBitacora("Agregar Rutina", "Se agrego una nueva rutina: " + rutina.Nombre, Criticidad.Media);
            }
            catch (Exception ex)
            {
                bllBitacora.crearNuevaBitacora("Agregar Rutina", "Se produjo un error al guardar una rutina: " + ex.Message, Criticidad.Alta);
                throw new Exception(NuSmartMessage.formatearMensaje("Rutina_error_guardar"));
            }
        }

        public int calcularCaloriasQuemadas(Rutina rutina)
        {
            try
            {
                return rutina.DiaEjercicioLunes.Calorias +
                rutina.DiaEjercicioMartes.Calorias +
                rutina.DiaEjercicioMiercoles.Calorias +
                rutina.DiaEjercicioJueves.Calorias +
                rutina.DiaEjercicioViernes.Calorias +
                rutina.DiaEjercicioSabado.Calorias +
                rutina.DiaEjercicioDomingo.Calorias;
            }catch(Exception ex)
            {
                throw new Exception(NuSmartMessage.formatearMensaje("Rutina_error_calcular_calorias"));
            }
        
        }

        public void validarDuracion(DiaEjercicio dia)
        {
            if(dia.Duracion == 0 && dia.Ejercicio.Nombre != null)
            {
                throw new Exception("Error de duracion de Ejercicio");
            }
        }

        public Rutina obtener(int id)
        {
            verificarPermiso("OP025");

            try
            {
                Rutina rutina = dalRutina.obtener(id);

                if (rutina != null)
                {
                    obtenerDiasEjercicioDeRutina(rutina);
                }

                return rutina;
            }catch(Exception ex)
            {
                bllBitacora.crearNuevaBitacora("Obtener Rutina", "Se produjo un error al intentar obtener la rutina: " + ex.Message, Criticidad.Alta);
                throw new Exception(NuSmartMessage.formatearMensaje("Rutina_error_busqueda"));
            }
        }
    }
}
