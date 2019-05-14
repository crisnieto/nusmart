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
        public List<Leyenda> conseguirLeyendasParaIdioma(int idiomaId)
        {
            return new DALLeyenda().conseguirTodosParaIdioma(idiomaId);
        }

    }
}
