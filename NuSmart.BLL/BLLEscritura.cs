using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NuSmart.BE;
using NuSmart.BLL;
using System.IO;


namespace NuSmart.BLL
{
    public class BLLEscritura
    {


        public string escribir(Tratamiento tratamiento, Turno turno)
        {
            StringBuilder sp = new StringBuilder();
            sp.Append(turno.Paciente.Nombre + turno.Paciente.Apellido + " - " + turno.Fecha.Date);
            nuevaLinea(sp);
            separador(sp);
            sp.Append("Dieta");
            nuevaLinea(sp);
            agregarDiaAlimenticio(tratamiento.Dieta.Lunes, "Lunes", sp);
            agregarDiaAlimenticio(tratamiento.Dieta.Martes, "Martes", sp);
            agregarDiaAlimenticio(tratamiento.Dieta.Miercoles, "Miercoles", sp);
            agregarDiaAlimenticio(tratamiento.Dieta.Jueves, "Jueves", sp);
            agregarDiaAlimenticio(tratamiento.Dieta.Viernes, "Viernes", sp);
            agregarDiaAlimenticio(tratamiento.Dieta.Sabado, "Sabado", sp);
            agregarDiaAlimenticio(tratamiento.Dieta.Domingo, "Domingo", sp);
            separador(sp);
            sp.Append("Rutina");
            agregarRutinaEjercicios(tratamiento.Rutina, sp);

            string textFile = System.AppContext.BaseDirectory + turno.Paciente.Nombre + "_" + turno.Paciente.Apellido + "_" + turno.Id+ ".txt";
            File.WriteAllText(textFile, sp.ToString());
            return textFile;
        }

        private void nuevaLinea(StringBuilder sp)
        {
            sp.Append("\n");
        }

        private void separador(StringBuilder sp)
        {
            sp.Append("\n");
            sp.Append("--------------------");
            sp.Append("\n");
        }

        private void agregarDiaAlimenticio(DiaAlimenticio dia, string nombre, StringBuilder sp)
        {
            separador(sp);
            sp.Append(nombre + ":");
            nuevaLinea(sp);
            sp.Append("    Desayuno: " + dia.Desayuno.Nombre + " - Calorias: " + dia.Desayuno.Calorias);
            nuevaLinea(sp);
            sp.Append("    Colacion: " + dia.Colacion.Nombre + "- Calorias: " + dia.Colacion.Calorias);
            nuevaLinea(sp);
            sp.Append("    Almuerzo: " + dia.Almuerzo.Nombre + "- Calorias: " + dia.Almuerzo.Calorias);
            nuevaLinea(sp);
            sp.Append("    Merienda: " + dia.Merienda.Nombre + "- Calorias: " + dia.Merienda.Calorias);
            nuevaLinea(sp);
            sp.Append("    Cena: " + dia.Cena.Nombre + "- Calorias: " + dia.Cena.Calorias);
        }

        private void agregarRutinaEjercicios(Rutina rutina, StringBuilder sp)
        {
            if(rutina != null)
            {
                nuevaLinea(sp);
                sp.Append("Lunes: " + rutina.DiaEjercicioLunes.Ejercicio.Nombre + " - Duracion: " + rutina.DiaEjercicioLunes.Duracion + " - Calorias: " + rutina.DiaEjercicioLunes.Calorias);
                nuevaLinea(sp);
                sp.Append("Martes: " + rutina.DiaEjercicioMartes.Ejercicio.Nombre + " - Duracion: " + rutina.DiaEjercicioMartes.Duracion + " - Calorias: " + rutina.DiaEjercicioMartes.Calorias);
                nuevaLinea(sp);
                sp.Append("Miercoles: " + rutina.DiaEjercicioMiercoles.Ejercicio.Nombre + " - Duracion: " + rutina.DiaEjercicioMiercoles.Duracion + " - Calorias: " + rutina.DiaEjercicioMiercoles.Calorias);
                nuevaLinea(sp);
                sp.Append("Jueves: " + rutina.DiaEjercicioJueves.Ejercicio.Nombre + " - Duracion: " + rutina.DiaEjercicioJueves.Duracion + " - Calorias: " + rutina.DiaEjercicioJueves.Calorias);
                nuevaLinea(sp);
                sp.Append("Viernes: " + rutina.DiaEjercicioViernes.Ejercicio.Nombre + " - Duracion: " + rutina.DiaEjercicioViernes.Duracion + " - Calorias: " + rutina.DiaEjercicioViernes.Calorias);
                nuevaLinea(sp);
                sp.Append("Sabado: " + rutina.DiaEjercicioSabado.Ejercicio.Nombre + " - Duracion: " + rutina.DiaEjercicioSabado.Duracion + " - Calorias: " + rutina.DiaEjercicioSabado.Calorias);
                nuevaLinea(sp);
                sp.Append("Domingo: " + rutina.DiaEjercicioDomingo.Ejercicio.Nombre + " - Duracion: " + rutina.DiaEjercicioDomingo.Duracion + " - Calorias: " + rutina.DiaEjercicioDomingo.Calorias);
            }
        }

    }
}
