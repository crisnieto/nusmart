using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NuSmart.BLL
{
    public class DVVH
    {
        public bool verificarIntegridad() {
            DAL.DVVH dalDVVH = new DAL.DVVH();
            //dalDVVH.conseguirDVV();

            //dalDVVH.obtenerListaDVHdeTabla()
            return true;
        }

        public int calcularDVV(List<int> i)
        {
            return 0;
        }

        public bool compararCalculadoConObtenido(int calculado, int obtenido)
        {   
            return true;
        }
    }
}
