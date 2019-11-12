using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NuSmart.BE;
using NuSmart.DAL;

namespace NuSmart.BLL
{
    public class BLLPlato
    {

        DALPlato dalPlato;
        BLLBitacora bllBitacora;

        public BLLPlato()
        {
            bllBitacora = new BLLBitacora();
            dalPlato = new DALPlato();
        }

        public List<Plato> obtenerTodos(string tipoAlimento = null)
        {
            Sesion.Instancia().verificarPermiso("OP007");
            try
            {
                BLLAlimento bllAliemento = new BLLAlimento();
                List<Plato> listaPlatos = dalPlato.obtenerTodos(tipoAlimento);
                foreach (Plato plato in listaPlatos)
                {
                    plato.Alimentos = bllAliemento.obtenerAlimentosDePlato(plato);
                }

                return listaPlatos;
            }catch(Exception ex)
            {
                bllBitacora.crearNuevaBitacora("Busqueda de Platos", "Ocurrio un error mientras se buscaban los platos: "+ ex.Message, Criticidad.Alta);
                throw new Exception(NuSmartMessage.formatearMensaje("Plato_error_busqueda"));
            }

        }

        public void agregar(Plato plato)
        {
            Sesion.Instancia().verificarPermiso("OP008");
            try
            {
                if (plato.Calorias == 0)
                {
                    plato.Calorias = calcularCalorias(plato.Alimentos);
                }
                int id = dalPlato.agregar(plato);

                plato.Id = id;

                dalPlato.asociarAlimentosAPlato(plato);
                bllBitacora.crearNuevaBitacora("Agregar Plato", "Se agrego correctamente un nuevo plato: " + plato.Nombre, Criticidad.Alta);
            }
            catch (Exception ex)
            {
                bllBitacora.crearNuevaBitacora("Agregar Plato", "Ocurrio un error al intentar crear un nuevo plato: " + ex.Message, Criticidad.Alta);
                throw new Exception(NuSmartMessage.formatearMensaje("Plato_error_agregado"));
            }

        }

        public int calcularCalorias(List<Alimento> alimentos)
        {
            try
            {
                int calorias = 0;
                foreach (Alimento alimento in alimentos)
                {
                    calorias += alimento.Calorias;
                }
                return calorias;
            }catch(Exception ex)
            {
                bllBitacora.crearNuevaBitacora("Calcular Calorias", "Ocurrio un error al intentar calcular las calorias de un plato: " + ex.Message, Criticidad.Alta);
                throw new Exception(NuSmartMessage.formatearMensaje("Plato_error_calculo_calorias"));
            }

        }

        public Plato obtenerPlato(int id)
        {
            Sesion.Instancia().verificarPermiso("OP008");
            try
            {
                return dalPlato.obtenerPlato(id);
            }catch(Exception ex)
            {
                bllBitacora.crearNuevaBitacora("Busqueda de Plato", "Ocurrio un error mientras se buscaban un plato: " + ex.Message, Criticidad.Alta);
                throw new Exception(NuSmartMessage.formatearMensaje("Plato_error_busqueda"));
            }
        }
    }
}
