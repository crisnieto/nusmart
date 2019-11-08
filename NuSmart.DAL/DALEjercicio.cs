using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using NuSmart.BE;

namespace NuSmart.DAL
{
    public class DALEjercicio
    {
        SqlHelper sqlHelper;

        public DALEjercicio()
        {
            sqlHelper = new SqlHelper();
        }

        public void agregar(Ejercicio ejercicio)
        {
            string textoComando = "INSERT INTO EJERCICIO (nombre, caloriasQuemadasHora) VALUES (@NOMBRE, @CALORIAS)";

            List<SqlParameter> lista = new List<SqlParameter>();

            lista.Add(new SqlParameter("@NOMBRE", ejercicio.Nombre));
            lista.Add(new SqlParameter("@CALORIAS", ejercicio.CaloriasQuemadas));

            sqlHelper.ejecutarNonQuery(textoComando, lista);

        }

        public List<Ejercicio> obtenerTodos()
        {
            string textoComando = "SELECT * FROM EJERCICIO";
            DataTable dt = sqlHelper.ejecutarDataAdapter(textoComando).Tables[0];

            List<Ejercicio> ejercicios = new List<Ejercicio>();

            foreach(DataRow dr in dt.Rows)
            {
                Ejercicio ejercicio = new Ejercicio();
                ejercicio.Nombre = (string)dr["nombre"];
                ejercicio.Id = (int)dr["ejercicioID"];
                ejercicio.CaloriasQuemadas = (int)dr["caloriasQuemadasHora"];
                ejercicios.Add(ejercicio);
            }

            return ejercicios;
            
        }

    }
}
