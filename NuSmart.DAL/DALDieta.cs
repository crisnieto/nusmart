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
    public class DALDieta
    {
        SqlHelper sqlHelper;

        public DALDieta()
        {
            sqlHelper = new SqlHelper();
        }


        public int guardar(Dieta dieta)
        {
            string textoComando = "INSERT INTO DIETA (LUNES, MARTES, MIERCOLES, JUEVES, VIERNES, SABADO, DOMINGO, ESGENERADAAUTOMATICAMENTE) Output Inserted.dietaID VALUES (@LUNES, @MARTES, @MIERCOLES, @JUEVES, @VIERNES, @SABADO, @DOMINGO, @ESAUTOMATICA)";

            List<SqlParameter> lista = new List<SqlParameter>();

            lista.Add(new SqlParameter("@LUNES", dieta.Lunes.Id));
            lista.Add(new SqlParameter("@MARTES", dieta.Martes.Id));
            lista.Add(new SqlParameter("@MIERCOLES", dieta.Miercoles.Id));
            lista.Add(new SqlParameter("@JUEVES", dieta.Jueves.Id));
            lista.Add(new SqlParameter("@VIERNES", dieta.Viernes.Id));
            lista.Add(new SqlParameter("@SABADO", dieta.Sabado.Id));
            lista.Add(new SqlParameter("@DOMINGO", dieta.Domingo.Id));
            lista.Add(new SqlParameter("@ESAUTOMATICA", dieta.EsAutomatica));

            return sqlHelper.ejecutarEscalar(textoComando, lista);

        }

        public List<Dieta> conseguirDietas()
        {
            string textoComando = "SELECT * FROM DIETA WHERE esGeneradaAutomaticamente = 0";

            DataTable dt = sqlHelper.ejecutarDataAdapter(textoComando).Tables[0];

            List<Dieta> listaDietas = new List<Dieta>();

            foreach(DataRow dr in dt.Rows)
            {
                Dieta dieta = new Dieta();

                dieta.Id = (int)dr["dietaID"];
                dieta.Nombre = dr["nombre"].ToString();
                dieta.EsAutomatica = (bool)dr["esGeneradaAutomaticamente"];
                dieta.Lunes.Id = (int)dr["lunes"];
                dieta.Martes.Id = (int)dr["martes"];
                dieta.Miercoles.Id = (int)dr["miercoles"];
                dieta.Jueves.Id = (int)dr["jueves"];
                dieta.Viernes.Id = (int)dr["viernes"];
                dieta.Sabado.Id = (int)dr["sabado"];
                dieta.Domingo.Id = (int)dr["domingo"];

                listaDietas.Add(dieta);
            }
            return listaDietas;
        }

        public Dieta conseguirDieta(int dietaID)
        {
            string textoComando = "SELECT * FROM DIETA WHERE dietaID = @ID";

            List<SqlParameter> lista = new List<SqlParameter>();
            lista.Add(new SqlParameter("@ID", dietaID));

            DataTable dt = sqlHelper.ejecutarDataAdapter(textoComando, lista).Tables[0];

            Dieta dieta = null;

            if(dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                dieta = new Dieta();
                dieta.Id = (int)dr["dietaID"];
                dieta.Nombre = dr["nombre"].ToString();
                dieta.EsAutomatica = (bool)dr["esGeneradaAutomaticamente"];
                dieta.Lunes.Id = (int)dr["lunes"];
                dieta.Martes.Id = (int)dr["martes"];
                dieta.Miercoles.Id = (int)dr["miercoles"];
                dieta.Jueves.Id = (int)dr["jueves"];
                dieta.Viernes.Id = (int)dr["viernes"];
                dieta.Sabado.Id = (int)dr["sabado"];
                dieta.Domingo.Id = (int)dr["domingo"];
            }
            return dieta;
        }
    }
}
