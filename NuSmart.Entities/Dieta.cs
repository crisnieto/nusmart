using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NuSmart.BE
{
    public class Dieta
    {
        int _id;
        string _nombre;
        bool _esAutomatica;
        DiaAlimenticio _lunes;
        DiaAlimenticio _martes;
        DiaAlimenticio _miercoles;
        DiaAlimenticio _jueves;
        DiaAlimenticio _viernes;
        DiaAlimenticio _sabado;
        DiaAlimenticio _domingo;

        public Dieta()
        {
            _lunes = new DiaAlimenticio();
            _martes = new DiaAlimenticio();
            _miercoles = new DiaAlimenticio();
            _jueves = new DiaAlimenticio();
            _viernes = new DiaAlimenticio();
            _sabado = new DiaAlimenticio();
            _domingo = new DiaAlimenticio();

            _lunes.Nombre = "Lunes";
            _martes.Nombre = "Martes";
            _miercoles.Nombre = "Miercoles";
            _jueves.Nombre = "Jueves";
            _viernes.Nombre = "Viernes";
            _sabado.Nombre = "Sabado";
            _domingo.Nombre = "Domingo";


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

        public bool EsAutomatica
        {
            get
            {
                return _esAutomatica;
            }

            set
            {
                _esAutomatica = value;
            }
        }

        public DiaAlimenticio Lunes
        {
            get
            {
                return _lunes;
            }

            set
            {
                _lunes = value;
            }
        }

        public DiaAlimenticio Martes
        {
            get
            {
                return _martes;
            }

            set
            {
                _martes = value;
            }
        }

        public DiaAlimenticio Miercoles
        {
            get
            {
                return _miercoles;
            }

            set
            {
                _miercoles = value;
            }
        }

        public DiaAlimenticio Jueves
        {
            get
            {
                return _jueves;
            }

            set
            {
                _jueves = value;
            }
        }

        public DiaAlimenticio Viernes
        {
            get
            {
                return _viernes;
            }

            set
            {
                _viernes = value;
            }
        }

        public DiaAlimenticio Sabado
        {
            get
            {
                return _sabado;
            }

            set
            {
                _sabado = value;
            }
        }

        public DiaAlimenticio Domingo
        {
            get
            {
                return _domingo;
            }

            set
            {
                _domingo = value;
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
