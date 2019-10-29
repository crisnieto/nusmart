using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NuSmart.BE
{
    public interface ComidaDieta
    {
        int Id { get; set; }
        string Nombre { get; set; }
        int Calorias { get; set; }
    }
}
