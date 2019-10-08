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
    public class DALPaciente
    {
        SqlHelper sqlHelper;

        public DALPaciente()
        {
            sqlHelper = new SqlHelper();
        }

        public void agregar(Paciente paciente)
        {
            string textoComando = "INSERT INTO PACIENTE (nombre, apellido, email, telefono, dni, sexo, habitos) values (@NOMBRE, @APELLIDO, @EMAIL, @TELEFONO, @DNI, @SEXO, @HABITOS)";

            List<SqlParameter> lista = new List<SqlParameter>();

            lista.Add(new SqlParameter("@NOMBRE", paciente.Nombre));
            lista.Add(new SqlParameter("@APELLIDO", paciente.Apellido));
            lista.Add(new SqlParameter("@DNI", paciente.Dni));
            lista.Add(new SqlParameter("@EMAIL", paciente.Email));
            lista.Add(new SqlParameter("@TELEFONO", paciente.Telefono));
            lista.Add(new SqlParameter("@SEXO", paciente.Sexo));
            lista.Add(new SqlParameter("@HABITOS", paciente.Habitos));


            sqlHelper.ejecutarNonQuery(textoComando, lista);
        }

        public void eliminar(Paciente paciente)
        {
            string textoComando = "UPDATE PACIENTE SET eliminado = @ELIMINADO where dni = @DNI";
            List<SqlParameter> lista = new List<SqlParameter>();

            lista.Add(new SqlParameter("@DNI", paciente.Dni));
            lista.Add(new SqlParameter("@ELIMINADO", paciente.Eliminado));

            sqlHelper.ejecutarNonQuery(textoComando, lista);

        }

        public void modificar(Paciente paciente)
        {
            string textoComando = "UPDATE PACIENTE SET nombre = @NOMBRE, apellido = @APELLIDO, email = @EMAIL, telefono = @TELEFONO, dni = @DNI, sexo = @SEXO, habitos = @HABITOS0)";
            List<SqlParameter> lista = new List<SqlParameter>();

            lista.Add(new SqlParameter("@NOMBRE", paciente.Nombre));
            lista.Add(new SqlParameter("@APELLIDO", paciente.Apellido));
            lista.Add(new SqlParameter("@DNI", paciente.Dni));
            lista.Add(new SqlParameter("@EMAIL", paciente.Email));
            lista.Add(new SqlParameter("@TELEFONO", paciente.Telefono));
            lista.Add(new SqlParameter("@SEXO", paciente.Sexo));
            lista.Add(new SqlParameter("@HABITOS", paciente.Habitos));

            sqlHelper.ejecutarNonQuery(textoComando, lista);

        }

        public List<Paciente> obtenerTodos()
        {
            string textoComando = "SELECT * FROM PACIENTE WHERE eliminado = 0";
            List<Paciente> listaPacientes = new List<Paciente>();

            DataTable dt = sqlHelper.ejecutarDataAdapter(textoComando).Tables[0];

            foreach(DataRow row in dt.Rows)
            {
                Paciente paciente = new Paciente();
                paciente.Nombre = (string)row["nombre"];
                paciente.Apellido = (string)row["apellido"];
                paciente.Dni = (int)row["dni"];
                paciente.Eliminado = (bool)row["eliminado"];
                paciente.Email = (string)row["email"];
                paciente.Id = (int)row["pacienteId"];
                paciente.Telefono = (int)row["telefono"];
                paciente.Sexo = (string)row["sexo"];

                listaPacientes.Add(paciente);
            }
            return listaPacientes;
        }

        public Paciente obtener(int dni)
        {

            string textoComando = "SELECT * FROM PACIENTE WHERE dni = @DNI AND eliminado = 0";
            Paciente paciente = new Paciente();

            List<SqlParameter> lista = new List<SqlParameter>();

            lista.Add(new SqlParameter("@DNI", dni));

            DataTable dt = sqlHelper.ejecutarDataAdapter(textoComando).Tables[0];


            if(dt.Rows.Count > 0)
            {
                paciente.Nombre = (string)dt.Rows[0]["nombre"];
                paciente.Apellido = (string)dt.Rows[0]["apellido"];
                paciente.Dni = (int)dt.Rows[0]["dni"];
                paciente.Eliminado = (bool)dt.Rows[0]["eliminado"];
                paciente.Email = (string)dt.Rows[0]["email"];
                paciente.Id = (int)dt.Rows[0]["id"];
                paciente.Telefono = (int)dt.Rows[0]["telefono"];
                paciente.Sexo = (string)dt.Rows[0]["sexo"];
            }
            return paciente;
        }

    }
}
