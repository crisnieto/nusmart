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
       public List<Rol> conseguir( Usuario usuario )
        {
            Familia familia = new Familia();

            DALRol dalRol = new DALRol();

            List<Rol> roles = dalRol.conseguirRolesDeUsuario(usuario);
            return roles;
        }

        public void eliminar()
        {

        }

        public void insertar()
        {

        }
    }
}
