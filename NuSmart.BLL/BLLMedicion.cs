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


        public BMI calcularBMI(double peso, double altura)
        {
            BMI bmi = new BMI();

            bmi.Indice = Math.Round((peso / (altura * altura)), 1);

            bmi.Categoria = calcularCategoriaBMI(bmi.Indice);

            return bmi;
        }

        public string calcularBFP(double peso, double altura, int edad, string sexo)
        {
            BMI bmi = calcularBMI(peso, altura);
            double porcentaje;

            int multiplicadorSexo = sexo == "M" ? 1 : 0;


            if (edad >= 18)
            {
                porcentaje = 1.20 * bmi.Indice + (0.23 * edad) - (10.8 * multiplicadorSexo) - 5.4 ;
            }
            else
            {
                porcentaje = (1.51 * bmi.Indice) - (0.70 * edad) - (3.6 * multiplicadorSexo) + 1.4;

            }

            if (sexo == "M")
            {
                if(porcentaje < 18 )
                {
                    return "Atletico";
                }
                else if(porcentaje >= 18 && porcentaje < 25)
                {
                    return "Parmetros Sanos";
                }
                else if(porcentaje >= 25)
                {
                    return "Excedido en Grasa Corporal";
                }
            }else if (sexo == "F")
            {
              
                if (porcentaje < 25)
                {
                    return "Atletico";
                }
                else if (porcentaje >= 25 && porcentaje < 32)
                {
                    return "Parmetros Sanos";
                }
                else if (porcentaje >= 32)
                {
                    return "Excedido en Grasa Corporal";
                }
            }
            return null;
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
