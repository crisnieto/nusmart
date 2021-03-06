﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NuSmart.BE;
using NuSmart.DAL;
using System.Text.RegularExpressions;

namespace NuSmart.BLL
{
    public class BLLPaciente : BLLBase
    {

        DALPaciente dalPaciente;
        BLLBitacora bllBitacora;

        public BLLPaciente()
        {
            dalPaciente = new DALPaciente();
            bllBitacora = new BLLBitacora();
        }

        bool esEmailValido(string email)
        {
            try
            {
                Regex regex = new Regex(@"^([\w\.\-]+)@([\w\-]+)((\.(\w){2,4})+)$");
                Match match = regex.Match(email);
                if (match.Success)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch
            {
                return false;
            }
        }


        public void agregar(Paciente paciente)
        {
            verificarPermiso("OP004");
            if (!tieneEdadValida(paciente))
            {
                throw new Exception(NuSmartMessage.formatearMensaje("Pacientes_messagebox_errorEdad"));
            }
            if (!esEmailValido(paciente.Email))
            {
                throw new Exception(NuSmartMessage.formatearMensaje("Pacientes_messagebox_errorMail"));
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
            verificarPermiso("OP005");
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

        public List<Paciente> obtenerTodos()
        {
            verificarPermiso("OP043");
            return dalPaciente.obtenerTodos();
        }

        public Paciente obtener(int dni)
        {
            verificarPermiso("OP043");
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
