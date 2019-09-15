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
            dalLeyenda.eliminarLeyenda(leyenda);
        }

        public void modificarLeyenda(Leyenda leyenda)
        {
            dalLeyenda.modificarLeyenda(leyenda);
        }

        public void crearLeyenda(Leyenda leyenda, Idioma idioma)
        {
            dalLeyenda.crearLeyenda(leyenda, idioma);
        }

    }
}
