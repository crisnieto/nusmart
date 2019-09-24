using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NuSmart.BE;
using NuSmart.DAL;

namespace NuSmart.BLL
{
    public class BLLLeyenda
    {

        DALLeyenda dalLeyenda;

        public BLLLeyenda()
        {
            dalLeyenda = new DALLeyenda();
        }


        /// <summary>
        /// conseguirLeyendasParaIdioma se encarga de obtener todas las leyendas para un idioma determinado
        /// </summary>
        /// <param name="idiomaId"></param>
        /// <returns></returns>
        public List<Leyenda> conseguirLeyendasParaIdioma(int idiomaId)
        {
            return dalLeyenda.conseguirTodosParaIdioma(idiomaId);
        }

        /// <summary>
        /// eliminarLeyenda se encarga de solicitar a la DAL la eliminacion de una leyenda
        /// </summary>
        /// <param name="leyenda"></param>
        public void eliminarLeyenda(Leyenda leyenda)
        {
            Sesion.Instancia().verificarPermiso("OP86");
            dalLeyenda.eliminarLeyenda(leyenda);
        }

        /// <summary>
        /// modificarLeyenda se encarga de solicitar a la DAL la modificacion de una leyenda
        /// </summary>
        /// <param name="leyenda"></param>
        public void modificarLeyenda(Leyenda leyenda)
        {
            Sesion.Instancia().verificarPermiso("OP87");
            dalLeyenda.modificarLeyenda(leyenda);
        }

        /// <summary>
        /// crearLeyenda se encarga de solicitar la creacion de una nueva leyenda para un idioma
        /// </summary>
        /// <param name="leyenda"></param>
        /// <param name="idioma"></param>
        public void crearLeyenda(Leyenda leyenda, Idioma idioma)
        {
            Sesion.Instancia().verificarPermiso("OP85");
            Leyenda leyendaConseguida = dalLeyenda.conseguirLeyendaParaIdioma(leyenda.NombreControl, idioma.Id);

            if (leyendaConseguida.NombreControl == null)
            {
                dalLeyenda.crearLeyenda(leyenda, idioma);
            }else
            {
                throw new Exception(NuSmartMessage.formatearMensaje("GestionLeyenda_messagebox_leyenda_existente"));
            }
        }

    }
}
