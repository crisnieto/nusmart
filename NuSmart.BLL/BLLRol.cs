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

       public List<Rol> conseguir( Usuario usuario )
        {
            Familia familia = new Familia();

            List<Rol> roles = dalRol.conseguirRolesDeUsuario(usuario);
            return roles;
        }

        public void eliminar(Rol rol)
        {
            dalRol.eliminarRecursivamente(rol.Id);
        }

        public void insertar()
        {

        }

        public List<Rol> conseguirRolesHijosdeFamilia(Familia familia)
        {
            return dalRol.conseguirHijosDeFamilia(familia);
        }

        public bool validarCodigoDeRol(string codigo)
        {
            if(codigo.Length > 0) {
            return dalRol.validarCodigoDeRol(codigo);
            }
            return false;
        }

           
    }
}
