using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using NuSmart.BE;

namespace NuSmart.DAL
{
    public class DALTurno
    {
        SqlHelper sqlHelper;

        public DALTurno()
        {
            sqlHelper = new SqlHelper();
        }

        public void registrarTurno(Turno turno)
        {
            string textoComando = "insert into TURNO (fecha, pacienteID, nutricionistaID, horarioID, motivo) values (@FECHA, @PACIENTEID, @NUTRICIONISTAID, @HORARIOID, @MOTIVO)";

            List<SqlParameter> lista = new List<SqlParameter>();

            lista.Add(new SqlParameter("@FECHA", turno.Fecha));
            lista.Add(new SqlParameter("@HORARIOID", turno.Horario.Id));
            lista.Add(new SqlParameter("@PACIENTEID", turno.Paciente.Id));
            lista.Add(new SqlParameter("@MOTIVO", turno.Motivo));
            lista.Add(new SqlParameter("@NUTRICIONISTAID", turno.Nutricionista.Id));

            sqlHelper.ejecutarNonQuery(textoComando, lista);
        }

        public List<Turno> obtenerTurnos(DateTime fecha, Nutricionista nutricionista)
        {
            List<Turno> turnos = new List<Turno>();
            string textoComando = "select * from turno INNER JOIN Paciente on (turno.pacienteID = Paciente.pacienteID) inner join Horario on (turno.horarioID = horario.id) where fecha = @FECHA and nutricionistaID = @NUTRICIONISTA and turno.eliminado = 0";
            List<SqlParameter> lista = new List<SqlParameter>();

            lista.Add(new SqlParameter("@FECHA", fecha));
            lista.Add(new SqlParameter("@NUTRICIONISTA", nutricionista.Id));

            DataTable dt = sqlHelper.ejecutarDataAdapter(textoComando, lista).Tables[0];

            foreach(DataRow dr in dt.Rows)
            {
                Turno turno = new Turno();
                turno.Id = (int)dr["turnoid"];
                turno.Nutricionista = nutricionista;
                turno.Fecha = (DateTime)dr["fecha"];
                if(!(dr["motivo"] is DBNull))
                {
                    turno.Motivo = (string)dr["motivo"];
                }
                turno.Horario = new Horario();
                turno.Horario.Id = (int)dr["horarioid"];
                turno.Horario.Tiempo = DateTime.Today + (TimeSpan)dr["tiempo"];
                turno.Paciente = new Paciente();
                turno.Paciente.Nombre = (string)dr["nombre"];
                turno.Paciente.Apellido = (string)dr["apellido"];
                turno.Paciente.Sexo = (string)dr["sexo"];
                turno.Paciente.Id = (int)dr["pacienteID"];
                turno.Paciente.FechaNacimiento = (DateTime)dr["fechaNacimiento"];
                
                turnos.Add(turno);
            }

            return turnos;

        }

        public void eliminar(Turno turno)
        {
            string textoComando = "update TURNO set ELIMINADO = 1 WHERE turnoID = @ID";

            List<SqlParameter> lista = new List<SqlParameter>();

            lista.Add(new SqlParameter("@ID", turno.Id));

            sqlHelper.ejecutarNonQuery(textoComando, lista);
        }
    }
}
