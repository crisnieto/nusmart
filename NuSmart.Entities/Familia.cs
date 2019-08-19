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
            roles = new List<Rol>();
        }

        public List<Rol> Roles { get => roles; set => roles = value; }

        public override void agregar(Rol rol)
        {
            roles.Add(rol);
        }

        public override void eliminar(Rol rol)
        {
            roles.Remove(rol);
        }

        public override List<Rol> mostrar()
        {
            return roles;
        }

    }
}
