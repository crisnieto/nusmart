﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NuSmart.BE;

namespace NuSmart.BLL
{
    public class BLLProyeccion : BLLBase
    {

        public BLLProyeccion()
        {
        }

        public Proyeccion calcularProyeccion(DateTime fechaInicio, double pesoActual, double porcentajeGrasaActual, double porcentajeGrasaCorporalIdeal)
        {
            verificarPermiso("OP034");

            if (porcentajeGrasaActual < porcentajeGrasaCorporalIdeal)
            {
                throw new Exception(NuSmartMessage.formatearMensaje("Proyeccion_error_objetivo"));
            }

            if(pesoActual < 0 || porcentajeGrasaActual < 0  || porcentajeGrasaCorporalIdeal < 0)
            {
                throw new Exception(NuSmartMessage.formatearMensaje("Proyeccion_error_proyeccion"));
            }

            try
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
                crearNuevaBitacora("Proyeccion de peso", "Se solicito una nueva proyeccion de peso", Criticidad.Media);
                return proyeccion;
            }catch(Exception ex)
            {
                crearNuevaBitacora("Proyeccion de peso", "Ocurrio un error al realizar la proyeccion de peso: " + ex.Message, Criticidad.Alta);
                throw new Exception(NuSmartMessage.formatearMensaje("Proyeccion_error_proyeccion"));
            }

            
        }


        public void obtenerPuntosParaProyeccion(Proyeccion proyeccion)
        {
            double diferenciaDePeso = proyeccion.PesoActual - proyeccion.PesoObjetivo;

            Fase primeraFasePeso = new Fase(37, 10);
            Fase segundaFasePeso = new Fase(55, 25);
            Fase terceraFasePeso = new Fase(80, 55);
            Fase cuartaFasePeso = new Fase(100, 100);


            proyeccion.Fases = new List<Fase>() {primeraFasePeso, segundaFasePeso, terceraFasePeso, cuartaFasePeso };

            

            PuntoProyeccion primerPunto = new PuntoProyeccion();
            primerPunto.puntoFecha = 0;
            primerPunto.puntoPeso = proyeccion.PesoActual;

            proyeccion.Puntos.Add(primerPunto);

            foreach(Fase fase in proyeccion.Fases)
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
