using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NuSmart.BE;

namespace NuSmart.BLL
{
    class BLLContextoDietaAutomatica
    {
        BLLDietaEstrategia estrategia;

        public void asociarEstrategia(BLLDietaEstrategia estrategia)
        {
            this.estrategia = estrategia;
        }

        public Dieta calcularDieta(List<Plato> platos)
        {
            return estrategia.calcularDietaAutomatica(platos);
        }
    }
}
