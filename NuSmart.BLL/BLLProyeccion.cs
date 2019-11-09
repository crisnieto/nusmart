using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NuSmart.BE;

namespace NuSmart.BLL
{
    public class BLLProyeccion
    {

        public Proyeccion calcularProyeccion(DateTime fechaInicio, double pesoActual, double porcentajeGrasaActual, double porcentajeGrasaCorporalIdeal)
        {
            double masaGrasa = porcentajeGrasaActual * pesoActual / 100;

            double masaMagra = pesoActual - masaGrasa;

            double porcentajeObjetivoMasaMagra = (100 - porcentajeGrasaCorporalIdeal) * 0.01;

            double pesoTotalObjetivo = masaMagra / porcentajeObjetivoMasaMagra;

            double masaGrasaAPerder = pesoActual - pesoTotalObjetivo;

            double masaGrasaFinal = masaGrasa - masaGrasaAPerder;

            double deficitMaximoDiario = ((masaGrasa + masaGrasaFinal) / 2) * 66;

            double deficitDiarioMediaAjustado = deficitMaximoDiario - 100;

            double caloriasMasaGrasaAPerder = masaGrasaAPerder * 7700;

            int diasALaMeta = Convert.ToInt32(caloriasMasaGrasaAPerder / deficitDiarioMediaAjustado);
            int semanasALaMeta = diasALaMeta / 7;

            Proyeccion proyeccion = new Proyeccion();

            proyeccion.PesoActual = pesoActual;
            proyeccion.PesoObjetivo = pesoTotalObjetivo;
            proyeccion.GrasaCorporalActual = porcentajeGrasaActual;
            proyeccion.GrasaCorporalObjetivo = porcentajeGrasaCorporalIdeal;
            proyeccion.Semanas = semanasALaMeta >= 0 ? semanasALaMeta : semanasALaMeta * -1;

            obtenerPuntosParaProyeccion(proyeccion);
            return proyeccion;
            
        }


        public void obtenerPuntosParaProyeccion(Proyeccion proyeccion)
        {
            double diferenciaDePeso = proyeccion.PesoActual - proyeccion.PesoObjetivo;

            Fase primeraFasePeso = new Fase(37, 10);
            Fase segundaFasePeso = new Fase(55, 20);
            Fase terceraFasePeso = new Fase(80, 30);
            Fase cuartaFasePeso = new Fase(88, 65);
            Fase quintaFasePeso = new Fase(100, 100);


            List<Fase> fases = new List<Fase>() {primeraFasePeso, segundaFasePeso, terceraFasePeso, cuartaFasePeso };

            PuntoProyeccion primerPunto = new PuntoProyeccion();
            primerPunto.puntoFecha = 0;
            primerPunto.puntoPeso = proyeccion.PesoActual;

            proyeccion.Puntos.Add(primerPunto);

            foreach(Fase fase in fases)
            {
                PuntoProyeccion punto = new PuntoProyeccion();
                punto.puntoPeso = proyeccion.PesoActual - (diferenciaDePeso * (fase.porcetajePeso * 0.01));

                double semanasAgregadas = fase.porcentajeTiempo * proyeccion.Semanas / 100;

                punto.puntoFecha = semanasAgregadas;

                proyeccion.Puntos.Add(punto);
            }

        }

    }
}
