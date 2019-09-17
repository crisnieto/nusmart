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

        public List<Leyenda> conseguirLeyendasParaIdioma(int idiomaId)
        {
            return dalLeyenda.conseguirTodosParaIdioma(idiomaId);
        }

        public List<string> conseguirLeyendasPorNombre()
        {
            return dalLeyenda.conseguirLeyendasPorNombre();
        }

        public void eliminarLeyenda(Leyenda leyenda)
        {
            Sesion.Instancia().verificarPermiso("OP86");
            dalLeyenda.eliminarLeyenda(leyenda);
        }

        public void modificarLeyenda(Leyenda leyenda)
        {
            Sesion.Instancia().verificarPermiso("OP87");
            dalLeyenda.modificarLeyenda(leyenda);
        }

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
