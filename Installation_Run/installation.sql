USE [master]
GO
/****** Object:  Database [nusmart]    Script Date: 8/19/2019 11:10:18 PM ******/
CREATE DATABASE [nusmart]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'nusmart', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\nusmart.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'nusmart_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\nusmart_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [nusmart] SET COMPATIBILITY_LEVEL = 120
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
USE [nusmart]
GO
/****** Object:  Table [dbo].[Alimento]    Script Date: 8/19/2019 11:10:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Bitacora]    Script Date: 8/19/2019 11:10:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DatosAnalíticos]    Script Date: 8/19/2019 11:10:18 PM ******/
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
/****** Object:  Table [dbo].[DiaAlimenticio]    Script Date: 8/19/2019 11:10:18 PM ******/
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
/****** Object:  Table [dbo].[Dieta]    Script Date: 8/19/2019 11:10:18 PM ******/
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
/****** Object:  Table [dbo].[DVV]    Script Date: 8/19/2019 11:10:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ejercicio]    Script Date: 8/19/2019 11:10:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Habitos]    Script Date: 8/19/2019 11:10:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Habitos](
	[descripcionHabito] [varchar](50) NULL,
	[pacienteID] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Idioma]    Script Date: 8/19/2019 11:10:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[JoinAlimentoPlato]    Script Date: 8/19/2019 11:10:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[JoinAlimentoPlato](
	[alimentoID] [varchar](50) NULL,
	[platoID] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[JoinAlimentoToPlato]    Script Date: 8/19/2019 11:10:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JoinAlimentoToPlato](
	[platoID] [int] NULL,
	[alimentoID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[JoinNutricionistaToUsuario]    Script Date: 8/19/2019 11:10:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JoinNutricionistaToUsuario](
	[usuarioID] [int] NULL,
	[nutricionistaID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[JoinUsuarioPermiso]    Script Date: 8/19/2019 11:10:18 PM ******/
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
/****** Object:  Table [dbo].[Leyenda]    Script Date: 8/19/2019 11:10:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Medicion]    Script Date: 8/19/2019 11:10:18 PM ******/
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
/****** Object:  Table [dbo].[Nutricionista]    Script Date: 8/19/2019 11:10:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Paciente]    Script Date: 8/19/2019 11:10:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Permiso]    Script Date: 8/19/2019 11:10:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Permiso_Jerarquia]    Script Date: 8/19/2019 11:10:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permiso_Jerarquia](
	[IdPadrePermiso] [int] NULL,
	[IdHijoPermiso] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Plato]    Script Date: 8/19/2019 11:10:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Proyección]    Script Date: 8/19/2019 11:10:18 PM ******/
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
/****** Object:  Table [dbo].[PuntoComparativo]    Script Date: 8/19/2019 11:10:18 PM ******/
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
/****** Object:  Table [dbo].[PuntoProyeccion]    Script Date: 8/19/2019 11:10:18 PM ******/
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
/****** Object:  Table [dbo].[Rol]    Script Date: 8/19/2019 11:10:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rutina]    Script Date: 8/19/2019 11:10:18 PM ******/
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
/****** Object:  Table [dbo].[Tratamiento]    Script Date: 8/19/2019 11:10:18 PM ******/
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
/****** Object:  Table [dbo].[Turno]    Script Date: 8/19/2019 11:10:18 PM ******/
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
/****** Object:  Table [dbo].[Usuario]    Script Date: 8/19/2019 11:10:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Bitacora] ON 

INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-14 00:00:00.000' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 2, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-19 00:00:00.000' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 3, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-19 00:00:00.000' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 4, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-19 00:00:00.000' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 5, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-19 00:00:00.000' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 6, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-19 00:00:00.000' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 7, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-19 00:00:00.000' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 8, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-19 00:00:00.000' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 9, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-19 00:00:00.000' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 10, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-19 00:00:00.000' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 11, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-19 00:00:00.000' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 12, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-19 00:00:00.000' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 13, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-19 00:00:00.000' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 14, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-19 00:00:00.000' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 15, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-19 00:00:00.000' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 16, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-19 00:00:00.000' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 17, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-19 00:00:00.000' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 18, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-19 00:00:00.000' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 19, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-19 00:00:00.000' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 20, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-19 00:00:00.000' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 21, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-19 00:00:00.000' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 22, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-19 00:00:00.000' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 23, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-19 22:22:00.000' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 24, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-19 22:23:00.000' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 25, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-19 22:24:00.000' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 26, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-19 22:26:00.000' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 27, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-19 22:28:00.000' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 28, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-19 22:48:00.000' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 29, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-19 22:49:00.000' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 30, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-19 22:53:00.000' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 31, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-19 22:54:56.077' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 32, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-19 22:56:12.000' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 33, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-19 22:57:17.000' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 34, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-19 22:59:52.257' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 35, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-19 23:00:28.117' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 36, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-19 23:00:54.260' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 37, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-19 23:10:17.053' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 38, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-19 23:11:37.340' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 39, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-19 23:15:18.180' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 40, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-19 23:25:14.487' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 41, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-19 23:47:40.933' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 42, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-19 23:53:51.247' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 43, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 00:04:52.253' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 44, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 00:06:00.530' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 45, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 00:06:30.363' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 46, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 00:07:19.130' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 47, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 00:08:45.010' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 48, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 00:09:04.520' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 49, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 00:10:33.290' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 50, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 00:14:58.263' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 51, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 00:20:23.347' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 52, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 00:20:54.837' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 53, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 00:27:23.843' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 54, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 01:18:05.393' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 55, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 01:20:20.167' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 56, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 01:23:13.463' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 57, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 01:54:48.987' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 58, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 01:59:32.843' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 59, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 02:00:22.243' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 60, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 02:03:35.867' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 61, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 02:07:54.687' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 62, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 02:17:35.497' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 63, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 02:20:18.893' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 64, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 02:22:03.680' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 65, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 02:22:56.580' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 66, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 02:23:21.320' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 67, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 02:32:07.730' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 68, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 02:32:19.263' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 69, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 02:36:30.940' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 70, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 02:46:05.547' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 71, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 02:53:09.270' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 72, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 02:56:11.830' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 73, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 02:56:22.390' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 74, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 02:57:59.547' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 75, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 02:59:35.850' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 76, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 03:04:41.250' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 77, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 03:04:59.900' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 78, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 03:07:19.697' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 79, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 04:57:24.030' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 80, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 05:01:50.027' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 81, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 05:02:08.463' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 82, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 05:23:25.120' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 83, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 05:40:57.870' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 84, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 05:42:40.137' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 85, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 05:43:14.903' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 86, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 05:44:20.087' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 87, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 05:44:44.573' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 88, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 05:51:28.893' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 89, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 05:52:43.270' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 90, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 05:53:07.470' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 91, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 05:53:49.317' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 92, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 05:55:11.673' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 93, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 05:57:27.827' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 94, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 06:01:14.957' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 95, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 06:03:02.027' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 96, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 06:04:42.913' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 97, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 06:05:52.817' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 98, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 06:06:53.870' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 99, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 06:08:22.880' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 100, 1)
GO
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 06:09:55.513' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 101, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 06:10:29.683' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 102, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 19:15:07.627' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 103, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 20:21:44.580' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 104, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 20:22:29.893' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 105, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 20:23:46.643' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 106, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 20:26:20.757' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 107, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 20:28:06.343' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 108, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 20:30:10.570' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 109, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 21:30:37.887' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 110, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 21:31:07.743' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 111, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 21:33:27.160' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 112, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 21:37:42.590' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 113, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 21:56:29.407' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 114, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 21:57:24.567' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 115, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 21:59:28.153' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 116, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 21:59:34.530' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 117, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 22:02:32.873' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 118, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 22:03:09.347' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 119, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 22:04:47.837' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 120, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 22:05:14.553' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 121, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 23:02:31.903' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 122, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 23:03:44.033' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 123, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 23:05:28.540' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 124, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 23:07:22.010' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 125, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 23:08:43.613' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 126, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 23:10:35.870' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 127, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 23:13:23.537' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 128, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 23:15:39.880' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 129, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 23:21:55.237' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 130, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 23:23:31.083' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 131, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 23:25:39.753' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 132, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 23:26:31.663' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 133, 6)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 23:35:58.063' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 134, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 23:36:10.640' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 135, 6)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 23:41:52.523' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 136, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 23:42:06.173' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 137, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-20 23:58:02.497' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 138, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-21 00:00:59.953' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 139, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-21 00:02:43.793' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 140, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-21 00:09:06.497' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 141, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-21 00:13:21.453' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 142, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-21 00:16:32.197' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 143, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-21 00:27:48.163' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 144, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-21 00:31:03.453' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 145, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-21 00:31:54.607' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 146, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-21 00:33:05.310' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 147, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-21 00:34:41.200' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 148, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-21 00:36:05.227' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 149, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-21 00:38:51.893' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 150, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-21 00:41:26.087' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 151, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-21 00:43:09.260' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 152, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-21 00:46:30.640' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 153, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-21 00:51:07.327' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 154, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-21 00:55:33.597' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 155, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-21 00:58:37.927' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 156, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-21 01:01:35.847' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 157, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-21 01:09:21.380' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 158, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-21 01:10:33.487' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 159, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-21 01:12:01.013' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 160, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-21 01:15:57.460' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 161, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-21 01:30:01.323' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 162, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-21 01:38:20.907' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 163, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-21 01:44:40.843' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 164, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-21 01:48:01.967' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 165, 6)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-21 01:49:45.890' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 166, 6)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-21 01:51:19.980' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 167, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-21 01:52:03.447' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 168, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-21 01:55:32.500' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 169, 6)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-21 02:02:24.260' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 170, 6)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-21 02:04:35.463' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 171, 6)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-21 02:15:17.720' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 172, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-21 02:16:43.907' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 173, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Logout de Usuario', CAST(N'2019-05-21 02:17:02.290' AS DateTime), N'Se detectó un logout', N'Baja', 174, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-21 02:17:17.020' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 175, 6)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-21 02:23:59.993' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 176, 6)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-21 02:25:56.810' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 177, 6)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Logout de Usuario', CAST(N'2019-05-21 02:26:12.627' AS DateTime), N'Se detectó un logout', N'Baja', 178, 6)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-21 02:26:20.147' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 179, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-21 02:28:24.600' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 180, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-21 02:30:32.937' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 181, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Logout de Usuario', CAST(N'2019-05-21 02:31:19.853' AS DateTime), N'Se detectó un logout', N'Baja', 182, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-21 02:31:27.787' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 183, 6)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-21 02:43:09.810' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 184, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-21 02:44:00.717' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 185, 8)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Logout de Usuario', CAST(N'2019-05-21 02:44:12.083' AS DateTime), N'Se detectó un logout', N'Baja', 186, 8)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-21 02:50:19.757' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 187, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-21 02:51:40.877' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 188, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Logout de Usuario', CAST(N'2019-05-21 02:52:04.787' AS DateTime), N'Se detectó un logout', N'Baja', 189, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-21 02:52:14.343' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 190, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-21 02:55:13.223' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 191, 6)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Cambio de Password', CAST(N'2019-05-21 02:55:20.917' AS DateTime), N'Se ejecutó un cambio de password', N'Media', 192, 6)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Logout de Usuario', CAST(N'2019-05-21 02:55:46.060' AS DateTime), N'Se detectó un logout', N'Baja', 193, 6)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-21 02:55:54.907' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 194, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-21 16:39:40.023' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 195, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Logout de Usuario', CAST(N'2019-05-21 16:42:06.070' AS DateTime), N'Se detectó un logout', N'Baja', 196, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-21 16:46:36.130' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 197, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-21 16:48:57.180' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 198, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-21 16:50:13.157' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 199, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-21 16:52:09.867' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 200, 1)
GO
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-21 16:52:46.560' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 201, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Logout de Usuario', CAST(N'2019-05-21 16:52:55.397' AS DateTime), N'Se detectó un logout', N'Baja', 202, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-21 16:53:03.587' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 203, 6)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-21 16:57:38.977' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 204, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-21 17:03:41.900' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 205, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-21 17:05:02.340' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 206, 6)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Logout de Usuario', CAST(N'2019-05-21 17:05:18.613' AS DateTime), N'Se detectó un logout', N'Baja', 207, 6)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-21 17:05:23.960' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 208, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Logout de Usuario', CAST(N'2019-05-21 17:09:24.663' AS DateTime), N'Se detectó un logout', N'Baja', 209, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-21 17:09:30.270' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 210, 7)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-21 17:11:27.563' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 211, 7)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Cambio de Password', CAST(N'2019-05-21 17:11:39.023' AS DateTime), N'Se ejecutó un cambio de password', N'Media', 212, 7)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Logout de Usuario', CAST(N'2019-05-21 17:11:42.953' AS DateTime), N'Se detectó un logout', N'Baja', 213, 7)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-21 17:11:59.100' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 214, 8)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Cambio de Password', CAST(N'2019-05-21 17:12:08.690' AS DateTime), N'Se ejecutó un cambio de password', N'Media', 215, 8)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Logout de Usuario', CAST(N'2019-05-21 17:12:11.540' AS DateTime), N'Se detectó un logout', N'Baja', 216, 8)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-21 18:23:03.500' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 217, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Logout de Usuario', CAST(N'2019-05-21 18:23:06.793' AS DateTime), N'Se detectó un logout', N'Baja', 218, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-21 18:23:20.040' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 219, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-21 20:09:21.383' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 220, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-28 12:03:42.007' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 221, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-28 12:04:51.663' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 222, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-28 12:07:30.373' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 223, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-28 12:08:34.407' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 224, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-28 12:10:12.820' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 225, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-28 12:49:27.603' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 226, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Logout de Usuario', CAST(N'2019-05-28 12:49:33.813' AS DateTime), N'Se detectó un logout', N'Baja', 227, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-28 12:50:33.983' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 228, 6)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-28 14:18:55.177' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 229, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-28 14:28:05.830' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 230, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-28 14:40:57.463' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 231, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Logout de Usuario', CAST(N'2019-05-28 14:41:13.297' AS DateTime), N'Se detectó un logout', N'Baja', 232, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-28 14:41:20.463' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 233, 6)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-28 14:46:58.983' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 234, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-28 14:49:08.363' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 235, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-28 14:49:28.353' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 236, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-28 14:50:00.480' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 237, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-28 14:54:59.090' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 238, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-28 14:58:35.993' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 239, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-28 15:08:37.277' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 240, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-28 15:09:49.657' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 241, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-28 15:10:42.130' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 242, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-28 15:26:50.657' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 243, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-28 15:37:11.393' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 244, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-28 15:48:12.220' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 245, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-28 15:50:51.603' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 246, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-28 16:13:08.937' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 247, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-28 16:14:00.190' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 248, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-28 16:19:51.097' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 249, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-28 16:27:03.917' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 250, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-28 16:40:32.977' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 251, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-28 16:41:47.620' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 252, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-28 16:42:33.457' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 253, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-28 16:45:31.477' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 254, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-28 16:56:15.130' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 255, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-28 16:59:49.240' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 256, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-28 18:16:20.343' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 257, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-28 18:17:08.840' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 258, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-28 18:18:40.647' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 259, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-28 18:21:19.730' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 260, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-28 18:23:30.267' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 261, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-28 18:37:30.657' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 262, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-28 19:08:20.570' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 263, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-28 19:13:30.100' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 264, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-28 19:19:20.177' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 265, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-28 19:21:05.093' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 266, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-28 19:23:44.963' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 267, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-28 22:31:14.947' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 268, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-28 22:50:52.893' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 269, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-28 23:13:55.207' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 270, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-28 23:22:08.427' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 271, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-28 23:23:22.940' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 272, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-28 23:25:07.110' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 273, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-28 23:28:01.110' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 274, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-28 23:28:43.530' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 275, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-28 23:32:57.993' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 276, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-28 23:35:23.200' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 277, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-28 23:37:04.083' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 278, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-28 23:39:55.060' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 279, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-28 23:41:00.060' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 280, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-05-28 23:47:32.127' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 281, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-06-01 18:00:10.133' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 1257, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-06-01 18:00:42.867' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 1258, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-06-01 18:39:50.410' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 1259, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-06-01 18:40:47.073' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 1260, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-06-01 18:41:34.033' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 1261, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-06-01 18:43:59.497' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 1262, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-06-01 18:45:04.837' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 1263, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-06-01 18:45:56.567' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 1264, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-06-01 18:46:38.950' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 1265, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-06-01 18:47:16.610' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 1266, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-06-01 18:49:46.450' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 1267, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-06-01 18:52:24.850' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 1268, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-06-01 19:27:01.500' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 1269, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-06-01 19:28:24.687' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 1270, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-06-01 19:29:12.070' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 1271, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-06-01 19:33:17.750' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 1272, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-06-01 19:52:10.060' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 1273, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-06-02 11:02:24.323' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 1274, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-06-02 11:04:34.967' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 1275, 1)
GO
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-06-02 11:07:13.020' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 1276, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-06-02 11:17:45.723' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 1277, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-06-02 11:53:52.210' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 1278, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-06-02 12:02:36.670' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 1279, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-06-02 12:04:48.830' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 1280, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-06-02 12:05:41.620' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 1281, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-08-19 00:22:47.370' AS DateTime), N'Se detecto un evento de ingreso', N'Baja', 1282, 1)
SET IDENTITY_INSERT [dbo].[Bitacora] OFF
INSERT [dbo].[DVV] ([nombreTabla], [valor], [idDVV]) VALUES (N'Usuario', 144979, 1)
INSERT [dbo].[DVV] ([nombreTabla], [valor], [idDVV]) VALUES (N'Nutricionista', 143464, 2)
SET IDENTITY_INSERT [dbo].[Idioma] ON 

INSERT [dbo].[Idioma] ([descripcionIdioma], [nombreIdioma], [idiomaID]) VALUES (N'Idioma Español neutro', N'Español', 1)
INSERT [dbo].[Idioma] ([descripcionIdioma], [nombreIdioma], [idiomaID]) VALUES (N'UK English Language', N'English', 2)
SET IDENTITY_INSERT [dbo].[Idioma] OFF
INSERT [dbo].[JoinUsuarioPermiso] ([usuarioID], [permisoID]) VALUES (1, 48)
INSERT [dbo].[JoinUsuarioPermiso] ([usuarioID], [permisoID]) VALUES (6, 36)
INSERT [dbo].[JoinUsuarioPermiso] ([usuarioID], [permisoID]) VALUES (6, 37)
INSERT [dbo].[JoinUsuarioPermiso] ([usuarioID], [permisoID]) VALUES (6, 38)
INSERT [dbo].[JoinUsuarioPermiso] ([usuarioID], [permisoID]) VALUES (6, 43)
INSERT [dbo].[JoinUsuarioPermiso] ([usuarioID], [permisoID]) VALUES (7, 43)
INSERT [dbo].[JoinUsuarioPermiso] ([usuarioID], [permisoID]) VALUES (8, 43)
SET IDENTITY_INSERT [dbo].[Leyenda] ON 

INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'login_lbl_usuario', N'Usuario', 1, 1)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'login_lbl_usuario', N'User', 2, 2)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'login_lbl_password', N'Contraseña', 3, 1)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'login_lbl_password', N'Password', 4, 2)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'login_lbl_login', N'Ingresar', 5, 1)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'login_lbl_login', N'Log In', 6, 2)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'login_btn_login', N'Ingresar', 7, 1)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'login_btn_login', N'Log In', 8, 2)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'menu_gestion_bitacora', N'Bitacora', 9, 1)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'menu_gestion_bitacora', N'User Logs', 10, 2)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'menu_gestion_backup', N'Respaldos', 11, 1)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'menu_gestion_backup', N'Backups', 12, 2)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'menu_gestion_nutricionistas', N'Gestión de Usuarios', 13, 1)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'menu_gestion_nutricionistas', N'Users Management', 14, 2)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'menu_gestion_micuenta', N'Mi Cuenta', 15, 1)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'menu_gestion_micuenta', N'My Account', 16, 2)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'menu_cambiar_idioma', N'Cambiar Idioma', 17, 1)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'menu_cambiar_idioma', N'Change Language', 18, 2)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'menu_cerrar_sesion', N'Cerrar Sesión', 19, 1)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'menu_cerrar_sesion', N'Close Session', 20, 2)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'menu_gestion_pacientes', N'Gestión de Pacientes', 21, 1)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'menu_gestion_pacientes', N'Patients Management', 22, 2)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'menu_gestion_comidas', N'Gestión de Comidas', 23, 1)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'menu_gestion_comidas', N'Food Management', 24, 2)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'menu_gestion_ejercicios', N'Gestión de Ejercicios', 25, 1)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'menu_gestion_ejercicios', N'Workout Management', 26, 2)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'menu_gestion_dietas', N'Gestión de Dietas', 27, 1)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'menu_gestion_dietas', N'Diet Management', 28, 2)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'menu_gestion_start_appointment', N'Iniciar Turno', 29, 1)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'menu_gestion_start_appointment', N'Start Appointment', 30, 2)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'menu_gestion_erase_appointment', N'Borrar Turno', 31, 1)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'menu_gestion_erase_appointment', N'Erase Appointment', 32, 2)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'menu_gestion_lbl_appointments', N'Tus turnos de hoy', 33, 1)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'menu_gestion_lbl_appointments', N'Your appointments for today', 34, 2)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'backup_lbl_title', N'Gestión de Backup', 35, 1)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'backup_lbl_title', N'Backup Management', 36, 2)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'backup_btn_crear', N'Crear Backup', 37, 1)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'backup_btn_crear', N'Create Backup', 38, 2)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'backup_btn_restaurar', N'Restaurar Base de Datos', 39, 1)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'backup_btn_restaurar', N'Restore Database', 40, 2)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'bitacora_lbl_usuarios', N'Usuarios', 41, 1)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'bitacora_lbl_usuarios', N'User', 42, 2)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'bitacora_btn_buscar', N'Buscar Eventos', 43, 1)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'bitacora_btn_buscar', N'Search Events', 44, 2)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'backup_lbl_title', N'Gestión de Backup', 71, 1)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'backup_lbl_title', N'Backup Management', 72, 2)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'backup_btn_crear', N'Crear Backup', 73, 1)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'backup_btn_crear', N'Create Backup', 74, 2)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'backup_btn_restaurar', N'Restaurar Base de Datos', 75, 1)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'backup_btn_restaurar', N'Restore Database', 76, 2)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'bitacora_lbl_usuarios', N'Usuarios', 77, 1)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'bitacora_lbl_usuarios', N'User', 78, 2)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'bitacora_btn_buscar', N'Buscar Eventos', 79, 1)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'bitacora_btn_buscar', N'Search Events', 80, 2)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'nutricionista_lbl_usuario', N'Usuario', 81, 1)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'nutricionista_lbl_usuario', N'User', 82, 2)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'nutricionista_lbl_contraseña', N'Contraseña', 83, 1)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'nutricionista_lbl_contraseña', N'Password', 84, 2)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'nutricionista_lbl_nombre', N'Nombre', 85, 1)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'nutricionista_lbl_nombre', N'Name', 86, 2)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'nutricionista_lbl_apellido', N'Apellido', 87, 1)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'nutricionista_lbl_apellido', N'Surname', 88, 2)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'nutricionista_lbl_matricula', N'Matricula', 89, 1)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'nutricionista_lbl_matricula', N'Enrollment', 90, 2)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'nutricionista_lbl_especializacion', N'Especialización', 91, 1)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'nutricionista_lbl_especializacion', N'Specialty', 92, 2)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'nutricionista_btn_crear', N'Crear Nutricionista', 93, 1)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'nutricionista_btn_crear', N'Create Nutricionist', 94, 2)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'nutricionista_lbl_sexo', N'Sexo', 95, 1)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'nutricionista_lbl_sexo', N'Sex', 96, 2)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'nutricionista_frm_title', N'Gestion de Nutricionistas', 97, 1)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'nutricionista_frm_title', N'Nutricionist Management', 98, 2)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'micuenta_lbl_username', N'Usuario', 99, 1)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'micuenta_lbl_username', N'User', 100, 2)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'micuenta_lbl_nombre', N'Nombre', 101, 1)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'micuenta_lbl_nombre', N'Name', 102, 2)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'micuenta_lbl_apellido', N'Usuario', 103, 1)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'micuenta_lbl_apellido', N'User', 104, 2)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'micuenta_lbl_nueva_password', N'Nueva Contraseña', 105, 1)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'micuenta_lbl_nueva_password', N'New Password', 106, 2)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'micuenta_btn_cambiar', N'Cambiar Contraseña', 107, 1)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'micuenta_btn_cambiar', N'Change Password', 108, 2)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'menu_micuenta', N'Mi Cuenta', 109, 1)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'menu_micuenta', N'My Account', 110, 2)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'menu_turnos', N'Turnos', 111, 1)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'menu_turnos', N'Appointments', 112, 2)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'menu_pacientes', N'Pacientes', 113, 1)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'menu_pacientes', N'Patients', 114, 2)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'menu_nutricionistas', N'Nutricionistas', 115, 1)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'menu_nutricionistas', N'Nutricionists', 116, 2)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'menu_dieta_ejercicio', N'Dieta y Ejercicios', 117, 1)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'menu_dieta_ejercicio', N'Diet and Exercices', 118, 2)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'menu_idioma', N'Idioma', 119, 1)
INSERT [dbo].[Leyenda] ([nombreLeyenda], [texto], [leyendaID], [idiomaID]) VALUES (N'menu_idioma', N'Language', 120, 2)
SET IDENTITY_INSERT [dbo].[Leyenda] OFF
SET IDENTITY_INSERT [dbo].[Nutricionista] ON 

INSERT [dbo].[Nutricionista] ([dni], [especialización], [matricula], [nutricionistaID], [apellido], [usuarioID], [nombre], [sexo], [DVH]) VALUES (37124345, N'Nutricion', N'ASD2123', 1, N'Perez', 1, N'Juan', N'M         ', 34564)
INSERT [dbo].[Nutricionista] ([dni], [especialización], [matricula], [nutricionistaID], [apellido], [usuarioID], [nombre], [sexo], [DVH]) VALUES (37171095, N'nutri', N'asd123', 3, N'nieto', 6, N'cristian', N'          ', 36054)
INSERT [dbo].[Nutricionista] ([dni], [especialización], [matricula], [nutricionistaID], [apellido], [usuarioID], [nombre], [sexo], [DVH]) VALUES (37171095, N'1002', N'ASD123', 4, N'nieto', 7, N'cristian', N'          ', 36127)
INSERT [dbo].[Nutricionista] ([dni], [especialización], [matricula], [nutricionistaID], [apellido], [usuarioID], [nombre], [sexo], [DVH]) VALUES (2351241, N'Algo', N'FAFA123', 5, N'Jaime', 8, N'Jacinto', N'          ', 36719)
SET IDENTITY_INSERT [dbo].[Nutricionista] OFF
SET IDENTITY_INSERT [dbo].[Permiso] ON 

INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (1, N'Generar turno para paciente', N'OP001')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (2, N'Borrar turno con un Paciente', N'OP003')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (3, N'Alta de datos de Paciente', N'OP004')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (4, N'Modificacion de datos de Paciente', N'OP005')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (5, N'Baja de datos de Paciente', N'OP006')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (6, N'Consulta de Alimentos', N'OP007')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (7, N'Alta de Alimento', N'OP008')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (8, N'Modificación de Alimento', N'OP009')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (9, N'Baja de Alimento', N'OP010')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (10, N'Consulta de Dietas Disponibles', N'OP011')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (11, N'Alta de Dieta', N'OP012')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (12, N'Modificación de Dieta', N'OP013')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (13, N'Baja de Dieta', N'OP014')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (14, N'Consulta de Ejercicios', N'OP015')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (15, N'Alta de Ejercicios', N'OP016')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (16, N'Modificación de Ejercicios', N'OP017')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (17, N'Baja de Ejercicios', N'OP018')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (18, N'Cálculo de BMI', N'OP019')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (19, N'Cálculo de BFP', N'OP020')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (20, N'Creación de Rutina de Ejercicios', N'OP021')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (21, N'Modificación de Rutina de Ejercicios', N'OP022')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (22, N'Baja de Rutina de Ejercicios', N'OP023')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (23, N'Solicitud de Sugerencia de Alimentos', N'OP024')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (24, N'Consulta de Asistencia del Paciente', N'OP026')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (25, N'Consulta de Datos Analíticos de Sangre por turno de paciente', N'OP031')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (26, N'Baja de Datos Analíticos de Sangre por turno de paciente', N'OP032')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (27, N'Solicitud de Resumen de Estado', N'OP033')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (28, N'Solicitud de proyección de peso hacia objetivo', N'OP034')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (29, N'Visualizar Actividad del Nutricionista', N'OP036')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (30, N'Alta de Nutricionista', N'OP038')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (31, N'Baja de Nutricionista', N'OP039')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (32, N'Modificación de datos de Nutricionista', N'OP040')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (33, N'Inicio de Tratamiento', N'OP041')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (34, N'Finalizar Tratamiento', N'OP042')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (35, N'Solicitud de Resumen de Estado', N'OP044')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (36, N'Gestión de paciente', N'GE100')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (37, N'Generación de turnos', N'GE101')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (38, N'Gestión de Dieta y Ejercicios', N'GE102')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (39, N'Cálculo por método antropométrico', N'GE103')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (40, N'Cálculo de Infografías', N'GE104')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (41, N'Gestión de Datos Analíticos de Sangre', N'GE106')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (42, N'Gestión de Proyecciones', N'GE107')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (43, N'Autogestión de cuenta', N'GE110')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (44, N'Gestión e informes de Nutricionistas', N'GE109')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (45, N'Permiso Huerfano Prueba', N'OP901')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (46, N'Manejo Bitacora', N'OP45')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (47, N'Manejo de Backup', N'OP46')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (48, N'Administrador', N'AA099')
SET IDENTITY_INSERT [dbo].[Permiso] OFF
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (36, 3)
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (36, 4)
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (36, 5)
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (36, 33)
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (36, 34)
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (44, 46)
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (44, 47)
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (44, 30)
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (44, 31)
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (44, 32)
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (48, 44)
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (38, 6)
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (38, 7)
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (38, 9)
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (38, 10)
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (38, 11)
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (38, 12)
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (38, 13)
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (38, 21)
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (38, 22)
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (38, 23)
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (48, 38)
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([password], [username], [usuarioID], [DVH]) VALUES (N'b08c8c585b6d67164c163767076445d6', N'test', 1, 34374)
INSERT [dbo].[Usuario] ([password], [username], [usuarioID], [DVH]) VALUES (N'561b8551f6f11713c9f5440db30ad42c', N'crisnieto', 6, 35669)
INSERT [dbo].[Usuario] ([password], [username], [usuarioID], [DVH]) VALUES (N'4d186321c1a7f0f354b297e8914ab240', N'lalala', 7, 35070)
INSERT [dbo].[Usuario] ([password], [username], [usuarioID], [DVH]) VALUES (N'4d186321c1a7f0f354b297e8914ab240', N'prueba', 8, 39866)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
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
