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
    public class DALTratamiento
    {
        SqlHelper sqlHelper = new SqlHelper();

        public DALTratamiento()
        {
            sqlHelper = new SqlHelper();
        }

        public void guardar(Tratamiento tratamiento)
        {
            string textoComando = "INSERT INTO Tratamiento (fechaInicio, dietaID, pacienteID) Output Inserted.TratamientoID VALUES (@FECHAINICIO, @DIETAID, @PACIENTEID)";
            List<SqlParameter> lista = new List<SqlParameter>();
            lista.Add(new SqlParameter("fechaInicio", tratamiento.FechaInicio));
            lista.Add(new SqlParameter("dietaID", tratamiento.Dieta.Id));
            lista.Add(new SqlParameter("pacienteID", tratamiento.Paciente.Id));
            sqlHelper.ejecutarNonQuery(textoComando, lista);
        }

        public List<Tratamiento> obtenerTratamientosDePaciente(int pacienteId)
        {
            string textoComando = "SELECT * FROM TRATAMIENTO WHERE PACIENTEID = @ID";
            List<SqlParameter> lista = new List<SqlParameter>();
            lista.Add(new SqlParameter("@ID", pacienteId));

            DataTable dt = sqlHelper.ejecutarDataAdapter(textoComando, lista).Tables[0];

            List<Tratamiento> tratamientos = new List<Tratamiento>();

            foreach (DataRow dr in dt.Rows)
            {
               
                Tratamiento tratamiento = new Tratamiento();
                tratamiento.FechaInicio = (DateTime)dr["fechaInicio"];
                if(!(dr["fechaFinalizado"] is DBNull))
                {
                    tratamiento.FechaFinalizado = (DateTime)dr["fechaFinalizado"];
                }else
                {
                    tratamiento.FechaFinalizado = null;
                }
                tratamiento.Dieta = new Dieta();
                tratamiento.Dieta.Id = (int)dr["dietaID"];
                if(!(dr["rutinaID"] is DBNull))
                {
                    //TODO: Agregar ID de Rutina
                }
                tratamiento.Id = (int)dr["tratamientoID"];
                tratamientos.Add(tratamiento);
            }
            return tratamientos;
        }

        public void agregarRutina(Tratamiento tratamiento)
        {
            string textoComando = "UPDATE TRATAMIENTO SET rutinaID = @RUTINAID WHERE TRATAMIENTOID = @TRATAMIENTOID";
            List<SqlParameter> lista = new List<SqlParameter>();
            lista.Add(new SqlParameter("@RUTINAID", tratamiento.Rutina.Id));
            lista.Add(new SqlParameter("@TRATAMIENTOID", tratamiento.Id));

            sqlHelper.ejecutarNonQuery(textoComando, lista);
        }
    }
}
