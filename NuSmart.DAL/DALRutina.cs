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
                rutina.DiaEjercicioLunes.Id = dr["idDiaEjercicioLunes"] is DBNull ? 0 : (int)dr["idDiaEjercicioLunes"];
                rutina.DiaEjercicioMartes.Id = dr["idDiaEjercicioMartes"] is DBNull ? 0 : (int)dr["idDiaEjercicioMartes"];
                rutina.DiaEjercicioMiercoles.Id = dr["idDiaEjercicioMiercoles"] is DBNull ? 0 : (int)dr["idDiaEjercicioMiercoles"];
                rutina.DiaEjercicioJueves.Id = dr["idDiaEjercicioJueves"] is DBNull ? 0 : (int)dr["idDiaEjercicioJueves"];
                rutina.DiaEjercicioViernes.Id = dr["idDiaEjercicioViernes"] is DBNull ? 0 : (int)dr["idDiaEjercicioViernes"];
                rutina.DiaEjercicioSabado.Id = dr["idDiaEjercicioSabado"] is DBNull ? 0 : (int)dr["idDiaEjercicioSabado"];
                rutina.DiaEjercicioDomingo.Id = dr["idDiaEjercicioDomingo"] is DBNull ? 0 : (int)dr["idDiaEjercicioDomingo"];
                rutina.Nombre = (string)dr["nombre"];

                rutinas.Add(rutina);
            }
            return rutinas;
        }

       

        public void agregar(Rutina rutina)
        {
            string textoComando = "INSERT INTO RUTINA (idDiaEjercicioLunes, idDiaEjercicioMartes, idDiaEjercicioMiercoles, idDiaEjercicioJueves, idDiaEjercicioViernes, idDiaEjercicioSabado, idDiaEjercicioDomingo, nombre) VALUES (@LUNES, @MARTES, @MIERCOLES, @JUEVES, @VIERNES, @SABADO, @DOMINGO, @NOMBRE)";

            List<SqlParameter> lista = new List<SqlParameter>();
            formatearOptionalParamDiaEjercicio(lista, rutina.DiaEjercicioLunes, "@LUNES");
            formatearOptionalParamDiaEjercicio(lista, rutina.DiaEjercicioMartes, "@MARTES");
            formatearOptionalParamDiaEjercicio(lista, rutina.DiaEjercicioMiercoles, "@MIERCOLES");
            formatearOptionalParamDiaEjercicio(lista, rutina.DiaEjercicioJueves, "@JUEVES");
            formatearOptionalParamDiaEjercicio(lista, rutina.DiaEjercicioViernes, "@VIERNES");
            formatearOptionalParamDiaEjercicio(lista, rutina.DiaEjercicioSabado, "@SABADO");
            formatearOptionalParamDiaEjercicio(lista, rutina.DiaEjercicioDomingo, "@DOMINGO");
            lista.Add(new SqlParameter("@NOMBRE", rutina.Nombre));

            sqlHelper.ejecutarNonQuery(textoComando, lista);
        }

        public void formatearOptionalParamDiaEjercicio(List<SqlParameter> lista, DiaEjercicio dia, string param)
        {
            if(dia.Id > 0)
            {
                lista.Add(new SqlParameter(param, dia.Id));
            }else
            {
                lista.Add(new SqlParameter(param, DBNull.Value));
            }
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
                rutina.DiaEjercicioLunes.Id = dr["idDiaEjercicioLunes"] is DBNull ? 0 : (int)dr["idDiaEjercicioLunes"];
                rutina.DiaEjercicioMartes.Id = dr["idDiaEjercicioMartes"] is DBNull ? 0 : (int)dr["idDiaEjercicioMartes"];
                rutina.DiaEjercicioMiercoles.Id = dr["idDiaEjercicioMiercoles"] is DBNull ? 0 : (int)dr["idDiaEjercicioMiercoles"];
                rutina.DiaEjercicioJueves.Id = dr["idDiaEjercicioJueves"] is DBNull ? 0 : (int)dr["idDiaEjercicioJueves"];
                rutina.DiaEjercicioViernes.Id = dr["idDiaEjercicioViernes"] is DBNull ? 0 : (int)dr["idDiaEjercicioViernes"];
                rutina.DiaEjercicioSabado.Id = dr["idDiaEjercicioSabado"] is DBNull ? 0 : (int)dr["idDiaEjercicioSabado"];
                rutina.DiaEjercicioDomingo.Id = dr["idDiaEjercicioDomingo"] is DBNull ? 0 : (int)dr["idDiaEjercicioDomingo"];
                rutina.Nombre = (string)dr["nombre"];

                return rutina;
            }
            return null;
        }
    }
}
