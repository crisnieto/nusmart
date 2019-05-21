select * from DVV

SELECT valor FROM DVV WHERE nombreTabla='Usuario'

SELECT * FROM IDIOMA

INSERT INTO IDIOMA (descripcionIdioma, nombreIdioma, idiomaID) values ('Idioma Español neutro', 'español', 1);

INSERT INTO IDIOMA (descripcionIdioma, nombreIdioma, idiomaID) values ('UK English Language', 'english', 2);

SELECT * FROM IDIOMA

SELECT * FROM LEYENDA

select * from Leyenda

insert into Leyenda (nombreLeyenda, texto, idiomaID) values 
('agenda_btn_bitacora', 'Bitacora', 1),
('agenda_btn_bitacora', 'User Logs', 2),
('agenda_btn_backup', 'Respaldos', 1),
('agenda_btn_backup', 'Backups', 2),
('agenda_btn_usuarios', 'Gestión de Usuarios', 1),
('agenda_btn_usuarios', 'Users Management', 2),
('agenda_btn_micuenta', 'Mi Cuenta', 1),
('agenda_btn_micuenta', 'My Account', 2),
('agenda_btn_idioma', 'Cambiar Idioma', 1),
('agenda_btn_idioma', 'Change Language', 2),
('agenda_btn_cerrar', 'Cerrar Sesión', 1),
('agenda_btn_cerrar', 'Close Session', 2),
('agenda_btn_gestion_pacientes', 'Gestión de Pacientes', 1),
('agenda_btn_gestion_pacientes', 'Patients Management', 2),
('agenda_btn_gestion_comidas', 'Gestión de Comidas', 1),
('agenda_btn_gestion_comidas', 'Food Management', 2),
('agenda_btn_gestion_ejercicios', 'Gestión de Ejercicios', 1),
('agenda_btn_gestion_ejercicios', 'Workout Management', 2),
('agenda_btn_gestion_dietas', 'Gestión de Dietas', 1),
('agenda_btn_gestion_dietas', 'Diet Management', 2),
('agenda_btn_start_appointment', 'Iniciar Turno', 1),
('agenda_btn_start_appointment', 'Start Appointment', 2),
('agenda_btn_erase_appointment', 'Borrar Turno', 1),
('agenda_btn_erase_appointment', 'Erase Appointment', 2),
('agenda_lbl_appointments', 'Tus turnos de hoy', 1),
('agenda_lbl_appointments', 'Your appointments for today', 2)
	


insert into Leyenda (nombreLeyenda, texto, idiomaID) values 
('backup_lbl_title', 'Gestión de Backup', 1),
('backup_lbl_title', 'Backup Management', 2),
('backup_btn_crear', 'Crear Backup', 1),
('backup_btn_crear', 'Create Backup', 2),
('backup_btn_restaurar', 'Restaurar Base de Datos', 1),
('backup_btn_restaurar', 'Restore Database', 2)


insert into Leyenda (nombreLeyenda, texto, idiomaID) values 
('bitacora_lbl_usuarios', 'Usuarios', 1),
('bitacora_lbl_usuarios', 'Usuarios', 2),
('bitacora_btn_buscar', 'Buscar Eventos', 1),
('bitacora_btn_buscar', 'Search Events', 2)

update leyenda set texto = 'Users' where nombreLeyenda = 'bitacora_lbl_usuarios' and IdiomaID = 2

update leyenda set nombreLeyenda = 'login_lbl_password' where nombreLeyenda = 'login_lbl_passwordr'

select * from usuario

select * from usuario

select * from DVV


update DVV set valor = 105075 where idDVV=1