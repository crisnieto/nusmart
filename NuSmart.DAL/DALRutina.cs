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
    public class DALRutina
    {
        SqlHelper sqlHelper;

        public DALRutina()
        {
            sqlHelper = new SqlHelper();
        }

        public List<Rutina> obtenerTodos()
        {
            string textoComando = "SELECT * FROM RUTINA";

            DataTable dt = sqlHelper.ejecutarDataAdapter(textoComando).Tables[0];

            List<Rutina> rutinas = new List<Rutina>();

            foreach(DataRow dr in dt.Rows)
            {
                Rutina rutina = new Rutina();
                rutina.Id = (int)dr["rutinaID"];
                rutina.DiaEjercicioLunes.Id = (int)dr["idDiaEjercicioLunes"];
                rutina.DiaEjercicioMartes.Id = (int)dr["idDiaEjercicioMartes"];
                rutina.DiaEjercicioMiercoles.Id = (int)dr["idDiaEjercicioMiercoles"];
                rutina.DiaEjercicioJueves.Id = (int)dr["idDiaEjercicioJueves"];
                rutina.DiaEjercicioViernes.Id = (int)dr["idDiaEjercicioViernes"];
                rutina.DiaEjercicioSabado.Id = (int)dr["idDiaEjercicioSabado"];
                rutina.DiaEjercicioDomingo.Id = (int)dr["idDiaEjercicioDomingo"];
                rutina.Nombre = (string)dr["nombre"];

                rutinas.Add(rutina);
            }
            return rutinas;
        }

        public void agregar(Rutina rutina)
        {
            string textoComando = "INSERT INTO RUTINA (idDiaEjercicioLunes, idDiaEjercicioMartes, idDiaEjercicioMiercoles, idDiaEjercicioJueves, idDiaEjercicioViernes, idDiaEjercicioSabado, idDiaEjercicioDomingo, nombre) VALUES (@LUNES, @MARTES, @MIERCOLES, @JUEVES, @VIERNES, @SABADO, @DOMINGO, @NOMBRE)";

            List<SqlParameter> lista = new List<SqlParameter>();
            lista.Add(new SqlParameter("@LUNES", rutina.DiaEjercicioLunes.Id));
            lista.Add(new SqlParameter("@MARTES", rutina.DiaEjercicioMartes.Id));
            lista.Add(new SqlParameter("@MIERCOLES", rutina.DiaEjercicioMiercoles.Id));
            lista.Add(new SqlParameter("@JUEVES", rutina.DiaEjercicioJueves.Id));
            lista.Add(new SqlParameter("@VIERNES", rutina.DiaEjercicioViernes.Id));
            lista.Add(new SqlParameter("@SABADO", rutina.DiaEjercicioSabado.Id));
            lista.Add(new SqlParameter("@DOMINGO", rutina.DiaEjercicioDomingo.Id));
            lista.Add(new SqlParameter("@NOMBRE", rutina.Nombre));

            sqlHelper.ejecutarDataAdapter(textoComando, lista);
        }

        public Rutina obtener(int id)
        {
            string textoComando = "SELECT * FROM RUTINA WHERE rutinaId = @ID";

            List<SqlParameter> lista = new List<SqlParameter>();
            lista.Add(new SqlParameter("@ID", id));

            DataTable dt = sqlHelper.ejecutarDataAdapter(textoComando, lista).Tables[0];
            

            if(dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                Rutina rutina = new Rutina();
                rutina.Id = (int)dr["rutinaID"];
                rutina.DiaEjercicioLunes.Id = (int)dr["idDiaEjercicioLunes"];
                rutina.DiaEjercicioMartes.Id = (int)dr["idDiaEjercicioMartes"];
                rutina.DiaEjercicioMiercoles.Id = (int)dr["idDiaEjercicioMiercoles"];
                rutina.DiaEjercicioJueves.Id = (int)dr["idDiaEjercicioJueves"];
                rutina.DiaEjercicioViernes.Id = (int)dr["idDiaEjercicioViernes"];
                rutina.DiaEjercicioSabado.Id = (int)dr["idDiaEjercicioSabado"];
                rutina.DiaEjercicioDomingo.Id = (int)dr["idDiaEjercicioDomingo"];
                rutina.Nombre = (string)dr["nombre"];

                return rutina;
            }
            return null;
        }
    }
}
