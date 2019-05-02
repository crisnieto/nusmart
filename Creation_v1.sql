IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_Bitacora_Usuario]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [Bitacora] DROP CONSTRAINT [FK_Bitacora_Usuario]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_DiaAlimenticio_Dieta]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [DiaAlimenticio] DROP CONSTRAINT [FK_DiaAlimenticio_Dieta]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_Dieta_Tratamiento]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [Dieta] DROP CONSTRAINT [FK_Dieta_Tratamiento]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_Ejercicio_Rutina]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [Ejercicio] DROP CONSTRAINT [FK_Ejercicio_Rutina]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_Habitos_Paciente]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [Habitos] DROP CONSTRAINT [FK_Habitos_Paciente]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[Alimento]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [JoinAlimentoPlato] DROP CONSTRAINT [Alimento]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[Plato]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [JoinAlimentoPlato] DROP CONSTRAINT [Plato]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_JoinAlimentoToPlato_Plato]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [JoinAlimentoToPlato] DROP CONSTRAINT [FK_JoinAlimentoToPlato_Plato]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[Plato]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [JoinAlimentoToPlato] DROP CONSTRAINT [Plato]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[Alimento]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [JoinAlimentoToPlato] DROP CONSTRAINT [Alimento]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[Usuario]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [JoinNutricionistaToUsuario] DROP CONSTRAINT [Usuario]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[Nutricionista]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [JoinNutricionistaToUsuario] DROP CONSTRAINT [Nutricionista]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_Leyenda_Idioma]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [Leyenda] DROP CONSTRAINT [FK_Leyenda_Idioma]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_Medicion_DatosAnalíticos]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [Medicion] DROP CONSTRAINT [FK_Medicion_DatosAnalíticos]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_Medicion_Paciente]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [Medicion] DROP CONSTRAINT [FK_Medicion_Paciente]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_Medicion_Turno]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [Medicion] DROP CONSTRAINT [FK_Medicion_Turno]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_Nutricionista_Persona]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [Nutricionista] DROP CONSTRAINT [FK_Nutricionista_Persona]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_Paciente_Persona]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [Paciente] DROP CONSTRAINT [FK_Paciente_Persona]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_Paciente_Tratamiento]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [Paciente] DROP CONSTRAINT [FK_Paciente_Tratamiento]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_Plato_DiaAlimenticio]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [Plato] DROP CONSTRAINT [FK_Plato_DiaAlimenticio]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_Proyección_Tratamiento]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [Proyección] DROP CONSTRAINT [FK_Proyección_Tratamiento]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_Punto_Proyección]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [PuntoComparativo] DROP CONSTRAINT [FK_Punto_Proyección]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_Punto_Proyección]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [PuntoProyeccion] DROP CONSTRAINT [FK_Punto_Proyección]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_PuntoProyeccion_Proyección]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [PuntoProyeccion] DROP CONSTRAINT [FK_PuntoProyeccion_Proyección]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_Rol_Familia]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [Rol] DROP CONSTRAINT [FK_Rol_Familia]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_Rol_Usuario]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [Rol] DROP CONSTRAINT [FK_Rol_Usuario]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_Rutina_Tratamiento]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [Rutina] DROP CONSTRAINT [FK_Rutina_Tratamiento]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_Turno_Paciente]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [Turno] DROP CONSTRAINT [FK_Turno_Paciente]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_Turno_Profesional]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [Turno] DROP CONSTRAINT [FK_Turno_Profesional]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_Turno_Nutricionista]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [Turno] DROP CONSTRAINT [FK_Turno_Nutricionista]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_Usuario_Nutricionista]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [Usuario] DROP CONSTRAINT [FK_Usuario_Nutricionista]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[Alimento]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [Alimento]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[Bitacora]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [Bitacora]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[DatosAnalíticos]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [DatosAnalíticos]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[DiaAlimenticio]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [DiaAlimenticio]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[Dieta]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [Dieta]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[DVV]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [DVV]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[Ejercicio]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [Ejercicio]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[Habitos]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [Habitos]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[Idioma]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [Idioma]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[JoinAlimentoPlato]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [JoinAlimentoPlato]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[JoinAlimentoToPlato]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [JoinAlimentoToPlato]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[JoinNutricionistaToUsuario]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [JoinNutricionistaToUsuario]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[JoinUsuarioPermiso]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [JoinUsuarioPermiso]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[Leyenda]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [Leyenda]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[Medicion]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [Medicion]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[Nutricionista]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [Nutricionista]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[Paciente]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [Paciente]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[Permiso]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [Permiso]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[Permiso_Jerarquia]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [Permiso_Jerarquia]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[Plato]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [Plato]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[Proyección]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [Proyección]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[PuntoComparativo]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [PuntoComparativo]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[PuntoProyeccion]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [PuntoProyeccion]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[Rol]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [Rol]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[Rutina]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [Rutina]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[Tratamiento]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [Tratamiento]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[Turno]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [Turno]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[Usuario]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [Usuario]
;

CREATE TABLE [Alimento]
(
	[calorias] int,
	[nombre] varchar(50),
	[tipoAlimento] varchar(50),
	[alimentoID] int NOT NULL
)
;

CREATE TABLE [Bitacora]
(
	[actividad] varchar(50),
	[fecha] date,
	[mensaje] varchar(50),
	[tipoCriticidad] varchar(50),
	[bitacoraID] int NOT NULL,
	[usuarioID] int
)
;

CREATE TABLE [DatosAnalíticos]
(
	[colesterolHDL] int,
	[colesterolLDL] int,
	[colesterolTotal] int,
	[masaGrasa] int,
	[masaMuscular] int,
	[porcentajeMasaGrasa] int,
	[presionArterial] int,
	[trigliceridos] int,
	[datosAnalíticosID] int NOT NULL
)
;

CREATE TABLE [DiaAlimenticio]
(
	[idPlatoalmuerzo] int,
	[idPlatocena] int,
	[idPlatodesayuno] int,
	[idPlatomediaMañana] int,
	[idPlatomerienda] int,
	[diaAlimenticioID] int NOT NULL,
	[dietaID] int NOT NULL
)
;

CREATE TABLE [Dieta]
(
	[domingo] int,
	[jueves] int,
	[lunes] int,
	[martes] int,
	[miercoles] int,
	[sabado] int,
	[viernes] int,
	[dietaID] int NOT NULL,
	[esGeneradaAutomaticamente] bit,
	[tratamientoID] int NOT NULL
)
;

CREATE TABLE [DVV]
(
	[nombreTabla] varchar(50),
	[valor] int,
	[idDVV] int NOT NULL
)
;

CREATE TABLE [Ejercicio]
(
	[caloriasQuemadas] int,
	[duración] int,
	[nombre] varchar(50),
	[ejercicioID] int NOT NULL,
	[rutinaID] int NOT NULL
)
;

CREATE TABLE [Habitos]
(
	[descripcionHabito] varchar(50),
	[pacienteID] int
)
;

CREATE TABLE [Idioma]
(
	[descripciónIdioma] varchar(50),
	[nombreIdioma] varchar(50),
	[idiomaID] int NOT NULL
)
;

CREATE TABLE [JoinAlimentoPlato]
(
	[alimentoID] varchar(50),
	[platoID] varchar(50)
)
;

CREATE TABLE [JoinAlimentoToPlato]
(
	[platoID] int,
	[alimentoID] int
)
;

CREATE TABLE [JoinNutricionistaToUsuario]
(
	[usuarioID] int,
	[nutricionistaID] int
)
;

CREATE TABLE [JoinUsuarioPermiso]
(
	[usuarioID] int NOT NULL,
	[permisoID] int NOT NULL
)
;

CREATE TABLE [Leyenda]
(
	[nombreLeyenda] varchar(50),
	[texto] varchar(50),
	[leyendaID] int NOT NULL,
	[idiomaID] int NOT NULL
)
;

CREATE TABLE [Medicion]
(
	[altura] int,
	[cadera] int,
	[cintura] int,
	[peso] int,
	[medicionID] int NOT NULL,
	[datosAnalíticosID] int NOT NULL,
	[pacienteID] int NOT NULL,
	[turnoID] int NOT NULL
)
;

CREATE TABLE [Nutricionista]
(
	[especialización] varchar(50),
	[matricula] varchar(50),
	[nutricionistaID] int NOT NULL,
	[apellido] varchar(50),
	[usuarioID] int,
	[dni] int,
	[nombre] varchar(50),
	[sexo] char(10),
	[DVH] int
)
;

CREATE TABLE [Paciente]
(
	[email] varchar(50),
	[telefono] int,
	[pacienteID] int NOT NULL,
	[tratamientoID] int NOT NULL,
	[apellido] varchar(50),
	[dni] int,
	[nombre] varchar(50),
	[sexo] char(10),
	[habitos] varchar(50),
	[DVH] int
)
;

CREATE TABLE [Permiso]
(
	[permisoID] int NOT NULL
)
;

CREATE TABLE [Permiso_Jerarquia]
(
	[IdPadrePermiso] int,
	[IdHijoPermiso] int
)
;

CREATE TABLE [Plato]
(
	[calorias] int,
	[esColacion] bit,
	[esDesayuno] bit,
	[esMerienda] bit,
	[diaAlimenticioID] int NOT NULL,
	[esPlatoPrincipal] bit,
	[nombre] char(10),
	[platoID] int NOT NULL
)
;

CREATE TABLE [Proyección]
(
	[proyecciónID] int NOT NULL,
	[DVH] int,
	[tratamientoID] int NOT NULL
)
;

CREATE TABLE [PuntoComparativo]
(
	[PuntoId] int NOT NULL,
	[proyecciónID] int,
	[Punto] int
)
;

CREATE TABLE [PuntoProyeccion]
(
	[PuntoId] int NOT NULL,
	[proyecciónID] int,
	[ValorPeso] int,
	[ValorFecha] date
)
;

CREATE TABLE [Rol]
(
	[descripción] varchar(50),
	[rolID] int NOT NULL,
	[familiaID] int,
	[usuarioID] int
)
;

CREATE TABLE [Rutina]
(
	[idEjercicioDomingo] int,
	[idEjercicioJueves] int,
	[idEjercicioLunes] int,
	[idEjercicioMartes] int,
	[idEjercicioMiercoles] int,
	[idEjercicioSabado] int,
	[idEjercicioViernes] int,
	[rutinaID] int NOT NULL,
	[tratamientoID] int NOT NULL
)
;

CREATE TABLE [Tratamiento]
(
	[fechaFinalizado] date,
	[fechaInicio] date,
	[tratamientoID] int NOT NULL
)
;

CREATE TABLE [Turno]
(
	[fecha] date,
	[turnoID] int NOT NULL,
	[pacienteID] int,
	[profesionalID] int,
	[nutricionistaID] int
)
;

CREATE TABLE [Usuario]
(
	[password] varchar(50),
	[username] varchar(50),
	[usuarioID] int NOT NULL,
	[nutricionistaID] int NOT NULL,
	[DVH] int
)
;

ALTER TABLE [Alimento] 
 ADD CONSTRAINT [PK_Alimento]
	PRIMARY KEY CLUSTERED ([alimentoID])
;

ALTER TABLE [Bitacora] 
 ADD CONSTRAINT [PK_Bitacora]
	PRIMARY KEY CLUSTERED ([bitacoraID])
;

ALTER TABLE [DatosAnalíticos] 
 ADD CONSTRAINT [PK_DatosAnalíticos]
	PRIMARY KEY CLUSTERED ([datosAnalíticosID])
;

ALTER TABLE [DiaAlimenticio] 
 ADD CONSTRAINT [PK_DiaAlimenticio]
	PRIMARY KEY CLUSTERED ([diaAlimenticioID])
;

ALTER TABLE [Dieta] 
 ADD CONSTRAINT [PK_Dieta]
	PRIMARY KEY CLUSTERED ([dietaID])
;

ALTER TABLE [DVV] 
 ADD CONSTRAINT [PK_DVV]
	PRIMARY KEY CLUSTERED ([idDVV])
;

ALTER TABLE [Ejercicio] 
 ADD CONSTRAINT [PK_Ejercicio]
	PRIMARY KEY CLUSTERED ([ejercicioID])
;

ALTER TABLE [Idioma] 
 ADD CONSTRAINT [PK_Idioma]
	PRIMARY KEY CLUSTERED ([idiomaID])
;

ALTER TABLE [JoinUsuarioPermiso] 
 ADD CONSTRAINT [PK_JounUsuarioPermiso]
	PRIMARY KEY CLUSTERED ([usuarioID],[permisoID])
;

ALTER TABLE [Leyenda] 
 ADD CONSTRAINT [PK_Leyenda]
	PRIMARY KEY CLUSTERED ([leyendaID])
;

ALTER TABLE [Medicion] 
 ADD CONSTRAINT [PK_Medicion]
	PRIMARY KEY CLUSTERED ([medicionID])
;

ALTER TABLE [Nutricionista] 
 ADD CONSTRAINT [PK_Nutricionista]
	PRIMARY KEY CLUSTERED ([nutricionistaID])
;

ALTER TABLE [Paciente] 
 ADD CONSTRAINT [PK_Paciente]
	PRIMARY KEY CLUSTERED ([pacienteID])
;

ALTER TABLE [Permiso] 
 ADD CONSTRAINT [PK_Permiso]
	PRIMARY KEY CLUSTERED ([permisoID])
;

ALTER TABLE [Plato] 
 ADD CONSTRAINT [PK_Plato]
	PRIMARY KEY CLUSTERED ([platoID])
;

ALTER TABLE [Proyección] 
 ADD CONSTRAINT [PK_Proyección]
	PRIMARY KEY CLUSTERED ([proyecciónID])
;

ALTER TABLE [PuntoComparativo] 
 ADD CONSTRAINT [PK_Punto]
	PRIMARY KEY CLUSTERED ([PuntoId])
;

ALTER TABLE [Rol] 
 ADD CONSTRAINT [PK_Rol]
	PRIMARY KEY CLUSTERED ([rolID])
;

ALTER TABLE [Rutina] 
 ADD CONSTRAINT [PK_Rutina]
	PRIMARY KEY CLUSTERED ([rutinaID])
;

ALTER TABLE [Tratamiento] 
 ADD CONSTRAINT [PK_Tratamiento]
	PRIMARY KEY CLUSTERED ([tratamientoID])
;

ALTER TABLE [Turno] 
 ADD CONSTRAINT [PK_Turno]
	PRIMARY KEY CLUSTERED ([turnoID])
;

ALTER TABLE [Usuario] 
 ADD CONSTRAINT [PK_Usuario]
	PRIMARY KEY CLUSTERED ([usuarioID])
;

ALTER TABLE [Bitacora] ADD CONSTRAINT [FK_Bitacora_Usuario]
	FOREIGN KEY ([usuarioID]) REFERENCES [Usuario] ([usuarioID]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [DiaAlimenticio] ADD CONSTRAINT [FK_DiaAlimenticio_Dieta]
	FOREIGN KEY ([dietaID]) REFERENCES [Dieta] ([dietaID]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [Dieta] ADD CONSTRAINT [FK_Dieta_Tratamiento]
	FOREIGN KEY ([tratamientoID]) REFERENCES [Tratamiento] ([tratamientoID]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [Ejercicio] ADD CONSTRAINT [FK_Ejercicio_Rutina]
	FOREIGN KEY ([rutinaID]) REFERENCES [Rutina] ([rutinaID]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [Habitos] ADD CONSTRAINT [FK_Habitos_Paciente]
	FOREIGN KEY ([pacienteID]) REFERENCES [Paciente] ([pacienteID])
;

ALTER TABLE [JoinAlimentoToPlato] ADD CONSTRAINT [FK_JoinAlimentoToPlato_Plato]
	FOREIGN KEY ([platoID]) REFERENCES [Plato] ([platoID])
;


ALTER TABLE [JoinAlimentoToPlato] ADD CONSTRAINT [Alimento]
	FOREIGN KEY ([alimentoID]) REFERENCES [Alimento] ([alimentoID]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [JoinNutricionistaToUsuario] ADD CONSTRAINT [Usuario]
	FOREIGN KEY ([usuarioID]) REFERENCES [Usuario] ([usuarioID]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [JoinNutricionistaToUsuario] ADD CONSTRAINT [Nutricionista]
	FOREIGN KEY ([nutricionistaID]) REFERENCES [Nutricionista] ([nutricionistaID]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [Leyenda] ADD CONSTRAINT [FK_Leyenda_Idioma]
	FOREIGN KEY ([idiomaID]) REFERENCES [Idioma] ([idiomaID]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [Medicion] ADD CONSTRAINT [FK_Medicion_DatosAnalíticos]
	FOREIGN KEY ([datosAnalíticosID]) REFERENCES [DatosAnalíticos] ([datosAnalíticosID]) ON DELETE No Action ON UPDATE No Action
;


ALTER TABLE [Medicion] ADD CONSTRAINT [FK_Medicion_Turno]
	FOREIGN KEY ([turnoID]) REFERENCES [Turno] ([turnoID]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [Nutricionista] ADD CONSTRAINT [FK_Nutricionista_Persona]
	FOREIGN KEY ([nutricionistaID]) REFERENCES [Persona] ([personaID]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [Paciente] ADD CONSTRAINT [FK_Paciente_Persona]
	FOREIGN KEY ([pacienteID]) REFERENCES [Persona] ([personaID]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [Paciente] ADD CONSTRAINT [FK_Paciente_Tratamiento]
	FOREIGN KEY ([tratamientoID]) REFERENCES [Tratamiento] ([tratamientoID]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [Plato] ADD CONSTRAINT [FK_Plato_DiaAlimenticio]
	FOREIGN KEY ([diaAlimenticioID]) REFERENCES [DiaAlimenticio] ([diaAlimenticioID]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [Proyección] ADD CONSTRAINT [FK_Proyección_Tratamiento]
	FOREIGN KEY ([tratamientoID]) REFERENCES [Tratamiento] ([tratamientoID]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [PuntoComparativo] ADD CONSTRAINT [FK_Punto_Proyección]
	FOREIGN KEY ([proyecciónID]) REFERENCES [Proyección] ([proyecciónID])
;

ALTER TABLE [PuntoProyeccion] ADD CONSTRAINT [FK_PuntoProyeccion_Proyección]
	FOREIGN KEY ([proyecciónID]) REFERENCES [Proyección] ([proyecciónID])
;

ALTER TABLE [Rol] ADD CONSTRAINT [FK_Rol_Familia]
	FOREIGN KEY ([familiaID]) REFERENCES [Familia] ([familiaID]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [Rol] ADD CONSTRAINT [FK_Rol_Usuario]
	FOREIGN KEY ([usuarioID]) REFERENCES [Usuario] ([usuarioID]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [Rutina] ADD CONSTRAINT [FK_Rutina_Tratamiento]
	FOREIGN KEY ([tratamientoID]) REFERENCES [Tratamiento] ([tratamientoID]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [Turno] ADD CONSTRAINT [FK_Turno_Paciente]
	FOREIGN KEY ([pacienteID]) REFERENCES [Paciente] ([pacienteID]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [Turno] ADD CONSTRAINT [FK_Turno_Nutricionista]
	FOREIGN KEY ([nutricionistaID]) REFERENCES [Nutricionista] ([nutricionistaID]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [Usuario] ADD CONSTRAINT [FK_Usuario_Nutricionista]
	FOREIGN KEY ([nutricionistaID]) REFERENCES [Nutricionista] ([nutricionistaID]) ON DELETE No Action ON UPDATE No Action
;
