﻿using System;
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

        public Usuario conseguir(string usuario)
        {
            string textoComando = "SELECT * FROM USUARIO WHERE USERNAME = @USER";

            List<SqlParameter> lista = new List<SqlParameter>();
            lista.Add(new SqlParameter("@USER", usuario));

            DataRow usuarioDS = sqlHelper.ejecutarDataAdapter(textoComando, lista).Tables[0].Rows[0];

            Usuario usuarioConseguido = new Usuario();

            usuarioConseguido.Id = (int)(usuarioDS["usuarioID"]);

            usuarioConseguido.Username = Convert.ToString(usuarioDS["username"]);

            usuarioConseguido.Password = Convert.ToString(usuarioDS["password"]);

            usuarioConseguido.Dvh = Convert.ToInt32(usuarioDS["DVH"]);

            usuarioConseguido.Intentos = Convert.ToInt32(usuarioDS["intentos"]);

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

        public int ingresar(Usuario usuario)
        {
            string textoComando = "insert into USUARIO (username, password, DVH) values (@USERNAME, @PASSWORD, @DVH)";
            List<SqlParameter> lista = new List<SqlParameter>();
            lista.Add(new SqlParameter("@PASSWORD", usuario.Password));
            lista.Add(new SqlParameter("@USERNAME", usuario.Username));
            lista.Add(new SqlParameter("@DVH", usuario.Dvh));
            return sqlHelper.ejecutarNonQuery(textoComando, lista);

        }

        public int actualizarContraseña(Usuario usuario)
        {
            string textoComando = "UPDATE Usuario set password = @PASSWORD, dvh = @DVH WHERE UsuarioID = @USUARIOID;";
            List<SqlParameter> lista = new List<SqlParameter>();
            lista.Add(new SqlParameter("@PASSWORD", usuario.Password));
            lista.Add(new SqlParameter("@DVH", usuario.Dvh));
            lista.Add(new SqlParameter("@USUARIOID", usuario.Id));
        
            return sqlHelper.ejecutarNonQuery(textoComando, lista);
        }

        public bool guardar(Usuario usuario)
        {
            string textoComando = "INSERT INTO Usuario (username, password) values @USER, @PASSWORD;";

            List<SqlParameter> lista = new List<SqlParameter>();
            lista.Add(new SqlParameter("@USER",usuario.Username));
            lista.Add(new SqlParameter("@PASSWORD",usuario.Password));

            return Convert.ToBoolean(sqlHelper.ejecutarNonQuery(textoComando, lista));

        }

        public bool agregarIntento(Usuario usuario)
        {
            string textoComando = "UPDATE Usuario SET intentos = intentos + 1 where username = @USER";
            List<SqlParameter> lista = new List<SqlParameter>();
            lista.Add(new SqlParameter("@USER", usuario.Username));
            return Convert.ToBoolean(sqlHelper.ejecutarNonQuery(textoComando, lista));
        }

        public bool desbloquear(Usuario usuario)
        {
            string textoComando = "UPDATE Usuario SET intentos = 0 where username = @USER";
            List<SqlParameter> lista = new List<SqlParameter>();
            lista.Add(new SqlParameter("@USER", usuario.Username));
            return Convert.ToBoolean(sqlHelper.ejecutarNonQuery(textoComando, lista));
        }
    }
}
