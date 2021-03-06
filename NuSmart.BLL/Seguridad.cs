﻿using System;
using System.Text;
using NuSmart.BE;
using System.Security.Cryptography;


namespace NuSmart.BLL
{
    class Seguridad
    {
        /// <summary>
        /// encriptar convierte el dato entrante en un hash MD5 en formato Hexadecimal.
        /// </summary>
        /// <param name="dato"></param>
        /// <returns></returns>
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
        

        /// <summary>
        /// validar se encarga de validar que los atributos de usuario y password ingresados sean iguales a los guardados.
        /// </summary>
        /// <param name="usuarioConseguido"></param>
        /// <param name="usuarioIngresado"></param>
        /// <returns></returns>
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

        /// <summary>
        /// Se encarga de verificar si el usuario se encuentra bloqueado.
        /// Cuando el usuario tiene 3 intentos, se lo considera bloqueado.
        /// </summary>
        /// <param name="usuario"></param>
        /// <returns></returns>
        public bool esBloqueado(Usuario usuario)
        {
            if(usuario.Intentos >= 3)
            {
                return true;
            }else
            {
                return false;
            }
        }
    }
}
