using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NuSmart.DAL;
using NuSmart.BE;

namespace NuSmart.BLL
{
    public class BLLBackupManager
    {
        public int crearBackup(string path)
        {
            try
            {
                Sesion.Instancia().verificarPermiso("AA099");
                DALBackupManager dalBackupManager = new DALBackupManager();
                return dalBackupManager.crearBackup(path);
            }
            catch (Exception ex)
            {
                throw new Exception(NuSmartMessage.formatearMensaje("BackupManager_messagebox_backup_error"));
            }
        }
        public int ejecutarRestore(string path)
        {
            try
            {
                Sesion.Instancia().verificarPermiso("AA099");
                DALBackupManager dalBackupManager = new DALBackupManager();
                return dalBackupManager.ejecutarRestore(path);
            }
            catch (Exception ex)
            {
                throw new Exception(NuSmartMessage.formatearMensaje("BackupManager_messagebox_restore_error"));
            }
        }
    }
}
