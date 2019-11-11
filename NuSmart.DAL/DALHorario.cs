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
    public class DALHorario
    {
        SqlHelper sqlHelper;

        public DALHorario()
        {
            sqlHelper = new SqlHelper();
        }


        public List<Horario> obtenerHorariosDisponibles(Nutricionista nutricionista, DateTime fecha, String preferencia)
        {
            List<Horario> horarios = new List<Horario>();

            string textoComando = "SELECT distinct(id), tiempo FROM HORARIO full JOIN Turno on(turno.horarioID = Horario.id) where horario.id not in (select horarioID from Turno where (coalesce(nutricionistaId, '') = @NUTRICIONISTAID and coalesce(turno.fecha, '') = @FECHA))";
            if (preferencia.Equals("manana"))
            {
                textoComando += " AND tiempo < '13:00'";
            }

            if(preferencia.Equals("tarde")){
                textoComando += " AND tiempo >= '13:00'";
            }

            List<SqlParameter> lista = new List<SqlParameter>();

            lista.Add(new SqlParameter("@NUTRICIONISTAID", nutricionista.Id));
            lista.Add(new SqlParameter("@FECHA", fecha));

            DataTable dt = sqlHelper.ejecutarDataAdapter(textoComando, lista).Tables[0];

            foreach(DataRow dr in dt.Rows)
            {
                Horario horario = new Horario();
                horario.Tiempo = DateTime.Today + (TimeSpan)dr["tiempo"];
                horario.Id = (int)dr["id"];
                horarios.Add(horario);
            }

            return horarios;
        }

    }
}
