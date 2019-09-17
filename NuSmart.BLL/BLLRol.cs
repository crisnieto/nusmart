using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NuSmart.BE;
using NuSmart.DAL;
using System.Data;

namespace NuSmart.BLL
{
    public class BLLRol
    {

        DALRol dalRol;

        public BLLRol()
        {
            dalRol = new DALRol();
        }

        public List<Rol> conseguir(Usuario usuario)
        {
            List<Rol> roles = dalRol.conseguirRolesDeUsuario(usuario);
            return roles;
        }

        public List<Rol> conseguir()
        {
            Sesion.Instancia().verificarPermiso("AA099");
            List<Rol> roles = dalRol.conseguirRoles();
            return roles;
        }

        public void eliminar(Rol rol)
        {
            Sesion.Instancia().verificarPermiso("AA099");
            dalRol.desasociarDeTodos(rol);
            dalRol.eliminarRecursivamente(rol.Id);
            new BLLBitacora().crearNuevaBitacora("Eliminacion de Rol", "Se elimino el rol " + rol.Codigo, Criticidad.Alta);
        }

        public void insertar()
        {

        }

        public bool validarCodigoDeRol(string codigo)
        {
            if (codigo.Length > 0)
            {
                return dalRol.validarCodigoDeRol(codigo);
            }
            return false;
        }

        public bool crearRol(Rol rol, Rol padre = null)
        {
            try
            {
                new BLLBitacora().crearNuevaBitacora("Creacion de Rol", "Se creo el rol " + rol.Codigo, Criticidad.Alta);
                Sesion.Instancia().verificarPermiso("AA099");
                return dalRol.crearRol(rol, padre);
            }catch(Exception ex)
            {
                throw new Exception(NuSmartMessage.formatearMensaje("GestionRoles_messagebox_error_creacion", ex));
            }

        }

        public bool asociarAUsuario(Rol rol, Usuario usuario)
        {
            Sesion.Instancia().verificarPermiso("AA099");
            if (esPosibleAsociarRol(rol, usuario.Roles))
            {
                new BLLBitacora().crearNuevaBitacora("Asociacion de Rol", "Se asocio el rol " + rol.Codigo + " del usuario " + usuario.Username, Criticidad.Media);
                return dalRol.asociarRolAUsuario(rol, usuario);
            }
            else
            {
                throw new Exception(NuSmartMessage.formatearMensaje("GestionRoles_messagebox_error_asociacion"));
            }
        }

        public bool desasociarDeUsuario(Rol rol, Usuario usuario)
        {
            Sesion.Instancia().verificarPermiso("AA099");
            if (esPosibleDesociarRol(rol, usuario))
            {
                new BLLBitacora().crearNuevaBitacora("Desasociacion de Rol", "Se desasocio el rol " + rol.Codigo + " del usuario " + usuario.Username, Criticidad.Media);
                return dalRol.desasociarDeUsuario(rol, usuario);

            }
            else
            {   
                throw new Exception(NuSmartMessage.formatearMensaje("GestionRoles_messagebox_error_desasociacion"));
            }
        }


        public bool esPosibleAsociarRol(Rol rolBuscado, List<Rol> roles)
        {
            return !contieneElRol(rolBuscado, roles);
        }


        public bool contieneElRol(Rol rolBuscado, List<Rol> roles)
        {
            bool resultado = false;
            foreach (Rol rolHijo in roles)
            {
                if (rolHijo.Codigo == rolBuscado.Codigo)
                {
                    return true;
                }
                if (rolHijo is Familia)
                {
                    resultado = contieneElRol(rolBuscado, ((Familia)rolHijo).Roles);
                    if (resultado == true)
                    {
                        return resultado;
                    }
                }
            }
            return resultado;

        }

        public bool esPosibleDesociarRol(Rol rolBuscado, Usuario usuario)
        {
            if (usuario.Id == Sesion.Instancia().UsuarioActual.Id)
            {
                return false;
            }
            else
            {
                foreach (Rol rolHijo in usuario.Roles)
                {
                    if (rolHijo.Codigo == rolBuscado.Codigo)
                    {
                        return true;
                    }
                }
            }
            return false;
        }

    }
}
