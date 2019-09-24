using System;
using System.Collections.Generic;
using NuSmart.BE;
using NuSmart.DAL;

namespace NuSmart.BLL
{
    public class BLLRol
    {

        DALRol dalRol;

        public BLLRol()
        {
            dalRol = new DALRol();
        }

        /// <summary>
        /// Consigue la lista de Roles de un usuario
        /// </summary>
        /// <param name="usuario"></param>
        /// <returns></returns>
        public List<Rol> conseguir(Usuario usuario)
        {
            List<Rol> roles = dalRol.conseguirRolesDeUsuario(usuario);
            return roles;
        }

        /// <summary>
        /// Consigue la lista de Roles global
        /// </summary>
        /// <returns></returns>
        public List<Rol> conseguir()
        {
            Sesion.Instancia().verificarPermiso("AA099");
            List<Rol> roles = dalRol.conseguirRoles();
            return roles;
        }

        /// <summary>
        /// Se encarga de solicitar la eliminacion de un rol a la base de datos y de eliminar todos sus hijos.
        /// Tambien desasocia el rol previamente de todos los usuarios.
        /// </summary>
        /// <param name="rol"></param>
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

        /// <summary>
        /// Se encarga de crear un rol nuevo en la base de datos. Puede tambien tener un padre con lo que se trataria de asociar un nuevo permiso a una familia.
        /// </summary>
        /// <param name="rol"></param>
        /// <param name="padre"></param>
        /// <returns></returns>
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

        /// <summary>
        /// Se encarga de asociar un Rol a un usuario en particular.
        /// </summary>
        /// <param name="rol"></param>
        /// <param name="usuario"></param>
        /// <returns></returns>
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

        /// <summary>
        /// Se encarga de eliminar la asociacion de un usuario con un rol particular.
        /// </summary>
        /// <param name="rol"></param>
        /// <param name="usuario"></param>
        /// <returns></returns>
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


        /// <summary>
        /// Verifica si ya el rol ya existe en una lista de roles previa.
        /// </summary>
        /// <param name="rolBuscado"></param>
        /// <param name="roles"></param>
        /// <returns></returns>
        public bool esPosibleAsociarRol(Rol rolBuscado, List<Rol> roles)
        {
            return !contieneElRol(rolBuscado, roles);
        }


        /// <summary>
        /// Busca recursivamente si ya existe el rol en la lista de roles previamente recibida.
        /// </summary>
        /// <param name="rolBuscado"></param>
        /// <param name="roles"></param>
        /// <returns></returns>
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

        /// <summary>
        /// Valida que no se pueda desasociar un usuario a si mismo roles.
        /// A su vez, busca recursivamente para validar si el rol que se quiere desasociar se encuentra en la lista de roles del usuario.
        /// </summary>
        /// <param name="rolBuscado"></param>
        /// <param name="usuario"></param>
        /// <returns></returns>
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
