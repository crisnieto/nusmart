using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NuSmart.BE
{
    public class Plato : ComidaDieta
    {
        int _id;
        string _nombre;
        int _calorias;
        bool _esDesayuno = false;
        bool _esColacion = false;
        bool _esMerienda = false;
        bool _esPlatoPrincipal = false;
        bool _eliminado = false;
        List<Alimento> _alimentos;

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

        public bool EsPlatoPrincipal
        {
            get
            {
                return _esPlatoPrincipal;
            }

            set
            {
                _esPlatoPrincipal = value;
            }
        }

        public bool EsDesayuno
        {
            get
            {
                return _esDesayuno;
            }

            set
            {
                _esDesayuno = value;
            }
        }


        public bool EsMerienda
        {
            get
            {
                return _esMerienda;
            }

            set
            {
                _esMerienda = value;
            }
        }

        
        public bool EsColacion
        {
            get
            {
                return _esColacion;
            }

            set
            {
                _esColacion = value;
            }
        }


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

        

        public List<Alimento> Alimentos
        {
            get
            {
                return _alimentos;
            }

            set
            {
                _alimentos = value;
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
    }
}
