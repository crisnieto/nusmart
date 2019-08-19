using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data.Sql;

namespace NuSmart.DAL
{
    class DALComando
    {
        string _textoComando;
        List<SqlParameter> _parametros;

        public DALComando(string textoComando, List<SqlParameter> parametros) 
        {
            this._textoComando = textoComando;
            this._parametros = parametros;
        }

        public string TextoComando { get => _textoComando; set => _textoComando = value; }
        public List<SqlParameter> Parametros { get => _parametros; set => _parametros = value; }
    }
}
