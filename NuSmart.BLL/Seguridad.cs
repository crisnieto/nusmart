using System;
using System.Text;
using NuSmart.BE;
using System.Security.Cryptography;


namespace NuSmart.BLL
{
    class Seguridad
    {
        public string encriptar(string dato)
        {
            MD5 md5 = new MD5CryptoServiceProvider();

            md5.ComputeHash(ASCIIEncoding.ASCII.GetBytes(dato));

            byte[] result = md5.Hash;

            StringBuilder hash = new StringBuilder();
            for (int i = 0; i < result.Length; i++)
            {
                hash.Append(result[i].ToString("x2"));
            }
            return hash.ToString();
        }
        
        public bool validar(Usuario usuarioConseguido, Usuario usuarioIngresado)
        {
            if (usuarioConseguido.Username == usuarioIngresado.Username && usuarioConseguido.Password == usuarioIngresado.Password)
            {
                return true;
            }
            else
            {
                Console.WriteLine(usuarioConseguido.Username);
                Console.WriteLine(usuarioIngresado.Username);

                Console.WriteLine(usuarioConseguido.Password);
                Console.WriteLine(usuarioIngresado.Password);


                Console.WriteLine("Los datos ingresados no concuerdan");
                return false;
            }
        }
    }
}
