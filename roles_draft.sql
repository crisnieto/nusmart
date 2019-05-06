select * from permiso

select * from Usuario

insert into Permiso (descripcion, codigo) values ('Permiso Huerfano Prueba', 'OP901')


insert into Permiso (descripcion, codigo) values ('Borrar turno con un Paciente', 'OP003'),
('Alta de datos de Paciente', 'OP004'),
('Modificacion de datos de Paciente', 'OP005'),
('Baja de datos de Paciente', 'OP006'),
('Consulta de Alimentos', 'OP007'),
('Alta de Alimento', 'OP008'),
('Modificaci�n de Alimento', 'OP009'),
('Baja de Alimento', 'OP010'),
('Consulta de Dietas Disponibles', 'OP011'),
('Alta de Dieta', 'OP012'),
('Modificaci�n de Dieta', 'OP013'),
('Baja de Dieta', 'OP014'),
('Consulta de Ejercicios', 'OP015'),
('Alta de Ejercicios', 'OP016'),
('Modificaci�n de Ejercicios', 'OP017'),
('Baja de Ejercicios', 'OP018'),
('C�lculo de BMI', 'OP019'),
('C�lculo de BFP', 'OP020'),
('Creaci�n de Rutina de Ejercicios', 'OP021'),
('Modificaci�n de Rutina de Ejercicios', 'OP022'),
('Baja de Rutina de Ejercicios', 'OP023'),
('Solicitud de Sugerencia de Alimentos', 'OP024'),
('Consulta de Asistencia del Paciente', 'OP026'),
('Consulta de Datos Anal�ticos de Sangre por turno de paciente', 'OP031'),
('Baja de Datos Anal�ticos de Sangre por turno de paciente', 'OP032'),
('Solicitud de Resumen de Estado', 'OP033'),
('Solicitud de proyecci�n de peso hacia objetivo', 'OP034'),
('Visualizar Actividad del Nutricionista', 'OP036'),
('Alta de Nutricionista', 'OP038'),
('Baja de Nutricionista', 'OP039'),
('Modificaci�n de datos de Nutricionista', 'OP040'),
('Inicio de Tratamiento', 'OP041'),
('Finalizar Tratamiento', 'OP042'),
('Solicitud de Resumen de Estado', 'OP044')




insert into Permiso (descripcion, codigo) values ('Gesti�n de paciente', 'GE100'),
('Generaci�n de turnos', 'GE101'),
('Gesti�n de Dieta y Ejercicios', 'GE102'),
('C�lculo por m�todo antropom�trico', 'GE103'),
('C�lculo de Infograf�as', 'GE104'),
('Gesti�n de Datos Anal�ticos de Sangre', 'GE106'),
('Gesti�n de Proyecciones', 'GE107'),
('Autogesti�n de cuenta', 'GE110'),
('Gesti�n e informes de Nutricionistas', 'GE109')

select * from JoinUsuarioPermiso

select * from Permiso_Jerarquia

insert into Permiso_Jerarquia(IdPadrePermiso, id) values
(36,3),
(36,4),
(36,5),
(36,33),
(36,34),


insert into JoinUsuarioPermiso (usuarioID, permisoID) values
(1, 45)

select * from Permiso_Jerarquia

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
JOIN (select IdPadrePermiso, IdHijoPermiso from Permiso_Jerarquia) C ON (a.permisoID = c.IdHijoPermiso )
where A.usuarioID = 1



select A.IdPadrePermiso, A.IdHijoPermiso as IdPropio, P.codigo, P.descripcion, C.descripcion_padre, C.codigo_padre 
from Permiso_Jerarquia A FULL OUTER JOIN (select permisoID, 
codigo, descripcion from Permiso) P ON (A.IdHijoPermiso = P.permisoID)
FULL OUTER JOIN (select permisoID as id_padre, codigo AS codigo_padre, descripcion AS descripcion_padre FROM Permiso) C ON (A.IdHijoPermiso = C.id_padre) 
where A.IdPadrePermiso IN (select permisoID from JoinUsuarioPermiso where usuarioID = 1)
Order By IdPadrePermiso

