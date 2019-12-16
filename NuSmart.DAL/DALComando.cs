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

        public string TextoComando
        {
            get
            {
                return _textoComando;
            }

            set
            {
                _textoComando = value;
            }
        }

        public List<SqlParameter> Parametros
        {
            get
            {
                return _parametros;
            }

            set
            {
                _parametros = value;
            }
        }

        public DALComando(string textoComando, List<SqlParameter> parametros) 
        {
            this.TextoComando = textoComando;
            this.Parametros = parametros;
        }

    }
}
