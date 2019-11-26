using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NuSmart.BE
{
    public class DiaAlimenticio
    {
        int _id;
        string _nombre;
        Plato _desayuno;
        Plato _colacion;
        Plato _almuerzo;
        Plato _merienda;
        Plato _cena;

        public DiaAlimenticio()
        {
            _desayuno = new Plato();
            _colacion = new Plato();
            _almuerzo = new Plato();
            _merienda = new Plato();
            _cena = new Plato();
        }

        public Plato Desayuno
        {
            get
            {
                return _desayuno;
            }

            set
            {
                _desayuno = value;
            }
        }

        public Plato Colacion
        {
            get
            {
                return _colacion;
            }

            set
            {
                _colacion = value;
            }
        }

        public Plato Almuerzo
        {
            get
            {
                return _almuerzo;
            }

            set
            {
                _almuerzo = value;
            }
        }

        public Plato Merienda
        {
            get
            {
                return _merienda;
            }

            set
            {
                _merienda = value;
            }
        }

        public Plato Cena
        {
            get
            {
                return _cena;
            }

            set
            {
                _cena = value;
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

        public override string ToString()
        {
            return _nombre;
        }
    }
}
