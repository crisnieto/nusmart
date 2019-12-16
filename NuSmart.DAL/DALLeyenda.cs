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
            string consulta = "select * from leyenda where idiomaID = @IDIOMA and eliminado = 0 ORDER BY nombreControl asc";

            List<SqlParameter> lista = new List<SqlParameter>();
            lista.Add(new SqlParameter("@IDIOMA", idiomaId));

            DataTable leyendasDT = sqlHelper.ejecutarDataAdapter(consulta, lista).Tables[0];

            List<Leyenda> listaLeyendas = new List<Leyenda>();

            foreach(DataRow dr in leyendasDT.Rows)
            {
                Leyenda leyenda = new Leyenda();
                leyenda.Id = (int)dr["leyendaId"];
                leyenda.NombreControl = Convert.ToString(dr["nombreControl"]);
                leyenda.Texto = Convert.ToString(dr["texto"]);

                listaLeyendas.Add(leyenda);
            }

            return listaLeyendas;
        }

        public List<string> conseguirLeyendasPorNombre()
        {
            string textoComando = "SELECT DISTINCT nombreControl from Leyenda";
            DataTable dt= sqlHelper.ejecutarDataAdapter(textoComando).Tables[0];
            List<string> listaNombres = new List<string>();
            foreach(DataRow dr in dt.Rows)
            {
                listaNombres.Add((string)dr["nombreControl"]);
            }

            return listaNombres;
        }

        public List<Leyenda> conseguirLeyendasFaltantes(int idiomaId)
        {
            string textoComando = "SELECT DISTINCT(nombreControl) FROM Leyenda where nombreControl not in(select nombreControl from Leyenda where IdiomaID = @ID and eliminado = 0) and eliminado = 0";
            List<SqlParameter> lista = new List<SqlParameter>();
            lista.Add(new SqlParameter("@ID", idiomaId));
            DataTable leyendasDT = sqlHelper.ejecutarDataAdapter(textoComando, lista).Tables[0];
            List<Leyenda> listaLeyendas = new List<Leyenda>();

            foreach (DataRow dr in leyendasDT.Rows)
            {
                Leyenda leyenda = new Leyenda();
                leyenda.NombreControl = Convert.ToString(dr["nombreControl"]);
                leyenda.Texto = "";
                listaLeyendas.Add(leyenda);
            }
            return listaLeyendas;
        }

        public Leyenda conseguirLeyendaParaIdioma(string nombre, int idiomaId)
        {
            string textoComando = "SELECT * from Leyenda where nombreControl = @NOMBRE and idiomaId = @IDIOMAID and eliminado = 0";
            List<SqlParameter> lista = new List<SqlParameter>();
            lista.Add(new SqlParameter("@NOMBRE", nombre));
            lista.Add(new SqlParameter("@IDIOMAID", idiomaId));
            Leyenda leyendaADevolver = new Leyenda();
            DataTable dt= sqlHelper.ejecutarDataAdapter(textoComando, lista).Tables[0];
            if(dt.Rows.Count > 0)
            {
                leyendaADevolver.Id = (int)dt.Rows[0]["leyendaID"];
                leyendaADevolver.NombreControl = (string)dt.Rows[0]["nombreControl"];
                leyendaADevolver.Texto = (string)dt.Rows[0]["texto"];
            }
            return leyendaADevolver;
        }

        public bool eliminarLeyenda(Leyenda leyenda)
        {
            string textoComando = "UPDATE LEYENDA SET eliminado = 1 WHERE leyendaID = @LEYENDAID";
            List<SqlParameter> lista = new List<SqlParameter>();
            lista.Add(new SqlParameter("@LEYENDAID", leyenda.Id));
            return Convert.ToBoolean(sqlHelper.ejecutarNonQuery(textoComando, lista));
        }

        public bool modificarLeyenda(Leyenda leyenda)
        {
            string textoComando = "UPDATE LEYENDA SET nombreControl = @NOMBRE, texto = @TEXTO where leyendaID = @LEYENDAID";
            List<SqlParameter> lista = new List<SqlParameter>();
            lista.Add(new SqlParameter("@NOMBRE", leyenda.NombreControl));
            lista.Add(new SqlParameter("@TEXTO", leyenda.Texto));
            lista.Add(new SqlParameter("@LEYENDAID", leyenda.Id));
            return Convert.ToBoolean(sqlHelper.ejecutarNonQuery(textoComando, lista));
        }

        public bool crearLeyenda(Leyenda leyenda, Idioma idioma)
        {
            string textoComando = "INSERT INTO LEYENDA (nombreControl, texto, idiomaID) values (@NOMBRE, @TEXTO, @IDIOMAID)";
            List<SqlParameter> lista = new List<SqlParameter>();
            lista.Add(new SqlParameter("@NOMBRE", leyenda.NombreControl));
            lista.Add(new SqlParameter("@TEXTO", leyenda.Texto));
            lista.Add(new SqlParameter("@IDIOMAID", idioma.Id));
            return Convert.ToBoolean(sqlHelper.ejecutarNonQuery(textoComando, lista));
        }

    }
}
