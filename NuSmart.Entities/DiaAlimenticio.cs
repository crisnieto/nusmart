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
        ComidaDieta _desayuno;
        ComidaDieta _colacion;
        ComidaDieta _almuerzo;
        ComidaDieta _merienda;
        ComidaDieta _cena;

        public DiaAlimenticio()
        {
            _desayuno = new Plato();
            _colacion = new Plato();
            _almuerzo = new Plato();
            _merienda = new Plato();
            _cena = new Plato();
        }

        public ComidaDieta Desayuno
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

        public ComidaDieta Colacion
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

        public ComidaDieta Almuerzo
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

        public ComidaDieta Merienda
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

        public ComidaDieta Cena
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
