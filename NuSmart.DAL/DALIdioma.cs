using System;
using System.Collections.Generic;
using NuSmart.BE;
using System.Data;
using System.Data.SqlClient;

namespace NuSmart.DAL
{
    public class DALIdioma
    {
        SqlHelper sqlHelper;

        public DALIdioma()
        {
            sqlHelper = new SqlHelper();
        }

        public Idioma conseguir(int idIdioma)
        {
            string textoComando = "SELECT * FROM IDIOMA WHERE idiomaID = @IDIOMA";

            List<SqlParameter> lista = new List<SqlParameter>();
            lista.Add(new SqlParameter("@IDIOMA", idIdioma));

            DataRow idiomaDR = sqlHelper.ejecutarDataAdapter(textoComando, lista).Tables[0].Rows[0];

            Idioma idiomaConseguido = new Idioma();

            idiomaConseguido.NombreIdioma = Convert.ToString(idiomaDR["nombreIdioma"]);
            idiomaConseguido.DescripcionIdioma = Convert.ToString(idiomaDR["descripcionIdioma"]);
            idiomaConseguido.Id = (int)idiomaDR["idiomaID"];

            return idiomaConseguido;
        }
        
        public List<Idioma> conseguirIdiomas()
        {
            string textoComando = "SELECT * FROM IDIOMA";

            DataTable dt = sqlHelper.ejecutarDataAdapter(textoComando).Tables[0];

            List<Idioma> listaIdioma = new List<Idioma>();
            
            foreach(DataRow dr in dt.Rows)
            {
                Idioma idioma = new Idioma();
                idioma.DescripcionIdioma = (string)dr["descripcionIdioma"];
                idioma.NombreIdioma = (string)dr["nombreIdioma"];
                idioma.Id = (int)dr["idiomaID"];
                listaIdioma.Add(idioma);
            }

            return listaIdioma;
           
        }
    }
}
