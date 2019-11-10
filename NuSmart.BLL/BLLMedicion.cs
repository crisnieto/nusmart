using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NuSmart.BE;
using NuSmart.DAL;

namespace NuSmart.BLL
{
    public class BLLMedicion
    {
        DALMedicion dalMedicion;

        public BLLMedicion()
        {
            dalMedicion = new DALMedicion();
        }

        public List<Medicion> conseguirMediciones(Paciente paciente)
        {
            return dalMedicion.conseguirMediciones(paciente);
        }

        public Medicion conseguirUltimaMedicion(Paciente paciente)
        {
            Medicion ultimaMedicion = null;
            foreach(Medicion medicion in conseguirMediciones(paciente))
            {
                if(ultimaMedicion == null)
                {
                    ultimaMedicion = medicion;
                }
                if(DateTime.Compare(medicion.Fecha, ultimaMedicion.Fecha) > 0)
                {
                    ultimaMedicion = medicion;
                }
            }
            return ultimaMedicion;
        }

        public Medicion obtenerPrimeraMedicionTratamiento(Tratamiento tratamiento)
        {
            Medicion primeraMedicion = null;
            foreach (Medicion medicion in conseguirMediciones(tratamiento.Paciente))
            {
                if (DateTime.Compare(medicion.Fecha.Date, tratamiento.FechaInicio.Date) == 0)
                {
                    primeraMedicion = medicion;
                    break;
                }
            }
            return primeraMedicion;
        }


        public void calcularBMI(Medicion medicion)
        {

            medicion.Bmi = Math.Round((medicion.Peso / (medicion.Altura * medicion.Altura)), 1);

            medicion.CategoriaBmi = calcularCategoriaBMI(medicion.Bmi);

        }

        public void calcularBFP(Medicion medicion, int edad, string sexo)
        {
            calcularBMI(medicion);
            double porcentaje;

            int multiplicadorSexo = sexo == "M" ? 1 : 0;


            if (edad >= 18)
            {
                porcentaje = 1.20 * medicion.Bmi + (0.23 * edad) - (10.8 * multiplicadorSexo) - 5.4 ;
            }
            else
            {
                porcentaje = (1.51 * medicion.Bmi) - (0.70 * edad) - (3.6 * multiplicadorSexo) + 1.4;

            }

            if (sexo == "M")
            {
                if(porcentaje < 18 )
                {
                    medicion.CategoriaBfp = "Atletico";
                }
                else if(porcentaje >= 18 && porcentaje < 25)
                {
                    medicion.CategoriaBfp = "Parmetros Sanos";
                }
                else if(porcentaje >= 25)
                {
                    medicion.CategoriaBfp = "Excedido en Grasa Corporal";
                }
            }else if (sexo == "F")
            {
              
                if (porcentaje < 25)
                {
                    medicion.CategoriaBfp = "Atletico";
                }
                else if (porcentaje >= 25 && porcentaje < 32)
                {
                    medicion.CategoriaBfp = "Parmetros Sanos";
                }
                else if (porcentaje >= 32)
                {
                    medicion.CategoriaBfp ="Excedido en Grasa Corporal";
                }
            }
            medicion.Bfp = porcentaje;
        }

        public string calcularCategoriaBMI(double indiceBMI)
        {
            if (esBajoDePeso(indiceBMI))
            {
                return "Bajo de Peso";
            }
            else if(esSano(indiceBMI)){
                return "Sano";
            }
            else if (esSobrepeso(indiceBMI))
            {
                return "Sobrepeso";
            }
            else if (esObeso(indiceBMI))
            {
                return "Obesidad";
            }
            else if (esExtremadamenteObeso(indiceBMI)){
                return "Extremadamente Obeso";
            }
            return null;
        }

        public bool esBajoDePeso(double indice)
        {
            return indice < 18;
        }

        public bool esSano(double indice)
        {
            return indice >= 18 && indice < 25;
        }

        public bool esSobrepeso(double indice)
        {
            return indice >= 25 && indice < 30;
        }

        public bool esObeso(double indice)
        {
            return indice >= 30 && indice < 40;
        }

        public bool esExtremadamenteObeso(double indice)
        {
            return indice >= 40;
        }

        public void guardarMedicionDeTurno(Turno turno)
        {
            dalMedicion.guardarMedicionDeTurno(turno);
        }

    }
}
