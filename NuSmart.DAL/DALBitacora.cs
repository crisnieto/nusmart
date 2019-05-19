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
    public class DALBitacora
    {
        SqlHelper sqlHelper;

        public DALBitacora()
        {
            sqlHelper = new SqlHelper();
        }

        public bool borrar()
        {
            return true;
        }

        public int guardarBitacora(Bitacora bitacora)
        {
            string textoComando = "insert into bitacora (actividad, fecha, mensaje, tipoCriticidad, usuarioID) values (@ACTIVIDAD, @FECHA, @MENSAJE, @CRITICIDAD, @USUARIO)";
            List<SqlParameter> lista = new List<SqlParameter>();
            lista.Add(new SqlParameter("@ACTIVIDAD", bitacora.Actividad));
            lista.Add(new SqlParameter("@FECHA", bitacora.Fecha));
            lista.Add(new SqlParameter("@MENSAJE", bitacora.Descripción));
            lista.Add(new SqlParameter("@CRITICIDAD", bitacora.TipoCriticidad));
            lista.Add(new SqlParameter("@USUARIO", bitacora.Usuario.ID));

            return sqlHelper.ejecutarNonQuery(textoComando, lista);
        }

        public int seleccionarPorTipo()
        {
            return 0;
        }
    }
}
