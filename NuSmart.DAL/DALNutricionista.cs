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
    public class DALNutricionista
    {
        SqlHelper sqlHelper;

        public DALNutricionista()
        {
            sqlHelper = new SqlHelper();
        }

        public Nutricionista conseguir(int id)
        {
            string textoComando = "select dni, especialización, matricula, nutricionistaID, apellido, usuarioID, nombre, sexo, DVH from Nutricionista " +
                "where usuarioID = @IDUSUARIO;";

            List<SqlParameter> lista = new List<SqlParameter>();
            lista.Add(new SqlParameter("@IDUSUARIO", id));

            DataRow dr = sqlHelper.ejecutarDataAdapter(textoComando, lista).Tables[0].Rows[0];

            Nutricionista nutricionista = new Nutricionista();
            nutricionista.Nombre = (string)dr["nombre"];
            nutricionista.Apellido = (string)dr["apellido"];
            nutricionista.Matricula = (string)dr["matricula"];
            nutricionista.Id = (int)dr["nutricionistaID"];
            nutricionista.Usuario.Id = (int)dr["usuarioId"];
            nutricionista.Dni = (int)dr["dni"];
            nutricionista.Especializacion = (string)dr["especialización"];
            nutricionista.Sexo = (string)dr["sexo"];
            nutricionista.Dvh = (int)dr["DVH"];

            return nutricionista;
        }

        public bool existe(Nutricionista nutricionista)
        {
            string textoComando = "SELECT * FROM NUTRICIONISTA WHERE DNI = @DNI";
            List<SqlParameter> lista = new List<SqlParameter>();
            lista.Add(new SqlParameter("@DNI", nutricionista.Dni));
            DataTable nutricionistaDt = sqlHelper.ejecutarDataAdapter(textoComando, lista).Tables[0];
            if (nutricionistaDt.Rows.Count > 0)
            {
                return true;
            }
            else
            {
                return false;
            }

        }

        public List<Nutricionista> conseguirTodos()
        {  
            string textoComando = "SELECT * FROM NUTRICIONISTA";
            DataTable dt = sqlHelper.ejecutarDataAdapter(textoComando).Tables[0];

            List<Nutricionista> listaNutricionistas = new List<Nutricionista>(); 

            foreach(DataRow dr in dt.Rows)
            {
                Nutricionista nutricionista = new Nutricionista();
                nutricionista.Nombre = (string)dr["nombre"];
                nutricionista.Apellido = (string)dr["apellido"];
                nutricionista.Matricula = (string)dr["matricula"];
                nutricionista.Id = (int)dr["nutricionistaID"];
                nutricionista.Usuario.Id = (int)dr["usuarioId"];
                nutricionista.Dni = (int)dr["dni"];
                nutricionista.Especializacion = (string)dr["especialización"];
                nutricionista.Sexo = (string)dr["sexo"];
                nutricionista.Dvh = (int)dr["DVH"];
                nutricionista.Eliminado = (bool)dr["eliminado"];
                listaNutricionistas.Add(nutricionista);
            }
            return listaNutricionistas; 
        }

        public int modificar(Nutricionista nutricionista)
        {
            string textoComando = "UPDATE Nutricionista SET dni = @DNI, especialización = @ESPECIALIZACION, matricula = @MATRICULA, apellido = @APELLIDO, " +
                "nombre = @NOMBRE, sexo = @SEXO, dvh = @DVH WHERE nutricionistaID = @IDNUTRICIONISTA";
            List<SqlParameter> lista = new List<SqlParameter>();
            lista.Add(new SqlParameter("@IDNUTRICIONISTA", nutricionista.Id));
            lista.Add(new SqlParameter("@DNI", nutricionista.Dni));
            lista.Add(new SqlParameter("@ESPECIALIZACION", nutricionista.Especializacion));
            lista.Add(new SqlParameter("@MATRICULA", nutricionista.Matricula));
            lista.Add(new SqlParameter("@APELLIDO", nutricionista.Apellido));
            lista.Add(new SqlParameter("@NOMBRE", nutricionista.Nombre));
            lista.Add(new SqlParameter("@SEXO", nutricionista.Sexo));
            lista.Add(new SqlParameter("@DVH", nutricionista.Dvh));

            return sqlHelper.ejecutarNonQuery(textoComando, lista);
        }

        public int ingresar(Nutricionista nutricionista)
        {
            string textoComando = "INSERT INTO Nutricionista (dni, especialización, matricula, apellido, usuarioID, nombre, sexo, DVH) " +
                "VALUES (@DNI, @ESPECIALIZACION, @MATRICULA, @APELLIDO, @IDUSUARIO, @NOMBRE, @SEXO, @DVH)";
            List<SqlParameter> lista = new List<SqlParameter>();
            lista.Add(new SqlParameter("@IDUSUARIO", nutricionista.Usuario.Id));
            lista.Add(new SqlParameter("@DNI", nutricionista.Dni));
            lista.Add(new SqlParameter("@ESPECIALIZACION", nutricionista.Especializacion));
            lista.Add(new SqlParameter("@MATRICULA", nutricionista.Matricula));
            lista.Add(new SqlParameter("@APELLIDO", nutricionista.Apellido));
            lista.Add(new SqlParameter("@NOMBRE", nutricionista.Nombre));
            lista.Add(new SqlParameter("@SEXO", nutricionista.Sexo));
            lista.Add(new SqlParameter("@DVH", nutricionista.Dvh));

            return sqlHelper.ejecutarNonQuery(textoComando, lista);
        }

        public int eliminar(Nutricionista nutricionista)
        {
            string textoComando = "UPDATE Nutricionista SET eliminado = @ELIMINADO, DVH = @DVH WHERE nutricionistaID = @IDNUTRICIONISTA";
            List<SqlParameter> lista = new List<SqlParameter>();
            lista.Add(new SqlParameter("@IDNUTRICIONISTA", nutricionista.Id));
            lista.Add(new SqlParameter("@ELIMINADO", nutricionista.Eliminado));
            lista.Add(new SqlParameter("@DVH", nutricionista.Dvh));
            return sqlHelper.ejecutarNonQuery(textoComando, lista);
        }



    }
}
