using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NuSmart.BE
{
    public class Fase
    {
        public double porcetajePeso;
        public double porcentajeTiempo;

        public Fase(int porcetajePeso, int porcentajeTiempo)
        {
            this.porcetajePeso = porcetajePeso;
            this.porcentajeTiempo = porcentajeTiempo;
        }
    }
}
