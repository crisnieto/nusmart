using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NuSmart.BE
{
    public class Leyenda
    {
        int _id;
        string _nombre;
        string _texto;

        public string Nombre { get => _nombre; set => _nombre = value; }
        public string Texto { get => _texto; set => _texto = value; }
        public int Id { get => _id; set => _id = value; }
    }
}
