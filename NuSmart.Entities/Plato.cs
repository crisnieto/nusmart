using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NuSmart.BE
{
    public class Plato
    {
        int id;
        string nombre;
        int calorias;
        bool esDesayuno = false;
        bool esColacion = false;
        bool esMerienda = false;
        bool esPlatoPrincipal = false;

        List<Alimento> _alimentos;

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

        public bool EsPlatoPrincipal
        {
            get
            {
                return esPlatoPrincipal;
            }

            set
            {
                esPlatoPrincipal = value;
            }
        }

        public bool EsDesayuno
        {
            get
            {
                return esDesayuno;
            }

            set
            {
                esDesayuno = value;
            }
        }


        public bool EsMerienda
        {
            get
            {
                return esMerienda;
            }

            set
            {
                esMerienda = value;
            }
        }

        
        public bool EsColacion
        {
            get
            {
                return esColacion;
            }

            set
            {
                esColacion = value;
            }
        }


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
    }
}
