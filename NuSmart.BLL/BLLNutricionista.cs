using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NuSmart.DAL;
using NuSmart.BE;

namespace NuSmart.BLL
{
    public class BLLNutricionista
    {
        DALNutricionista dalNutricionista;

        public BLLNutricionista()
        {
            dalNutricionista = new DALNutricionista();
        }

        public Nutricionista conseguir(int idUsuario)
        {
            return dalNutricionista.conseguir(idUsuario);
        }
        

        public int calcularDVH(Nutricionista nutricionista)
        {
            string concatenacion = Convert.ToString(nutricionista.Dni) + nutricionista.Especializacion + nutricionista.Matricula + nutricionista.Apellido + Convert.ToString(nutricionista.Usuario.ID) + nutricionista.Sexo;
            Seguridad seguridad = new Seguridad();
            string md5 = seguridad.encriptar(concatenacion);


            //En este punto, verifico cada uno de los caracteres del MD5 obtenido, y los transformo al numero de codigo ASCII
            //multiplicado por su posicion en la cadena original
            byte[] asciiBytes = Encoding.ASCII.GetBytes(md5);

            int DVH = 0;
            int posicion = 0;

            foreach (byte b in asciiBytes)
            {
                posicion += 1;
                DVH = DVH + (int)b * posicion;
            }

            Console.WriteLine("DVH CONSEGUIDO = {0}", DVH);
            return DVH;

        }

        public int ingresar(Nutricionista nutricionista)
        {
            nutricionista.Dvh = calcularDVH(nutricionista);
            dalNutricionista.ingresar(nutricionista);
            return new DVVH().actualizarDVV("Nutricionista");
        }
    }
}
