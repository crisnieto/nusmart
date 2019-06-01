select * from permiso

select * from Usuario

insert into Permiso (descripcion, codigo) values ('Permiso Huerfano Prueba', 'OP901')


insert into Permiso (descripcion, codigo) values ('Borrar turno con un Paciente', 'OP003'),
('Alta de datos de Paciente', 'OP004'),
('Modificacion de datos de Paciente', 'OP005'),
('Baja de datos de Paciente', 'OP006'),
('Consulta de Alimentos', 'OP007'),
('Alta de Alimento', 'OP008'),
('Modificación de Alimento', 'OP009'),
('Baja de Alimento', 'OP010'),
('Consulta de Dietas Disponibles', 'OP011'),
('Alta de Dieta', 'OP012'),
('Modificación de Dieta', 'OP013'),
('Baja de Dieta', 'OP014'),
('Consulta de Ejercicios', 'OP015'),
('Alta de Ejercicios', 'OP016'),
('Modificación de Ejercicios', 'OP017'),
('Baja de Ejercicios', 'OP018'),
('Cálculo de BMI', 'OP019'),
('Cálculo de BFP', 'OP020'),
('Creación de Rutina de Ejercicios', 'OP021'),
('Modificación de Rutina de Ejercicios', 'OP022'),
('Baja de Rutina de Ejercicios', 'OP023'),
('Solicitud de Sugerencia de Alimentos', 'OP024'),
('Consulta de Asistencia del Paciente', 'OP026'),
('Consulta de Datos Analíticos de Sangre por turno de paciente', 'OP031'),
('Baja de Datos Analíticos de Sangre por turno de paciente', 'OP032'),
('Solicitud de Resumen de Estado', 'OP033'),
('Solicitud de proyección de peso hacia objetivo', 'OP034'),
('Visualizar Actividad del Nutricionista', 'OP036'),
('Alta de Nutricionista', 'OP038'),
('Baja de Nutricionista', 'OP039'),
('Modificación de datos de Nutricionista', 'OP040'),
('Inicio de Tratamiento', 'OP041'),
('Finalizar Tratamiento', 'OP042'),
('Solicitud de Resumen de Estado', 'OP044')




insert into Permiso (descripcion, codigo) values ('Gestión de paciente', 'GE100'),
('Generación de turnos', 'GE101'),
('Gestión de Dieta y Ejercicios', 'GE102'),
('Cálculo por método antropométrico', 'GE103'),
('Cálculo de Infografías', 'GE104'),
('Gestión de Datos Analíticos de Sangre', 'GE106'),
('Gestión de Proyecciones', 'GE107'),
('Autogestión de cuenta', 'GE110'),
('Gestión e informes de Nutricionistas', 'GE109')


select * from JoinUsuarioPermiso

select * from Usuario
insert into JoinUsuarioPermiso(usuarioID, permisoID) values (9, 48)

select * from Permiso where permisoID = 38
select * from Permiso_Jerarquia
select * from permiso where permisoid=5

select * from JoinUsuarioPermiso 

select * from J

insert into Permiso_Jerarquia(IdPadrePermiso, IdHijoPermiso) values
(38,(select permisoID from Permiso where codigo='OP007')),
(38,(select permisoID from Permiso where codigo='OP008')),
(38,(select permisoID from Permiso where codigo='OP010')),
(38,(select permisoID from Permiso where codigo='OP011')),
(38,(select permisoID from Permiso where codigo='OP012')),
(38,(select permisoID from Permiso where codigo='OP013')),
(38,(select permisoID from Permiso where codigo='OP014')),
(38,(select permisoID from Permiso where codigo='OP022')),
(38,(select permisoID from Permiso where codigo='OP023')),
(38,(select permisoID from Permiso where codigo='OP024'))

insert into Permiso_Jerarquia(IdPadrePermiso, IdHijoPermiso) values
(48,38)

insert into JoinUsuarioPermiso (usuarioID, permisoID)
values 
(6, (select permisoID from Permiso where codigo = 'GE110'))



select * from permiso 

insert into JoinUsuarioPermiso (usuarioID, permisoID)
values ()

select * from Usuario
select * from JoinUsuarioPermiso;


insert into JoinUsuarioPermiso (usuarioID, permisoID) values
(1, 45)

select * from Permiso_Jerarquia

select * from Idioma

select permisoID from JoinUsuarioPermiso where usuarioID = 1



/* PASO 1: Selecciono los permisos por usuario (Seria el primer nivel, en este punto no importa si son familias o patentes) */
select permisoID from JoinUsuarioPermiso where usuarioID = 1


/* PASO 2: Por cada permiso, muestro su descripcion */
select A.permisoID, P.descripcion, P.codigo from JoinUsuarioPermiso A join (select permisoID, descripcion, codigo from Permiso) P 
ON (A.permisoID = P.permisoID) where A.permisoID IN (select permisoID from JoinUsuarioPermiso where usuarioID = 1) 


/* PASO 3: Valido si tiene hijos -> Si tiene es Familia - Sino, es Patente */
select A.IdPadrePermiso, A.IdHijoPermiso, P.codigo, P.descripcion, C.codigoPadre, C.descripcionPadre
from Permiso_Jerarquia A JOIN (select permisoID, 
codigo, descripcion from Permiso) P ON (A.IdHijoPermiso = P.permisoID)
JOIN (select permisoID, codigo as codigoPadre, descripcion as descripcionPadre from Permiso) C ON (A.IdPadrePermiso = C.permisoID)
where A.IdPadrePermiso = 36

/* Por cada uno de los hijos, repetir PASO 2 Y 3 */


select permisoID, codigo, descripcion from Permiso where permisoID = 45 

select A.permisoID, B.codigo, B.descripcion,  C.IdPadrePermiso, C.IdHijoPermiso from JoinUsuarioPermiso A
JOIN (select permisoID, codigo, descripcion from Permiso) B ON (A.permisoID = B.permisoId)
JOIN (select IdPadrePermiso, IdHijoPermiso from Permiso_Jerarquia) C ON (a.permisoID = c.IdPadrePermiso )
where A.usuarioID = 1


select * from JoinUsuarioPermiso where usuarioID = 6



select * from permiso id where permisoID IN (36, 37, 38, 43)

select A.IdPadrePermiso, A.IdHijoPermiso as IdPropio, P.codigo, P.descripcion, C.descripcion_padre, C.codigo_padre 
from Permiso_Jerarquia A FULL OUTER JOIN (select permisoID, 
codigo, descripcion from Permiso) P ON (A.IdHijoPermiso = P.permisoID)
FULL OUTER JOIN (select permisoID as id_padre, codigo AS codigo_padre, descripcion AS descripcion_padre FROM Permiso) C ON (A.IdHijoPermiso = C.id_padre) 
where A.IdPadrePermiso IN (select permisoID from JoinUsuarioPermiso where usuarioID = 6)
Order By IdPadrePermiso



SELECT * FROM JoinUsuarioPermiso where usuarioID = 6


select * from Permiso_Jerarquia;

update usuario set password ='561b8551f6f11713c9f5440db30ad42c' where username = 'crisnieto'

select * from Permiso where codigo = 'OP46';

select * from Permiso_Jerarquia