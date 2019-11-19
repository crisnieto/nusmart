using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NuSmart.BE;
using NuSmart.DAL;

namespace NuSmart.BLL
{
    public class BLLLeyenda : BLLBase
    {

        DALLeyenda dalLeyenda;
        BLLBitacora bllBitacora;

        public BLLLeyenda()
        {
            dalLeyenda = new DALLeyenda();
            bllBitacora = new BLLBitacora();
        }


        /// <summary>
        /// conseguirLeyendasParaIdioma se encarga de obtener todas las leyendas para un idioma determinado
        /// </summary>
        /// <param name="idiomaId"></param>
        /// <returns></returns>
        public List<Leyenda> conseguirLeyendasParaIdioma(int idiomaId)
        {
            try
            {
                return dalLeyenda.conseguirTodosParaIdioma(idiomaId);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// eliminarLeyenda se encarga de solicitar a la DAL la eliminacion de una leyenda
        /// </summary>
        /// <param name="leyenda"></param>
        public void eliminarLeyenda(Leyenda leyenda)
        {
            verificarPermiso("OP86");
            try
            {
                dalLeyenda.eliminarLeyenda(leyenda);
                bllBitacora.crearNuevaBitacora("Eliminacion de Leyenda", "Se elimino la leyenda para el control " + leyenda.NombreControl + " con ID " + leyenda.Id, Criticidad.Media);
            }
            catch (Exception ex)
            {
                bllBitacora.crearNuevaBitacora("Eliminacion de Leyenda", "Error en la eliminacion de leyenda: " + ex.Message, Criticidad.Alta);
                throw ex;
            }
        }

        /// <summary>
        /// modificarLeyenda se encarga de solicitar a la DAL la modificacion de una leyenda
        /// </summary>
        /// <param name="leyenda"></param>
        public void modificarLeyenda(Leyenda leyenda)
        {
            verificarPermiso("OP87");
            try
            {
                dalLeyenda.modificarLeyenda(leyenda);
                bllBitacora.crearNuevaBitacora("Modificacion de Leyenda", "Se modifico la leyenda para el control " + leyenda.NombreControl + " con ID " + leyenda.Id, Criticidad.Media);
            }
            catch (Exception ex)
            {
                bllBitacora.crearNuevaBitacora("Modificacion de leyenda", "Error en la modificacion de leyenda: " + ex.Message, Criticidad.Alta);
                throw ex;

            }
        }

        /// <summary>
        /// crearLeyenda se encarga de solicitar la creacion de una nueva leyenda para un idioma
        /// </summary>
        /// <param name="leyenda"></param>
        /// <param name="idioma"></param>
        public void crearLeyenda(Leyenda leyenda, Idioma idioma)
        {
            try
            {
                verificarPermiso("OP85");
                Leyenda leyendaConseguida = dalLeyenda.conseguirLeyendaParaIdioma(leyenda.NombreControl, idioma.Id);

                if (leyendaConseguida.NombreControl == null)
                {
                    dalLeyenda.crearLeyenda(leyenda, idioma);
                    bllBitacora.crearNuevaBitacora("Creacion de Leyenda", "Creacion de leyenda para el control " + leyenda.NombreControl + " con Idioma: " + idioma.NombreIdioma  , Criticidad.Alta);

                }
                else
                {
                    throw new Exception(NuSmartMessage.formatearMensaje("GestionLeyenda_messagebox_leyenda_existente"));
                }
            }catch(Exception ex)
            {
                bllBitacora.crearNuevaBitacora("Creacion de Leyenda", "Error en la creacion de leyenda: " + ex.Message, Criticidad.Alta);
                throw ex;
            }
        }

        public List<Leyenda> conseguirLeyendasFaltantes(int idiomaId)
        {
            return dalLeyenda.conseguirLeyendasFaltantes(idiomaId);
        }

        public void guardar(List<Leyenda> leyendas, Idioma idioma)
        {
            foreach(Leyenda leyenda in leyendas)
            {
                if(leyenda.Texto != "")
                {
                    dalLeyenda.crearLeyenda(leyenda, idioma);   
                }
            }
        }
    }
}
