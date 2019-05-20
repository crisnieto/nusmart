using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NuSmart.DAL;

namespace NuSmart.BLL
{
    public class BLLBackupManager
    {
        public int crearBackup(string path)
        {
            DALBackupManager dalBackupManager = new DALBackupManager();
            return dalBackupManager.crearBackup(path);
        }
        public int ejecutarRestore(string path)
        {
            DALBackupManager dalBackupManager = new DALBackupManager();
            return dalBackupManager.ejecutarRestore(path);
        }
    }
}
