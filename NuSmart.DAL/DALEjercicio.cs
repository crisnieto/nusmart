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

        public Ejercicio obtener(int id)
        {
            string textoComando = "SELECT * FROM EJERCICIO WHERE EJERCICIOID = @ID";
            List<SqlParameter> lista = new List<SqlParameter>();

            lista.Add(new SqlParameter("@ID", id));


            DataTable dt = sqlHelper.ejecutarDataAdapter(textoComando, lista).Tables[0];

            Ejercicio ejercicio = new Ejercicio();
            foreach (DataRow dr in dt.Rows)
            {
                ejercicio.Nombre = (string)dr["nombre"];
                ejercicio.Id = (int)dr["ejercicioID"];
                ejercicio.CaloriasQuemadas = (int)dr["caloriasQuemadasHora"];
            }

            return ejercicio;
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
