using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NuSmart.DAL
{
    public class DALBackupManager
    {
        SqlHelper sqlHelper;
        public DALBackupManager()
        {
            sqlHelper = new SqlHelper();
        }

        public int crearBackup(string path)
        {
            //Si hay un error de Access denied, verificar la configuración del servicio de SQL Server.
            //Debe estar configurado en Local System Account
            //Fuente: https://stackoverflow.com/a/35464963
            string textoComando = "BACKUP DATABASE nusmart TO DISK='" + path + "'";
            return sqlHelper.ejecutarNonQuery(textoComando);
        }

        public int ejecutarRestore(string path)
        {
            //Las primeras dos queries son un workaround para matar cualquier otra conexión que esté viva (ejemplo: SSMS)
            //Fuente: https://stackoverflow.com/a/18699584
            string textoComando1 = "USE master ALTER DATABASE nusmart SET SINGLE_USER WITH ROLLBACK IMMEDIATE;";
            sqlHelper.ejecutarNonQuery(textoComando1);

            string textoComando2 = "ALTER DATABASE nusmart SET MULTI_USER;";
            sqlHelper.ejecutarNonQuery(textoComando2);

            string textoComando3 = "USE MASTER RESTORE DATABASE [nusmart] FROM DISK= '" + path + "'";
            return sqlHelper.ejecutarNonQuery(textoComando3);
        }

    }
}
