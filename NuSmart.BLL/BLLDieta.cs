using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NuSmart.BE;
using NuSmart.DAL;

namespace NuSmart.BLL
{
    public class BLLDieta
    {
        BLLDiaAlimenticio bllDiaAlimenticio;
        DALDieta dalDieta;
        BLLPlato bllPlato;
        BLLBitacora bllBitacora;

        public const int ADELGAZAR = 1;
        public const int MANTENER = 2;
        public const int ENGORDAR = 3;

        public BLLDieta()
        {
            bllDiaAlimenticio = new BLLDiaAlimenticio();
            dalDieta = new DALDieta();
            bllPlato = new BLLPlato();
            bllBitacora = new BLLBitacora();
        }


        public int guardar(Dieta dieta)
        {
            Sesion.Instancia().verificarPermiso("OP012");
            if (dietaValida(dieta))
            {
                try
                {
                    dieta.Lunes.Id = bllDiaAlimenticio.guardar(dieta.Lunes);
                    dieta.Martes.Id = bllDiaAlimenticio.guardar(dieta.Martes);
                    dieta.Miercoles.Id = bllDiaAlimenticio.guardar(dieta.Miercoles);
                    dieta.Jueves.Id = bllDiaAlimenticio.guardar(dieta.Jueves);
                    dieta.Viernes.Id = bllDiaAlimenticio.guardar(dieta.Viernes);
                    dieta.Sabado.Id = bllDiaAlimenticio.guardar(dieta.Sabado);
                    dieta.Domingo.Id = bllDiaAlimenticio.guardar(dieta.Domingo);

                    bllBitacora.crearNuevaBitacora("Dieta Creada", "Se creo una nueva dieta", Criticidad.Baja);
                    return dalDieta.guardar(dieta);
                }catch(Exception ex)
                {
                    bllBitacora.crearNuevaBitacora("Dieta Creada", "Ocurrio un error al guardar la dieta: " + ex.Message, Criticidad.Alta);
                    throw new Exception(NuSmartMessage.formatearMensaje("AgregarDieta_error_guardado"));
                }
            }
            else
            {
                throw new Exception(NuSmartMessage.formatearMensaje("AgregarDieta_error_invalida"));
            }
        }

        public int calcularCalorias(Dieta dieta)
        {
            try
            {
                int calorias = 0;

                calorias += calcularCaloriasDia(dieta.Lunes);
                calorias += calcularCaloriasDia(dieta.Martes);
                calorias += calcularCaloriasDia(dieta.Miercoles);
                calorias += calcularCaloriasDia(dieta.Jueves);
                calorias += calcularCaloriasDia(dieta.Viernes);
                calorias += calcularCaloriasDia(dieta.Sabado);
                calorias += calcularCaloriasDia(dieta.Domingo);

                return calorias;
            }catch(Exception ex)
            {
                throw new Exception(NuSmartMessage.formatearMensaje("AgregarDieta_error_calculo_calorias"));
            }

        }

        public int calcularCaloriasDia(DiaAlimenticio dia)
        {
            try
            {
                int calorias = 0;

                calorias += dia.Desayuno != null ? dia.Desayuno.Calorias : 0;
                calorias += dia.Colacion != null ? dia.Colacion.Calorias : 0;
                calorias += dia.Almuerzo != null ? dia.Almuerzo.Calorias : 0;
                calorias += dia.Merienda != null ? dia.Merienda.Calorias : 0;
                calorias += dia.Cena != null ? dia.Cena.Calorias : 0;

                return calorias;
            }catch(Exception ex)
            {
                throw new Exception(NuSmartMessage.formatearMensaje("AgregarDieta_error_calculo_calorias_diarias"));
            }

        }

        public bool dietaValida(Dieta dieta)
        {
            if(dieta.Lunes != null && dieta.Martes != null && dieta.Miercoles != null && dieta.Jueves != null && dieta.Viernes != null && dieta.Sabado != null && dieta.Domingo != null)
            {
                return true;
            }
            return false;
        }

        public List<Dieta> conseguirDietas()
        {
            Sesion.Instancia().verificarPermiso("OP011");
            try
            {       
                List<Dieta> dietasObtenidas = dalDieta.conseguirDietas();
            
                foreach(Dieta dieta in dietasObtenidas)
                {
                    dieta.Lunes = bllDiaAlimenticio.obtener(dieta.Lunes.Id, dieta.Lunes.Nombre);
                    dieta.Martes = bllDiaAlimenticio.obtener(dieta.Martes.Id, dieta.Martes.Nombre);
                    dieta.Miercoles = bllDiaAlimenticio.obtener(dieta.Miercoles.Id, dieta.Miercoles.Nombre);
                    dieta.Jueves = bllDiaAlimenticio.obtener(dieta.Jueves.Id, dieta.Jueves.Nombre);
                    dieta.Viernes = bllDiaAlimenticio.obtener(dieta.Viernes.Id, dieta.Viernes.Nombre);
                    dieta.Sabado = bllDiaAlimenticio.obtener(dieta.Sabado.Id, dieta.Sabado.Nombre);
                    dieta.Domingo = bllDiaAlimenticio.obtener(dieta.Domingo.Id, dieta.Domingo.Nombre);

                    obtenerPlatosDeDia(dieta.Lunes);
                    obtenerPlatosDeDia(dieta.Martes);
                    obtenerPlatosDeDia(dieta.Miercoles);
                    obtenerPlatosDeDia(dieta.Jueves);
                    obtenerPlatosDeDia(dieta.Viernes);
                    obtenerPlatosDeDia(dieta.Sabado);
                    obtenerPlatosDeDia(dieta.Domingo);

                }
                return dietasObtenidas;
            }catch(Exception ex)
            {
                throw new Exception(NuSmartMessage.formatearMensaje("AgregarDieta_error_obtener_dietas"));
            }
        }

        public void obtenerPlatosDeDia(DiaAlimenticio dia)
        {

            dia.Desayuno = bllPlato.obtenerPlato(dia.Desayuno.Id);
            dia.Colacion = bllPlato.obtenerPlato(dia.Colacion.Id);
            dia.Almuerzo = bllPlato.obtenerPlato(dia.Almuerzo.Id);
            dia.Merienda = bllPlato.obtenerPlato(dia.Merienda.Id);
            dia.Cena = bllPlato.obtenerPlato(dia.Cena.Id);
        }

        public Dieta obtenerDietaAutomatica(int tipo)
        {
            Sesion.Instancia().verificarPermiso("OP026");
            try
            {
                switch (tipo)
                {
                    case ADELGAZAR:
                        return calcularDietaAdegalzar();
                    case MANTENER:
                        return calcularDietaMantener();
                    case ENGORDAR:
                        return calcularDietaEngordar();
                }
                return null;
            }catch(Exception ex)
            {
                bllBitacora.crearNuevaBitacora("Calculo Dieta Automatica", "Ocurrio un error calculando la dieta automatica: " + ex.Message, Criticidad.Alta);
                throw new Exception(NuSmartMessage.formatearMensaje("AgregarDieta_error_dieta_automatica"));
            }
        }

        public Dieta calcularDietaAdegalzar()
        {
            int caloriasDiariasMaximas = 1400;
            int caloriasDiarasMinimas = 1000;

            List<Plato> platos = bllPlato.obtenerTodos();

            Dieta dieta = new Dieta();
            calcularPlatosdeDia(caloriasDiarasMinimas, caloriasDiariasMaximas, dieta.Lunes, new List<Plato>(platos));
            calcularPlatosdeDia(caloriasDiarasMinimas, caloriasDiariasMaximas, dieta.Martes, new List<Plato>(platos));
            calcularPlatosdeDia(caloriasDiarasMinimas, caloriasDiariasMaximas, dieta.Miercoles, new List<Plato>(platos));
            calcularPlatosdeDia(caloriasDiarasMinimas, caloriasDiariasMaximas, dieta.Jueves, new List<Plato>(platos));
            calcularPlatosdeDia(caloriasDiarasMinimas, caloriasDiariasMaximas, dieta.Viernes, new List<Plato>(platos));
            calcularPlatosdeDia(caloriasDiarasMinimas, caloriasDiariasMaximas, dieta.Sabado, new List<Plato>(platos));
            calcularPlatosdeDia(caloriasDiarasMinimas, caloriasDiariasMaximas, dieta.Domingo, new List<Plato>(platos));

            dieta.EsAutomatica = true;
            dieta.Nombre = "Dieta generada para adelgazar";
            bllBitacora.crearNuevaBitacora("Calculo Dieta Automatica", "Se produjo un calculo de dieta para adelgazar", Criticidad.Baja);

            return dieta;
        }


        public Dieta calcularDietaMantener()
        {
            int caloriasDiariasMaximas = 2300;
            int caloriasDiarasMinimas = 1800;

            List<Plato> platos = bllPlato.obtenerTodos();

            Dieta dieta = new Dieta();
            calcularPlatosdeDia(caloriasDiarasMinimas, caloriasDiariasMaximas, dieta.Lunes, new List<Plato>(platos));
            calcularPlatosdeDia(caloriasDiarasMinimas, caloriasDiariasMaximas, dieta.Martes, new List<Plato>(platos));
            calcularPlatosdeDia(caloriasDiarasMinimas, caloriasDiariasMaximas, dieta.Miercoles, new List<Plato>(platos));
            calcularPlatosdeDia(caloriasDiarasMinimas, caloriasDiariasMaximas, dieta.Jueves, new List<Plato>(platos));
            calcularPlatosdeDia(caloriasDiarasMinimas, caloriasDiariasMaximas, dieta.Viernes, new List<Plato>(platos));
            calcularPlatosdeDia(caloriasDiarasMinimas, caloriasDiariasMaximas, dieta.Sabado, new List<Plato>(platos));
            calcularPlatosdeDia(caloriasDiarasMinimas, caloriasDiariasMaximas, dieta.Domingo, new List<Plato>(platos));

            dieta.EsAutomatica = true;
            dieta.Nombre = "Dieta generada para mantener peso";
            bllBitacora.crearNuevaBitacora("Calculo Dieta Automatica", "Se produjo un calculo de dieta para mantener peso", Criticidad.Baja);

            return dieta;
        }

        public Dieta calcularDietaEngordar()
        {
            int caloriasDiariasMaximas = 3000;
            int caloriasDiarasMinimas = 2200;

            List<Plato> platos = bllPlato.obtenerTodos();

            Dieta dieta = new Dieta();
            calcularPlatosdeDia(caloriasDiarasMinimas, caloriasDiariasMaximas, dieta.Lunes, new List<Plato>(platos));
            calcularPlatosdeDia(caloriasDiarasMinimas, caloriasDiariasMaximas, dieta.Martes, new List<Plato>(platos));
            calcularPlatosdeDia(caloriasDiarasMinimas, caloriasDiariasMaximas, dieta.Miercoles, new List<Plato>(platos));
            calcularPlatosdeDia(caloriasDiarasMinimas, caloriasDiariasMaximas, dieta.Jueves, new List<Plato>(platos));
            calcularPlatosdeDia(caloriasDiarasMinimas, caloriasDiariasMaximas, dieta.Viernes, new List<Plato>(platos));
            calcularPlatosdeDia(caloriasDiarasMinimas, caloriasDiariasMaximas, dieta.Sabado, new List<Plato>(platos));
            calcularPlatosdeDia(caloriasDiarasMinimas, caloriasDiariasMaximas, dieta.Domingo, new List<Plato>(platos));

            dieta.EsAutomatica = true;
            dieta.Nombre = "Dieta generada para engordar";
            bllBitacora.crearNuevaBitacora("Calculo Dieta Automatica", "Se produjo un calculo de dieta para engordar", Criticidad.Baja);

            return dieta;
        }



        public void calcularPlatosdeDia(int min, int max, DiaAlimenticio dia, List<Plato> platos)
        {
            Randomizer.Shuffle(platos);
            double porcentajeDesayuno = 0.20;
            double porcentajeColacion = 0.10;
            double porcentajeAlmuerzo = 0.30;
            double porcentajeMerienda = 0.15;
            double porcentajeCena = 0.25;
            bool continueLoop = false;

            do
            {
                foreach (Plato plato in platos.ToList())
                {
                    if (plato.EsDesayuno && dia.Desayuno.Calorias == 0)
                    {
                        if (plato.Calorias >= min * porcentajeDesayuno && plato.Calorias <= max * porcentajeDesayuno)
                        {
                            dia.Desayuno = plato;
                            platos.Remove(plato);
                            continue;
                        }
                    }
                    if (plato.EsColacion && dia.Colacion.Calorias == 0)
                    {
                        if (plato.Calorias >= min * porcentajeColacion && plato.Calorias <= max * porcentajeColacion)
                        {
                            dia.Colacion = plato;
                            platos.Remove(plato);
                            continue;
                        }
                    }
                    if (plato.EsPlatoPrincipal && dia.Almuerzo.Calorias == 0)
                    {
                        if (plato.Calorias >= min * porcentajeAlmuerzo && plato.Calorias <= max * porcentajeAlmuerzo)
                        {
                            dia.Almuerzo = plato;
                            platos.Remove(plato);
                            continue;
                        }
                    }
                    if (plato.EsMerienda && dia.Merienda.Calorias == 0)
                    {
                        if (plato.Calorias >= min * porcentajeMerienda && plato.Calorias <= max * porcentajeMerienda)
                        {
                            dia.Merienda = plato;
                            platos.Remove(plato);
                            continue;
                        }
                    }
                    if (plato.EsPlatoPrincipal && dia.Cena.Calorias == 0)
                    {
                        if (plato.Calorias >= min * porcentajeCena && plato.Calorias <= max * porcentajeCena)
                        {
                            dia.Cena = plato;
                            platos.Remove(plato);
                            continue;
                        }
                    }
                }
                max = max + 100;
                min = min > 0 ? min - 100 : min;

                if(dia.Desayuno.Calorias == 0 || dia.Colacion.Calorias == 0 || dia.Almuerzo.Calorias == 0 || dia.Merienda.Calorias == 0 || dia.Cena.Calorias == 0)
                {
                    continueLoop = true;
                }

            } while (max <= 3500 && continueLoop);
            
        }

        public Dieta conseguirDieta(int dietaID)
        {
            Sesion.Instancia().verificarPermiso("OP011");
            try
            {
                Dieta dieta = dalDieta.conseguirDieta(dietaID);

                dieta.Lunes = bllDiaAlimenticio.obtener(dieta.Lunes.Id, dieta.Lunes.Nombre);
                dieta.Martes = bllDiaAlimenticio.obtener(dieta.Martes.Id, dieta.Martes.Nombre);
                dieta.Miercoles = bllDiaAlimenticio.obtener(dieta.Miercoles.Id, dieta.Miercoles.Nombre);
                dieta.Jueves = bllDiaAlimenticio.obtener(dieta.Jueves.Id, dieta.Jueves.Nombre);
                dieta.Viernes = bllDiaAlimenticio.obtener(dieta.Viernes.Id, dieta.Viernes.Nombre);
                dieta.Sabado = bllDiaAlimenticio.obtener(dieta.Sabado.Id, dieta.Sabado.Nombre);
                dieta.Domingo = bllDiaAlimenticio.obtener(dieta.Domingo.Id, dieta.Domingo.Nombre);

                obtenerPlatosDeDia(dieta.Lunes);
                obtenerPlatosDeDia(dieta.Martes);
                obtenerPlatosDeDia(dieta.Miercoles);
                obtenerPlatosDeDia(dieta.Jueves);
                obtenerPlatosDeDia(dieta.Viernes);
                obtenerPlatosDeDia(dieta.Sabado);
                obtenerPlatosDeDia(dieta.Domingo);

                return dieta;
            }catch(Exception ex)
            {
                bllBitacora.crearNuevaBitacora("Conseguir Dieta", "Se produjo error al buscar la dieta con id: " + dietaID, Criticidad.Alta);
                throw new Exception(NuSmartMessage.formatearMensaje("Dieta_error_busqueda"));
            }

        }
    }
}
