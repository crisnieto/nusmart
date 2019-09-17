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
        BLLUsuario bllUsuario;
        DALNutricionista dalNutricionista;

        public BLLNutricionista()
        {
            dalNutricionista = new DALNutricionista();
            bllUsuario = new BLLUsuario();
        }

        public Nutricionista conseguir(int idUsuario)
        {
            Sesion.Instancia().verificarPermiso("GE110");
            return dalNutricionista.conseguir(idUsuario);
        }

        public List<Nutricionista> conseguirTodos()
        {
            return dalNutricionista.conseguirTodos();
        }
        

        public int calcularDVH(Nutricionista nutricionista)
        {
            string concatenacion = Convert.ToString(nutricionista.Dni) + nutricionista.Especializacion + nutricionista.Matricula + nutricionista.Apellido + Convert.ToString(nutricionista.Usuario.Id) + nutricionista.Nombre + nutricionista.Sexo + Convert.ToString(nutricionista.Eliminado);
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

        public bool ingresar(Nutricionista nutricionista)
        {
            Sesion.Instancia().verificarPermiso("OP038");

            if (!(bllUsuario.existe(nutricionista.Usuario)) && !(existe(nutricionista))){
                bllUsuario.crearUsuario(nutricionista.Usuario);
                nutricionista.Usuario = bllUsuario.conseguir(nutricionista.Usuario.Username);
                nutricionista.Dvh = calcularDVH(nutricionista);
                dalNutricionista.ingresar(nutricionista);
                new DVVH().actualizarDVV("Nutricionista");
                return true;
            }
            else
            {
                throw new Exception("Ya existe el Usuario / Nutricionista. Verifique los datos.");
            }
        }

        public int modificar(Nutricionista nutricionista)
        {
            nutricionista.Dvh = calcularDVH(nutricionista);
            dalNutricionista.modificar(nutricionista);
            return new DVVH().actualizarDVV("Nutricionista");
        }

        public bool existe(Nutricionista nutricionista)
        {
            return dalNutricionista.existe(nutricionista);
        }

        public bool eliminar(Nutricionista nutricionista)
        {
            try
            {
                nutricionista.Eliminado = true;
                nutricionista.Dvh = calcularDVH(nutricionista);
                dalNutricionista.eliminar(nutricionista);
                new DVVH().actualizarDVV("Nutricionista");


                bllUsuario.eliminarUsuario(nutricionista.Usuario);
                return true;
            }catch(Exception e)
            {
                throw new Exception(NuSmartMessage.formatearMensaje("Error al eliminar los usuarios", e));
            }
        }
    }

}
