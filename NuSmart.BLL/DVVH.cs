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
            string[] listaTablasIntegridad =
            {
               "Usuario",
               "Nutricionista",
               // "Paciente" (no implementado aun ya que es una entidad a desarrollar para el negocio)
            };
            
            //Primero debo obtener todas las tablas que tienen DVH y DVV
            DAL.DVVH dalDVVH = new DAL.DVVH();
            foreach(string tabla in listaTablasIntegridad)
            {
                List<int> listaDeDVH = dalDVVH.obtenerListaDVHdeTabla(tabla);
                int dvvObtenido = dalDVVH.conseguirDVV(tabla);
                compararCalculadoConObtenido(calcularDVV(listaDeDVH), dvvObtenido);
            }
            return true;
        }

        public int calcularDVV(List<int> i)
        {
            //Aca sumo cada uno de los DVH obtenidos para obtener el DVV calculado.
            int dvvCalculado = 0;
            foreach(int dvh in i)
            {
                dvvCalculado += dvh;
            }
            return dvvCalculado;
        }

        public int actualizarDVV(string tabla)
        {
            DAL.DVVH dalDVVH = new DAL.DVVH();
            return dalDVVH.actualizarDVV(tabla);
        }

        public void compararCalculadoConObtenido(int calculado, int obtenido)
        {

            if (calculado == obtenido)
            {
                Console.WriteLine("Calculo de integridad correcto!!!");
            }
            else
            {
                Console.WriteLine("Existe un error de integridad en la base de datos. Por favor contacte a un Administrador");
                throw new Exception("Existe un error de integridad, cerrando aplicación.");
            }
        }
    }
}
