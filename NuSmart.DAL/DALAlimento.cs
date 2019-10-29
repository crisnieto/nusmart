using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NuSmart.BE;
using System.Data.SqlClient;
using System.Data;

namespace NuSmart.DAL
{
    public class DALAlimento
    {
        SqlHelper sqlHelper;

        public DALAlimento()
        {
            sqlHelper = new SqlHelper();
        }

        public List<Alimento> obtenerTodos()
        {
            string textoComando = "SELECT * FROM ALIMENTO WHERE ELIMINADO = 0";

            DataTable dt = sqlHelper.ejecutarDataAdapter(textoComando).Tables[0];

            List<Alimento> alimentos = new List<Alimento>();

            foreach(DataRow dr in dt.Rows)
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

        public List<Alimento> obtenerAlimentosDePlato(Plato plato)
        {
            string textoComando = "SELECT alimento.calorias, alimento.nombre, alimento.tipoAlimento, alimento.alimentoID, alimento.eliminado FROM JOINALIMENTOPLATO INNER JOIN ALIMENTO ON (JOINALIMENTOPLATO.ALIMENTOID = ALIMENTO.ALIMENTOID) WHERE PLATOID = @PLATOID";

            List<SqlParameter> lista = new List<SqlParameter>();
            lista.Add(new SqlParameter("@PLATOID", plato.Id));

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



        public void agregar(Alimento alimento)
        {
            string textoComando = "INSERT INTO ALIMENTO (CALORIAS, NOMBRE, TIPOALIMENTO) VALUES (@CALORIAS, @NOMBRE, @TIPOALIMENTO)";

            List<SqlParameter> lista = new List<SqlParameter>();
            lista.Add(new SqlParameter("@CALORIAS", alimento.Calorias));
            lista.Add(new SqlParameter("@NOMBRE", alimento.Nombre));
            lista.Add(new SqlParameter("@TIPOALIMENTO", alimento.TipoAlimento));

            sqlHelper.ejecutarNonQuery(textoComando, lista);
        }

        public List<Alimento> buscar(string alimentoBuscado)
        {
            string textoComando = "SELECT * FROM ALIMENTO WHERE ELIMINADO = 0 AND NOMBRE LIKE @NOMBRE";

            List<SqlParameter> lista = new List<SqlParameter>();
            lista.Add(new SqlParameter("@NOMBRE", "%"+alimentoBuscado+"%"));

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

    }
}
