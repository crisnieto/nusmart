using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NuSmart.BE;
using NuSmart.DAL;
using System.Data;
using System.Data.SqlClient;

namespace NuSmart.DAL
{
    public class DALDiaAlimenticio
    {

        SqlHelper sqlHelper;

        public DALDiaAlimenticio()
        {
            sqlHelper = new SqlHelper();
        }

        public int guardar(DiaAlimenticio diaAlimenticio)
        {
            string textoComando = "INSERT INTO DIAALIMENTICIO (idPlatoAlmuerzo, idPlatoCena, idPlatoDesayuno, idPlatoColacion, idPlatoMerienda) Output Inserted.diaAlimenticioId values (@IDALMUERZO, @IDPLATOCENA, @IDPLATODESAYUNO, @IDPLATOCOLACION, @IDPLATOMERIENDA)";

            List<SqlParameter> lista = new List<SqlParameter>();

            lista.Add(new SqlParameter("@IDALMUERZO", diaAlimenticio.Almuerzo.Id));
            lista.Add(new SqlParameter("@IDPLATOCENA", diaAlimenticio.Cena.Id));
            lista.Add(new SqlParameter("@IDPLATODESAYUNO", diaAlimenticio.Desayuno.Id));
            lista.Add(new SqlParameter("@IDPLATOCOLACION", diaAlimenticio.Colacion.Id));
            lista.Add(new SqlParameter("@IDPLATOMERIENDA", diaAlimenticio.Merienda.Id));

            return sqlHelper.ejecutarEscalar(textoComando, lista);

        }

        public DiaAlimenticio obtener(int id)
        {
            string textoComando = "SELECT * FROM DIAALIMENTICIO WHERE DIAALIMENTICIOID = @ID";
            List<SqlParameter> lista = new List<SqlParameter>();
            lista.Add(new SqlParameter("@ID", id));

            DataTable dt = sqlHelper.ejecutarDataAdapter(textoComando, lista).Tables[0];
            DiaAlimenticio dia = new DiaAlimenticio();

            foreach (DataRow dr in dt.Rows)
            {
                dia.Id = (int)dr["diaAlimenticioID"];
                dia.Desayuno.Id = (int)dr["idPlatoDesayuno"];
                dia.Colacion.Id = (int)dr["idPlatoColacion"];
                dia.Almuerzo.Id = (int)dr["idPlatoAlmuerzo"];
                dia.Merienda.Id = (int)dr["idPlatoMerienda"];
                dia.Cena.Id = (int)dr["idPlatoCena"];
            }
            return dia;
        }
    }
}
