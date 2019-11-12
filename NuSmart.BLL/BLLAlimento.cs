using System;
using System.Collections.Generic;
using NuSmart.BE;
using NuSmart.DAL;

namespace NuSmart.BLL
{
    public class BLLAlimento
    {
        DALAlimento dalAlimento;
        BLLBitacora bllBitacora;

        public BLLAlimento()
        {
            dalAlimento = new DALAlimento();
            bllBitacora = new BLLBitacora();
        }

        public void agregar(Alimento alimento)
        {
            Sesion.Instancia().verificarPermiso("OP008");

            try
            {
                dalAlimento.agregar(alimento);
                bllBitacora.crearNuevaBitacora("Agregar Alimento", "Se agrego un nuevo alimento: " + alimento.Nombre, Criticidad.Media);
            }
            catch (Exception ex)
            {
                bllBitacora.crearNuevaBitacora("Agregar Alimento", "Se produjo un error al intentar crear un nuevo alimento: " + ex.Message, Criticidad.Alta);
                throw new Exception(NuSmartMessage.formatearMensaje("Alimento_error_agregar"));
            }
        }

        public List<Alimento> obtenerTodos()
        {
            Sesion.Instancia().verificarPermiso("OP007");
            try
            {
                return dalAlimento.obtenerTodos();
            }catch(Exception ex)
            {
                bllBitacora.crearNuevaBitacora("Buscar Alimento", "Se produjo un error al buscar los alimentos: " + ex.Message, Criticidad.Alta);
                throw new Exception(NuSmartMessage.formatearMensaje("Alimento_error_buscar"));
            }
        }

        public List<Alimento> obtenerAlimentosDePlato(Plato plato)
        {
            Sesion.Instancia().verificarPermiso("OP007");
            try
            {
                return dalAlimento.obtenerAlimentosDePlato(plato);
            }catch(Exception ex)
            {
                bllBitacora.crearNuevaBitacora("Buscar Alimento", "Se produjo un error al buscar los alimentos para un plato especifico: " + ex.Message, Criticidad.Alta);
                throw new Exception(NuSmartMessage.formatearMensaje("Alimento_error_plato_buscar"));
            }
        }

        public List<Alimento> buscarPorNombre(String nombre)
        {
            Sesion.Instancia().verificarPermiso("OP007");
            try
            {
                return dalAlimento.buscar(nombre);
            }
            catch (Exception ex)
            {
                bllBitacora.crearNuevaBitacora("Buscar Alimento", "Se produjo un error al buscar los alimentos: " + ex.Message, Criticidad.Alta);
                throw new Exception(NuSmartMessage.formatearMensaje("Alimento_error_buscar"));
            }
        }
    }
}
