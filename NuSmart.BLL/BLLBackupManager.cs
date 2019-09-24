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
        /// <summary>
        /// crearBackup se encarga de la creacion y guardado de un archivo .bak
        /// </summary>
        /// <param name="path"></param>
        /// <returns></returns>
        public int crearBackup(string path)
        {
            Sesion.Instancia().verificarPermiso("OP90");

            try
            {
                DALBackupManager dalBackupManager = new DALBackupManager();
                int resultado =dalBackupManager.crearBackup(path);
                new BLLBitacora().crearNuevaBitacora("Creacion de Backup", "Backup de la base de datos creada", Criticidad.Alta);
                return resultado;
            }
            catch (Exception ex)
            {
                new BLLBitacora().crearNuevaBitacora("Creacion de Backup", "Error en la creacion de Backup", Criticidad.Alta);
                throw new Exception(NuSmartMessage.formatearMensaje("BackupManager_messagebox_backup_error"));
            }
        }

        /// <summary>
        /// ejecutarRestore se encarga de efectuar un restore de la base de datos en base a un .bak recibido como parametro
        /// </summary>
        /// <param name="path"></param>
        /// <returns></returns>
        public int ejecutarRestore(string path)
        {
            Sesion.Instancia().verificarPermiso("OP91");

            try
            {
                DALBackupManager dalBackupManager = new DALBackupManager();
                return dalBackupManager.ejecutarRestore(path);
            }
            catch (Exception ex)
            {
                new BLLBitacora().crearNuevaBitacora("Creacion de Restore", "Error en la creacion de Backup", Criticidad.Alta);
                throw new Exception(NuSmartMessage.formatearMensaje("BackupManager_messagebox_restore_error"));
            }
        }
    }
}
