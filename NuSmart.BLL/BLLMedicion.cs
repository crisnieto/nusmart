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
        BLLBitacora bllBitacora;

        public BLLMedicion()
        {
            dalMedicion = new DALMedicion();
            bllBitacora = new BLLBitacora();
        }

        public List<Medicion> conseguirMediciones(Paciente paciente)
        {
            try {
                return dalMedicion.conseguirMediciones(paciente);
            }catch(Exception ex)
            {
                bllBitacora.crearNuevaBitacora("Busqueda Mediciones", "Ocurrio un error en la busqueda de mediciones: " + ex.Message, Criticidad.Alta);
                throw new Exception(NuSmartMessage.formatearMensaje("Error_messagebox_busqueda"));
            }
        }

        public Medicion conseguirUltimaMedicion(Paciente paciente)
        {
            try
            {
                Medicion ultimaMedicion = null;
                foreach (Medicion medicion in conseguirMediciones(paciente))
                {
                    if (ultimaMedicion == null)
                    {
                        ultimaMedicion = medicion;
                    }
                    if (DateTime.Compare(medicion.Fecha, ultimaMedicion.Fecha) > 0)
                    {
                        ultimaMedicion = medicion;
                    }
                }
                return ultimaMedicion;
            }catch(Exception ex)
            {
                bllBitacora.crearNuevaBitacora("Busqueda Ultima Medicion", "Ocurrio un error en la busqueda de mediciones: " + ex.Message, Criticidad.Alta);
                throw new Exception(NuSmartMessage.formatearMensaje("Error_messagebox_busqueda"));
            }
        }

        public Medicion obtenerPrimeraMedicionTratamiento(Tratamiento tratamiento)
        {
            try
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
            }catch(Exception ex)
            {
                bllBitacora.crearNuevaBitacora("Busqueda Primera Medicion", "Ocurrio un error en la busqueda de mediciones: " + ex.Message, Criticidad.Alta);
                throw new Exception(NuSmartMessage.formatearMensaje("Error_messagebox_busqueda"));
            }

        }


        public void calcularBMI(Medicion medicion)
        {
            try
            {
                medicion.Bmi = Math.Round((medicion.Peso / (medicion.Altura * medicion.Altura)), 1);
                medicion.CategoriaBmi = calcularCategoriaBMI(medicion.Bmi);
                bllBitacora.crearNuevaBitacora("Calculo BMI", "Calculo de BMI realizado por el usuario id: " + Sesion.Instancia().UsuarioActual.Id, Criticidad.Alta);
            }
            catch (Exception ex)
            {
                bllBitacora.crearNuevaBitacora("Calculo BMI", "Ocurrio un error en el calculo: " + ex.Message, Criticidad.Alta);
                throw new Exception(NuSmartMessage.formatearMensaje("Mediciones_error_calculo_bmi"));
            }


        }

        public void calcularBFP(Medicion medicion, int edad, string sexo)
        {
            try
            {
                calcularBMI(medicion);
                double porcentaje;

                int multiplicadorSexo = sexo == "M" ? 1 : 0;


                if (edad >= 18)
                {
                    porcentaje = 1.20 * medicion.Bmi + (0.23 * edad) - (10.8 * multiplicadorSexo) - 5.4;
                }
                else
                {
                    porcentaje = (1.51 * medicion.Bmi) - (0.70 * edad) - (3.6 * multiplicadorSexo) + 1.4;

                }

                if (sexo == "M")
                {
                    if (porcentaje < 18)
                    {
                        medicion.CategoriaBfp = NuSmartMessage.formatearMensaje("Mediciones_BFP_Atletico");
                    }
                    else if (porcentaje >= 18 && porcentaje < 25)
                    {
                        medicion.CategoriaBfp = NuSmartMessage.formatearMensaje("Mediciones_BFP_Sano");
                    }
                    else if (porcentaje >= 25)
                    {
                        medicion.CategoriaBfp = NuSmartMessage.formatearMensaje("Mediciones_BFP_Grasa_Excedida");
                    }
                }
                else if (sexo == "F")
                {

                    if (porcentaje < 25)
                    {
                        medicion.CategoriaBfp = NuSmartMessage.formatearMensaje("Mediciones_BFP_Atletico");
                    }
                    else if (porcentaje >= 25 && porcentaje < 32)
                    {
                        medicion.CategoriaBfp = NuSmartMessage.formatearMensaje("Mediciones_BFP_Sano");
                    }
                    else if (porcentaje >= 32)
                    {
                        medicion.CategoriaBfp = NuSmartMessage.formatearMensaje("Mediciones_BFP_Grasa_Excedida");
                    }
                }
                medicion.Bfp = porcentaje;
                bllBitacora.crearNuevaBitacora("Calculo BMI", "Calculo de BFP realizado por el usuario id: " + Sesion.Instancia().UsuarioActual.Id, Criticidad.Alta);
            }
            catch (Exception ex)
            {
                bllBitacora.crearNuevaBitacora("Calculo BFP", "Ocurrio un error en el calculo: " + ex.Message, Criticidad.Alta);
                throw new Exception(NuSmartMessage.formatearMensaje("Mediciones_error_calculo_bfp"));
            }

        }

        public string calcularCategoriaBMI(double indiceBMI)
        {
            if (esBajoDePeso(indiceBMI))
            {
                return NuSmartMessage.formatearMensaje("Mediciones_BMI_Bajo");
            }
            else if(esSano(indiceBMI)){
                return NuSmartMessage.formatearMensaje("Mediciones_BMI_Sano");
            }
            else if (esSobrepeso(indiceBMI))
            {
                return NuSmartMessage.formatearMensaje("Mediciones_BMI_Sobrepeso");
            }
            else if (esObeso(indiceBMI))
            {
                return NuSmartMessage.formatearMensaje("Mediciones_BMI_Obesidad");
            }
            else if (esExtremadamenteObeso(indiceBMI)){
                return NuSmartMessage.formatearMensaje("Mediciones_BMI_ExtremoObeso");
            }
            return "";
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
            try
            {
                dalMedicion.guardarMedicionDeTurno(turno);
                bllBitacora.crearNuevaBitacora("Guardar Medicion", "Se guardo una nueva medicion para el turno con ID: " + turno.Id, Criticidad.Media);
            }
            catch (Exception ex)
            {
                bllBitacora.crearNuevaBitacora("Guardar Medicion", "Ocurrio un error al guardar una medicion: " + ex.Message, Criticidad.Alta);
                throw new Exception(NuSmartMessage.formatearMensaje("Mediciones_error_guardar_medicion"));
            }
        }

    }
}
