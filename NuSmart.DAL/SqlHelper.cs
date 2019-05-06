﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;

namespace NuSmart.DAL
{
    class SqlHelper
    {
 
        public void abrirConexion(SqlConnection conexion)
        {
            conexion.Open();            
        }

        public void agregarParametro(SqlCommand comando, List<SqlParameter> lista)
        {   
            for (int i = 0; i < lista.Count(); i++)
            {
                comando.Parameters.Add(lista[i]);
            }
        }

        public void cerrarConexion(SqlConnection sqlConexion)
        {
            sqlConexion.Close();
        }

        public SqlConnection conseguirStringConexion()
        {
            return new SqlConnection("Data Source=.\\SQLEXPRESS;Initial Catalog=nusmart;Integrated Security=True");
        }

        public int ejecutarComando(SqlCommand comando)
        {
            return comando.ExecuteNonQuery();
        }

           
        public int ejecutarNonQuery(String textoComando, List<SqlParameter> lista)
        {
            SqlConnection conexion = conseguirStringConexion();
            SqlCommand comando = nuevoComando(textoComando, conexion);
            agregarParametro(comando, lista);
            abrirConexion(conexion);
            ejecutarComando(comando);
            cerrarConexion(conexion);
            return 0;
        }
        
        public DataSet ejecutarSelect(SqlCommand comando)
        {
            SqlDataAdapter dataAdapter = new SqlDataAdapter();
            dataAdapter.SelectCommand = comando;
            DataSet dataSet = new DataSet();
            dataAdapter.Fill(dataSet);
            return dataSet;
        }

        public SqlCommand nuevoComando(string textoComando, SqlConnection conexion)
        {
            return new SqlCommand(textoComando, conexion);
        }

        public DataSet ejecutarDataAdapter(String textoComando, List<SqlParameter> lista)
        {
            SqlConnection conexion = conseguirStringConexion();
            SqlCommand comando = nuevoComando(textoComando, conexion);
            agregarParametro(comando, lista);
            abrirConexion(conexion);
            DataSet data = ejecutarSelect(comando);
            cerrarConexion(conexion);
            return data;
        }
    }
}