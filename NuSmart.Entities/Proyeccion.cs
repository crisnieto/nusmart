using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NuSmart.BE
{
    public class Proyeccion
    {
        double pesoActual;

        double grasaCorporalActual;
        double grasaCorporalObjetivo;

        double pesoObjetivo;

        int semanas;
        List<Fase> fases; 
        List<PuntoProyeccion> puntos;

        public Proyeccion()
        {
            puntos = new List<PuntoProyeccion>();
        }

        public double PesoActual
        {
            get
            {
                return pesoActual;
            }

            set
            {
                pesoActual = value;
            }
        }

        public double GrasaCorporalActual
        {
            get
            {
                return grasaCorporalActual;
            }

            set
            {
                grasaCorporalActual = value;
            }
        }

        public double GrasaCorporalObjetivo
        {
            get
            {
                return grasaCorporalObjetivo;
            }

            set
            {
                grasaCorporalObjetivo = value;
            }
        }

        public double PesoObjetivo
        {
            get
            {
                return pesoObjetivo;
            }

            set
            {
                pesoObjetivo = value;
            }
        }

        public List<PuntoProyeccion> Puntos
        {
            get
            {
                return puntos;
            }

            set
            {
                puntos = value;
            }
        }

        public int Semanas
        {
            get
            {
                return semanas;
            }

            set
            {
                semanas = value;
            }
        }

        public List<Fase> Fases
        {
            get
            {
                return fases;
            }

            set
            {
                fases = value;
            }
        }
    }
}
