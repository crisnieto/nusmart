﻿using System;
using System.Collections.Generic;
using NuSmart.BE;
using NuSmart.DAL;

namespace NuSmart.BLL
{
    public class BLLAlimento : BLLBase
    {
        DALAlimento dalAlimento;

        public BLLAlimento()
        {
            dalAlimento = new DALAlimento();
        }

        public void agregar(Alimento alimento)
        {

            verificarPermiso("OP008");

            try
            {
                dalAlimento.agregar(alimento);
                crearNuevaBitacora("Agregar Alimento", "Se agrego un nuevo alimento: " + alimento.Nombre, Criticidad.Media);
            }
            catch (Exception ex)
            {
                crearNuevaBitacora("Agregar Alimento", "Se produjo un error al intentar crear un nuevo alimento: " + ex.Message, Criticidad.Alta);
                throw new Exception(NuSmartMessage.formatearMensaje("Alimento_error_agregar"));
            }
        }

        public List<Alimento> obtenerTodos()
        {
            verificarPermiso("OP007");
            try
            {
                return dalAlimento.obtenerTodos();
            }catch(Exception ex)
            {
                crearNuevaBitacora("Buscar Alimento", "Se produjo un error al buscar los alimentos: " + ex.Message, Criticidad.Alta);
                throw new Exception(NuSmartMessage.formatearMensaje("Alimento_error_buscar"));
            }
        }

        public List<Alimento> obtenerAlimentosDePlato(Plato plato)
        {
            verificarPermiso("OP007");
            try
            {
                return dalAlimento.obtenerAlimentosDePlato(plato);
            }catch(Exception ex)
            {
                crearNuevaBitacora("Buscar Alimento", "Se produjo un error al buscar los alimentos para un plato especifico: " + ex.Message, Criticidad.Alta);
                throw new Exception(NuSmartMessage.formatearMensaje("Alimento_error_plato_buscar"));
            }
        }

        public List<Alimento> buscarPorNombre(String nombre)
        {
            verificarPermiso("OP007");
            try
            {
                return dalAlimento.buscar(nombre);
            }
            catch (Exception ex)
            {
                crearNuevaBitacora("Buscar Alimento", "Se produjo un error al buscar los alimentos: " + ex.Message, Criticidad.Alta);
                throw new Exception(NuSmartMessage.formatearMensaje("Alimento_error_buscar"));
            }
        }
    }
}
