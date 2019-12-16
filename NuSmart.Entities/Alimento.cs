using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NuSmart.BE
{
    public class Alimento
    {
        private int id;
        private string nombre;
        private int calorias;
        private string tipoAlimento;

        public int Id
        {
            get
            {
                return id;
            }

            set
            {
                id = value;
            }
        }

        public string Nombre
        {
            get
            {
                return nombre;
            }

            set
            {
                nombre = value;
            }
        }

        public int Calorias
        {
            get
            {
                return calorias;
            }

            set
            {
                calorias = value;
            }
        }

        public string TipoAlimento
        {
            get
            {
                return tipoAlimento;
            }

            set
            {
                tipoAlimento = value;
            }
        }

        public override string ToString()
        {
            return nombre;
        }
    }
}
