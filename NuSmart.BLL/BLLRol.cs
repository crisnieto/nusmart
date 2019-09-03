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
            List<Rol> roles = dalRol.conseguirRoles();
            return roles;
        }

        public void eliminar(Rol rol)
        {
            dalRol.desasociarDeTodos(rol);
            dalRol.eliminarRecursivamente(rol.Id);
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
            return dalRol.crearRol(rol, padre);

        }

        public bool asociarAUsuario(Rol rol, Usuario usuario)
        {
            if (esPosibleAsociarRol(rol, usuario.Roles))
            {
                return dalRol.asociarRolAUsuario(rol, usuario);
            }
            else
            {
                throw new Exception("No es posible asociar el rol. Verifique que efectivamente no sea parte de una familia que lo posea");
            }
        }

        public bool desasociarDeUsuario(Rol rol, Usuario usuario)
        {
            if (esPosibleDesociarRol(rol, usuario))
            {
                return dalRol.desasociarDeUsuario(rol, usuario);
            }
            else
            {
                throw new Exception("No es posible desasociar el rol. Verifique que efectivamente no sea parte de una familia que lo posea");
            }
        }


        public bool esPosibleAsociarRol(Rol rolBuscado, List<Rol> roles)
        {
            bool resultado = true;
            foreach(Rol rolHijo in roles){
                if (rolHijo.Codigo == rolBuscado.Codigo)
                {
                    return false;
                }
                if(rolHijo is Familia)
                {
                       resultado = esPosibleAsociarRol(rolBuscado ,((Familia)rolHijo).Roles);
                       if(resultado == false){
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
