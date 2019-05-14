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

    }
}
