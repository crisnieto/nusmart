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
    public class DALUsuario
    {
        SqlHelper sqlHelper;        

        public DALUsuario()
        {
            sqlHelper = new SqlHelper();
        }

        public Usuario conseguir(Usuario usuario)
        {
            string textoComando = "SELECT * FROM USUARIO WHERE USERNAME = @USER";

            List<SqlParameter> lista = new List<SqlParameter>();
            lista.Add(new SqlParameter("@USER", usuario.Username));

            DataSet usuarioDS = sqlHelper.ejecutarDataAdapter(textoComando, lista);

            Usuario usuarioConseguido = new Usuario();

            usuarioConseguido.ID = (int)(usuarioDS.Tables[0].Rows[0]
            ["usuarioID"]);

            usuarioConseguido.Username = Convert.ToString(usuarioDS.Tables[0].Rows[0]
            ["username"]);

            usuarioConseguido.Password = Convert.ToString(usuarioDS.Tables[0].Rows[0]
            ["password"]);

            return usuarioConseguido;
        }

        public int conseguirTodos()
        {
            return 0;
        }

        public bool eliminar(int id)
        {
            return true;
        }

        public bool guardar(Usuario usuario)
        {
            string textoComando = "INSERT INTO Usuario (username, password) values @USER, @PASSWORD;";

            List<SqlParameter> lista = new List<SqlParameter>();
            lista.Add(new SqlParameter("@USER",usuario.Username));
            lista.Add(new SqlParameter("@PASSWORD",usuario.Password));

            return Convert.ToBoolean(sqlHelper.ejecutarNonQuery(textoComando, lista));

        }
    }
}
