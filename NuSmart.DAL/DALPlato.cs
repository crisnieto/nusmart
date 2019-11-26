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
    public class DALPlato
    {
        SqlHelper sqlHelper;

        public DALPlato()
        {
            sqlHelper = new SqlHelper();
        }

        public List<Plato> obtenerTodos(string tipoAlimento = null)
        {
            string textoComando = "SELECT platoID, nombre, calorias, esDesayuno, esColacion, esMerienda, esPlatoPrincipal FROM PLATO";

            if(tipoAlimento != null)
            {
                textoComando += " WHERE " + tipoAlimento + " = 1";
            }

            DataTable dt = sqlHelper.ejecutarDataAdapter(textoComando).Tables[0];

            List<Plato> platos = new List<Plato>();

            foreach (DataRow dr in dt.Rows)
            {
                Plato plato = new Plato();
                plato.Calorias = Convert.ToInt32(dr["calorias"]);
                plato.Nombre = Convert.ToString(dr["nombre"]);
                plato.EsColacion = Convert.ToBoolean(dr["esColacion"]);
                plato.EsDesayuno = Convert.ToBoolean(dr["esDesayuno"]);
                plato.EsMerienda = Convert.ToBoolean(dr["esMerienda"]);
                plato.EsPlatoPrincipal = Convert.ToBoolean(dr["esPlatoPrincipal"]);
                plato.Id = Convert.ToInt32(dr["platoID"]);
                platos.Add(plato);
            }
            return platos;
        }

        public int agregar(Plato plato)
        {
            string textoComando = "INSERT INTO PLATO (CALORIAS, NOMBRE, ESDESAYUNO, ESCOLACION, ESMERIENDA, ESPLATOPRINCIPAL) Output Inserted.platoId VALUES (@CALORIAS, @NOMBRE, @ESDESAYUNO, @ESCOLACION, @ESMERIENDA, @ESPLATOPRINCIPAL)";

            List<SqlParameter> lista = new List<SqlParameter>();
            lista.Add(new SqlParameter("@CALORIAS", plato.Calorias));
            lista.Add(new SqlParameter("@NOMBRE", plato.Nombre));
            lista.Add(new SqlParameter("@ESDESAYUNO", plato.EsDesayuno));
            lista.Add(new SqlParameter("@ESCOLACION", plato.EsColacion));
            lista.Add(new SqlParameter("@ESMERIENDA", plato.EsMerienda));
            lista.Add(new SqlParameter("@ESPLATOPRINCIPAL", plato.EsPlatoPrincipal));

            return sqlHelper.ejecutarEscalar(textoComando, lista);
        }

        public void asociarAlimentosAPlato(Plato plato)
        {
            foreach(Alimento alimento in plato.Alimentos)
            {
                string textoComando = "INSERT INTO JOINALIMENTOPLATO (PLATOID, ALIMENTOID) VALUES (@PLATOID, @ALIMENTOID)";

                List<SqlParameter> lista = new List<SqlParameter>();
                lista.Add(new SqlParameter("@PLATOID", plato.Id));
                lista.Add(new SqlParameter("@ALIMENTOID", alimento.Id));

                sqlHelper.ejecutarNonQuery(textoComando, lista);
            }
        }


        public Plato obtenerPlato(int id)
        {
            string textoComando = "SELECT platoID, nombre, calorias, esDesayuno, esColacion, esMerienda, esPlatoPrincipal FROM PLATO WHERE platoID = @ID";

            List<SqlParameter> lista = new List<SqlParameter>();

            lista.Add(new SqlParameter("@ID", id));

            DataTable dt = sqlHelper.ejecutarDataAdapter(textoComando, lista).Tables[0];

            Plato plato = new Plato();


            foreach (DataRow dr in dt.Rows)
            {
                plato.Calorias = Convert.ToInt32(dr["calorias"]);
                plato.Nombre = Convert.ToString(dr["nombre"]);
                plato.EsColacion = Convert.ToBoolean(dr["esColacion"]);
                plato.EsDesayuno = Convert.ToBoolean(dr["esDesayuno"]);
                plato.EsMerienda = Convert.ToBoolean(dr["esMerienda"]);
                plato.EsPlatoPrincipal = Convert.ToBoolean(dr["esPlatoPrincipal"]);
                plato.Id = Convert.ToInt32(dr["platoID"]);
            }
            return plato;
        }


    }
}
