using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NuSmart.BE
{
    public abstract class Rol
    {
        int id;
        string descripcion;
        string codigo;

        public string Descripcion { get => descripcion; set => descripcion = value; }
        public string Codigo { get => codigo; set => codigo = value; }
        public int Id { get => id; set => id = value; }

        abstract public void agregar(Rol rol);

        abstract public void eliminar(Rol rol);

        abstract public List<Rol> mostrar();

        public override string ToString()
        {
            return this.codigo + " - " + this.descripcion;
        }

    }
}
