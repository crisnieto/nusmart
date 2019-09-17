using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NuSmart.BE;
using NuSmart.DAL;

namespace NuSmart.BLL
{
    public class DVVH
    {
        string[] listaTablasIntegridad =
         {
               "Usuario",
               "Nutricionista",
            };

        public bool verificarIntegridad()
        {
            //Primero debo obtener todas las tablas que tienen DVH y DVV
            DAL.DVVH dalDVVH = new DAL.DVVH();
            foreach (string tabla in listaTablasIntegridad)
            {
                List<int> listaDeDVH = dalDVVH.obtenerListaDVHdeTabla(tabla);
                int dvvObtenido = dalDVVH.conseguirDVV(tabla);
                compararCalculadoConObtenido(calcularDVV(listaDeDVH), dvvObtenido);
            }
            BLLUsuario bllUsuario = new BLLUsuario();
            BLLNutricionista bllNutricionista = new BLLNutricionista();
            foreach (Usuario usuario in bllUsuario.conseguirUsuarios())
            {
                if (bllUsuario.calcularDVH(usuario) != usuario.Dvh)
                {
                    Console.WriteLine(usuario.Username);
                    lanzarErrorDeVerificacion();
                }
            }

            foreach (Nutricionista nutricionista in bllNutricionista.conseguirTodos())
            {
                if (bllNutricionista.calcularDVH(nutricionista) != nutricionista.Dvh)
                {
                    Console.WriteLine(nutricionista.Id);
                    lanzarErrorDeVerificacion();
                }
            }
            return true;
        }

        public int calcularDVV(List<int> i)
        {
            //Aca sumo cada uno de los DVH obtenidos para obtener el DVV calculado.
            int dvvCalculado = 0;
            foreach (int dvh in i)
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
                lanzarErrorDeVerificacion();
            }
        }

        public void lanzarErrorDeVerificacion()
        {
            throw new Exception("Existe un error de integridad, cerrando aplicación.");
        }
    }
}
    
