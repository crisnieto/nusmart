using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NuSmart.BE
{
    public class Alimento : ComidaDieta
    {
        private int _id;
        private string _nombre;
        private int _calorias;
        private string _tipoAlimento;
        private bool _eliminado;

        public int Id
        {
            get
            {
                return _id;
            }

            set
            {
                _id = value;
            }
        }

        public string Nombre
        {
            get
            {
                return _nombre;
            }

            set
            {
                _nombre = value;
            }
        }

        public int Calorias
        {
            get
            {
                return _calorias;
            }

            set
            {
                _calorias = value;
            }
        }

        public string TipoAlimento
        {
            get
            {
                return _tipoAlimento;
            }

            set
            {
                _tipoAlimento = value;
            }
        }

        public bool Eliminado
        {
            get
            {
                return _eliminado;
            }

            set
            {
                _eliminado = value;
            }
        }

        public override string ToString()
        {
            return _nombre;
        }
    }
}
