using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NuSmart.BE
{
    public class Bitacora
    {
        string actividad;
        string descripción;
        DateTime fecha;
        string tipoCriticidad;

        public string Actividad { get => actividad; set => actividad = value; }
        public string Descripción { get => descripción; set => descripción = value; }
        public DateTime Fecha { get => fecha; set => fecha = value; }
        public string TipoCriticidad { get => tipoCriticidad; set => tipoCriticidad = value; }
    }
}
