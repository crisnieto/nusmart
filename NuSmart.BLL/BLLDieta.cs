using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NuSmart.BE;
using NuSmart.DAL;

namespace NuSmart.BLL
{
    public class BLLDieta : BLLBase
    {
        BLLDiaAlimenticio bllDiaAlimenticio;
        DALDieta dalDieta;

        public const int ADELGAZAR = 1;
        public const int MANTENER = 2;
        public const int ENGORDAR = 3;

        public BLLDieta()
        {
            bllDiaAlimenticio = new BLLDiaAlimenticio();
            dalDieta = new DALDieta();
        }


        public int guardar(Dieta dieta)
        {
            verificarPermiso("OP012");
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

                    crearNuevaBitacora("Dieta Creada", "Se creo una nueva dieta", Criticidad.Baja);
                    return dalDieta.guardar(dieta);
                }catch(Exception ex)
                {
                    crearNuevaBitacora("Dieta Creada", "Ocurrio un error al guardar la dieta: " + ex.Message, Criticidad.Alta);
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
            if(dieta.Lunes != null && dieta.Martes != null && dieta.Miercoles != null && dieta.Jueves != null && dieta.Viernes != null && dieta.Sabado != null && dieta.Domingo != null && dieta.Nombre != null && dieta.Nombre != "")
            {
                return true;
            }
            return false;
        }

        public List<Dieta> conseguirDietas()
        {
            verificarPermiso("OP011");
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
            BLLPlato bllPlato = new BLLPlato();

            dia.Desayuno = bllPlato.obtenerPlato(dia.Desayuno.Id);
            dia.Colacion = bllPlato.obtenerPlato(dia.Colacion.Id);
            dia.Almuerzo = bllPlato.obtenerPlato(dia.Almuerzo.Id);
            dia.Merienda = bllPlato.obtenerPlato(dia.Merienda.Id);
            dia.Cena = bllPlato.obtenerPlato(dia.Cena.Id);
        }

        public Dieta obtenerDietaAutomatica(int tipo)
        {
            verificarPermiso("OP026");
            try
            {
                BLLPlato bllPlato = new BLLPlato();
                List<Plato> platos = bllPlato.obtenerTodos();
                BLLContextoDietaAutomatica contexto = new BLLContextoDietaAutomatica();

                switch (tipo)
                {
                    case ADELGAZAR:
                        contexto.asociarEstrategia(new BLLAdelgazarEstrategia());
                        return contexto.calcularDieta(platos);
                    case MANTENER:
                        contexto.asociarEstrategia(new BLLMantenerEstrategia());
                        return contexto.calcularDieta(platos);
                    case ENGORDAR:
                        contexto.asociarEstrategia(new BLLEngordarEstrategia());
                        return contexto.calcularDieta(platos);
                    default:
                        contexto.asociarEstrategia(new BLLAdelgazarEstrategia());
                        return contexto.calcularDieta(platos);
                }
            }
            catch(Exception ex)
            {
                crearNuevaBitacora("Calculo Dieta Automatica", "Ocurrio un error calculando la dieta automatica: " + ex.Message, Criticidad.Alta);
                throw new Exception(NuSmartMessage.formatearMensaje("AgregarDieta_error_dieta_automatica"));
            }
        }


        public Dieta conseguirDieta(int dietaID)
        {
            verificarPermiso("OP011");
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
                crearNuevaBitacora("Conseguir Dieta", "Se produjo error al buscar la dieta con id: " + dietaID, Criticidad.Alta);
                throw new Exception(NuSmartMessage.formatearMensaje("Dieta_error_busqueda"));
            }

        }
    }
}
