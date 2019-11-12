USE [master]
GO
/****** Object:  Database [nusmart]    Script Date: 10/29/2019 6:31:13 PM ******/
CREATE DATABASE [nusmart]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'nusmart', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\nusmart.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'nusmart_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\nusmart_log.ldf' , SIZE = 1088KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  Table [dbo].[Alimento]    Script Date: 10/29/2019 6:31:13 PM ******/
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
	[alimentoID] [int] IDENTITY(1,1) NOT NULL,
	[eliminado] [bit] NOT NULL CONSTRAINT [DF_Alimento_eliminado]  DEFAULT ((0)),
 CONSTRAINT [PK_Alimento] PRIMARY KEY CLUSTERED 
(
	[alimentoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Bitacora]    Script Date: 10/29/2019 6:31:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bitacora](
	[actividad] [varchar](200) NULL,
	[fecha] [datetime] NULL,
	[mensaje] [varchar](200) NULL,
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
/****** Object:  Table [dbo].[DatosAnalíticos]    Script Date: 10/29/2019 6:31:13 PM ******/
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
/****** Object:  Table [dbo].[DiaAlimenticio]    Script Date: 10/29/2019 6:31:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiaAlimenticio](
	[idPlatoAlmuerzo] [int] NULL,
	[idPlatoCena] [int] NULL,
	[idPlatoDesayuno] [int] NULL,
	[idPlatoColacion] [int] NULL,
	[idPlatoMerienda] [int] NULL,
	[diaAlimenticioID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_DiaAlimenticio] PRIMARY KEY CLUSTERED 
(
	[diaAlimenticioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Dieta]    Script Date: 10/29/2019 6:31:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Dieta](
	[domingo] [int] NULL,
	[jueves] [int] NULL,
	[lunes] [int] NULL,
	[martes] [int] NULL,
	[miercoles] [int] NULL,
	[sabado] [int] NULL,
	[viernes] [int] NULL,
	[dietaID] [int] IDENTITY(1,1) NOT NULL,
	[esGeneradaAutomaticamente] [bit] NULL,
	[nombre] [varchar](100) NULL,
 CONSTRAINT [PK_Dieta] PRIMARY KEY CLUSTERED 
(
	[dietaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DVV]    Script Date: 10/29/2019 6:31:13 PM ******/
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
/****** Object:  Table [dbo].[Ejercicio]    Script Date: 10/29/2019 6:31:13 PM ******/
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
/****** Object:  Table [dbo].[Habitos]    Script Date: 10/29/2019 6:31:13 PM ******/
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
/****** Object:  Table [dbo].[Horario]    Script Date: 10/29/2019 6:31:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Horario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tiempo] [time](7) NOT NULL,
 CONSTRAINT [PK_Horarios] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Idioma]    Script Date: 10/29/2019 6:31:13 PM ******/
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
	[eliminado] [bit] NOT NULL CONSTRAINT [DF_Idioma_eliminado]  DEFAULT ((0)),
 CONSTRAINT [PK_Idioma] PRIMARY KEY CLUSTERED 
(
	[idiomaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[JoinAlimentoPlato]    Script Date: 10/29/2019 6:31:13 PM ******/
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
/****** Object:  Table [dbo].[JoinAlimentoToPlato]    Script Date: 10/29/2019 6:31:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JoinAlimentoToPlato](
	[platoID] [int] NULL,
	[alimentoID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[JoinNutricionistaToUsuario]    Script Date: 10/29/2019 6:31:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JoinNutricionistaToUsuario](
	[usuarioID] [int] NULL,
	[nutricionistaID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[JoinUsuarioPermiso]    Script Date: 10/29/2019 6:31:13 PM ******/
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
/****** Object:  Table [dbo].[Leyenda]    Script Date: 10/29/2019 6:31:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Leyenda](
	[leyendaID] [int] IDENTITY(1,1) NOT NULL,
	[nombreControl] [varchar](250) NOT NULL,
	[texto] [varchar](250) NOT NULL,
	[idiomaID] [int] NOT NULL,
	[eliminado] [bit] NOT NULL CONSTRAINT [DF_Leyenda_eliminado]  DEFAULT ((0)),
 CONSTRAINT [PK_Leyenda] PRIMARY KEY CLUSTERED 
(
	[leyendaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Medicion]    Script Date: 10/29/2019 6:31:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicion](
	[altura] [float] NULL,
	[cadera] [int] NULL,
	[cintura] [int] NULL,
	[peso] [int] NULL,
	[medicionID] [int] IDENTITY(1,1) NOT NULL,
	[datosAnalíticosID] [int] NULL,
	[pacienteID] [int] NOT NULL,
	[turnoID] [int] NOT NULL,
 CONSTRAINT [PK_Medicion] PRIMARY KEY CLUSTERED 
(
	[medicionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Nutricionista]    Script Date: 10/29/2019 6:31:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Nutricionista](
	[nutricionistaID] [int] IDENTITY(1,1) NOT NULL,
	[dni] [int] NOT NULL,
	[especialización] [varchar](50) NULL,
	[matricula] [varchar](50) NULL,
	[apellido] [varchar](50) NOT NULL,
	[usuarioID] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[sexo] [char](1) NOT NULL,
	[eliminado] [bit] NOT NULL CONSTRAINT [DF_Nutricionista_eliminado]  DEFAULT ((0)),
	[DVH] [int] NOT NULL,
 CONSTRAINT [PK_Nutricionista] PRIMARY KEY CLUSTERED 
(
	[nutricionistaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Paciente]    Script Date: 10/29/2019 6:31:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Paciente](
	[email] [varchar](50) NULL,
	[telefono] [int] NULL,
	[pacienteID] [int] IDENTITY(1,1) NOT NULL,
	[tratamientoID] [int] NULL,
	[apellido] [varchar](50) NULL,
	[dni] [int] NULL,
	[nombre] [varchar](50) NULL,
	[sexo] [char](1) NULL,
	[habitos] [varchar](50) NULL,
	[DVH] [int] NULL,
	[eliminado] [bit] NOT NULL CONSTRAINT [DF_Paciente_eliminado]  DEFAULT ((0)),
	[fechaNacimiento] [date] NULL,
 CONSTRAINT [PK_Paciente] PRIMARY KEY CLUSTERED 
(
	[pacienteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Permiso]    Script Date: 10/29/2019 6:31:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Permiso](
	[permisoID] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](100) NULL,
	[codigo] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Permiso] PRIMARY KEY CLUSTERED 
(
	[permisoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Permiso_Jerarquia]    Script Date: 10/29/2019 6:31:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permiso_Jerarquia](
	[IdPadrePermiso] [int] NOT NULL,
	[IdHijoPermiso] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Plato]    Script Date: 10/29/2019 6:31:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Plato](
	[platoID] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[calorias] [int] NOT NULL CONSTRAINT [DF_Plato_calorias]  DEFAULT ((0)),
	[esDesayuno] [bit] NOT NULL CONSTRAINT [DF_Plato_esDesayuno]  DEFAULT ((0)),
	[esColacion] [bit] NOT NULL CONSTRAINT [DF_Plato_esColacion]  DEFAULT ((0)),
	[esMerienda] [bit] NOT NULL CONSTRAINT [DF_Plato_esMerienda]  DEFAULT ((0)),
	[esPlatoPrincipal] [bit] NOT NULL,
	[eliminado] [bit] NOT NULL CONSTRAINT [DF_Plato_eliminado]  DEFAULT ((0)),
 CONSTRAINT [PK_Plato] PRIMARY KEY CLUSTERED 
(
	[platoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Proyección]    Script Date: 10/29/2019 6:31:13 PM ******/
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
/****** Object:  Table [dbo].[PuntoComparativo]    Script Date: 10/29/2019 6:31:13 PM ******/
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
/****** Object:  Table [dbo].[PuntoProyeccion]    Script Date: 10/29/2019 6:31:13 PM ******/
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
/****** Object:  Table [dbo].[Rol]    Script Date: 10/29/2019 6:31:13 PM ******/
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
/****** Object:  Table [dbo].[Rutina]    Script Date: 10/29/2019 6:31:13 PM ******/
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
/****** Object:  Table [dbo].[Tratamiento]    Script Date: 10/29/2019 6:31:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tratamiento](
	[fechaFinalizado] [date] NULL,
	[fechaInicio] [date] NULL,
	[tratamientoID] [int] NOT NULL,
	[dietaID] [int] NOT NULL,
 CONSTRAINT [PK_Tratamiento] PRIMARY KEY CLUSTERED 
(
	[tratamientoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Turno]    Script Date: 10/29/2019 6:31:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Turno](
	[fecha] [date] NOT NULL,
	[turnoID] [int] IDENTITY(1,1) NOT NULL,
	[pacienteID] [int] NOT NULL,
	[nutricionistaID] [int] NOT NULL,
	[horarioID] [int] NOT NULL,
	[motivo] [varchar](100) NULL,
 CONSTRAINT [PK_Turno] PRIMARY KEY CLUSTERED 
(
	[turnoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 10/29/2019 6:31:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[usuarioID] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[intentos] [int] NOT NULL CONSTRAINT [DF_Usuario_intentos]  DEFAULT ((0)),
	[eliminado] [bit] NOT NULL CONSTRAINT [DF_Usuario_eliminado]  DEFAULT ((0)),
	[DVH] [int] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[usuarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Alimento] ON 

INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID], [eliminado]) VALUES (140, N'Vaso de Leche Entera', N'Lacteo', 4, 0)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID], [eliminado]) VALUES (160, N'Huevo Hervido', N'Vegetariano', 5, 0)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID], [eliminado]) VALUES (100, N'Yogur Descremado con Cereales', N'Lacteo', 6, 0)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID], [eliminado]) VALUES (45, N'Vaso de Jugo de Naranja', N'Bebida', 7, 0)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID], [eliminado]) VALUES (120, N'Vaso de Coca Cola', N'Bebida', 8, 0)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID], [eliminado]) VALUES (0, N'Agua', N'Bebida', 9, 0)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID], [eliminado]) VALUES (140, N'Huevo a la plancha', N'Vegetariano', 10, 0)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID], [eliminado]) VALUES (130, N'Arroz Blanco', N'Vegetariano', 12, 0)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID], [eliminado]) VALUES (150, N'Pechuga de Pollo', N'Carne', 13, 0)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID], [eliminado]) VALUES (100, N'Merluza', N'Carne', 14, 0)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID], [eliminado]) VALUES (90, N'Papa al Horno', N'Vegetariano', 15, 0)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID], [eliminado]) VALUES (120, N'Canelones de Espinaca', N'Vegetariano', 16, 0)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID], [eliminado]) VALUES (15, N'Salsa de Tomate', N'Vegetariano', 17, 0)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID], [eliminado]) VALUES (65, N'Atun', N'Carne', 18, 0)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID], [eliminado]) VALUES (270, N'Fideos Tirabuzon', N'Vegetariano', 19, 0)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID], [eliminado]) VALUES (35, N'Kanikama', N'Carne', 20, 0)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID], [eliminado]) VALUES (180, N'Huevo Frito', N'Vegetariano', 21, 0)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID], [eliminado]) VALUES (90, N'Papa Hervida', N'Vegetariano', 22, 0)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID], [eliminado]) VALUES (110, N'Jamon Cocido', N'Carne', 23, 0)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID], [eliminado]) VALUES (250, N'Queso Fresco Cremoso', N'Vegetariano', 24, 0)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID], [eliminado]) VALUES (103, N'Tapa de Tarta', N'Vegetariano', 25, 0)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID], [eliminado]) VALUES (50, N'Manzana', N'Vegetariano', 26, 0)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID], [eliminado]) VALUES (55, N'Piña', N'Vegetariano', 27, 0)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID], [eliminado]) VALUES (55, N'Pera', N'Vegetariano', 28, 0)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID], [eliminado]) VALUES (90, N'Banana', N'Vegetariano', 29, 0)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID], [eliminado]) VALUES (20, N'Tomate', N'Vegetariano', 30, 0)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID], [eliminado]) VALUES (200, N'Carne Picada', N'Carne', 31, 0)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID], [eliminado]) VALUES (25, N'Berenjena', N'Vegetariano', 32, 0)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID], [eliminado]) VALUES (28, N'Cebolla Chica', N'Vegetariano', 33, 0)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID], [eliminado]) VALUES (200, N'Carne Hamburguesa', N'Carne', 34, 0)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID], [eliminado]) VALUES (180, N'Pan Hamburguesa', N'Vegetariano', 35, 0)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID], [eliminado]) VALUES (90, N'Salchicha', N'Carne', 36, 0)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID], [eliminado]) VALUES (130, N'Pan de Pancho', N'Vegetariano', 37, 0)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID], [eliminado]) VALUES (20, N'Mayonesa Light (Cucharada)', N'Vegetariano', 38, 0)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID], [eliminado]) VALUES (130, N'Lentejas', N'Vegetariano', 39, 0)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID], [eliminado]) VALUES (20, N'Ajo', N'Vegetariano', 41, 0)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID], [eliminado]) VALUES (40, N'Zanahoria', N'Vegetariano', 42, 0)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID], [eliminado]) VALUES (26, N'Calabaza', N'Vegetariano', 43, 0)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID], [eliminado]) VALUES (350, N'Papas Fritas', N'Vegetariano', 44, 0)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID], [eliminado]) VALUES (600, N'Bife Carne Grande', N'Carne', 45, 0)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID], [eliminado]) VALUES (35, N'Pan Tostado', N'Vegetariano', 46, 0)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID], [eliminado]) VALUES (55, N'Queso Untable Saborizado', N'Vegetariano', 47, 0)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID], [eliminado]) VALUES (50, N'Cafe con Leche', N'Bebida', 48, 0)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID], [eliminado]) VALUES (20, N'Azucar (Cucharada)', N'Vegetariano', 49, 0)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID], [eliminado]) VALUES (165, N'Pistachos (Puñado)', N'Vegetariano', 50, 0)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID], [eliminado]) VALUES (100, N'Nueces (Puñado)', N'Vegetariano', 51, 0)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID], [eliminado]) VALUES (162, N'Almendras (Puñado)', N'Vegetariano', 52, 0)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID], [eliminado]) VALUES (114, N'Racion de Avena', N'Vegetariano', 53, 0)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID], [eliminado]) VALUES (105, N'Leche Entera', N'Vegetariano', 54, 0)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID], [eliminado]) VALUES (64, N'Miel (cucharada)', N'Vegetariano', 55, 0)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID], [eliminado]) VALUES (64, N'Yogur Cremoso', N'Lacteo', 56, 0)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID], [eliminado]) VALUES (110, N'Cereales Copos de Maiz', N'Cereal', 57, 0)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID], [eliminado]) VALUES (61, N'Kiwi', N'Fruta', 58, 0)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID], [eliminado]) VALUES (62, N'Uva', N'Fruta', 59, 0)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID], [eliminado]) VALUES (130, N'Galletita de Agua (5)', N'Vegetariano', 60, 0)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID], [eliminado]) VALUES (200, N'Milanesa', N'Carne', 62, 0)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID], [eliminado]) VALUES (200, N'Milanesa de Soja', N'Vegetariano', 63, 0)
SET IDENTITY_INSERT [dbo].[Alimento] OFF
SET IDENTITY_INSERT [dbo].[Bitacora] ON 

INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-10-29 15:13:03.750' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 1, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-10-29 16:16:17.047' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 2, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-10-29 16:28:49.510' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 3, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-10-29 16:32:12.467' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 4, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-10-29 16:35:56.730' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 5, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-10-29 16:44:39.170' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 6, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-10-29 16:47:50.470' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 7, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-10-29 17:22:00.167' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 8, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-10-29 17:25:06.287' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 9, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-10-29 17:27:37.507' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 10, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-10-29 17:30:17.417' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 11, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-10-29 17:32:45.890' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 12, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-10-29 17:34:19.247' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 13, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-10-29 17:53:30.613' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 14, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-10-29 17:54:41.553' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 15, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-10-29 17:59:47.463' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 16, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-10-29 18:05:09.690' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 17, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-10-29 18:08:30.080' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 18, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-10-29 18:13:13.230' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 19, 1)
SET IDENTITY_INSERT [dbo].[Bitacora] OFF
SET IDENTITY_INSERT [dbo].[DiaAlimenticio] ON 

INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (7, 11, 19, 24, 20, 15)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (6, 8, 19, 25, 21, 16)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (7, 4, 20, 23, 21, 17)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (5, 9, 18, 26, 19, 18)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (6, 7, 17, 24, 19, 19)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (4, 11, 19, 24, 19, 20)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (16, 10, 19, 25, 21, 21)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (10, 9, 18, 23, 20, 22)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (7, 9, 17, 22, 19, 23)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (6, 7, 17, 23, 21, 24)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (7, 15, 20, 25, 25, 25)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (8, 9, 19, 24, 19, 26)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (8, 9, 19, 24, 20, 27)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (9, 11, 19, 24, 21, 28)
SET IDENTITY_INSERT [dbo].[DiaAlimenticio] OFF
SET IDENTITY_INSERT [dbo].[Dieta] ON 

INSERT [dbo].[Dieta] ([domingo], [jueves], [lunes], [martes], [miercoles], [sabado], [viernes], [dietaID], [esGeneradaAutomaticamente], [nombre]) VALUES (21, 18, 15, 16, 17, 20, 19, 1, 0, N'Dieta Variada Levemente Baja en Calorias')
INSERT [dbo].[Dieta] ([domingo], [jueves], [lunes], [martes], [miercoles], [sabado], [viernes], [dietaID], [esGeneradaAutomaticamente], [nombre]) VALUES (28, 25, 22, 23, 24, 27, 26, 2, 0, N'Dieta de Prueba')
SET IDENTITY_INSERT [dbo].[Dieta] OFF
INSERT [dbo].[DVV] ([nombreTabla], [valor], [idDVV]) VALUES (N'Usuario', 503654, 1)
INSERT [dbo].[DVV] ([nombreTabla], [valor], [idDVV]) VALUES (N'Nutricionista', 522592, 2)
SET IDENTITY_INSERT [dbo].[Horario] ON 

INSERT [dbo].[Horario] ([id], [tiempo]) VALUES (5, CAST(N'09:00:00' AS Time))
INSERT [dbo].[Horario] ([id], [tiempo]) VALUES (6, CAST(N'09:30:00' AS Time))
INSERT [dbo].[Horario] ([id], [tiempo]) VALUES (7, CAST(N'10:00:00' AS Time))
INSERT [dbo].[Horario] ([id], [tiempo]) VALUES (8, CAST(N'10:30:00' AS Time))
INSERT [dbo].[Horario] ([id], [tiempo]) VALUES (9, CAST(N'11:00:00' AS Time))
INSERT [dbo].[Horario] ([id], [tiempo]) VALUES (10, CAST(N'11:30:00' AS Time))
INSERT [dbo].[Horario] ([id], [tiempo]) VALUES (11, CAST(N'12:00:00' AS Time))
INSERT [dbo].[Horario] ([id], [tiempo]) VALUES (12, CAST(N'12:30:00' AS Time))
INSERT [dbo].[Horario] ([id], [tiempo]) VALUES (15, CAST(N'14:00:00' AS Time))
INSERT [dbo].[Horario] ([id], [tiempo]) VALUES (16, CAST(N'14:30:00' AS Time))
INSERT [dbo].[Horario] ([id], [tiempo]) VALUES (17, CAST(N'15:00:00' AS Time))
INSERT [dbo].[Horario] ([id], [tiempo]) VALUES (18, CAST(N'15:30:00' AS Time))
INSERT [dbo].[Horario] ([id], [tiempo]) VALUES (19, CAST(N'16:00:00' AS Time))
INSERT [dbo].[Horario] ([id], [tiempo]) VALUES (20, CAST(N'16:30:00' AS Time))
INSERT [dbo].[Horario] ([id], [tiempo]) VALUES (21, CAST(N'17:00:00' AS Time))
INSERT [dbo].[Horario] ([id], [tiempo]) VALUES (22, CAST(N'17:30:00' AS Time))
SET IDENTITY_INSERT [dbo].[Horario] OFF
SET IDENTITY_INSERT [dbo].[Idioma] ON 

INSERT [dbo].[Idioma] ([descripcionIdioma], [nombreIdioma], [idiomaID], [eliminado]) VALUES (N'Idioma Español neutro', N'Español', 1, 0)
INSERT [dbo].[Idioma] ([descripcionIdioma], [nombreIdioma], [idiomaID], [eliminado]) VALUES (N'UK English Language', N'English', 2, 0)
INSERT [dbo].[Idioma] ([descripcionIdioma], [nombreIdioma], [idiomaID], [eliminado]) VALUES (N'Idioma Español neutro', N'asdasd', 3, 1)
INSERT [dbo].[Idioma] ([descripcionIdioma], [nombreIdioma], [idiomaID], [eliminado]) VALUES (N'Idioma Español neutro', N'asd', 4, 1)
INSERT [dbo].[Idioma] ([descripcionIdioma], [nombreIdioma], [idiomaID], [eliminado]) VALUES (N'Portugues de Portugal', N'Portugues', 5, 1)
INSERT [dbo].[Idioma] ([descripcionIdioma], [nombreIdioma], [idiomaID], [eliminado]) VALUES (N'Prueba', N'Portugues', 6, 1)
INSERT [dbo].[Idioma] ([descripcionIdioma], [nombreIdioma], [idiomaID], [eliminado]) VALUES (N'Chino Mandarin', N'Chino', 7, 1)
INSERT [dbo].[Idioma] ([descripcionIdioma], [nombreIdioma], [idiomaID], [eliminado]) VALUES (N'Japones Kanji', N'Japones', 8, 1)
SET IDENTITY_INSERT [dbo].[Idioma] OFF
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'10', N'1')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'7', N'1')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'63', N'3')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'8', N'3')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'12', N'4')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'13', N'4')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'14', N'5')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'15', N'5')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'16', N'6')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'17', N'6')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'18', N'7')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'19', N'7')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'20', N'7')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'21', N'8')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'22', N'8')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'23', N'9')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'24', N'9')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'25', N'9')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'25', N'9')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'30', N'10')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'18', N'10')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'15', N'10')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'31', N'11')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'32', N'11')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'33', N'11')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'34', N'12')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'35', N'12')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'36', N'13')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'37', N'13')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'38', N'13')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'39', N'14')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'41', N'14')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'42', N'14')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'43', N'14')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'17', N'14')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'44', N'15')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'35', N'15')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'34', N'15')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'45', N'16')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'19', N'16')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'46', N'17')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'46', N'17')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'47', N'17')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'48', N'17')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'49', N'17')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'6', N'18')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'29', N'18')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'50', N'19')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'51', N'19')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'52', N'19')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'53', N'20')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'54', N'20')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'29', N'20')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'7', N'20')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'46', N'21')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'24', N'21')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'7', N'21')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'29', N'22')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'55', N'22')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'56', N'23')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'57', N'23')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'58', N'24')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'59', N'24')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'26', N'24')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'28', N'24')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'29', N'24')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'60', N'25')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'47', N'25')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'7', N'25')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'26', N'26')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'29', N'26')
INSERT [dbo].[JoinUsuarioPermiso] ([usuarioID], [permisoID]) VALUES (1, 36)
INSERT [dbo].[JoinUsuarioPermiso] ([usuarioID], [permisoID]) VALUES (1, 37)
INSERT [dbo].[JoinUsuarioPermiso] ([usuarioID], [permisoID]) VALUES (1, 39)
INSERT [dbo].[JoinUsuarioPermiso] ([usuarioID], [permisoID]) VALUES (1, 42)
INSERT [dbo].[JoinUsuarioPermiso] ([usuarioID], [permisoID]) VALUES (1, 43)
INSERT [dbo].[JoinUsuarioPermiso] ([usuarioID], [permisoID]) VALUES (1, 48)
INSERT [dbo].[JoinUsuarioPermiso] ([usuarioID], [permisoID]) VALUES (6, 36)
INSERT [dbo].[JoinUsuarioPermiso] ([usuarioID], [permisoID]) VALUES (6, 37)
INSERT [dbo].[JoinUsuarioPermiso] ([usuarioID], [permisoID]) VALUES (6, 38)
INSERT [dbo].[JoinUsuarioPermiso] ([usuarioID], [permisoID]) VALUES (6, 39)
INSERT [dbo].[JoinUsuarioPermiso] ([usuarioID], [permisoID]) VALUES (6, 42)
INSERT [dbo].[JoinUsuarioPermiso] ([usuarioID], [permisoID]) VALUES (6, 43)
INSERT [dbo].[JoinUsuarioPermiso] ([usuarioID], [permisoID]) VALUES (8, 43)
INSERT [dbo].[JoinUsuarioPermiso] ([usuarioID], [permisoID]) VALUES (11, 43)
INSERT [dbo].[JoinUsuarioPermiso] ([usuarioID], [permisoID]) VALUES (35, 43)
SET IDENTITY_INSERT [dbo].[Leyenda] ON 

INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (1, N'Login_label_usuario', N'Usuario', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (2, N'Login_label_usuario', N'User', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (3, N'Login_label_password', N'Contraseña', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (4, N'Login_label_password', N'Password', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (7, N'Login_button_login', N'Ingresar', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (8, N'Login_button_login', N'Log In', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (10, N'Contenedor_menu_gestion_bitacora', N'User Logs', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (11, N'Contenedor_menu_gestion_bitacora', N'Bitacora', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (12, N'Contenedor_menu_backup', N'Backups', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (13, N'Contenedor_menu_nutricionistas', N'Usuarios', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (14, N'Contenedor_menu_nutricionistas', N'Users', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (15, N'Contenedor_menu_micuenta', N'Mi Cuenta', 1, 1)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (16, N'Contenedor_menu_micuenta', N'My Account', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (17, N'Contenedor_menu_cambiar_idioma', N'Cambiar Idioma', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (18, N'Contenedor_menu_cambiar_idioma', N'Change Language', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (19, N'Contenedor_menu_cerrar_sesion', N'Cerrar Sesión', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (20, N'Contenedor_menu_cerrar_sesion', N'Close Session', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (21, N'Contenedor_menu_pacientes', N'Pacientes', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (22, N'Contenedor_menu_pacientes', N'Patients', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (23, N'Contenedor_menu_gestion_alimentos', N'Gestión de Comidas', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (24, N'Contenedor_menu_gestion_alimentos', N'Food Management', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (25, N'Contenedor_menu_gestion_ejercicios', N'Gestión de Ejercicios', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (26, N'Contenedor_menu_gestion_ejercicios', N'Workout Management', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (27, N'Contenedor_menu_gestion_dietas', N'Gestión de Dietas', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (28, N'Contenedor_menu_gestion_dietas', N'Diet Management', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (35, N'BackupManager_label_titulo', N'Gestión de Backup', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (36, N'BackupManager_label_titulo', N'Backup Management', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (37, N'BackupManager_button_crear_backup', N'Crear Backup', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (38, N'BackupManager_button_crear_backup', N'Create Backup', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (39, N'BackupManager_button_restaurar', N'Restaurar Base de Datos', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (40, N'BackupManager_button_restaurar', N'Restore Database', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (41, N'Bitacora_label_usuarios', N'Usuarios', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (42, N'Bitacora_label_usuarios', N'User', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (43, N'Bitacora_button_buscar', N'Buscar Eventos', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (44, N'Bitacora_button_buscar', N'Search Events', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (81, N'Nutricionista_label_usuario', N'Usuario', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (82, N'Nutricionista_label_usuario', N'User', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (83, N'Nutricionista_label_password', N'Contraseña', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (84, N'Nutricionista_label_password', N'Password', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (85, N'Nutricionista_label_nombre', N'Nombre', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (86, N'Nutricionista_label_nombre', N'Name', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (87, N'Nutricionista_label_apellido', N'Apellido', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (88, N'Nutricionista_label_apellido', N'Surname', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (89, N'Nutricionista_label_matricula', N'Matricula', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (90, N'Nutricionista_label_matricula', N'Enrollment', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (91, N'Nutricionista_label_especializacion', N'Especialización', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (92, N'Nutricionista_label_especializacion', N'Specialty', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (93, N'Nutricionista_button_crear', N'Crear Nutricionista con Usuario', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (94, N'Nutricionista_button_crear', N'Create Nutritionist with User', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (95, N'Nutricionista_label_sexo', N'Sexo', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (96, N'Nutricionista_label_sexo', N'Sex', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (99, N'MiCuenta_label_username', N'Usuario', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (100, N'MiCuenta_label_username', N'User', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (101, N'MiCuenta_label_nombre', N'Nombre', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (102, N'MiCuenta_label_nombre', N'Name', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (103, N'MiCuenta_label_apellido', N'Apellido', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (104, N'MiCuenta_label_apellido', N'Surname', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (105, N'MiCuenta_label_nueva_password', N'Nueva Contraseña', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (106, N'MiCuenta_label_nueva_password', N'New Password', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (107, N'MiCuenta_button_cambiar_password', N'Cambiar Contraseña', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (108, N'MiCuenta_button_cambiar_password', N'Change Password', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (122, N'Bitacora_label_criticidad', N'Criticidad', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (123, N'Bitacora_label_criticidad', N'Criticality', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (124, N'Bitacora_radiobutton_criticidad_todas', N'Todas', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (125, N'Bitacora_radiobutton_criticidad_todas', N'All', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (127, N'Bitacora_radiobutton_criticidad_baja', N'Baja', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (128, N'Bitacora_radiobutton_criticidad_baja', N'Low', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (129, N'Bitacora_radiobutton_criticidad_media', N'Media', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (130, N'Bitacora_radiobutton_criticidad_media', N'Medium', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (131, N'Bitacora_radiobutton_criticidad_alta', N'Alta', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (132, N'Bitacora_radiobutton_criticidad_alta', N'High', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (133, N'Bitacora_label_desde', N'Desde', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (134, N'Bitacora_label_desde', N'Since', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (136, N'Bitacora_label_hasta', N'Hasta', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (137, N'Bitacora_label_hasta', N'Until', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (138, N'GestionIdioma_label_idioma', N'Idioma', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (139, N'GestionIdioma_label_idioma', N'Language', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (140, N'GestionIdioma_button_crear_idioma', N'Crear Idioma', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (142, N'GestionIdioma_button_crear_idioma', N'Create Language', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (143, N'GestionIdioma_button_modificar_idioma', N'Modificar Idioma', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (145, N'GestionIdioma_button_modificar_idioma', N'Modify Language', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (146, N'GestionIdioma_button_eliminar_idioma', N'Eliminar Idioma', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (147, N'GestionIdioma_button_eliminar_idioma', N'Delete Language', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (148, N'GestionIdioma_label_descripcion', N'Descripción', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (150, N'GestionIdioma_label_descripcion', N'Description', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (151, N'Nutricionista_label_usuario_desbloquear', N'Usuario a desbloquear', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (152, N'Nutricionista_label_usuario_desbloquear', N'User to unlock', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (153, N'Nutricionista_label_usuario_reestablecer_password', N'Usuario a reestablecer contraseña', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (155, N'Nutricionista_label_usuario_reestablecer_password', N'User to reset password', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (157, N'Nutricionista_label_usuario_nueva_password', N'Nueva Contraseña', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (159, N'Nutricionista_label_usuario_nueva_password', N'New Password', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (160, N'Nutricionista_button_reestablecer_password', N'Reestablecer', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (161, N'Nutricionista_button_reestablecer_password', N'Reset', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (162, N'Nutricionista_button_desbloquear_password', N'Desbloquear', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (163, N'Nutricionista_button_desbloquear_password', N'Unlock', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (164, N'GestionRoles_groupbox_roles', N'Gestión de Roles', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (165, N'GestionRoles_groupbox_roles', N'Roles Management', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (166, N'GestionRoles_label_roles_usuario', N'Roles del usuario', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (167, N'GestionRoles_label_roles_usuario', N'User Roles', 2, 0)
GO
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (169, N'GestionRoles_label_usuario', N'Usuario', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (170, N'GestionRoles_label_usuario', N'User', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (171, N'GestionRoles_label_roles_usuario_seleccionado', N'Rol de Usuario Seleccionado', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (172, N'GestionRoles_label_roles_usuario_seleccionado', N'Selected User Roles', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (178, N'Contendor_menu_gestion_bitacora', N'Bitacora', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (179, N'Login_messagebox_error_login', N'No se pudo loguear correctamente', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (180, N'Login_messagebox_usuario_bloqueado', N'El usuario se encuentra bloqueado, por favor contactarse con un Administrador', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (181, N'Nutricionista_messagebox_usuario_inexistente', N'El usuario no fue encontrado', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (182, N'Roles_messagebox_usuario_sin_permisos', N'El usuario no posee permisos para realizar la accion', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (183, N'Database_messagebox_error_conexion', N'Ocurrio un error al interactuar con la base de datos', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (184, N'Login_messagebox_error_login', N'There was an error on the login', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (185, N'Login_messagebox_usuario_bloqueado', N'The user is blocked, please contact an Administrator', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (186, N'Roles_messagebox_usuario_sin_permisos', N'The user doesn-t have the required permissions to do this action', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (187, N'Database_messagebox_error_conexion', N'There was an error while interacting with the database', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (188, N'GestionLeyenda_messagebox_leyenda_existente', N'Ya existe una leyenda para ese control y ese idioma', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (189, N'GestionLeyenda_messagebox_leyenda_existente', N'There is already a caption for that control and language', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (190, N'GestionRoles_messagebox_error_asociacion', N'No es posible asociar el rol. Verifique que efectivamente no sea parte de una familia que lo posea', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (191, N'GestionRoles_messagebox_error_asociacion', N'It is not possible to associate that Role. Verify that the role is not part of an already associated family', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (192, N'GestionRoles_messagebox_error_desasociacion', N'It is not possible to deassociate that Role. Verify that the role is not part of an already associated family', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (193, N'GestionRoles_messagebox_error_desasociacion', N'No es posible desasociar el rol. Verifique que efectivamente no sea parte de una familia que lo posea', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (194, N'BackupManager_messagebox_backup_creado', N'Backup creado correctamente!', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (195, N'BackupManager_messagebox_backup_creado', N'Backup created successfully!', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (196, N'BackupManager_messagebox_backup_error', N'There was an error creating the backup', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (197, N'BackupManager_messagebox_backup_error', N'Ocurrio un error creando el backup', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (198, N'BackupManager_messagebox_restore_error', N'Ocurrio un error creando el restore', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (199, N'BackupManager_messagebox_restore_error', N'There was an error creating the restore', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (200, N'BackupManager_messagebox_restore_creado', N'Restore done successfully! the application will close.', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (201, N'BackupManager_messagebox_restore_creado', N'Restore efectuado correctamente! La aplicación se cerrará', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (202, N'MiCuenta_messagebox_error_cambio_password', N'Ocurrió un error al cambiar la contraseña', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (203, N'MiCuenta_messagebox_error_cambio_password', N'There was an error while chaging the password', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (204, N'MiCuenta_messagebox_cambio_password_correcto', N'Cambio de Password efecutado!', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (205, N'MiCuenta_messagebox_cambio_password_correcto', N'Change of password done successfully!', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (206, N'Nutricionista_messagebox_reiniciar_intentos_usuario_error', N'Error al reestablecer intentos', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (207, N'Nutricionista_messagebox_reiniciar_intentos_usuario_error', N'Error resetting intents of passwords', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (208, N'Bitacora_messagebox_busqueda_error', N'There was an error while executing the search.', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (209, N'Bitacora_messagebox_busqueda_error', N'Ocurrió un error al realizar la busqueda de bitacora', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (210, N'Contenedor_menu_gestion_idioma', N'Manage Languages', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (211, N'Contenedor_menu_gestion_idioma', N'Gestionar Idiomas', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (212, N'Contenedor_menu_gestion_etiquetas', N'Manage Captions', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (213, N'Contenedor_menu_gestion_etiquetas', N'Gestionar Etiquetas', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (214, N'Contenedor_menu_idioma', N'Idioma', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (215, N'Contenedor_menu_idioma', N'Language', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (216, N'GestionRoles_button_roles_usuario_desasociar', N'Desasociar Rol de Usuario', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (217, N'GestionRoles_button_roles_usuario_desasociar', N'Disassociate Role from User', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (218, N'GestionRoles_button_roles_usuario_asociar', N'Asociar Seleccion a Rol de Usuario Seleccionado', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (219, N'GestionRoles_button_roles_usuario_asociar', N'Associate Role to Selected User', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (220, N'GestionRoles_label_todos_los_roles', N'Todos los Roles', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (221, N'GestionRoles_label_todos_los_roles', N'All the Roles', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (222, N'GestionRoles_label_seleccion', N'Selection', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (223, N'GestionRoles_label_seleccion', N'Selección', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (224, N'GestionRoles_label_borrar', N'Borrar', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (225, N'GestionRoles_label_borrar', N'Delete', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (226, N'GestionRoles_label_nuevo_rol', N'New Role', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (227, N'GestionRoles_label_nuevo_rol', N'Nuevo Rol', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (228, N'GestionRoles_button_crear_rol', N'Crear Rol', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (229, N'GestionRoles_button_crear_rol', N'Create Role', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (230, N'GestionRoles_button_asociar_seleccion', N'Associate to Selection', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (231, N'GestionRoles_button_asociar_seleccion', N'Asociar a Seleccion', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (232, N'GestionRoles_button_limpiar_selecciones', N'Limpiar Selecciones', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (233, N'GestionRoles_button_limpiar_selecciones', N'Clear Selections', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (234, N'GestionRoles_button_asociar_seleccionGestionRoles_button_asociar_seleccion', N'Selected User Role', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (235, N'GestionRoles_button_asociar_seleccionGestionRoles_button_asociar_seleccion', N'Rol de Usuario Seleccionado', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (236, N'Contenedor_menu_gestion_nutricionistas', N'Gestion de Nutricionistas', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (237, N'Contenedor_menu_gestion_nutricionistas', N'Nutritionists Management', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (238, N'Contenedor_menu_dieta_ejercicio', N'Diet and Exercises', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (239, N'Contenedor_menu_dieta_ejercicio', N'Dieta y Ejercicios', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (240, N'Contenedor_menu_gestion_pacientes', N'Gestión de Pacientes', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (241, N'Contenedor_menu_gestion_pacientes', N'Patients Management', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (242, N'Contenedor_menu_gestion_turnos', N'Gestión de Turnos', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (243, N'Contenedor_menu_gestion_turnos', N'Appointments Management', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (244, N'Contenedor_menu_turnos', N'Appointments', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (245, N'Contenedor_menu_turnos', N'Turnos', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (246, N'Nutricionista_button_borrar', N'Borrar Usuario Seleccionado', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (247, N'Nutricionista_button_borrar', N'Delete Selected User', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (248, N'Nutricionista_button_modificar', N'Modify Selected Nutritionist', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (249, N'Nutricionista_button_modificar', N'Modificar Nutricionista Seleccionado', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (250, N'GestionEtiqueta_label_idioma', N'Seleccione Idioma', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (251, N'GestionEtiqueta_label_idioma', N'Select Language', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (252, N'GestionEtiqueta_label_nombre_control', N'Nombre del control', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (253, N'GestionEtiqueta_label_nombre_control', N'Name of control', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (254, N'GestionEtiqueta_label_texto_leyenda', N'Texto de la Leyenda', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (255, N'GestionEtiqueta_label_texto_leyenda', N'Caption text', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (256, N'GestionEtiqueta_button_crear', N'Crear', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (257, N'GestionEtiqueta_button_crear', N'Create', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (258, N'GestionEtiqueta_button_modificar', N'Modificar Seleccion', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (259, N'GestionEtiqueta_button_modificar', N'Modify Selection', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (260, N'GestionEtiqueta_button_borrar', N'Delete selection', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (261, N'GestionEtiqueta_button_borrar', N'Borrar Seleccion', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (262, N'Contenedor_menu_gestion_micuenta', N'Gestionar Cuenta', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (263, N'Contenedor_menu_gestion_micuenta', N'Manage Account', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (264, N'Nutricionista_messagebox_desbloqueado', N'Usuario desbloqueado correctamente!', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (265, N'Nutricionista_messagebox_desbloqueado', N'User unlocked successfully!', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (266, N'Nutricionista_messagebox_creado', N'Nutritionist created successfully!', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (267, N'Nutricionista_messagebox_creado', N'Nutricionista creado correctamente', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (268, N'Nutricionista_messagebox_reestablecer_password', N'Contraseña reestablecida correctamente!', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (269, N'Nutricionista_messagebox_reestablecer_password', N'Password changed correctly!', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (270, N'GestionRoles_messagebox_error_creacion', N'Ocurrio un error al crear el Rol', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (271, N'GestionRoles_messagebox_error_creacion', N'There was an error while creating the Role', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (272, N'TEST_asd_asdd', N'asdasddasd', 1, 1)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (273, N'Nutricionista_messagebox_error_borrado_actual', N'No es posible borrar o modificar el usuario con el cual se encuentra logueado', 1, 0)
GO
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (274, N'Nutricionista_messagebox_error_borrado_actual', N'It''s not possible to erase or modify the same user you are currently using on your session', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (275, N'Nutricionista_messagebox_usuario_ya_existe', N'Ya existe el Usuario / Nutricionista. Verifique los datos.', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (276, N'Nutricionista_messagebox_usuario_ya_existe', N'The User / Nutritionist that you are trying to create already exists. Please verify the data.', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (277, N'GestionRoles_messagebox_logout_aplicar_permiso_usuario_actual', N'Por favor ingrese nuevamente al sistema para poder ver los cambios impactados.', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (278, N'GestionRoles_messagebox_logout_aplicar_permiso_usuario_actual', N'Please login again to verify the changes.', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (279, N'DVVH_messagebox_error_integridad', N'Existe un error de integridad, cerrando aplicación.', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (280, N'DVVH_messagebox_error_integridad', N'There is an integrity error, closing application.', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (281, N'Error_messagebox_carga_formulario', N'Ocurrio un error en la carga del formulario', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (282, N'Error_messagebox_carga_formulario', N'There was a problem loading the form', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (284, N'Contenedor_menu_micuenta', N'Mi Cuenta', 1, 0)
SET IDENTITY_INSERT [dbo].[Leyenda] OFF
SET IDENTITY_INSERT [dbo].[Medicion] ON 

INSERT [dbo].[Medicion] ([altura], [cadera], [cintura], [peso], [medicionID], [datosAnalíticosID], [pacienteID], [turnoID]) VALUES (1, 90, 80, 75, 3, NULL, 1, 6)
INSERT [dbo].[Medicion] ([altura], [cadera], [cintura], [peso], [medicionID], [datosAnalíticosID], [pacienteID], [turnoID]) VALUES (1, 80, 90, 75, 4, NULL, 1, 6)
INSERT [dbo].[Medicion] ([altura], [cadera], [cintura], [peso], [medicionID], [datosAnalíticosID], [pacienteID], [turnoID]) VALUES (1, 80, 90, 75, 5, NULL, 1, 6)
INSERT [dbo].[Medicion] ([altura], [cadera], [cintura], [peso], [medicionID], [datosAnalíticosID], [pacienteID], [turnoID]) VALUES (1, 80, 90, 75, 6, NULL, 3, 7)
INSERT [dbo].[Medicion] ([altura], [cadera], [cintura], [peso], [medicionID], [datosAnalíticosID], [pacienteID], [turnoID]) VALUES (90, 80, 90, 75, 7, NULL, 3, 7)
INSERT [dbo].[Medicion] ([altura], [cadera], [cintura], [peso], [medicionID], [datosAnalíticosID], [pacienteID], [turnoID]) VALUES (90, 90, 80, 75, 8, NULL, 3, 7)
INSERT [dbo].[Medicion] ([altura], [cadera], [cintura], [peso], [medicionID], [datosAnalíticosID], [pacienteID], [turnoID]) VALUES (1, 80, 90, 75, 9, NULL, 3, 7)
INSERT [dbo].[Medicion] ([altura], [cadera], [cintura], [peso], [medicionID], [datosAnalíticosID], [pacienteID], [turnoID]) VALUES (1.75, 80, 90, 75, 10, NULL, 3, 7)
INSERT [dbo].[Medicion] ([altura], [cadera], [cintura], [peso], [medicionID], [datosAnalíticosID], [pacienteID], [turnoID]) VALUES (1.75, 80, 90, 85, 11, NULL, 3, 7)
INSERT [dbo].[Medicion] ([altura], [cadera], [cintura], [peso], [medicionID], [datosAnalíticosID], [pacienteID], [turnoID]) VALUES (175, 80, 90, 80, 12, NULL, 3, 7)
INSERT [dbo].[Medicion] ([altura], [cadera], [cintura], [peso], [medicionID], [datosAnalíticosID], [pacienteID], [turnoID]) VALUES (1.75, 80, 90, 85, 13, NULL, 3, 7)
INSERT [dbo].[Medicion] ([altura], [cadera], [cintura], [peso], [medicionID], [datosAnalíticosID], [pacienteID], [turnoID]) VALUES (1.75, 80, 90, 80, 14, NULL, 3, 7)
INSERT [dbo].[Medicion] ([altura], [cadera], [cintura], [peso], [medicionID], [datosAnalíticosID], [pacienteID], [turnoID]) VALUES (80, 0, 0, 80, 15, NULL, 3, 7)
INSERT [dbo].[Medicion] ([altura], [cadera], [cintura], [peso], [medicionID], [datosAnalíticosID], [pacienteID], [turnoID]) VALUES (90, 0, 0, 80, 16, NULL, 3, 7)
INSERT [dbo].[Medicion] ([altura], [cadera], [cintura], [peso], [medicionID], [datosAnalíticosID], [pacienteID], [turnoID]) VALUES (80, 0, 0, 80, 17, NULL, 3, 7)
INSERT [dbo].[Medicion] ([altura], [cadera], [cintura], [peso], [medicionID], [datosAnalíticosID], [pacienteID], [turnoID]) VALUES (80, 0, 0, 80, 18, NULL, 3, 7)
INSERT [dbo].[Medicion] ([altura], [cadera], [cintura], [peso], [medicionID], [datosAnalíticosID], [pacienteID], [turnoID]) VALUES (80, 0, 0, 80, 19, NULL, 3, 7)
INSERT [dbo].[Medicion] ([altura], [cadera], [cintura], [peso], [medicionID], [datosAnalíticosID], [pacienteID], [turnoID]) VALUES (1.8, 0, 0, 80, 20, NULL, 3, 7)
INSERT [dbo].[Medicion] ([altura], [cadera], [cintura], [peso], [medicionID], [datosAnalíticosID], [pacienteID], [turnoID]) VALUES (1.7, 0, 0, 80, 21, NULL, 3, 7)
INSERT [dbo].[Medicion] ([altura], [cadera], [cintura], [peso], [medicionID], [datosAnalíticosID], [pacienteID], [turnoID]) VALUES (1.8, 0, 0, 80, 22, NULL, 3, 7)
INSERT [dbo].[Medicion] ([altura], [cadera], [cintura], [peso], [medicionID], [datosAnalíticosID], [pacienteID], [turnoID]) VALUES (1.8, 0, 0, 80, 23, NULL, 3, 7)
SET IDENTITY_INSERT [dbo].[Medicion] OFF
SET IDENTITY_INSERT [dbo].[Nutricionista] ON 

INSERT [dbo].[Nutricionista] ([nutricionistaID], [dni], [especialización], [matricula], [apellido], [usuarioID], [nombre], [sexo], [eliminado], [DVH]) VALUES (1, 37171095, N'Nutricion', N'ASD2123', N'Nieto', 1, N'Cristian', N'M', 0, 35169)
INSERT [dbo].[Nutricionista] ([nutricionistaID], [dni], [especialización], [matricula], [apellido], [usuarioID], [nombre], [sexo], [eliminado], [DVH]) VALUES (3, 1234, N'Informatica', N'1234', N'1234', 6, N'cristian1234', N'M', 0, 39026)
INSERT [dbo].[Nutricionista] ([nutricionistaID], [dni], [especialización], [matricula], [apellido], [usuarioID], [nombre], [sexo], [eliminado], [DVH]) VALUES (5, 2351241, N'Algo', N'FAFA123', N'Jaime', 8, N'Jacinto', N'M', 0, 37529)
INSERT [dbo].[Nutricionista] ([nutricionistaID], [dni], [especialización], [matricula], [apellido], [usuarioID], [nombre], [sexo], [eliminado], [DVH]) VALUES (6, 124123, N'lalala', N'12413', N'Sarasa', 10, N'Lalala', N'F', 0, 39097)
INSERT [dbo].[Nutricionista] ([nutricionistaID], [dni], [especialización], [matricula], [apellido], [usuarioID], [nombre], [sexo], [eliminado], [DVH]) VALUES (7, 151234123, N'asdasd', N'asfasad', N'permiso', 11, N'permiso', N'F', 0, 35177)
INSERT [dbo].[Nutricionista] ([nutricionistaID], [dni], [especialización], [matricula], [apellido], [usuarioID], [nombre], [sexo], [eliminado], [DVH]) VALUES (10, 12423421, N'Algo', N'FAFA123', N'Jaime', 24, N'Jacinto', N'M', 0, 33034)
INSERT [dbo].[Nutricionista] ([nutricionistaID], [dni], [especialización], [matricula], [apellido], [usuarioID], [nombre], [sexo], [eliminado], [DVH]) VALUES (11, 1294823, N'Nutricion', N'ASD2123', N'Nieto', 25, N'Cristian', N'M', 0, 37919)
INSERT [dbo].[Nutricionista] ([nutricionistaID], [dni], [especialización], [matricula], [apellido], [usuarioID], [nombre], [sexo], [eliminado], [DVH]) VALUES (12, 23512422, N'Nutricion', N'ASD2123', N'Nieto', 27, N'Cristian', N'M', 0, 37411)
INSERT [dbo].[Nutricionista] ([nutricionistaID], [dni], [especialización], [matricula], [apellido], [usuarioID], [nombre], [sexo], [eliminado], [DVH]) VALUES (13, 37171096, N'Administracion de Empresas', N'asd2512', N'Nieto', 28, N'Cristian', N'F', 0, 40235)
INSERT [dbo].[Nutricionista] ([nutricionistaID], [dni], [especialización], [matricula], [apellido], [usuarioID], [nombre], [sexo], [eliminado], [DVH]) VALUES (16, 37171099, N'Nutricion', N'ASD2123', N'Nieto', 31, N'Cristian', N'M', 1, 39445)
INSERT [dbo].[Nutricionista] ([nutricionistaID], [dni], [especialización], [matricula], [apellido], [usuarioID], [nombre], [sexo], [eliminado], [DVH]) VALUES (17, 37171100, N'Nutricion', N'ASD2123', N'Nieto', 32, N'Cristian', N'M', 1, 38744)
INSERT [dbo].[Nutricionista] ([nutricionistaID], [dni], [especialización], [matricula], [apellido], [usuarioID], [nombre], [sexo], [eliminado], [DVH]) VALUES (18, 2412312, N'Nutricion', N'GASF1395', N'Alvarez', 33, N'Roberto', N'F', 1, 38365)
INSERT [dbo].[Nutricionista] ([nutricionistaID], [dni], [especialización], [matricula], [apellido], [usuarioID], [nombre], [sexo], [eliminado], [DVH]) VALUES (19, 241242, N'Nutricion', N'GASF1395', N'Alvarez', 34, N'Roberto', N'F', 1, 32161)
INSERT [dbo].[Nutricionista] ([nutricionistaID], [dni], [especialización], [matricula], [apellido], [usuarioID], [nombre], [sexo], [eliminado], [DVH]) VALUES (20, 245624, N'Nutricion', N'125412', N'Sarasa', 35, N'Sarlanga', N'F', 1, 39280)
SET IDENTITY_INSERT [dbo].[Nutricionista] OFF
SET IDENTITY_INSERT [dbo].[Paciente] ON 

INSERT [dbo].[Paciente] ([email], [telefono], [pacienteID], [tratamientoID], [apellido], [dni], [nombre], [sexo], [habitos], [DVH], [eliminado], [fechaNacimiento]) VALUES (N'carlossanchez@live.com', 1136040313, 1, NULL, N'Sanchez', 37171096, N'Carlos', N'M', NULL, NULL, 0, CAST(N'1992-11-10' AS Date))
INSERT [dbo].[Paciente] ([email], [telefono], [pacienteID], [tratamientoID], [apellido], [dni], [nombre], [sexo], [habitos], [DVH], [eliminado], [fechaNacimiento]) VALUES (N'juanlopez@live.com', 1124352354, 3, NULL, N'Lopez', 1234123, N'Juancho', N'M', NULL, NULL, 0, CAST(N'1985-02-12' AS Date))
INSERT [dbo].[Paciente] ([email], [telefono], [pacienteID], [tratamientoID], [apellido], [dni], [nombre], [sexo], [habitos], [DVH], [eliminado], [fechaNacimiento]) VALUES (N'lola@yahoo.com', 15231234, 5, NULL, N'Lopez', 561254133, N'Lola', N'F', NULL, NULL, 1, CAST(N'1984-07-11' AS Date))
SET IDENTITY_INSERT [dbo].[Paciente] OFF
SET IDENTITY_INSERT [dbo].[Permiso] ON 

INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (3, N'Alta de datos de Paciente', N'OP004')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (4, N'Modificacion de datos de Paciente', N'OP005')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (5, N'Baja de datos de Paciente', N'OP006')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (6, N'Consulta de Alimentos', N'OP007')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (7, N'Alta de Alimento', N'OP008')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (9, N'Baja de Alimento', N'OP010')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (10, N'Consulta de Dietas Disponibles', N'OP011')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (11, N'Alta de Dieta', N'OP012')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (12, N'Modificación de Dieta', N'OP013')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (13, N'Baja de Dieta', N'OP014')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (21, N'Modificación de Rutina de Ejercicios', N'OP022')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (22, N'Baja de Rutina de Ejercicios', N'OP023')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (23, N'Solicitud de Sugerencia de Alimentos', N'OP024')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (30, N'Alta de Nutricionista', N'OP038')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (31, N'Baja de Nutricionista', N'OP039')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (32, N'Modificación de datos de Nutricionista', N'OP040')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (33, N'Inicio de Tratamiento', N'OP041')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (34, N'Finalizar Tratamiento', N'OP042')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (36, N'Gestión de paciente', N'GE100')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (37, N'Generación de turnos', N'GE101')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (38, N'Gestión de Dieta y Ejercicios', N'GE102')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (39, N'Cálculo por método antropométrico', N'GE103')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (42, N'Gestión de Proyecciones', N'GE107')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (43, N'Autogestión de cuenta', N'GE110')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (44, N'Gestión e informes de Nutricionistas', N'GE109')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (46, N'Manejo Bitacora', N'OP45')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (47, N'Manejo de Backup', N'OP46')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (48, N'Administrador', N'AA099')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (79, N'Solicitud de proyeccion de peso hacia objetivo', N'OP034')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (80, N'Generar Turno con Paciente', N'OP001')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (81, N'Borrar Turno con un Paciente', N'OP003')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (82, N'Creación de Rutina de Ejercicios', N'OP021')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (83, N'Modificación de Ejercicios', N'OP017')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (84, N'Modificación de Alimento', N'OP009')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (85, N'Cálculo de BMI', N'OP019')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (86, N'Cálculo de BFP', N'OP020')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (87, N'Alta de Ejercicios', N'OP016')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (88, N'Baja de Ejercicios', N'OP018')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (90, N'Consulta de Ejercicios', N'OP015')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (93, N'Gestión de Idiomas', N'GE120')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (95, N'Crear Idioma', N'OP80')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (96, N'Modificar Idioma', N'OP81')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (97, N'Borrar Idioma', N'OP82')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (98, N'Visualizar Manejo de Idiomas', N'OP83')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (99, N'Visualizar Manejo de Etiquetas', N'OP84')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (100, N'Crear Etiqueta', N'OP85')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (101, N'Borrar Etiqueta', N'OP86')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (102, N'Modificar Etiqueta', N'OP87')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (103, N'Gestión de Respaldos', N'GE121')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (106, N'Crear Backup', N'OP090')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (107, N'Realizar Restore', N'OP091')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (124, N'Reestablecer password de Nutricionista', N'OP100')
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
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (42, 79)
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (37, 80)
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (37, 81)
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (38, 82)
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (38, 83)
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (38, 84)
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (39, 85)
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (39, 86)
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (38, 87)
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (38, 88)
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (38, 90)
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (48, 93)
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (93, 95)
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (93, 96)
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (93, 97)
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (93, 98)
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (93, 99)
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (93, 100)
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (93, 101)
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (93, 102)
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (48, 103)
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (103, 106)
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (103, 107)
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (44, 124)
SET IDENTITY_INSERT [dbo].[Plato] ON 

INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal], [eliminado]) VALUES (1, N'Huevo con Jugo de Naranja', 185, 1, 0, 0, 0, 0)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal], [eliminado]) VALUES (3, N'Soja con Bebida Cola', 320, 0, 0, 0, 1, 0)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal], [eliminado]) VALUES (4, N'Pollo con Arroz', 280, 0, 0, 0, 1, 0)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal], [eliminado]) VALUES (5, N'Pescado (Merluza) con Papas', 190, 0, 0, 0, 1, 0)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal], [eliminado]) VALUES (6, N'Canelones de Espinaca con Salsa', 135, 0, 0, 0, 1, 0)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal], [eliminado]) VALUES (7, N'Ensalada de Pasta con Atun y Cangrejo Kanikama', 370, 0, 0, 0, 1, 0)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal], [eliminado]) VALUES (8, N'Porcion de Tortilla de Papas', 330, 0, 0, 0, 1, 0)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal], [eliminado]) VALUES (9, N'Porcion de Tarta', 380, 0, 0, 0, 1, 0)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal], [eliminado]) VALUES (10, N'Tomate Relleno de Atun y Papa al Horno', 175, 0, 0, 0, 1, 0)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal], [eliminado]) VALUES (11, N'Berenjena Rellena con Carne', 253, 0, 0, 0, 1, 0)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal], [eliminado]) VALUES (12, N'Hamburguesa Simple', 380, 0, 0, 0, 1, 0)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal], [eliminado]) VALUES (13, N'Pancho Simple con Mayonesa', 240, 0, 0, 0, 1, 0)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal], [eliminado]) VALUES (14, N'Guiso de Lentejas', 340, 0, 0, 0, 1, 0)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal], [eliminado]) VALUES (15, N'Hamburguesa con Papas Fritas', 730, 0, 0, 0, 1, 0)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal], [eliminado]) VALUES (16, N'Bife con Pastas', 870, 0, 0, 0, 1, 0)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal], [eliminado]) VALUES (17, N'Tostadas con Queso y Cafe', 195, 1, 0, 1, 0, 0)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal], [eliminado]) VALUES (18, N'Yogurt con cereales y banana', 190, 1, 1, 1, 0, 0)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal], [eliminado]) VALUES (19, N'Porcion de Frutos Secos', 427, 1, 0, 1, 0, 0)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal], [eliminado]) VALUES (20, N'Batido de Avena y Jugo', 354, 1, 0, 1, 0, 0)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal], [eliminado]) VALUES (21, N'Tostada con Queso Fresco y Jugo', 150, 1, 0, 1, 0, 0)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal], [eliminado]) VALUES (22, N'Banana con Miel', 154, 0, 1, 0, 0, 0)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal], [eliminado]) VALUES (23, N'Yogur con Cereales', 174, 0, 1, 0, 0, 0)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal], [eliminado]) VALUES (24, N'Taza de Ensalada de Frutas', 150, 1, 1, 1, 0, 0)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal], [eliminado]) VALUES (25, N'Taza de Ensalada de Frutas', 150, 1, 1, 1, 0, 0)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal], [eliminado]) VALUES (26, N'Banana Y Manzana', 150, 0, 1, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[Plato] OFF
SET IDENTITY_INSERT [dbo].[Turno] ON 

INSERT [dbo].[Turno] ([fecha], [turnoID], [pacienteID], [nutricionistaID], [horarioID], [motivo]) VALUES (CAST(N'2019-10-08' AS Date), 2, 1, 1, 20, NULL)
INSERT [dbo].[Turno] ([fecha], [turnoID], [pacienteID], [nutricionistaID], [horarioID], [motivo]) VALUES (CAST(N'2019-10-15' AS Date), 6, 1, 1, 9, N'Consulta de Rutina')
INSERT [dbo].[Turno] ([fecha], [turnoID], [pacienteID], [nutricionistaID], [horarioID], [motivo]) VALUES (CAST(N'2019-10-29' AS Date), 7, 3, 1, 5, N'Prueba')
SET IDENTITY_INSERT [dbo].[Turno] OFF
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([usuarioID], [username], [password], [intentos], [eliminado], [DVH]) VALUES (1, N'test', N'b08c8c585b6d67164c163767076445d6', 0, 0, 34814)
INSERT [dbo].[Usuario] ([usuarioID], [username], [password], [intentos], [eliminado], [DVH]) VALUES (6, N'crisnieto', N'fd9a3c4c1653ae00a3b24dd04d3dea74', 2, 0, 38377)
INSERT [dbo].[Usuario] ([usuarioID], [username], [password], [intentos], [eliminado], [DVH]) VALUES (8, N'prueba', N'561b8551f6f11713c9f5440db30ad42c', 0, 0, 35574)
INSERT [dbo].[Usuario] ([usuarioID], [username], [password], [intentos], [eliminado], [DVH]) VALUES (10, N'prueba1', N'561b8551f6f11713c9f5440db30ad42c', 0, 0, 35889)
INSERT [dbo].[Usuario] ([usuarioID], [username], [password], [intentos], [eliminado], [DVH]) VALUES (11, N'permiso', N'561b8551f6f11713c9f5440db30ad42c', 0, 0, 35274)
INSERT [dbo].[Usuario] ([usuarioID], [username], [password], [intentos], [eliminado], [DVH]) VALUES (24, N'asdasd', N'561b8551f6f11713c9f5440db30ad42c', 0, 0, 37003)
INSERT [dbo].[Usuario] ([usuarioID], [username], [password], [intentos], [eliminado], [DVH]) VALUES (25, N'raro', N'fd9a3c4c1653ae00a3b24dd04d3dea74', 0, 0, 35028)
INSERT [dbo].[Usuario] ([usuarioID], [username], [password], [intentos], [eliminado], [DVH]) VALUES (27, N'EAST', N'b08c8c585b6d67164c163767076445d6', 0, 0, 40195)
INSERT [dbo].[Usuario] ([usuarioID], [username], [password], [intentos], [eliminado], [DVH]) VALUES (28, N'gerente', N'561b8551f6f11713c9f5440db30ad42c', 0, 0, 36389)
INSERT [dbo].[Usuario] ([usuarioID], [username], [password], [intentos], [eliminado], [DVH]) VALUES (31, N'WEST', N'83c9f5692281bf59471b13dfddb3af91', 0, 1, 37943)
INSERT [dbo].[Usuario] ([usuarioID], [username], [password], [intentos], [eliminado], [DVH]) VALUES (32, N'NORTH', N'2bf8f791695c70efa9c14e6f1c326403', 0, 1, 32240)
INSERT [dbo].[Usuario] ([usuarioID], [username], [password], [intentos], [eliminado], [DVH]) VALUES (33, N'entrega', N'3f5ac8e8c175cb03f0709336f3d73fad', 0, 1, 31317)
INSERT [dbo].[Usuario] ([usuarioID], [username], [password], [intentos], [eliminado], [DVH]) VALUES (34, N'prueba5', N'0a1cd938b0dc673986504140d57cdb9f', 0, 1, 37167)
INSERT [dbo].[Usuario] ([usuarioID], [username], [password], [intentos], [eliminado], [DVH]) VALUES (35, N'prueba6', N'ec5dc435ef17501a15643b690eb3ebaa', 0, 1, 36444)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
/****** Object:  Index [IX_Nutricionista]    Script Date: 10/29/2019 6:31:13 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Nutricionista] ON [dbo].[Nutricionista]
(
	[dni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Permiso]    Script Date: 10/29/2019 6:31:13 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Permiso] ON [dbo].[Permiso]
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [uq_turno]    Script Date: 10/29/2019 6:31:13 PM ******/
ALTER TABLE [dbo].[Turno] ADD  CONSTRAINT [uq_turno] UNIQUE NONCLUSTERED 
(
	[fecha] ASC,
	[horarioID] ASC,
	[nutricionistaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Usuario]    Script Date: 10/29/2019 6:31:13 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Usuario] ON [dbo].[Usuario]
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Bitacora]  WITH CHECK ADD  CONSTRAINT [FK_Bitacora_Usuario] FOREIGN KEY([usuarioID])
REFERENCES [dbo].[Usuario] ([usuarioID])
GO
ALTER TABLE [dbo].[Bitacora] CHECK CONSTRAINT [FK_Bitacora_Usuario]
GO
ALTER TABLE [dbo].[DiaAlimenticio]  WITH CHECK ADD  CONSTRAINT [FK_DiaAlimenticio_Alimento_Merienda] FOREIGN KEY([idPlatoMerienda])
REFERENCES [dbo].[Alimento] ([alimentoID])
GO
ALTER TABLE [dbo].[DiaAlimenticio] CHECK CONSTRAINT [FK_DiaAlimenticio_Alimento_Merienda]
GO
ALTER TABLE [dbo].[DiaAlimenticio]  WITH CHECK ADD  CONSTRAINT [FK_DiaAlimenticio_Plato_Almuerzo] FOREIGN KEY([idPlatoAlmuerzo])
REFERENCES [dbo].[Plato] ([platoID])
GO
ALTER TABLE [dbo].[DiaAlimenticio] CHECK CONSTRAINT [FK_DiaAlimenticio_Plato_Almuerzo]
GO
ALTER TABLE [dbo].[DiaAlimenticio]  WITH CHECK ADD  CONSTRAINT [FK_DiaAlimenticio_Plato_Cena] FOREIGN KEY([idPlatoCena])
REFERENCES [dbo].[Plato] ([platoID])
GO
ALTER TABLE [dbo].[DiaAlimenticio] CHECK CONSTRAINT [FK_DiaAlimenticio_Plato_Cena]
GO
ALTER TABLE [dbo].[DiaAlimenticio]  WITH CHECK ADD  CONSTRAINT [FK_DiaAlimenticio_Plato_Colacion] FOREIGN KEY([idPlatoColacion])
REFERENCES [dbo].[Plato] ([platoID])
GO
ALTER TABLE [dbo].[DiaAlimenticio] CHECK CONSTRAINT [FK_DiaAlimenticio_Plato_Colacion]
GO
ALTER TABLE [dbo].[DiaAlimenticio]  WITH CHECK ADD  CONSTRAINT [FK_DiaAlimenticio_Plato_Desayuno] FOREIGN KEY([idPlatoDesayuno])
REFERENCES [dbo].[Plato] ([platoID])
GO
ALTER TABLE [dbo].[DiaAlimenticio] CHECK CONSTRAINT [FK_DiaAlimenticio_Plato_Desayuno]
GO
ALTER TABLE [dbo].[DiaAlimenticio]  WITH CHECK ADD  CONSTRAINT [FK_DiaAlimenticio_Plato_Merienda] FOREIGN KEY([idPlatoMerienda])
REFERENCES [dbo].[Plato] ([platoID])
GO
ALTER TABLE [dbo].[DiaAlimenticio] CHECK CONSTRAINT [FK_DiaAlimenticio_Plato_Merienda]
GO
ALTER TABLE [dbo].[Dieta]  WITH CHECK ADD  CONSTRAINT [FK_Dieta_DiaAlimenticio_Domingo] FOREIGN KEY([domingo])
REFERENCES [dbo].[DiaAlimenticio] ([diaAlimenticioID])
GO
ALTER TABLE [dbo].[Dieta] CHECK CONSTRAINT [FK_Dieta_DiaAlimenticio_Domingo]
GO
ALTER TABLE [dbo].[Dieta]  WITH CHECK ADD  CONSTRAINT [FK_Dieta_DiaAlimenticio_Jueves] FOREIGN KEY([jueves])
REFERENCES [dbo].[DiaAlimenticio] ([diaAlimenticioID])
GO
ALTER TABLE [dbo].[Dieta] CHECK CONSTRAINT [FK_Dieta_DiaAlimenticio_Jueves]
GO
ALTER TABLE [dbo].[Dieta]  WITH CHECK ADD  CONSTRAINT [FK_Dieta_DiaAlimenticio_Lunes] FOREIGN KEY([lunes])
REFERENCES [dbo].[DiaAlimenticio] ([diaAlimenticioID])
GO
ALTER TABLE [dbo].[Dieta] CHECK CONSTRAINT [FK_Dieta_DiaAlimenticio_Lunes]
GO
ALTER TABLE [dbo].[Dieta]  WITH CHECK ADD  CONSTRAINT [FK_Dieta_DiaAlimenticio_Martes] FOREIGN KEY([martes])
REFERENCES [dbo].[DiaAlimenticio] ([diaAlimenticioID])
GO
ALTER TABLE [dbo].[Dieta] CHECK CONSTRAINT [FK_Dieta_DiaAlimenticio_Martes]
GO
ALTER TABLE [dbo].[Dieta]  WITH CHECK ADD  CONSTRAINT [FK_Dieta_DiaAlimenticio_Miercoles] FOREIGN KEY([miercoles])
REFERENCES [dbo].[DiaAlimenticio] ([diaAlimenticioID])
GO
ALTER TABLE [dbo].[Dieta] CHECK CONSTRAINT [FK_Dieta_DiaAlimenticio_Miercoles]
GO
ALTER TABLE [dbo].[Dieta]  WITH CHECK ADD  CONSTRAINT [FK_Dieta_DiaAlimenticio_Sabado] FOREIGN KEY([sabado])
REFERENCES [dbo].[DiaAlimenticio] ([diaAlimenticioID])
GO
ALTER TABLE [dbo].[Dieta] CHECK CONSTRAINT [FK_Dieta_DiaAlimenticio_Sabado]
GO
ALTER TABLE [dbo].[Dieta]  WITH CHECK ADD  CONSTRAINT [FK_Dieta_DiaAlimenticio_Viernes] FOREIGN KEY([viernes])
REFERENCES [dbo].[DiaAlimenticio] ([diaAlimenticioID])
GO
ALTER TABLE [dbo].[Dieta] CHECK CONSTRAINT [FK_Dieta_DiaAlimenticio_Viernes]
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
ALTER TABLE [dbo].[Tratamiento]  WITH CHECK ADD  CONSTRAINT [FK_Tratamiento_Dieta] FOREIGN KEY([dietaID])
REFERENCES [dbo].[Dieta] ([dietaID])
GO
ALTER TABLE [dbo].[Tratamiento] CHECK CONSTRAINT [FK_Tratamiento_Dieta]
GO
ALTER TABLE [dbo].[Turno]  WITH CHECK ADD  CONSTRAINT [FK_Turno_Horario] FOREIGN KEY([horarioID])
REFERENCES [dbo].[Horario] ([id])
GO
ALTER TABLE [dbo].[Turno] CHECK CONSTRAINT [FK_Turno_Horario]
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
