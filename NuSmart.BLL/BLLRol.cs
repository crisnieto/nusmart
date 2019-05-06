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
       public Familia conseguir( Usuario usuario )
        {
            Familia familia = new Familia();

            DALRol dalRol = new DALRol();

            Familia roles = dalRol.conseguirRolesDeUsuario(usuario);
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
