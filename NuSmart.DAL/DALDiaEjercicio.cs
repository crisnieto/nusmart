using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NuSmart.BE;
using System.Data.SqlClient;
using System.Data;

namespace NuSmart.DAL
{
    public class DALDiaEjercicio
    {
        SqlHelper sqlHelper;

        public DALDiaEjercicio()
        {
            sqlHelper = new SqlHelper();
        }

        public int agregar(DiaEjercicio dia)
        {
            string textoComando = "INSERT INTO DIAEJERCICIO (ejercicioID, duracionDia) OUTPUT INSERTED.DIAEJERCICIOID VALUES (@EJERCICIO, @DURACION)";

            List<SqlParameter> lista = new List<SqlParameter>();

            lista.Add(new SqlParameter("@EJERCICIO", dia.Ejercicio.Id));
            lista.Add(new SqlParameter("@DURACION", dia.Duracion));

            return sqlHelper.ejecutarEscalar(textoComando, lista);
        }

        public DiaEjercicio obtener(int id)
        {
            string textoComando = "SELECT * FROM DIAEJERCICIO WHERE diaEjercicioID = @ID";
            List<SqlParameter> lista = new List<SqlParameter>();

            lista.Add(new SqlParameter("@ID", id));

            DataTable dt = sqlHelper.ejecutarDataAdapter(textoComando, lista).Tables[0];

            DiaEjercicio dia = new DiaEjercicio(); 
            foreach(DataRow dr in dt.Rows)
            {
                dia.Duracion = (int)dr["duracionDia"];
                dia.Id = (int)dr["diaEjercicioID"];
                dia.Ejercicio.Id = (int)dr["ejercicioID"];
            }

            return dia;

        }
    }
}
