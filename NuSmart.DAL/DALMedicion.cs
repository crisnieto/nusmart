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
    public class DALMedicion
    {
        SqlHelper sqlHelper;

        public DALMedicion()
        {
            sqlHelper = new SqlHelper();
        }

        public List<Medicion> conseguirMediciones(Paciente paciente)
        {
            string textoComando = "SELECT altura, peso, cadera, bmi, categoriaBmi, bfp, categoriaBfp, cintura, turno.fecha from Medicion inner join Turno on (turno.turnoID = Medicion.turnoID) where turno.pacienteID = @IDPACIENTE ORDER BY FECHA DESC";

            List<SqlParameter> lista = new List<SqlParameter>();

            lista.Add(new SqlParameter("@IDPACIENTE", paciente.Id));

            DataTable dt = sqlHelper.ejecutarDataAdapter(textoComando, lista).Tables[0];

            List<Medicion> mediciones = new List<Medicion>();

            foreach(DataRow dr in dt.Rows)
            {
                Medicion medicion = new Medicion();
                medicion.Altura = Convert.ToDouble(dr["altura"]);
                medicion.Peso = Convert.ToDouble(dr["peso"]);
                medicion.Cintura = Convert.ToDouble(dr["cintura"]);
                medicion.Cadera = Convert.ToDouble(dr["cadera"]);
                medicion.Fecha = (DateTime)dr["fecha"];
                medicion.Bmi = Convert.ToDouble(dr["bmi"]);
                medicion.CategoriaBmi = Convert.ToString(dr["categoriaBmi"]);
                medicion.Bfp = Convert.ToDouble(dr["bfp"]);
                medicion.CategoriaBfp = Convert.ToString(dr["categoriaBfp"]);

                mediciones.Add(medicion);
            }

            return mediciones;
        }

        public void guardarMedicionDeTurno(Turno turno)
        {
            string textoComando = "INSERT INTO MEDICION (altura, peso, cintura, cadera, turnoid, pacienteid, bmi, categoriaBmi, bfp, categoriaBfp) values (@ALTURA, @PESO, @CINTURA, @CADERA, @TURNOID, @PACIENTEID, @BMI, @CATEGORIABMI, @BFP, @CATEGORIABFP)";

            List<SqlParameter> lista = new List<SqlParameter>();

            lista.Add(new SqlParameter("@ALTURA", turno.Medicion.Altura));
            lista.Add(new SqlParameter("@PESO", turno.Medicion.Peso));
            lista.Add(new SqlParameter("@CINTURA", turno.Medicion.Cintura));
            lista.Add(new SqlParameter("@CADERA", turno.Medicion.Cadera));
            lista.Add(new SqlParameter("@TURNOID", turno.Id));
            lista.Add(new SqlParameter("@PACIENTEID", turno.Paciente.Id));
            lista.Add(new SqlParameter("@BMI", turno.Medicion.Bmi));
            lista.Add(new SqlParameter("@CATEGORIABMI", turno.Medicion.CategoriaBmi));
            lista.Add(new SqlParameter("@BFP", turno.Medicion.Bfp));
            lista.Add(new SqlParameter("@CATEGORIABFP", turno.Medicion.CategoriaBfp));

            sqlHelper.ejecutarNonQuery(textoComando, lista);
            
        }

    }
}
