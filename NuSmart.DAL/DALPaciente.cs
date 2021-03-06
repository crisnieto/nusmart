﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NuSmart.BE;
using System.Data.SqlClient;
using System.Data;

namespace NuSmart.DAL
{
    public class DALPaciente
    {
        SqlHelper sqlHelper;

        public DALPaciente()
        {
            sqlHelper = new SqlHelper();
        }

        public void agregar(Paciente paciente)
        {
            string textoComando = "INSERT INTO PACIENTE (nombre, apellido, email, telefono, dni, sexo, fechaNacimiento) values (@NOMBRE, @APELLIDO, @EMAIL, @TELEFONO, @DNI, @SEXO, @NACIMIENTO)";

            List<SqlParameter> lista = new List<SqlParameter>();

            lista.Add(new SqlParameter("@NOMBRE", paciente.Nombre));
            lista.Add(new SqlParameter("@APELLIDO", paciente.Apellido));
            lista.Add(new SqlParameter("@DNI", paciente.Dni));
            lista.Add(new SqlParameter("@EMAIL", paciente.Email));
            lista.Add(new SqlParameter("@TELEFONO", paciente.Telefono));
            lista.Add(new SqlParameter("@SEXO", paciente.Sexo));
            lista.Add(new SqlParameter("@NACIMIENTO", paciente.FechaNacimiento));


            sqlHelper.ejecutarNonQuery(textoComando, lista);
        }

        public void modificar(Paciente paciente)
        {
            string textoComando = "UPDATE PACIENTE SET nombre = @NOMBRE, apellido = @APELLIDO, email = @EMAIL, telefono = @TELEFONO, dni = @DNI, sexo = @SEXO WHERE PACIENTEID = @PACIENTEID";
            List<SqlParameter> lista = new List<SqlParameter>();

            lista.Add(new SqlParameter("@NOMBRE", paciente.Nombre));
            lista.Add(new SqlParameter("@APELLIDO", paciente.Apellido));
            lista.Add(new SqlParameter("@DNI", paciente.Dni));
            lista.Add(new SqlParameter("@EMAIL", paciente.Email));
            lista.Add(new SqlParameter("@TELEFONO", paciente.Telefono));
            lista.Add(new SqlParameter("@SEXO", paciente.Sexo));
            lista.Add(new SqlParameter("@PACIENTEID", paciente.Id));

            sqlHelper.ejecutarNonQuery(textoComando, lista);

        }

        public List<Paciente> obtenerTodos()
        {
            string textoComando = "SELECT * FROM PACIENTE";
            List<Paciente> listaPacientes = new List<Paciente>();

            DataTable dt = sqlHelper.ejecutarDataAdapter(textoComando).Tables[0];

            foreach(DataRow row in dt.Rows)
            {
                Paciente paciente = new Paciente();
                paciente.Nombre = (string)row["nombre"];
                paciente.Apellido = (string)row["apellido"];
                paciente.Dni = (int)row["dni"];
                paciente.Email = (string)row["email"];
                paciente.Id = (int)row["pacienteId"];
                paciente.Telefono = (int)row["telefono"];
                paciente.Sexo = (string)row["sexo"];
                paciente.FechaNacimiento = (DateTime)row["fechaNacimiento"];
                listaPacientes.Add(paciente);
            }
            return listaPacientes;
        }

        public Paciente obtener(int dni)
        {

            string textoComando = "SELECT * FROM PACIENTE WHERE dni = @DNI";
            Paciente paciente = null;

            List<SqlParameter> lista = new List<SqlParameter>();

            lista.Add(new SqlParameter("@DNI", dni));

            DataTable dt = sqlHelper.ejecutarDataAdapter(textoComando, lista).Tables[0];


            if(dt.Rows.Count > 0)
            {
                paciente = new Paciente();
                paciente.Nombre = (string)dt.Rows[0]["nombre"];
                paciente.Apellido = (string)dt.Rows[0]["apellido"];
                paciente.Dni = (int)dt.Rows[0]["dni"];
                paciente.Email = (string)dt.Rows[0]["email"];
                paciente.Id = (int)dt.Rows[0]["pacienteID"];
                paciente.Telefono = (int)dt.Rows[0]["telefono"];
                paciente.Sexo = (string)dt.Rows[0]["sexo"];
                paciente.FechaNacimiento = (DateTime)dt.Rows[0]["fechaNacimiento"];
            }
            return paciente;
        }

    }
}
