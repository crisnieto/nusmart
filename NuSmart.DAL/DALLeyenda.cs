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

        public List<string> conseguirLeyendasPorNombre()
        {
            string textoComando = "SELECT DISTINCT nombreLeyenda from Leyenda";
            DataTable dt =sqlHelper.ejecutarDataAdapter(textoComando).Tables[0];
            List<string> listaNombres = new List<string>();
            foreach(DataRow dr in dt.Rows)
            {
                listaNombres.Add((string)dr["nombreLeyenda"]);
            }

            return listaNombres;
        }

        public Leyenda conseguirLeyendaParaIdioma(string nombre, int idiomaId)
        {
            string textoComando = "SELECT * from Leyenda where nombreLeyenda = @NOMBRE and idiomaId = @IDIOMAID";
            List<SqlParameter> lista = new List<SqlParameter>();
            lista.Add(new SqlParameter("@NOMBRE", nombre));
            lista.Add(new SqlParameter("@IDIOMAID", idiomaId));
            Leyenda leyendaADevolver = new Leyenda();
            DataTable dt= sqlHelper.ejecutarDataAdapter(textoComando, lista).Tables[0];
            if(dt.Rows.Count > 0)
            {
                leyendaADevolver.Id = (int)dt.Rows[0]["leyendaID"];
                leyendaADevolver.Nombre = (string)dt.Rows[0]["nombreLeyenda"];
                leyendaADevolver.Texto = (string)dt.Rows[0]["texto"];
            }
            return leyendaADevolver;
        }

    }
}
