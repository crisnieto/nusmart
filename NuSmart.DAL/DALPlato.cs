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
            string textoComando = "SELECT platoID, nombre, calorias, esDesayuno, esColacion, esMerienda, esPlatoPrincipal, eliminado FROM PLATO WHERE ELIMINADO = 0";

            if(tipoAlimento != null)
            {
                textoComando += " AND " + tipoAlimento + " = 1";
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
                plato.Eliminado = Convert.ToBoolean(dr["eliminado"]);
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

        public List<Alimento> buscar(Alimento alimentoBuscado)
        {
            string textoComando = "SELECT * FROM ALIMENTO WHERE ELIMINADO = 0 AND NOMBRE CONTAINS(NOMBRE, @NOMBRE)";

            List<SqlParameter> lista = new List<SqlParameter>();
            lista.Add(new SqlParameter("@NOMBRE", alimentoBuscado.Nombre));


            DataTable dt = sqlHelper.ejecutarDataAdapter(textoComando, lista).Tables[0];

            List<Alimento> alimentos = new List<Alimento>();

            foreach (DataRow dr in dt.Rows)
            {
                Alimento alimento = new Alimento();
                alimento.Calorias = Convert.ToInt32(dr["calorias"]);
                alimento.Nombre = Convert.ToString(dr["nombre"]);
                alimento.TipoAlimento = Convert.ToString(dr["tipoAlimento"]);
                alimento.Id = Convert.ToInt32(dr["alimentoID"]);
                alimento.Eliminado = Convert.ToBoolean(dr["eliminado"]);
                alimentos.Add(alimento);
            }
            return alimentos;
        }

        public Plato obtenerPlato(int id)
        {
            string textoComando = "SELECT platoID, nombre, calorias, esDesayuno, esColacion, esMerienda, esPlatoPrincipal, eliminado FROM PLATO WHERE ELIMINADO = 0 AND platoID = @ID";

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
                plato.Eliminado = Convert.ToBoolean(dr["eliminado"]);
            }
            return plato;
        }


    }
}
