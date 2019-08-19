using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NuSmart.BE
{
    public class Familia : Rol
    {
        List<Rol> roles;

        public Familia()
        {
            Roles1 = new List<Rol>();
        }

        public List<Rol> Roles1
        {
            get
            {
                return roles;
            }

            set
            {
                roles = value;
            }
        }

        public override void agregar(Rol rol)
        {
            Roles1.Add(rol);
        }

        public override void eliminar(Rol rol)
        {
            Roles1.Remove(rol);
        }

        public override List<Rol> mostrar()
        {
            return Roles1;
        }

    }
}
