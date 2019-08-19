USE [master]
GO
/****** Object:  Database [nusmart]    Script Date: 18/08/2019 23:52:32 ******/
CREATE DATABASE [nusmart]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'nusmart', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\nusmart.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'nusmart_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\nusmart_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [nusmart] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [nusmart].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [nusmart] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [nusmart] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [nusmart] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [nusmart] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [nusmart] SET ARITHABORT OFF 
GO
ALTER DATABASE [nusmart] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [nusmart] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [nusmart] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [nusmart] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [nusmart] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [nusmart] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [nusmart] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [nusmart] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [nusmart] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [nusmart] SET  DISABLE_BROKER 
GO
ALTER DATABASE [nusmart] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [nusmart] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [nusmart] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [nusmart] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [nusmart] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [nusmart] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [nusmart] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [nusmart] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [nusmart] SET  MULTI_USER 
GO
ALTER DATABASE [nusmart] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [nusmart] SET DB_CHAINING OFF 
GO
ALTER DATABASE [nusmart] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [nusmart] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [nusmart] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [nusmart] SET QUERY_STORE = OFF
GO
USE [nusmart]
GO
/****** Object:  Table [dbo].[Alimento]    Script Date: 18/08/2019 23:52:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alimento](
	[calorias] [int] NULL,
	[nombre] [varchar](50) NULL,
	[tipoAlimento] [varchar](50) NULL,
	[alimentoID] [int] NOT NULL,
 CONSTRAINT [PK_Alimento] PRIMARY KEY CLUSTERED 
(
	[alimentoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bitacora]    Script Date: 18/08/2019 23:52:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bitacora](
	[actividad] [varchar](50) NULL,
	[fecha] [datetime] NULL,
	[mensaje] [varchar](50) NULL,
	[tipoCriticidad] [varchar](50) NULL,
	[bitacoraID] [int] IDENTITY(1,1) NOT NULL,
	[usuarioID] [int] NULL,
 CONSTRAINT [PK_Bitacora] PRIMARY KEY CLUSTERED 
(
	[bitacoraID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DatosAnalíticos]    Script Date: 18/08/2019 23:52:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DatosAnalíticos](
	[colesterolHDL] [int] NULL,
	[colesterolLDL] [int] NULL,
	[colesterolTotal] [int] NULL,
	[masaGrasa] [int] NULL,
	[masaMuscular] [int] NULL,
	[porcentajeMasaGrasa] [int] NULL,
	[presionArterial] [int] NULL,
	[trigliceridos] [int] NULL,
	[datosAnalíticosID] [int] NOT NULL,
 CONSTRAINT [PK_DatosAnalíticos] PRIMARY KEY CLUSTERED 
(
	[datosAnalíticosID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiaAlimenticio]    Script Date: 18/08/2019 23:52:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiaAlimenticio](
	[idPlatoalmuerzo] [int] NULL,
	[idPlatocena] [int] NULL,
	[idPlatodesayuno] [int] NULL,
	[idPlatomediaMañana] [int] NULL,
	[idPlatomerienda] [int] NULL,
	[diaAlimenticioID] [int] NOT NULL,
	[dietaID] [int] NOT NULL,
 CONSTRAINT [PK_DiaAlimenticio] PRIMARY KEY CLUSTERED 
(
	[diaAlimenticioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dieta]    Script Date: 18/08/2019 23:52:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dieta](
	[domingo] [int] NULL,
	[jueves] [int] NULL,
	[lunes] [int] NULL,
	[martes] [int] NULL,
	[miercoles] [int] NULL,
	[sabado] [int] NULL,
	[viernes] [int] NULL,
	[dietaID] [int] NOT NULL,
	[esGeneradaAutomaticamente] [bit] NULL,
	[tratamientoID] [int] NOT NULL,
 CONSTRAINT [PK_Dieta] PRIMARY KEY CLUSTERED 
(
	[dietaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DVV]    Script Date: 18/08/2019 23:52:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DVV](
	[nombreTabla] [varchar](50) NULL,
	[valor] [int] NULL,
	[idDVV] [int] NOT NULL,
 CONSTRAINT [PK_DVV] PRIMARY KEY CLUSTERED 
(
	[idDVV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ejercicio]    Script Date: 18/08/2019 23:52:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ejercicio](
	[caloriasQuemadas] [int] NULL,
	[duración] [int] NULL,
	[nombre] [varchar](50) NULL,
	[ejercicioID] [int] NOT NULL,
	[rutinaID] [int] NOT NULL,
 CONSTRAINT [PK_Ejercicio] PRIMARY KEY CLUSTERED 
(
	[ejercicioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Habitos]    Script Date: 18/08/2019 23:52:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Habitos](
	[descripcionHabito] [varchar](50) NULL,
	[pacienteID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Idioma]    Script Date: 18/08/2019 23:52:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Idioma](
	[descripcionIdioma] [varchar](50) NULL,
	[nombreIdioma] [varchar](50) NULL,
	[idiomaID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Idioma] PRIMARY KEY CLUSTERED 
(
	[idiomaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JoinAlimentoPlato]    Script Date: 18/08/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JoinAlimentoPlato](
	[alimentoID] [varchar](50) NULL,
	[platoID] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JoinAlimentoToPlato]    Script Date: 18/08/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JoinAlimentoToPlato](
	[platoID] [int] NULL,
	[alimentoID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JoinNutricionistaToUsuario]    Script Date: 18/08/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JoinNutricionistaToUsuario](
	[usuarioID] [int] NULL,
	[nutricionistaID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JoinUsuarioPermiso]    Script Date: 18/08/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JoinUsuarioPermiso](
	[usuarioID] [int] NOT NULL,
	[permisoID] [int] NOT NULL,
 CONSTRAINT [PK_JounUsuarioPermiso] PRIMARY KEY CLUSTERED 
(
	[usuarioID] ASC,
	[permisoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Leyenda]    Script Date: 18/08/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Leyenda](
	[nombreLeyenda] [varchar](50) NULL,
	[texto] [varchar](50) NULL,
	[leyendaID] [int] IDENTITY(1,1) NOT NULL,
	[idiomaID] [int] NOT NULL,
 CONSTRAINT [PK_Leyenda] PRIMARY KEY CLUSTERED 
(
	[leyendaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicion]    Script Date: 18/08/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicion](
	[altura] [int] NULL,
	[cadera] [int] NULL,
	[cintura] [int] NULL,
	[peso] [int] NULL,
	[medicionID] [int] NOT NULL,
	[datosAnalíticosID] [int] NOT NULL,
	[pacienteID] [int] NOT NULL,
	[turnoID] [int] NOT NULL,
 CONSTRAINT [PK_Medicion] PRIMARY KEY CLUSTERED 
(
	[medicionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nutricionista]    Script Date: 18/08/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nutricionista](
	[dni] [int] NULL,
	[especialización] [varchar](50) NULL,
	[matricula] [varchar](50) NULL,
	[nutricionistaID] [int] IDENTITY(1,1) NOT NULL,
	[apellido] [varchar](50) NULL,
	[usuarioID] [int] NULL,
	[nombre] [varchar](50) NULL,
	[sexo] [char](10) NULL,
	[DVH] [int] NULL,
 CONSTRAINT [PK_Nutricionista] PRIMARY KEY CLUSTERED 
(
	[nutricionistaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paciente]    Script Date: 18/08/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paciente](
	[email] [varchar](50) NULL,
	[telefono] [int] NULL,
	[pacienteID] [int] NOT NULL,
	[tratamientoID] [int] NOT NULL,
	[apellido] [varchar](50) NULL,
	[dni] [int] NULL,
	[nombre] [varchar](50) NULL,
	[sexo] [char](10) NULL,
	[habitos] [varchar](50) NULL,
	[DVH] [int] NULL,
 CONSTRAINT [PK_Paciente] PRIMARY KEY CLUSTERED 
(
	[pacienteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permiso]    Script Date: 18/08/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permiso](
	[permisoID] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](100) NULL,
	[codigo] [varchar](10) NULL,
 CONSTRAINT [PK_Permiso] PRIMARY KEY CLUSTERED 
(
	[permisoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permiso_Jerarquia]    Script Date: 18/08/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permiso_Jerarquia](
	[IdPadrePermiso] [int] NULL,
	[IdHijoPermiso] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Plato]    Script Date: 18/08/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plato](
	[calorias] [int] NULL,
	[esColacion] [bit] NULL,
	[esDesayuno] [bit] NULL,
	[esMerienda] [bit] NULL,
	[diaAlimenticioID] [int] NOT NULL,
	[esPlatoPrincipal] [bit] NULL,
	[nombre] [char](10) NULL,
	[platoID] [int] NOT NULL,
 CONSTRAINT [PK_Plato] PRIMARY KEY CLUSTERED 
(
	[platoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proyección]    Script Date: 18/08/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proyección](
	[proyecciónID] [int] NOT NULL,
	[DVH] [int] NULL,
	[tratamientoID] [int] NOT NULL,
 CONSTRAINT [PK_Proyección] PRIMARY KEY CLUSTERED 
(
	[proyecciónID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PuntoComparativo]    Script Date: 18/08/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PuntoComparativo](
	[PuntoId] [int] NOT NULL,
	[proyecciónID] [int] NULL,
	[Punto] [int] NULL,
 CONSTRAINT [PK_Punto] PRIMARY KEY CLUSTERED 
(
	[PuntoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PuntoProyeccion]    Script Date: 18/08/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PuntoProyeccion](
	[PuntoId] [int] NOT NULL,
	[proyecciónID] [int] NULL,
	[ValorPeso] [int] NULL,
	[ValorFecha] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 18/08/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[descripción] [varchar](50) NULL,
	[rolID] [int] NOT NULL,
	[familiaID] [int] NULL,
	[usuarioID] [int] NULL,
 CONSTRAINT [PK_Rol] PRIMARY KEY CLUSTERED 
(
	[rolID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rutina]    Script Date: 18/08/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rutina](
	[idEjercicioDomingo] [int] NULL,
	[idEjercicioJueves] [int] NULL,
	[idEjercicioLunes] [int] NULL,
	[idEjercicioMartes] [int] NULL,
	[idEjercicioMiercoles] [int] NULL,
	[idEjercicioSabado] [int] NULL,
	[idEjercicioViernes] [int] NULL,
	[rutinaID] [int] NOT NULL,
	[tratamientoID] [int] NOT NULL,
 CONSTRAINT [PK_Rutina] PRIMARY KEY CLUSTERED 
(
	[rutinaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tratamiento]    Script Date: 18/08/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tratamiento](
	[fechaFinalizado] [date] NULL,
	[fechaInicio] [date] NULL,
	[tratamientoID] [int] NOT NULL,
 CONSTRAINT [PK_Tratamiento] PRIMARY KEY CLUSTERED 
(
	[tratamientoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Turno]    Script Date: 18/08/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Turno](
	[fecha] [date] NULL,
	[turnoID] [int] NOT NULL,
	[pacienteID] [int] NULL,
	[profesionalID] [int] NULL,
	[nutricionistaID] [int] NULL,
 CONSTRAINT [PK_Turno] PRIMARY KEY CLUSTERED 
(
	[turnoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 18/08/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[password] [varchar](50) NULL,
	[username] [varchar](50) NULL,
	[usuarioID] [int] IDENTITY(1,1) NOT NULL,
	[DVH] [int] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[usuarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Bitacora]  WITH CHECK ADD  CONSTRAINT [FK_Bitacora_Usuario] FOREIGN KEY([usuarioID])
REFERENCES [dbo].[Usuario] ([usuarioID])
GO
ALTER TABLE [dbo].[Bitacora] CHECK CONSTRAINT [FK_Bitacora_Usuario]
GO
ALTER TABLE [dbo].[DiaAlimenticio]  WITH CHECK ADD  CONSTRAINT [FK_DiaAlimenticio_Dieta] FOREIGN KEY([dietaID])
REFERENCES [dbo].[Dieta] ([dietaID])
GO
ALTER TABLE [dbo].[DiaAlimenticio] CHECK CONSTRAINT [FK_DiaAlimenticio_Dieta]
GO
ALTER TABLE [dbo].[Dieta]  WITH CHECK ADD  CONSTRAINT [FK_Dieta_Tratamiento] FOREIGN KEY([tratamientoID])
REFERENCES [dbo].[Tratamiento] ([tratamientoID])
GO
ALTER TABLE [dbo].[Dieta] CHECK CONSTRAINT [FK_Dieta_Tratamiento]
GO
ALTER TABLE [dbo].[Ejercicio]  WITH CHECK ADD  CONSTRAINT [FK_Ejercicio_Rutina] FOREIGN KEY([rutinaID])
REFERENCES [dbo].[Rutina] ([rutinaID])
GO
ALTER TABLE [dbo].[Ejercicio] CHECK CONSTRAINT [FK_Ejercicio_Rutina]
GO
ALTER TABLE [dbo].[Habitos]  WITH CHECK ADD  CONSTRAINT [FK_Habitos_Paciente] FOREIGN KEY([pacienteID])
REFERENCES [dbo].[Paciente] ([pacienteID])
GO
ALTER TABLE [dbo].[Habitos] CHECK CONSTRAINT [FK_Habitos_Paciente]
GO
ALTER TABLE [dbo].[JoinAlimentoToPlato]  WITH CHECK ADD  CONSTRAINT [FK_JoinAlimentoToPlato_Plato] FOREIGN KEY([platoID])
REFERENCES [dbo].[Plato] ([platoID])
GO
ALTER TABLE [dbo].[JoinAlimentoToPlato] CHECK CONSTRAINT [FK_JoinAlimentoToPlato_Plato]
GO
ALTER TABLE [dbo].[JoinUsuarioPermiso]  WITH CHECK ADD  CONSTRAINT [FK_JoinUsuarioPermiso_Permiso] FOREIGN KEY([permisoID])
REFERENCES [dbo].[Permiso] ([permisoID])
GO
ALTER TABLE [dbo].[JoinUsuarioPermiso] CHECK CONSTRAINT [FK_JoinUsuarioPermiso_Permiso]
GO
ALTER TABLE [dbo].[JoinUsuarioPermiso]  WITH CHECK ADD  CONSTRAINT [FK_JoinUsuarioPermiso_Usuario] FOREIGN KEY([usuarioID])
REFERENCES [dbo].[Usuario] ([usuarioID])
GO
ALTER TABLE [dbo].[JoinUsuarioPermiso] CHECK CONSTRAINT [FK_JoinUsuarioPermiso_Usuario]
GO
ALTER TABLE [dbo].[Leyenda]  WITH CHECK ADD  CONSTRAINT [FK_Leyenda_Idioma] FOREIGN KEY([idiomaID])
REFERENCES [dbo].[Idioma] ([idiomaID])
GO
ALTER TABLE [dbo].[Leyenda] CHECK CONSTRAINT [FK_Leyenda_Idioma]
GO
ALTER TABLE [dbo].[Medicion]  WITH CHECK ADD  CONSTRAINT [FK_Medicion_DatosAnalíticos] FOREIGN KEY([datosAnalíticosID])
REFERENCES [dbo].[DatosAnalíticos] ([datosAnalíticosID])
GO
ALTER TABLE [dbo].[Medicion] CHECK CONSTRAINT [FK_Medicion_DatosAnalíticos]
GO
ALTER TABLE [dbo].[Medicion]  WITH CHECK ADD  CONSTRAINT [FK_Medicion_Turno] FOREIGN KEY([turnoID])
REFERENCES [dbo].[Turno] ([turnoID])
GO
ALTER TABLE [dbo].[Medicion] CHECK CONSTRAINT [FK_Medicion_Turno]
GO
ALTER TABLE [dbo].[Nutricionista]  WITH CHECK ADD  CONSTRAINT [FK_Nutricionista_Usuario] FOREIGN KEY([usuarioID])
REFERENCES [dbo].[Usuario] ([usuarioID])
GO
ALTER TABLE [dbo].[Nutricionista] CHECK CONSTRAINT [FK_Nutricionista_Usuario]
GO
ALTER TABLE [dbo].[Paciente]  WITH CHECK ADD  CONSTRAINT [FK_Paciente_Tratamiento] FOREIGN KEY([tratamientoID])
REFERENCES [dbo].[Tratamiento] ([tratamientoID])
GO
ALTER TABLE [dbo].[Paciente] CHECK CONSTRAINT [FK_Paciente_Tratamiento]
GO
ALTER TABLE [dbo].[Permiso_Jerarquia]  WITH CHECK ADD  CONSTRAINT [FK_Permiso_Jerarquia_Permiso] FOREIGN KEY([IdPadrePermiso])
REFERENCES [dbo].[Permiso] ([permisoID])
GO
ALTER TABLE [dbo].[Permiso_Jerarquia] CHECK CONSTRAINT [FK_Permiso_Jerarquia_Permiso]
GO
ALTER TABLE [dbo].[Permiso_Jerarquia]  WITH CHECK ADD  CONSTRAINT [FK_Permiso_Jerarquia_Permiso1] FOREIGN KEY([IdHijoPermiso])
REFERENCES [dbo].[Permiso] ([permisoID])
GO
ALTER TABLE [dbo].[Permiso_Jerarquia] CHECK CONSTRAINT [FK_Permiso_Jerarquia_Permiso1]
GO
ALTER TABLE [dbo].[Plato]  WITH CHECK ADD  CONSTRAINT [FK_Plato_DiaAlimenticio] FOREIGN KEY([diaAlimenticioID])
REFERENCES [dbo].[DiaAlimenticio] ([diaAlimenticioID])
GO
ALTER TABLE [dbo].[Plato] CHECK CONSTRAINT [FK_Plato_DiaAlimenticio]
GO
ALTER TABLE [dbo].[Proyección]  WITH CHECK ADD  CONSTRAINT [FK_Proyección_Tratamiento] FOREIGN KEY([tratamientoID])
REFERENCES [dbo].[Tratamiento] ([tratamientoID])
GO
ALTER TABLE [dbo].[Proyección] CHECK CONSTRAINT [FK_Proyección_Tratamiento]
GO
ALTER TABLE [dbo].[PuntoComparativo]  WITH CHECK ADD  CONSTRAINT [FK_Punto_Proyección] FOREIGN KEY([proyecciónID])
REFERENCES [dbo].[Proyección] ([proyecciónID])
GO
ALTER TABLE [dbo].[PuntoComparativo] CHECK CONSTRAINT [FK_Punto_Proyección]
GO
ALTER TABLE [dbo].[PuntoProyeccion]  WITH CHECK ADD  CONSTRAINT [FK_PuntoProyeccion_Proyección] FOREIGN KEY([proyecciónID])
REFERENCES [dbo].[Proyección] ([proyecciónID])
GO
ALTER TABLE [dbo].[PuntoProyeccion] CHECK CONSTRAINT [FK_PuntoProyeccion_Proyección]
GO
ALTER TABLE [dbo].[Rutina]  WITH CHECK ADD  CONSTRAINT [FK_Rutina_Tratamiento] FOREIGN KEY([tratamientoID])
REFERENCES [dbo].[Tratamiento] ([tratamientoID])
GO
ALTER TABLE [dbo].[Rutina] CHECK CONSTRAINT [FK_Rutina_Tratamiento]
GO
ALTER TABLE [dbo].[Turno]  WITH CHECK ADD  CONSTRAINT [FK_Turno_Paciente] FOREIGN KEY([pacienteID])
REFERENCES [dbo].[Paciente] ([pacienteID])
GO
ALTER TABLE [dbo].[Turno] CHECK CONSTRAINT [FK_Turno_Paciente]
GO
USE [master]
GO
ALTER DATABASE [nusmart] SET  READ_WRITE 
GO
