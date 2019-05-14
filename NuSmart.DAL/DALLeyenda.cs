using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NuSmart.BE;
using System.Data;
using System.Data.SqlClient;

namespace NuSmart.DAL
{
    public class DALLeyenda
    {
        SqlHelper sqlHelper;
        
        public DALLeyenda()
        {
            sqlHelper = new SqlHelper();
        }

        public List<Leyenda> conseguirTodosParaIdioma(int idiomaId)
        {
            string consulta = "select * from leyenda where idiomaID = @IDIOMA";

            List<SqlParameter> lista = new List<SqlParameter>();
            lista.Add(new SqlParameter("@IDIOMA", idiomaId));

            DataTable leyendasDT = sqlHelper.ejecutarDataAdapter(consulta, lista).Tables[0];

            List<Leyenda> listaLeyendas = new List<Leyenda>();

            foreach(DataRow dr in leyendasDT.Rows)
            {
                Leyenda leyenda = new Leyenda();
                leyenda.Id = (int)dr["leyendaId"];
                leyenda.Nombre = Convert.ToString(dr["nombreLeyenda"]);
                leyenda.Texto = Convert.ToString(dr["texto"]);
                listaLeyendas.Add(leyenda);
            }

            return listaLeyendas;
        }

    }
}
