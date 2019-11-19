alter database [nusmart] set single_user with rollback immediate
GO
EXEC msdb.dbo.sp_delete_database_backuphistory @database_name = N'nusmart'
GO
USE [master]
GO
/****** Object:  Database [nusmart]    Script Date: 11/19/2019 3:50:03 PM ******/
DROP DATABASE [nusmart]
GO
