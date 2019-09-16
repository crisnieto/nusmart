using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NuSmart.BE;

namespace NuSmart.BE
{
    public class NuSmartMessage
    {
        public static string formatearMensaje(string message)
        {
            Leyenda leyenda = Sesion.Instancia().IdiomaActual.Leyendas.Find(i => i.NombreControl == message);

            if (leyenda != null)
            {
                return leyenda.Texto;
            }
            else
            {
                return message;
            }
        }
    }
}
