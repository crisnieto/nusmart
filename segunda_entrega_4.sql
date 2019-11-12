USE [master]
GO
/****** Object:  Database [nusmart]    Script Date: 11/12/2019 1:14:21 PM ******/
CREATE DATABASE [nusmart]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'nusmart', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\nusmart.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
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
/****** Object:  Table [dbo].[Alimento]    Script Date: 11/12/2019 1:14:21 PM ******/
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
/****** Object:  Table [dbo].[Bitacora]    Script Date: 11/12/2019 1:14:21 PM ******/
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
/****** Object:  Table [dbo].[DatosAnalíticos]    Script Date: 11/12/2019 1:14:21 PM ******/
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
/****** Object:  Table [dbo].[DiaAlimenticio]    Script Date: 11/12/2019 1:14:21 PM ******/
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
/****** Object:  Table [dbo].[DiaEjercicio]    Script Date: 11/12/2019 1:14:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiaEjercicio](
	[diaEjercicioID] [int] IDENTITY(1,1) NOT NULL,
	[ejercicioID] [int] NOT NULL,
	[duracionDia] [int] NOT NULL,
 CONSTRAINT [PK_DiaEjercicio] PRIMARY KEY CLUSTERED 
(
	[diaEjercicioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Dieta]    Script Date: 11/12/2019 1:14:21 PM ******/
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
	[esGeneradaAutomaticamente] [bit] NOT NULL,
	[nombre] [varchar](100) NULL,
 CONSTRAINT [PK_Dieta] PRIMARY KEY CLUSTERED 
(
	[dietaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DVV]    Script Date: 11/12/2019 1:14:21 PM ******/
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
/****** Object:  Table [dbo].[Ejercicio]    Script Date: 11/12/2019 1:14:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ejercicio](
	[caloriasQuemadasHora] [int] NULL,
	[nombre] [varchar](50) NULL,
	[ejercicioID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Ejercicio] PRIMARY KEY CLUSTERED 
(
	[ejercicioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Habitos]    Script Date: 11/12/2019 1:14:21 PM ******/
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
/****** Object:  Table [dbo].[Horario]    Script Date: 11/12/2019 1:14:21 PM ******/
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
/****** Object:  Table [dbo].[Idioma]    Script Date: 11/12/2019 1:14:21 PM ******/
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
/****** Object:  Table [dbo].[JoinAlimentoPlato]    Script Date: 11/12/2019 1:14:21 PM ******/
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
/****** Object:  Table [dbo].[JoinAlimentoToPlato]    Script Date: 11/12/2019 1:14:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JoinAlimentoToPlato](
	[platoID] [int] NULL,
	[alimentoID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[JoinNutricionistaToUsuario]    Script Date: 11/12/2019 1:14:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JoinNutricionistaToUsuario](
	[usuarioID] [int] NULL,
	[nutricionistaID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[JoinUsuarioPermiso]    Script Date: 11/12/2019 1:14:21 PM ******/
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
/****** Object:  Table [dbo].[Leyenda]    Script Date: 11/12/2019 1:14:21 PM ******/
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
/****** Object:  Table [dbo].[Medicion]    Script Date: 11/12/2019 1:14:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
	[bmi] [float] NULL,
	[categoriaBmi] [varchar](100) NULL,
	[bfp] [float] NULL,
	[categoriaBfp] [varchar](100) NULL,
 CONSTRAINT [PK_Medicion] PRIMARY KEY CLUSTERED 
(
	[medicionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Nutricionista]    Script Date: 11/12/2019 1:14:21 PM ******/
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
/****** Object:  Table [dbo].[Paciente]    Script Date: 11/12/2019 1:14:21 PM ******/
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
	[apellido] [varchar](50) NOT NULL,
	[dni] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[sexo] [char](1) NOT NULL,
	[eliminado] [bit] NOT NULL CONSTRAINT [DF_Paciente_eliminado]  DEFAULT ((0)),
	[fechaNacimiento] [date] NOT NULL,
 CONSTRAINT [PK_Paciente] PRIMARY KEY CLUSTERED 
(
	[pacienteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Permiso]    Script Date: 11/12/2019 1:14:21 PM ******/
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
/****** Object:  Table [dbo].[Permiso_Jerarquia]    Script Date: 11/12/2019 1:14:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permiso_Jerarquia](
	[IdPadrePermiso] [int] NOT NULL,
	[IdHijoPermiso] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Plato]    Script Date: 11/12/2019 1:14:21 PM ******/
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
/****** Object:  Table [dbo].[Proyección]    Script Date: 11/12/2019 1:14:21 PM ******/
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
/****** Object:  Table [dbo].[PuntoComparativo]    Script Date: 11/12/2019 1:14:21 PM ******/
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
/****** Object:  Table [dbo].[PuntoProyeccion]    Script Date: 11/12/2019 1:14:21 PM ******/
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
/****** Object:  Table [dbo].[Rol]    Script Date: 11/12/2019 1:14:21 PM ******/
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
/****** Object:  Table [dbo].[Rutina]    Script Date: 11/12/2019 1:14:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rutina](
	[idDiaEjercicioDomingo] [int] NULL,
	[idDiaEjercicioJueves] [int] NULL,
	[idDiaEjercicioLunes] [int] NULL,
	[idDiaEjercicioMartes] [int] NULL,
	[idDiaEjercicioMiercoles] [int] NULL,
	[idDiaEjercicioSabado] [int] NULL,
	[idDiaEjercicioViernes] [int] NULL,
	[rutinaID] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Rutina] PRIMARY KEY CLUSTERED 
(
	[rutinaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tratamiento]    Script Date: 11/12/2019 1:14:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tratamiento](
	[fechaFinalizado] [date] NULL,
	[fechaInicio] [date] NOT NULL,
	[tratamientoID] [int] IDENTITY(1,1) NOT NULL,
	[dietaID] [int] NOT NULL,
	[rutinaID] [int] NULL,
	[pacienteID] [int] NOT NULL,
 CONSTRAINT [PK_Tratamiento] PRIMARY KEY CLUSTERED 
(
	[tratamientoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Turno]    Script Date: 11/12/2019 1:14:21 PM ******/
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
	[eliminado] [bit] NOT NULL CONSTRAINT [DF_Turno_eliminado]  DEFAULT ((0)),
 CONSTRAINT [PK_Turno] PRIMARY KEY CLUSTERED 
(
	[turnoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 11/12/2019 1:14:21 PM ******/
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
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID], [eliminado]) VALUES (50, N'Panceta', N'Carne', 64, 0)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID], [eliminado]) VALUES (50, N'Banana Deshidratada', N'Fruta', 65, 0)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID], [eliminado]) VALUES (200, N'Vacio', N'Carne', 66, 0)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID], [eliminado]) VALUES (100, N'Pure de Papas', N'Vegetal', 67, 0)
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
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-03 17:30:52.197' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 20, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-03 17:58:31.493' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 21, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-03 18:00:58.200' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 22, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-03 18:04:25.633' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 23, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-03 19:02:34.650' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 24, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-03 21:14:10.083' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 25, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-03 21:24:56.800' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 26, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-03 22:35:49.180' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 27, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-03 22:41:50.897' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 28, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-03 22:44:37.717' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 29, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-03 22:50:04.840' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 30, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-03 22:53:26.427' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 31, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-03 23:04:02.047' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 32, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-03 23:04:13.583' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 33, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-03 23:30:56.647' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 34, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-03 23:31:50.830' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 35, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-03 23:33:42.573' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 36, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-03 23:34:44.093' AS DateTime), N'Se detecto un login incorrecto', N'Media', 37, NULL)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-03 23:34:44.120' AS DateTime), N'Ocurrio un error en el login de usuario No se pudo loguear correctamente', N'Media', 38, NULL)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-03 23:34:49.597' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 39, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-03 23:36:38.170' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 40, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-03 23:38:10.397' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 41, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-03 23:39:06.267' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 42, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-03 23:56:12.150' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 43, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-03 23:56:39.700' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 44, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-04 00:12:36.043' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 45, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-04 00:14:39.370' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 46, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-04 00:16:31.643' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 47, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-04 00:17:25.390' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 48, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-07 13:45:29.390' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 49, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-07 14:10:20.460' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 50, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-07 14:42:48.337' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 51, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-07 15:57:36.837' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 52, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-07 16:00:48.047' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 53, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-07 16:02:51.693' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 54, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-07 16:05:00.120' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 55, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-07 16:17:35.860' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 56, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-07 16:19:18.910' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 57, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-07 16:21:45.347' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 58, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-07 16:23:04.980' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 59, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-07 16:28:08.380' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 60, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-07 16:29:48.380' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 61, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-07 16:32:43.697' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 62, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-07 16:34:25.847' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 63, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-07 16:37:26.040' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 64, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-07 16:38:46.630' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 65, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-07 16:41:25.843' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 66, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-07 16:42:36.853' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 67, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-07 16:43:18.620' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 68, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-07 16:47:24.907' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 69, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-07 16:52:27.640' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 70, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-08 10:43:23.160' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 71, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-08 13:25:42.480' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 72, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-08 13:26:09.947' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 73, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-08 13:27:59.277' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 74, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-08 13:29:25.977' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 75, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-08 13:30:13.763' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 76, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-08 13:30:49.990' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 77, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-08 13:31:48.043' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 78, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-08 13:32:44.100' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 79, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-08 20:08:23.627' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 80, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-08 20:15:01.157' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 81, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-08 20:18:58.843' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 82, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-08 21:01:42.930' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 83, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-08 21:04:04.883' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 84, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-08 21:07:44.557' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 85, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-08 22:01:50.747' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 86, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-08 22:09:37.843' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 87, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-08 22:14:42.273' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 88, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-08 22:15:11.690' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 89, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-08 22:16:06.983' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 90, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-08 22:35:12.993' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 91, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-08 22:38:02.190' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 92, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-09 00:02:33.590' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 93, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-09 00:05:02.033' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 94, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-09 00:16:48.007' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 95, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-09 00:18:05.053' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 96, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-09 00:26:25.797' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 97, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-09 00:53:02.473' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 98, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-09 01:01:42.507' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 99, 1)
GO
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-09 01:31:47.843' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 100, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-09 01:37:26.317' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 101, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-09 01:40:13.820' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 102, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-09 01:41:50.537' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 103, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-09 01:46:57.297' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 104, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-09 01:49:26.360' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 105, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-09 18:24:54.133' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 106, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-09 18:28:54.170' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 107, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-09 18:29:37.243' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 108, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-09 18:37:56.000' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 109, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-09 18:48:23.260' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 110, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-09 18:49:30.333' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 111, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-09 19:31:17.283' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 112, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-09 19:49:16.677' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 113, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-09 20:16:13.400' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 114, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-10 11:34:30.857' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 115, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-10 11:42:28.080' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 116, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-10 11:47:16.170' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 117, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-10 11:57:29.810' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 118, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-10 12:13:35.987' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 119, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-10 12:15:14.713' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 120, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-10 12:18:59.197' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 121, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-10 12:20:05.963' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 122, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-10 12:21:42.443' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 123, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-10 12:24:32.080' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 124, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-10 12:25:19.247' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 125, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-10 12:36:38.720' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 126, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-10 12:37:26.833' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 127, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-10 20:29:34.887' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 128, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-10 20:36:49.650' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 129, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-10 21:20:33.877' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 130, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-10 21:22:29.750' AS DateTime), N'Creacion de leyenda para el control Pacientes_button_buscar_todos con Idioma: Español', N'Alta', 131, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-10 21:22:55.633' AS DateTime), N'Creacion de leyenda para el control Pacientes_button_buscar_todos con Idioma: English', N'Alta', 132, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-10 21:23:10.440' AS DateTime), N'Creacion de leyenda para el control Pacientes_button_buscar con Idioma: English', N'Alta', 133, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-10 21:23:21.767' AS DateTime), N'Creacion de leyenda para el control Pacientes_button_buscar con Idioma: Español', N'Alta', 134, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-10 21:23:40.517' AS DateTime), N'Creacion de leyenda para el control Pacientes_label_nombre con Idioma: Español', N'Alta', 135, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-10 21:23:45.753' AS DateTime), N'Creacion de leyenda para el control Pacientes_label_nombre con Idioma: English', N'Alta', 136, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-10 21:23:56.720' AS DateTime), N'Creacion de leyenda para el control Pacientes_label_apellido con Idioma: English', N'Alta', 137, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-10 21:24:06.890' AS DateTime), N'Creacion de leyenda para el control Pacientes_label_apellido con Idioma: Español', N'Alta', 138, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-10 21:24:21.103' AS DateTime), N'Creacion de leyenda para el control Pacientes_label_telefono con Idioma: Español', N'Alta', 139, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-10 21:24:29.077' AS DateTime), N'Creacion de leyenda para el control Pacientes_label_telefono con Idioma: English', N'Alta', 140, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-10 21:24:43.710' AS DateTime), N'Creacion de leyenda para el control Pacientes_label_sexo con Idioma: English', N'Alta', 141, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-10 21:24:48.753' AS DateTime), N'Creacion de leyenda para el control Pacientes_label_sexo con Idioma: Español', N'Alta', 142, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-10 21:25:18.873' AS DateTime), N'Creacion de leyenda para el control Pacientes_label_fecha con Idioma: Español', N'Alta', 143, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-10 21:25:32.117' AS DateTime), N'Creacion de leyenda para el control Pacientes_label_fecha con Idioma: English', N'Alta', 144, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-10 21:25:52.733' AS DateTime), N'Creacion de leyenda para el control Pacientes_button_crear_turno con Idioma: English', N'Alta', 145, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Modificacion de Leyenda', CAST(N'2019-11-10 21:26:14.487' AS DateTime), N'Se modifico la leyenda para el control Pacientes_button_crear_turno con ID 299', N'Media', 146, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-10 21:26:31.160' AS DateTime), N'Creacion de leyenda para el control Pacientes_button_crear_turno con Idioma: Español', N'Alta', 147, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-10 21:27:05.553' AS DateTime), N'Creacion de leyenda para el control Pacientes_button_agregar con Idioma: Español', N'Alta', 148, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-10 21:27:27.857' AS DateTime), N'Creacion de leyenda para el control Pacientes_button_agregar con Idioma: English', N'Alta', 149, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Modificacion de Leyenda', CAST(N'2019-11-10 21:27:50.417' AS DateTime), N'Se modifico la leyenda para el control Pacientes_button_agregar con ID 301', N'Media', 150, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-10 21:28:06.293' AS DateTime), N'Creacion de leyenda para el control Pacientes_button_modificar con Idioma: Español', N'Alta', 151, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-10 21:28:17.027' AS DateTime), N'Creacion de leyenda para el control Pacientes_button_modificar con Idioma: English', N'Alta', 152, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-10 21:28:34.190' AS DateTime), N'Creacion de leyenda para el control Pacientes_button_eliminar con Idioma: English', N'Alta', 153, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-10 21:28:47.967' AS DateTime), N'Creacion de leyenda para el control Pacientes_button_eliminar con Idioma: Español', N'Alta', 154, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-10 21:30:31.423' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 155, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-10 21:37:13.123' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 156, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-10 21:48:38.100' AS DateTime), N'Creacion de leyenda para el control Pacientes_messagebox_errorSeleccion con Idioma: Español', N'Alta', 157, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-10 21:49:00.080' AS DateTime), N'Creacion de leyenda para el control Pacientes_messagebox_errorSeleccion con Idioma: English', N'Alta', 158, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-10 21:49:37.593' AS DateTime), N'Creacion de leyenda para el control Pacientes_messagebox_errorDatos con Idioma: English', N'Alta', 159, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-10 21:49:55.840' AS DateTime), N'Creacion de leyenda para el control Pacientes_messagebox_errorDatos con Idioma: Español', N'Alta', 160, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-10 22:24:11.747' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 161, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-10 22:25:27.390' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 162, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Paciente', CAST(N'2019-11-10 22:26:10.007' AS DateTime), N'Se creo el paciente con DNI 37692345', N'Media', 163, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-10 22:31:16.703' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 164, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-10 22:32:21.343' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 165, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Eliminacion de Paciente', CAST(N'2019-11-10 22:32:31.743' AS DateTime), N'Se elimino el paciente con DNI 37692345', N'Media', 166, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-10 22:42:03.267' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 167, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-10 22:43:43.610' AS DateTime), N'Creacion de leyenda para el control Pacientes_messagebox_errorEdad con Idioma: Español', N'Alta', 168, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-10 22:44:01.963' AS DateTime), N'Creacion de leyenda para el control Pacientes_messagebox_errorEdad con Idioma: English', N'Alta', 169, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Paciente', CAST(N'2019-11-10 22:45:25.640' AS DateTime), N'Se creo el paciente con DNI 37171097', N'Media', 170, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Modificacion de Paciente', CAST(N'2019-11-10 23:34:36.060' AS DateTime), N'Se modifico el paciente con DNI 37171095', N'Media', 171, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Modificacion de Paciente', CAST(N'2019-11-10 23:34:45.660' AS DateTime), N'Se modifico el paciente con DNI 37171097', N'Media', 172, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Paciente', CAST(N'2019-11-10 23:34:52.740' AS DateTime), N'Se creo el paciente con DNI 37171096', N'Media', 173, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Eliminacion de Paciente', CAST(N'2019-11-10 23:34:59.943' AS DateTime), N'Se elimino el paciente con DNI 37171096', N'Media', 174, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Paciente', CAST(N'2019-11-10 23:43:12.797' AS DateTime), N'Se creo el paciente con DNI 37171096', N'Media', 175, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Paciente', CAST(N'2019-11-10 23:44:07.223' AS DateTime), N'Se creo el paciente con DNI 37171096', N'Media', 176, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Paciente', CAST(N'2019-11-10 23:45:34.293' AS DateTime), N'Se produjo un error al crear un paciente Ocurrio un error al interactuar con la base de datos', N'Alta', 177, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Paciente', CAST(N'2019-11-10 23:46:17.803' AS DateTime), N'Se produjo un error al crear un paciente Ocurrio un error al interactuar con la base de datos', N'Alta', 178, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-10 23:47:26.027' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 179, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-11 01:18:07.230' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 180, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 01:19:22.940' AS DateTime), N'Creacion de leyenda para el control GenerarTurno_label_titulo con Idioma: Español', N'Alta', 181, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 01:19:51.517' AS DateTime), N'Creacion de leyenda para el control GenerarTurno_label_titulo con Idioma: English', N'Alta', 182, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 01:20:16.523' AS DateTime), N'Creacion de leyenda para el control GenerarTurno_label_dia con Idioma: Español', N'Alta', 183, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 01:20:41.797' AS DateTime), N'Creacion de leyenda para el control GenerarTurno_label_dia con Idioma: English', N'Alta', 184, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 01:20:55.890' AS DateTime), N'Creacion de leyenda para el control GenerarTurno_label_manana con Idioma: Español', N'Alta', 185, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 01:21:01.863' AS DateTime), N'Creacion de leyenda para el control GenerarTurno_label_manana con Idioma: English', N'Alta', 186, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 01:21:11.180' AS DateTime), N'Creacion de leyenda para el control GenerarTurno_label_tarde con Idioma: Español', N'Alta', 187, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 01:21:19.347' AS DateTime), N'Creacion de leyenda para el control GenerarTurno_label_tarde con Idioma: English', N'Alta', 188, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Modificacion de Leyenda', CAST(N'2019-11-11 01:21:34.160' AS DateTime), N'Se modifico la leyenda para el control GenerarTurno_label_tarde con ID 320', N'Media', 189, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 01:21:53.340' AS DateTime), N'Creacion de leyenda para el control GenerarTurno_label_motivo con Idioma: Español', N'Alta', 190, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 01:22:31.957' AS DateTime), N'Creacion de leyenda para el control GenerarTurno_label_motivo con Idioma: English', N'Alta', 191, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 01:27:40.647' AS DateTime), N'Creacion de leyenda para el control GenerarTurno_label_crear_turno con Idioma: Español', N'Alta', 192, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 01:27:48.827' AS DateTime), N'Creacion de leyenda para el control GenerarTurno_label_crear_turno con Idioma: English', N'Alta', 193, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 01:28:05.217' AS DateTime), N'Creacion de leyenda para el control AgregarTurno_messagebox_errorTurno con Idioma: Español', N'Alta', 194, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 01:28:19.687' AS DateTime), N'Creacion de leyenda para el control AgregarTurno_messagebox_errorTurno con Idioma: English', N'Alta', 195, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-11 01:45:58.927' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 196, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-11 01:59:59.087' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 197, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-11 02:00:52.887' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 198, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-11 11:51:53.300' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 199, 1)
GO
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-11 11:58:57.213' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 200, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-11 12:14:02.807' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 201, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-11 12:15:19.910' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 202, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-11 12:16:19.940' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 203, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-11 12:26:04.740' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 204, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Modificacion de Leyenda', CAST(N'2019-11-11 12:27:40.957' AS DateTime), N'Se modifico la leyenda para el control GenerarTurno_messagebox_errorTurno con ID 325', N'Media', 205, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Modificacion de Leyenda', CAST(N'2019-11-11 12:28:05.967' AS DateTime), N'Se modifico la leyenda para el control GenerarTurno_messagebox_errorTurno con ID 326', N'Media', 206, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-11 12:32:35.220' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 207, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-11 12:34:44.573' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 208, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 12:35:01.723' AS DateTime), N'Creacion de leyenda para el control Error_messagebox_busqueda con Idioma: Español', N'Alta', 209, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 12:35:20.900' AS DateTime), N'Creacion de leyenda para el control Error_messagebox_busqueda con Idioma: English', N'Alta', 210, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-11 12:41:03.640' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 211, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 12:41:22.867' AS DateTime), N'Creacion de leyenda para el control MisTurnos_messagebox_seleccione_turno con Idioma: Español', N'Alta', 212, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 12:41:35.233' AS DateTime), N'Creacion de leyenda para el control MisTurnos_messagebox_seleccione_turno con Idioma: English', N'Alta', 213, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-11 12:53:29.203' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 214, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 12:54:49.173' AS DateTime), N'Creacion de leyenda para el control Tratamiento_error_buscar_activo con Idioma: Español', N'Alta', 215, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 12:55:02.743' AS DateTime), N'Creacion de leyenda para el control Tratamiento_error_buscar_activo con Idioma: English', N'Alta', 216, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 13:56:57.700' AS DateTime), N'Creacion de leyenda para el control Mediciones_label_titulo con Idioma: Español', N'Alta', 217, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 13:57:22.063' AS DateTime), N'Creacion de leyenda para el control Mediciones_label_titulo con Idioma: English', N'Alta', 218, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Modificacion de Leyenda', CAST(N'2019-11-11 13:57:35.390' AS DateTime), N'Se modifico la leyenda para el control Mediciones_label_titulo con ID 333', N'Media', 219, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 13:58:16.303' AS DateTime), N'Creacion de leyenda para el control Mediciones_label_motivo con Idioma: Español', N'Alta', 220, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 13:59:30.560' AS DateTime), N'Creacion de leyenda para el control Mediciones_label_motivo con Idioma: English', N'Alta', 221, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 14:00:42.373' AS DateTime), N'Creacion de leyenda para el control Mediciones_label_mediciones con Idioma: Español', N'Alta', 222, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 14:00:49.990' AS DateTime), N'Creacion de leyenda para el control Mediciones_label_mediciones con Idioma: English', N'Alta', 223, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 14:01:31.347' AS DateTime), N'Creacion de leyenda para el control Mediciones_label_peso con Idioma: Español', N'Alta', 224, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 14:01:39.390' AS DateTime), N'Creacion de leyenda para el control Mediciones_label_peso con Idioma: English', N'Alta', 225, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 14:01:51.150' AS DateTime), N'Creacion de leyenda para el control Mediciones_label_altura con Idioma: English', N'Alta', 226, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 14:01:59.730' AS DateTime), N'Creacion de leyenda para el control Mediciones_label_altura con Idioma: Español', N'Alta', 227, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 14:02:29.463' AS DateTime), N'Creacion de leyenda para el control Mediciones_label_edad con Idioma: Español', N'Alta', 228, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 14:02:33.693' AS DateTime), N'Creacion de leyenda para el control Mediciones_label_edad con Idioma: English', N'Alta', 229, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 14:02:53.780' AS DateTime), N'Creacion de leyenda para el control Mediciones_label_cadera con Idioma: Español', N'Alta', 230, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 14:03:14.120' AS DateTime), N'Creacion de leyenda para el control Mediciones_label_cadera con Idioma: English', N'Alta', 231, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 14:03:26.440' AS DateTime), N'Creacion de leyenda para el control Mediciones_label_cintura con Idioma: Español', N'Alta', 232, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 14:03:40.670' AS DateTime), N'Creacion de leyenda para el control Mediciones_label_cintura con Idioma: English', N'Alta', 233, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 14:03:54.037' AS DateTime), N'Creacion de leyenda para el control Mediciones_button_guardar_mediciones con Idioma: Español', N'Alta', 234, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 14:04:03.700' AS DateTime), N'Creacion de leyenda para el control Mediciones_button_guardar_mediciones con Idioma: English', N'Alta', 235, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 14:04:19.640' AS DateTime), N'Creacion de leyenda para el control Mediciones_button_calcular_bmi con Idioma: English', N'Alta', 236, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 14:04:25.907' AS DateTime), N'Creacion de leyenda para el control Mediciones_button_calcular_bmi con Idioma: Español', N'Alta', 237, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 14:04:34.203' AS DateTime), N'Creacion de leyenda para el control Mediciones_button_calcular_bfp con Idioma: Español', N'Alta', 238, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 14:04:40.890' AS DateTime), N'Creacion de leyenda para el control Mediciones_button_calcular_bfp con Idioma: English', N'Alta', 239, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 14:05:05.547' AS DateTime), N'Creacion de leyenda para el control Mediciones_label_valor_bmi con Idioma: English', N'Alta', 240, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 14:05:12.373' AS DateTime), N'Creacion de leyenda para el control Mediciones_label_valor_bmi con Idioma: Español', N'Alta', 241, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 14:05:23.407' AS DateTime), N'Creacion de leyenda para el control Mediciones_label_estado_bmi con Idioma: Español', N'Alta', 242, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 14:05:59.660' AS DateTime), N'Creacion de leyenda para el control Mediciones_label_estado_bmi con Idioma: English', N'Alta', 243, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Modificacion de Leyenda', CAST(N'2019-11-11 14:06:15.113' AS DateTime), N'Se modifico la leyenda para el control Mediciones_label_valor_bmi con ID 356', N'Media', 244, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Modificacion de Leyenda', CAST(N'2019-11-11 14:06:29.753' AS DateTime), N'Se modifico la leyenda para el control Mediciones_label_estado_bmi con ID 357', N'Media', 245, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Modificacion de Leyenda', CAST(N'2019-11-11 14:06:52.430' AS DateTime), N'Se modifico la leyenda para el control Mediciones_label_valor_bmi con ID 355', N'Media', 246, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 14:06:56.730' AS DateTime), N'Creacion de leyenda para el control Mediciones_label_valor_bfp con Idioma: English', N'Alta', 247, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 14:07:04.693' AS DateTime), N'Creacion de leyenda para el control Mediciones_label_estado_bfp con Idioma: English', N'Alta', 248, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 14:07:15.167' AS DateTime), N'Creacion de leyenda para el control Mediciones_label_valor_bfp con Idioma: Español', N'Alta', 249, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 14:07:32.217' AS DateTime), N'Creacion de leyenda para el control Mediciones_label_estado_bfp con Idioma: Español', N'Alta', 250, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 14:07:48.503' AS DateTime), N'Creacion de leyenda para el control Mediciones_label_ultimas_mediciones con Idioma: Español', N'Alta', 251, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 14:07:56.027' AS DateTime), N'Creacion de leyenda para el control Mediciones_label_ultimas_mediciones con Idioma: English', N'Alta', 252, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 14:09:48.423' AS DateTime), N'Creacion de leyenda para el control Mediciones_messagebox_error_medidas_introducidas con Idioma: Español', N'Alta', 253, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 14:10:03.397' AS DateTime), N'Creacion de leyenda para el control Mediciones_messagebox_error_medidas_introducidas con Idioma: English', N'Alta', 254, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 14:18:49.777' AS DateTime), N'Creacion de leyenda para el control Mediciones_error_calculo_bmi con Idioma: English', N'Alta', 255, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Modificacion de Leyenda', CAST(N'2019-11-11 14:19:37.397' AS DateTime), N'Se modifico la leyenda para el control Mediciones_error_calculo_bmi con ID 367', N'Media', 256, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 14:19:46.210' AS DateTime), N'Creacion de leyenda para el control Mediciones_error_calculo_bfp con Idioma: English', N'Alta', 257, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 14:20:23.223' AS DateTime), N'Creacion de leyenda para el control Mediciones_error_calculo_bfp con Idioma: Español', N'Alta', 258, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 14:20:33.933' AS DateTime), N'Creacion de leyenda para el control Mediciones_error_calculo_bmi con Idioma: Español', N'Alta', 259, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 14:31:39.557' AS DateTime), N'Creacion de leyenda para el control Mediciones_BMI_Bajo con Idioma: Español', N'Alta', 260, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 14:31:48.650' AS DateTime), N'Creacion de leyenda para el control Mediciones_BMI_Bajo con Idioma: English', N'Alta', 261, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 14:31:57.687' AS DateTime), N'Creacion de leyenda para el control Mediciones_BMI_Sano con Idioma: Español', N'Alta', 262, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 14:32:05.193' AS DateTime), N'Creacion de leyenda para el control Mediciones_BMI_Sano con Idioma: English', N'Alta', 263, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 14:32:18.037' AS DateTime), N'Creacion de leyenda para el control Mediciones_BMI_Sobrepeso con Idioma: English', N'Alta', 264, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 14:32:24.020' AS DateTime), N'Creacion de leyenda para el control Mediciones_BMI_Sobrepeso con Idioma: Español', N'Alta', 265, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 14:32:33.197' AS DateTime), N'Creacion de leyenda para el control Mediciones_BMI_Obesidad con Idioma: Español', N'Alta', 266, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 14:32:40.523' AS DateTime), N'Creacion de leyenda para el control Mediciones_BMI_Obesidad con Idioma: English', N'Alta', 267, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 14:33:01.027' AS DateTime), N'Creacion de leyenda para el control Mediciones_BMI_ExtremoObeso con Idioma: English', N'Alta', 268, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 14:33:09.790' AS DateTime), N'Creacion de leyenda para el control Mediciones_BMI_ExtremoObeso con Idioma: Español', N'Alta', 269, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 14:36:42.523' AS DateTime), N'Creacion de leyenda para el control Mediciones_BFP_Atletico con Idioma: Español', N'Alta', 270, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 14:36:45.693' AS DateTime), N'Error en la creacion de leyenda: Ya existe una leyenda para ese control y ese idioma', N'Alta', 271, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 14:36:55.867' AS DateTime), N'Creacion de leyenda para el control Mediciones_BFP_Atletico con Idioma: English', N'Alta', 272, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 14:37:42.283' AS DateTime), N'Creacion de leyenda para el control Mediciones_BFP_Sano con Idioma: Español', N'Alta', 273, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 14:37:53.933' AS DateTime), N'Creacion de leyenda para el control Mediciones_BFP_Sano con Idioma: English', N'Alta', 274, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 14:38:50.897' AS DateTime), N'Creacion de leyenda para el control Mediciones_BFP_Grasa_Excedida con Idioma: English', N'Alta', 275, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 14:39:02.717' AS DateTime), N'Creacion de leyenda para el control Mediciones_BFP_Grasa_Excedida con Idioma: Español', N'Alta', 276, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-11 14:45:42.580' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 277, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-11 14:46:28.777' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 278, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-11 14:46:30.010' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 279, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-11 14:46:30.010' AS DateTime), N'Calculo de BFP realizado por el usuario id: 1', N'Alta', 280, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-11 14:46:51.180' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 281, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-11 14:46:51.910' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 282, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-11 14:46:51.910' AS DateTime), N'Calculo de BFP realizado por el usuario id: 1', N'Alta', 283, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-11 14:48:15.510' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 284, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-11 14:49:13.767' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 285, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-11 14:49:14.763' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 286, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-11 14:49:14.763' AS DateTime), N'Calculo de BFP realizado por el usuario id: 1', N'Alta', 287, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-11 14:49:21.743' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 288, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-11 14:49:22.220' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 289, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-11 14:49:22.223' AS DateTime), N'Calculo de BFP realizado por el usuario id: 1', N'Alta', 290, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-11 14:51:02.190' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 291, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-11 15:14:13.240' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 292, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 15:14:35.460' AS DateTime), N'Creacion de leyenda para el control Mediciones_error_guardar_medicion con Idioma: Español', N'Alta', 293, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 15:15:03.493' AS DateTime), N'Creacion de leyenda para el control Mediciones_error_guardar_medicion con Idioma: English', N'Alta', 294, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-11 15:15:28.623' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 295, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-11 15:26:15.907' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 296, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 15:26:53.250' AS DateTime), N'Creacion de leyenda para el control AgregarDieta_radiobutton_bajar con Idioma: Español', N'Alta', 297, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 15:27:19.140' AS DateTime), N'Creacion de leyenda para el control AgregarDieta_radiobutton_bajar con Idioma: English', N'Alta', 298, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 15:27:38.120' AS DateTime), N'Creacion de leyenda para el control AgregarDieta_radiobutton_mantener con Idioma: English', N'Alta', 299, 1)
GO
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 15:27:46.440' AS DateTime), N'Creacion de leyenda para el control AgregarDieta_radiobutton_mantener con Idioma: Español', N'Alta', 300, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 15:27:59.143' AS DateTime), N'Creacion de leyenda para el control AgregarDieta_radiobutton_subir con Idioma: Español', N'Alta', 301, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 15:28:05.387' AS DateTime), N'Creacion de leyenda para el control AgregarDieta_radiobutton_subir con Idioma: English', N'Alta', 302, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 15:28:25.963' AS DateTime), N'Creacion de leyenda para el control AgregarDieta_button_generar_dieta_automatica con Idioma: English', N'Alta', 303, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 15:28:34.417' AS DateTime), N'Creacion de leyenda para el control AgregarDieta_button_generar_dieta_automatica con Idioma: Español', N'Alta', 304, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 15:28:45.353' AS DateTime), N'Creacion de leyenda para el control AgregarDieta_button_nueva_dieta con Idioma: Español', N'Alta', 305, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 15:28:51.190' AS DateTime), N'Creacion de leyenda para el control AgregarDieta_button_nueva_dieta con Idioma: English', N'Alta', 306, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 15:29:09.217' AS DateTime), N'Creacion de leyenda para el control AgregarDieta_label_desayuno con Idioma: English', N'Alta', 307, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 15:29:14.853' AS DateTime), N'Creacion de leyenda para el control AgregarDieta_label_desayuno con Idioma: Español', N'Alta', 308, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 15:29:32.320' AS DateTime), N'Creacion de leyenda para el control AgregarDieta_label_colacion con Idioma: Español', N'Alta', 309, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 15:29:40.220' AS DateTime), N'Creacion de leyenda para el control AgregarDieta_label_colacion con Idioma: English', N'Alta', 310, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 15:30:11.800' AS DateTime), N'Creacion de leyenda para el control AgregarDieta_label_almuerzo con Idioma: English', N'Alta', 311, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 15:30:16.733' AS DateTime), N'Creacion de leyenda para el control AgregarDieta_label_almuerzo con Idioma: Español', N'Alta', 312, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 15:30:28.870' AS DateTime), N'Creacion de leyenda para el control AgregarDieta_label_merienda con Idioma: Español', N'Alta', 313, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 15:31:08.147' AS DateTime), N'Creacion de leyenda para el control AgregarDieta_label_merienda con Idioma: English', N'Alta', 314, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 15:31:28.613' AS DateTime), N'Creacion de leyenda para el control AgregarDieta_label_cena con Idioma: Español', N'Alta', 315, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 15:31:34.083' AS DateTime), N'Creacion de leyenda para el control AgregarDieta_label_cena con Idioma: English', N'Alta', 316, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 15:32:21.590' AS DateTime), N'Creacion de leyenda para el control AgregarDieta_label_buscar con Idioma: English', N'Alta', 317, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 15:32:27.337' AS DateTime), N'Creacion de leyenda para el control AgregarDieta_label_buscar con Idioma: Español', N'Alta', 318, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 15:32:41.360' AS DateTime), N'Creacion de leyenda para el control AgregarDieta_label_calorias_dia con Idioma: Español', N'Alta', 319, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 15:32:47.997' AS DateTime), N'Creacion de leyenda para el control AgregarDieta_label_calorias_dia con Idioma: English', N'Alta', 320, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 15:33:00.087' AS DateTime), N'Creacion de leyenda para el control AgregarDieta_label_calorias_totales con Idioma: Español', N'Alta', 321, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 15:33:07.967' AS DateTime), N'Creacion de leyenda para el control AgregarDieta_label_calorias_totales con Idioma: English', N'Alta', 322, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 15:33:25.960' AS DateTime), N'Creacion de leyenda para el control AgregarDieta_button_iniciar_tratamiento con Idioma: Español', N'Alta', 323, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 15:33:26.943' AS DateTime), N'Error en la creacion de leyenda: Ya existe una leyenda para ese control y ese idioma', N'Alta', 324, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 15:33:35.987' AS DateTime), N'Creacion de leyenda para el control AgregarDieta_button_iniciar_tratamiento con Idioma: English', N'Alta', 325, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 15:33:53.053' AS DateTime), N'Creacion de leyenda para el control AgregarDieta_label_cambiar_plato con Idioma: Español', N'Alta', 326, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 15:34:02.137' AS DateTime), N'Error en la creacion de leyenda: Ya existe una leyenda para ese control y ese idioma', N'Alta', 327, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 15:34:05.453' AS DateTime), N'Creacion de leyenda para el control AgregarDieta_label_cambiar_plato con Idioma: English', N'Alta', 328, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-11 15:39:41.680' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 329, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-11 15:40:10.677' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 330, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-11 15:40:12.223' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 331, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-11 15:40:12.227' AS DateTime), N'Calculo de BFP realizado por el usuario id: 1', N'Alta', 332, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-11 15:40:28.457' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 333, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-11 15:40:28.460' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 334, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-11 15:40:28.460' AS DateTime), N'Calculo de BFP realizado por el usuario id: 1', N'Alta', 335, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Guardar Medicion', CAST(N'2019-11-11 15:40:28.463' AS DateTime), N'Se guardo una nueva medicion para el turno con ID: 14', N'Media', 336, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-11 15:44:40.890' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 337, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-11 15:46:26.853' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 338, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-11 15:46:26.857' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 339, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-11 15:46:26.857' AS DateTime), N'Calculo de BFP realizado por el usuario id: 1', N'Alta', 340, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Guardar Medicion', CAST(N'2019-11-11 15:46:26.860' AS DateTime), N'Se guardo una nueva medicion para el turno con ID: 10', N'Media', 341, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-11 15:48:09.673' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 342, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 15:48:19.430' AS DateTime), N'Creacion de leyenda para el control AgregarDieta_groupbox_detalle_dieta con Idioma: Español', N'Alta', 343, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 15:48:26.247' AS DateTime), N'Creacion de leyenda para el control AgregarDieta_groupbox_detalle_dieta con Idioma: English', N'Alta', 344, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-11 15:48:50.503' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 345, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-11 15:48:50.507' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 346, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-11 15:48:50.507' AS DateTime), N'Calculo de BFP realizado por el usuario id: 1', N'Alta', 347, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Guardar Medicion', CAST(N'2019-11-11 15:48:50.510' AS DateTime), N'Se guardo una nueva medicion para el turno con ID: 10', N'Media', 348, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-11 15:49:42.787' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 349, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-11 15:49:55.843' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 350, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-11 15:49:55.843' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 351, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-11 15:49:55.843' AS DateTime), N'Calculo de BFP realizado por el usuario id: 1', N'Alta', 352, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Guardar Medicion', CAST(N'2019-11-11 15:49:55.847' AS DateTime), N'Se guardo una nueva medicion para el turno con ID: 10', N'Media', 353, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-11 15:53:37.770' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 354, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 15:53:50.863' AS DateTime), N'Creacion de leyenda para el control AgregarDieta_dia_lunes con Idioma: Español', N'Alta', 355, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 15:53:58.567' AS DateTime), N'Creacion de leyenda para el control AgregarDieta_dia_martes con Idioma: Español', N'Alta', 356, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 15:54:05.380' AS DateTime), N'Creacion de leyenda para el control AgregarDieta_dia_miercoles con Idioma: Español', N'Alta', 357, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 15:54:11.647' AS DateTime), N'Creacion de leyenda para el control AgregarDieta_dia_jueves con Idioma: Español', N'Alta', 358, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 15:54:16.523' AS DateTime), N'Creacion de leyenda para el control AgregarDieta_dia_viernes con Idioma: Español', N'Alta', 359, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 15:54:22.543' AS DateTime), N'Creacion de leyenda para el control AgregarDieta_dia_sabado con Idioma: Español', N'Alta', 360, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 15:54:27.840' AS DateTime), N'Creacion de leyenda para el control AgregarDieta_dia_domingo con Idioma: Español', N'Alta', 361, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 15:54:41.883' AS DateTime), N'Creacion de leyenda para el control AgregarDieta_dia_monday con Idioma: English', N'Alta', 362, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Modificacion de Leyenda', CAST(N'2019-11-11 15:54:55.770' AS DateTime), N'Se modifico la leyenda para el control AgregarDieta_dia_lunes con ID 428', N'Media', 363, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 15:55:01.543' AS DateTime), N'Creacion de leyenda para el control AgregarDieta_dia_martes con Idioma: English', N'Alta', 364, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 15:55:10.697' AS DateTime), N'Creacion de leyenda para el control AgregarDieta_dia_miercoles con Idioma: English', N'Alta', 365, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 15:55:29.017' AS DateTime), N'Creacion de leyenda para el control AgregarDieta_dia_jueves con Idioma: English', N'Alta', 366, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 15:55:35.017' AS DateTime), N'Creacion de leyenda para el control AgregarDieta_dia_viernes con Idioma: English', N'Alta', 367, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 15:55:55.540' AS DateTime), N'Creacion de leyenda para el control AgregarDieta_dia_sabado con Idioma: English', N'Alta', 368, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 15:56:01.537' AS DateTime), N'Creacion de leyenda para el control AgregarDieta_dia_domingo con Idioma: English', N'Alta', 369, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-11 16:07:24.777' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 370, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 16:09:14.693' AS DateTime), N'Creacion de leyenda para el control TratamientoActual_label_resumen con Idioma: Español', N'Alta', 371, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 16:09:22.693' AS DateTime), N'Creacion de leyenda para el control TratamientoActual_label_resumen con Idioma: English', N'Alta', 372, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 16:09:36.520' AS DateTime), N'Creacion de leyenda para el control TratamientoActual_label_ultima_medicion con Idioma: English', N'Alta', 373, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 16:09:44.820' AS DateTime), N'Creacion de leyenda para el control TratamientoActual_label_ultima_medicion con Idioma: Español', N'Alta', 374, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 16:09:45.667' AS DateTime), N'Error en la creacion de leyenda: Ya existe una leyenda para ese control y ese idioma', N'Alta', 375, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 16:10:03.733' AS DateTime), N'Creacion de leyenda para el control TratamientoActual_label_primera_medicion con Idioma: Español', N'Alta', 376, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 16:10:22.710' AS DateTime), N'Creacion de leyenda para el control TratamientoActual_label_primera_medicion con Idioma: English', N'Alta', 377, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 16:11:02.530' AS DateTime), N'Creacion de leyenda para el control TratamientoActual_button_nueva_medicion con Idioma: English', N'Alta', 378, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 16:11:03.950' AS DateTime), N'Error en la creacion de leyenda: Ya existe una leyenda para ese control y ese idioma', N'Alta', 379, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 16:11:13.020' AS DateTime), N'Creacion de leyenda para el control TratamientoActual_button_nueva_medicion con Idioma: Español', N'Alta', 380, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 16:11:28.760' AS DateTime), N'Creacion de leyenda para el control TratamientoActual_button_proyecciones con Idioma: Español', N'Alta', 381, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 16:11:41.927' AS DateTime), N'Creacion de leyenda para el control TratamientoActual_button_proyecciones con Idioma: English', N'Alta', 382, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 16:11:58.410' AS DateTime), N'Creacion de leyenda para el control TratamientoActual_button_manejar_ejercicios con Idioma: English', N'Alta', 383, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 16:12:05.540' AS DateTime), N'Creacion de leyenda para el control TratamientoActual_button_manejar_ejercicios con Idioma: Español', N'Alta', 384, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 16:12:20.153' AS DateTime), N'Creacion de leyenda para el control TratamientoActual_label_dieta_actual con Idioma: Español', N'Alta', 385, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 16:12:26.367' AS DateTime), N'Creacion de leyenda para el control TratamientoActual_label_dieta_actual con Idioma: English', N'Alta', 386, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 16:12:44.273' AS DateTime), N'Creacion de leyenda para el control AgregarDieta_button_finalizar con Idioma: Español', N'Alta', 387, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 16:12:50.437' AS DateTime), N'Creacion de leyenda para el control AgregarDieta_button_finalizar con Idioma: English', N'Alta', 388, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 16:13:05.177' AS DateTime), N'Creacion de leyenda para el control AgregarDieta_label_rutina_actual con Idioma: English', N'Alta', 389, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 16:13:11.430' AS DateTime), N'Creacion de leyenda para el control AgregarDieta_label_rutina_actual con Idioma: Español', N'Alta', 390, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 16:13:19.777' AS DateTime), N'Creacion de leyenda para el control AgregarDieta_label_duracion con Idioma: Español', N'Alta', 391, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 16:13:29.887' AS DateTime), N'Creacion de leyenda para el control AgregarDieta_label_duracion con Idioma: English', N'Alta', 392, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 16:13:39.177' AS DateTime), N'Creacion de leyenda para el control AgregarDieta_label_calorias con Idioma: English', N'Alta', 393, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 16:13:44.003' AS DateTime), N'Creacion de leyenda para el control AgregarDieta_label_calorias con Idioma: Español', N'Alta', 394, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 16:13:45.573' AS DateTime), N'Error en la creacion de leyenda: Ya existe una leyenda para ese control y ese idioma', N'Alta', 395, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 16:13:56.923' AS DateTime), N'Creacion de leyenda para el control Tratamiento_label_calorias_totales_quemadas con Idioma: Español', N'Alta', 396, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 16:14:03.367' AS DateTime), N'Creacion de leyenda para el control Tratamiento_label_calorias_totales_quemadas con Idioma: English', N'Alta', 397, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-11 16:14:16.583' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 398, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-11 16:32:11.520' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 399, 1)
GO
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 16:33:29.017' AS DateTime), N'Creacion de leyenda para el control AgregarRutina_label_ver_rutinas con Idioma: Español', N'Alta', 400, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 16:33:51.153' AS DateTime), N'Creacion de leyenda para el control AgregarRutina_label_ver_rutinas con Idioma: English', N'Alta', 401, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 16:33:51.900' AS DateTime), N'Error en la creacion de leyenda: Ya existe una leyenda para ese control y ese idioma', N'Alta', 402, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 16:34:16.107' AS DateTime), N'Creacion de leyenda para el control AgregarRutina_button_asociar con Idioma: English', N'Alta', 403, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Modificacion de Leyenda', CAST(N'2019-11-11 16:34:31.477' AS DateTime), N'Se modifico la leyenda para el control AgregarRutina_button_asociar con ID 461', N'Media', 404, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 16:35:08.193' AS DateTime), N'Creacion de leyenda para el control AgregarRutina_button_asociar con Idioma: Español', N'Alta', 405, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Modificacion de Leyenda', CAST(N'2019-11-11 16:35:19.697' AS DateTime), N'Se modifico la leyenda para el control AgregarRutina_button_asociar con ID 461', N'Media', 406, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Modificacion de Leyenda', CAST(N'2019-11-11 16:35:29.140' AS DateTime), N'Se modifico la leyenda para el control AgregarRutina_label_ver_rutinas con ID 460', N'Media', 407, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 16:35:48.217' AS DateTime), N'Creacion de leyenda para el control AgregarRutina_label_calorias_quemadas_dia con Idioma: English', N'Alta', 408, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 16:35:58.753' AS DateTime), N'Creacion de leyenda para el control AgregarRutina_label_calorias_quemadas_dia con Idioma: Español', N'Alta', 409, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 16:36:10.217' AS DateTime), N'Creacion de leyenda para el control AgregarRutina_label_calorias_quemadas_semanales con Idioma: Español', N'Alta', 410, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 16:36:18.410' AS DateTime), N'Creacion de leyenda para el control AgregarRutina_label_calorias_quemadas_semanales con Idioma: English', N'Alta', 411, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Modificacion de Leyenda', CAST(N'2019-11-11 16:36:56.303' AS DateTime), N'Se modifico la leyenda para el control TratamientoActual_button_manejar_ejercicios con ID 445', N'Media', 412, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 16:38:15.220' AS DateTime), N'Creacion de leyenda para el control TratamientoActual_label_rutina_actual con Idioma: English', N'Alta', 413, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 16:38:21.833' AS DateTime), N'Creacion de leyenda para el control TratamientoActual_label_rutina_actual con Idioma: Español', N'Alta', 414, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-11 16:40:04.067' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 415, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-11 16:46:34.490' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 416, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 16:48:10.217' AS DateTime), N'Creacion de leyenda para el control Ejercicios_label_nombre con Idioma: Español', N'Alta', 417, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 16:48:11.247' AS DateTime), N'Error en la creacion de leyenda: Ya existe una leyenda para ese control y ese idioma', N'Alta', 418, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 16:48:20.087' AS DateTime), N'Creacion de leyenda para el control Ejercicios_label_nombre con Idioma: English', N'Alta', 419, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 16:48:35.747' AS DateTime), N'Creacion de leyenda para el control Ejercicios_label_calorias_hora con Idioma: English', N'Alta', 420, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 16:48:44.603' AS DateTime), N'Creacion de leyenda para el control Ejercicios_label_calorias_hora con Idioma: Español', N'Alta', 421, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 16:48:58.303' AS DateTime), N'Creacion de leyenda para el control Ejercicios_label_nombre_rutina con Idioma: Español', N'Alta', 422, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 16:49:06.353' AS DateTime), N'Creacion de leyenda para el control Ejercicios_label_nombre_rutina con Idioma: English', N'Alta', 423, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 16:49:14.123' AS DateTime), N'Creacion de leyenda para el control Ejercicios_button_agregar_rutina con Idioma: English', N'Alta', 424, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 16:49:20.797' AS DateTime), N'Creacion de leyenda para el control Ejercicios_button_agregar_rutina con Idioma: Español', N'Alta', 425, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 16:49:32.863' AS DateTime), N'Creacion de leyenda para el control Ejercicios_label_ver_rutinas_existentes con Idioma: Español', N'Alta', 426, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 16:49:41.500' AS DateTime), N'Creacion de leyenda para el control Ejercicios_label_ver_rutinas_existentes con Idioma: English', N'Alta', 427, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 16:49:53.280' AS DateTime), N'Creacion de leyenda para el control Ejercicios_button_limpiar con Idioma: English', N'Alta', 428, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 16:50:01.330' AS DateTime), N'Creacion de leyenda para el control Ejercicios_button_limpiar con Idioma: Español', N'Alta', 429, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-11 16:51:57.067' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 430, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-11 16:58:56.563' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 431, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-11 17:00:54.700' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 432, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-11 17:20:04.360' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 433, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-11 17:20:43.017' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 434, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 17:21:07.080' AS DateTime), N'Creacion de leyenda para el control Alimentos_label_nombre_alimento con Idioma: Español', N'Alta', 435, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 17:21:08.577' AS DateTime), N'Error en la creacion de leyenda: Ya existe una leyenda para ese control y ese idioma', N'Alta', 436, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 17:21:13.840' AS DateTime), N'Creacion de leyenda para el control Alimentos_label_nombre_alimento con Idioma: English', N'Alta', 437, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 17:21:25.063' AS DateTime), N'Creacion de leyenda para el control Alimentos_label_calorias_alimento con Idioma: English', N'Alta', 438, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 17:21:30.080' AS DateTime), N'Creacion de leyenda para el control Alimentos_label_calorias_alimento con Idioma: Español', N'Alta', 439, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 17:21:46.337' AS DateTime), N'Creacion de leyenda para el control Alimentos_label_tipo_alimento con Idioma: Español', N'Alta', 440, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 17:21:53.057' AS DateTime), N'Creacion de leyenda para el control Alimentos_label_tipo_alimento con Idioma: English', N'Alta', 441, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 17:22:08.013' AS DateTime), N'Creacion de leyenda para el control Alimentos_button_agregar con Idioma: English', N'Alta', 442, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 17:22:14.287' AS DateTime), N'Creacion de leyenda para el control Alimentos_button_agregar con Idioma: Español', N'Alta', 443, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 17:22:25.927' AS DateTime), N'Creacion de leyenda para el control Alimentos_label_buscar_nombre_alimento con Idioma: Español', N'Alta', 444, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 17:22:33.807' AS DateTime), N'Creacion de leyenda para el control Alimentos_label_buscar_nombre_alimento con Idioma: English', N'Alta', 445, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 17:22:47.483' AS DateTime), N'Creacion de leyenda para el control Alimentos_label_nombre_plato con Idioma: English', N'Alta', 446, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 17:22:53.460' AS DateTime), N'Creacion de leyenda para el control Alimentos_label_nombre_plato con Idioma: Español', N'Alta', 447, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 17:23:07.210' AS DateTime), N'Creacion de leyenda para el control Alimentos_label_calorias_plato con Idioma: Español', N'Alta', 448, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 17:23:18.020' AS DateTime), N'Creacion de leyenda para el control Alimentos_label_calorias_plato con Idioma: English', N'Alta', 449, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 17:23:34.677' AS DateTime), N'Creacion de leyenda para el control Alimentos_checkbox_desayuno con Idioma: English', N'Alta', 450, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 17:23:40.823' AS DateTime), N'Creacion de leyenda para el control Alimentos_checkbox_desayuno con Idioma: Español', N'Alta', 451, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Modificacion de Leyenda', CAST(N'2019-11-11 17:23:51.140' AS DateTime), N'Se modifico la leyenda para el control Alimentos_checkbox_desayuno con ID 496', N'Media', 452, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 17:24:00.637' AS DateTime), N'Creacion de leyenda para el control Alimentos_checkbox_colacion con Idioma: Español', N'Alta', 453, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 17:24:07.943' AS DateTime), N'Creacion de leyenda para el control Alimentos_checkbox_colacion con Idioma: English', N'Alta', 454, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 17:24:17.780' AS DateTime), N'Creacion de leyenda para el control Alimentos_checkbox_merienda con Idioma: English', N'Alta', 455, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 17:24:19.057' AS DateTime), N'Error en la creacion de leyenda: Ya existe una leyenda para ese control y ese idioma', N'Alta', 456, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 17:24:27.823' AS DateTime), N'Creacion de leyenda para el control Alimentos_checkbox_merienda con Idioma: Español', N'Alta', 457, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 17:24:39.997' AS DateTime), N'Creacion de leyenda para el control Alimentos_checkbox_plato_principal con Idioma: Español', N'Alta', 458, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 17:24:50.633' AS DateTime), N'Creacion de leyenda para el control Alimentos_checkbox_plato_principal con Idioma: English', N'Alta', 459, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 17:25:31.217' AS DateTime), N'Creacion de leyenda para el control Alimentos_button_limpiar_seleccion_plato con Idioma: English', N'Alta', 460, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 17:25:39.590' AS DateTime), N'Creacion de leyenda para el control Alimentos_button_limpiar_seleccion_plato con Idioma: Español', N'Alta', 461, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 17:25:57.793' AS DateTime), N'Creacion de leyenda para el control Alimentos_label_buscar_nombre_plato con Idioma: Español', N'Alta', 462, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Modificacion de Leyenda', CAST(N'2019-11-11 17:26:14.783' AS DateTime), N'Se modifico la leyenda para el control Alimentos_label_buscar_nombre_plato con ID 505', N'Media', 463, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 17:26:24.257' AS DateTime), N'Creacion de leyenda para el control Alimentos_label_buscar_nombre_plato con Idioma: English', N'Alta', 464, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 17:26:47.627' AS DateTime), N'Creacion de leyenda para el control Alimentos_label_agregar_alimento_a_plato con Idioma: English', N'Alta', 465, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 17:26:48.480' AS DateTime), N'Error en la creacion de leyenda: Ya existe una leyenda para ese control y ese idioma', N'Alta', 466, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Modificacion de Leyenda', CAST(N'2019-11-11 17:27:11.673' AS DateTime), N'Se modifico la leyenda para el control Alimentos_label_agregar_alimento_a_plato con ID 507', N'Media', 467, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 17:27:23.773' AS DateTime), N'Creacion de leyenda para el control Alimentos_label_agregar_alimento_a_plato con Idioma: Español', N'Alta', 468, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 17:28:00.630' AS DateTime), N'Creacion de leyenda para el control Alimentos_label_dietas con Idioma: Español', N'Alta', 469, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 17:28:15.583' AS DateTime), N'Creacion de leyenda para el control Alimentos_label_dietas con Idioma: English', N'Alta', 470, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 17:28:26.937' AS DateTime), N'Creacion de leyenda para el control Alimentos_button_limpiar_desayuno con Idioma: Español', N'Alta', 471, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 17:28:30.943' AS DateTime), N'Creacion de leyenda para el control Alimentos_button_limpiar_colacion con Idioma: Español', N'Alta', 472, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 17:28:38.093' AS DateTime), N'Creacion de leyenda para el control Alimentos_button_limpiar_almuerzo con Idioma: Español', N'Alta', 473, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 17:28:43.263' AS DateTime), N'Creacion de leyenda para el control Alimentos_button_limpiar_merienda con Idioma: Español', N'Alta', 474, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 17:28:47.310' AS DateTime), N'Creacion de leyenda para el control Alimentos_button_limpiar_cena con Idioma: Español', N'Alta', 475, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 17:28:57.247' AS DateTime), N'Creacion de leyenda para el control Alimentos_button_limpiar_cena con Idioma: English', N'Alta', 476, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 17:29:02.953' AS DateTime), N'Creacion de leyenda para el control Alimentos_button_limpiar_desayuno con Idioma: English', N'Alta', 477, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 17:29:07.640' AS DateTime), N'Creacion de leyenda para el control Alimentos_button_limpiar_colacion con Idioma: English', N'Alta', 478, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 17:29:13.067' AS DateTime), N'Creacion de leyenda para el control Alimentos_button_limpiar_almuerzo con Idioma: English', N'Alta', 479, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 17:29:19.183' AS DateTime), N'Creacion de leyenda para el control Alimentos_button_limpiar_merienda con Idioma: English', N'Alta', 480, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 17:29:23.077' AS DateTime), N'Error en la creacion de leyenda: Ya existe una leyenda para ese control y ese idioma', N'Alta', 481, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 17:29:42.443' AS DateTime), N'Creacion de leyenda para el control Alimentos_label_seleccione_dia con Idioma: Español', N'Alta', 482, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 17:29:43.707' AS DateTime), N'Error en la creacion de leyenda: Ya existe una leyenda para ese control y ese idioma', N'Alta', 483, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 17:29:50.243' AS DateTime), N'Creacion de leyenda para el control Alimentos_label_seleccione_dia con Idioma: English', N'Alta', 484, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 17:30:07.633' AS DateTime), N'Creacion de leyenda para el control Alimentos_label_nombre_dieta con Idioma: English', N'Alta', 485, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 17:30:18.550' AS DateTime), N'Creacion de leyenda para el control Alimentos_label_calorias_totales con Idioma: English', N'Alta', 486, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Modificacion de Leyenda', CAST(N'2019-11-11 17:30:43.240' AS DateTime), N'Se modifico la leyenda para el control Alimentos_label_calorias_totales con ID 524', N'Media', 487, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Modificacion de Leyenda', CAST(N'2019-11-11 17:30:54.897' AS DateTime), N'Se modifico la leyenda para el control Alimentos_label_nombre_dieta con ID 523', N'Media', 488, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 17:31:01.510' AS DateTime), N'Creacion de leyenda para el control Alimentos_label_nombre_dieta con Idioma: Español', N'Alta', 489, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 17:31:11.163' AS DateTime), N'Creacion de leyenda para el control Alimentos_label_calorias_totales con Idioma: Español', N'Alta', 490, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 17:31:24.653' AS DateTime), N'Creacion de leyenda para el control Alimentos_label_calorias_dia con Idioma: Español', N'Alta', 491, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 17:31:43.520' AS DateTime), N'Creacion de leyenda para el control Alimentos_label_calorias_dia con Idioma: English', N'Alta', 492, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 17:31:58.827' AS DateTime), N'Creacion de leyenda para el control Alimentos_button_crear_dieta con Idioma: English', N'Alta', 493, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 17:32:04.427' AS DateTime), N'Creacion de leyenda para el control Alimentos_button_crear_dieta con Idioma: Español', N'Alta', 494, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-11 17:32:20.583' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 495, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-11 17:33:35.433' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 496, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 17:33:56.420' AS DateTime), N'Creacion de leyenda para el control Alimentos_label_agregar_plato con Idioma: English', N'Alta', 497, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 17:34:01.680' AS DateTime), N'Creacion de leyenda para el control Alimentos_label_agregar_plato con Idioma: Español', N'Alta', 498, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Modificacion de Paciente', CAST(N'2019-11-11 17:40:30.157' AS DateTime), N'Se produjo un error al modificar un paciente There was an error while interacting with the database', N'Alta', 499, 1)
GO
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Modificacion de Paciente', CAST(N'2019-11-11 17:40:36.867' AS DateTime), N'Se modifico el paciente con DNI 37171097', N'Media', 500, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-11 17:55:08.703' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 501, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-11 17:55:51.397' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 502, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-11 18:13:52.510' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 503, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 18:14:06.880' AS DateTime), N'Creacion de leyenda para el control GenerarTurno_messagebox_sin_turnos con Idioma: Español', N'Alta', 504, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 18:14:29.487' AS DateTime), N'Creacion de leyenda para el control GenerarTurno_messagebox_sin_turnos con Idioma: English', N'Alta', 505, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 18:14:45.230' AS DateTime), N'Creacion de leyenda para el control GenerarTurno_messagebox_siguiente_semana con Idioma: Español', N'Alta', 506, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 18:15:06.507' AS DateTime), N'Creacion de leyenda para el control GenerarTurno_messagebox_siguiente_semana con Idioma: English', N'Alta', 507, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-11 18:15:25.283' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 508, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-11 18:16:15.807' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 509, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de turno', CAST(N'2019-11-11 18:16:54.920' AS DateTime), N'Se creo un turno para el paciente con id 7', N'Alta', 510, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de turno', CAST(N'2019-11-11 18:16:55.823' AS DateTime), N'Se creo un turno para el paciente con id 7', N'Alta', 511, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de turno', CAST(N'2019-11-11 18:16:56.220' AS DateTime), N'Se creo un turno para el paciente con id 7', N'Alta', 512, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de turno', CAST(N'2019-11-11 18:16:56.560' AS DateTime), N'Se creo un turno para el paciente con id 7', N'Alta', 513, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de turno', CAST(N'2019-11-11 18:16:56.877' AS DateTime), N'Se creo un turno para el paciente con id 7', N'Alta', 514, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de turno', CAST(N'2019-11-11 18:16:57.257' AS DateTime), N'Se creo un turno para el paciente con id 7', N'Alta', 515, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de turno', CAST(N'2019-11-11 18:16:57.653' AS DateTime), N'Se creo un turno para el paciente con id 7', N'Alta', 516, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de turno', CAST(N'2019-11-11 18:16:58.153' AS DateTime), N'Se creo un turno para el paciente con id 7', N'Alta', 517, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-11 18:19:42.640' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 518, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-11 18:27:08.010' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 519, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 18:28:18.950' AS DateTime), N'Creacion de leyenda para el control Tratamiento_error_fecha_tratamiento con Idioma: Español', N'Alta', 520, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 18:28:44.023' AS DateTime), N'Creacion de leyenda para el control Tratamiento_error_fecha_tratamiento con Idioma: English', N'Alta', 521, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-11 19:54:04.467' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 522, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-11 19:55:04.980' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 523, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-11 19:55:06.517' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 524, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-11 19:55:06.523' AS DateTime), N'Calculo de BFP realizado por el usuario id: 1', N'Alta', 525, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-11 19:55:09.620' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 526, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-11 19:55:12.657' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 527, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-11 19:55:15.493' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 528, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-11 19:55:22.000' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 529, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-11 19:55:22.003' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 530, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-11 19:55:22.003' AS DateTime), N'Calculo de BFP realizado por el usuario id: 1', N'Alta', 531, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Guardar Medicion', CAST(N'2019-11-11 19:55:22.007' AS DateTime), N'Se guardo una nueva medicion para el turno con ID: 7', N'Media', 532, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-11 19:59:15.320' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 533, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-11 20:04:13.903' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 534, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 20:05:01.767' AS DateTime), N'Creacion de leyenda para el control Proyeccion_label_peso_inicial con Idioma: Español', N'Alta', 535, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 20:05:09.313' AS DateTime), N'Creacion de leyenda para el control Proyeccion_label_peso_inicial con Idioma: English', N'Alta', 536, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 20:05:24.400' AS DateTime), N'Creacion de leyenda para el control Proyeccion_label_bfp con Idioma: English', N'Alta', 537, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 20:06:02.063' AS DateTime), N'Error en la creacion de leyenda: Ya existe una leyenda para ese control y ese idioma', N'Alta', 538, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Modificacion de Leyenda', CAST(N'2019-11-11 20:06:04.277' AS DateTime), N'Se modifico la leyenda para el control Proyeccion_label_bfp con ID 541', N'Media', 539, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 20:06:12.877' AS DateTime), N'Creacion de leyenda para el control Proyeccion_label_bfp con Idioma: Español', N'Alta', 540, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 20:06:31.667' AS DateTime), N'Creacion de leyenda para el control Proyeccion_label_bfp_objetivo con Idioma: Español', N'Alta', 541, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 20:06:49.167' AS DateTime), N'Creacion de leyenda para el control Proyeccion_label_bfp_objetivo con Idioma: English', N'Alta', 542, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 20:12:20.390' AS DateTime), N'Creacion de leyenda para el control Proyeccion_error_objetivo con Idioma: English', N'Alta', 543, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 20:12:53.343' AS DateTime), N'Creacion de leyenda para el control Proyeccion_error_objetivo con Idioma: Español', N'Alta', 544, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 20:13:41.640' AS DateTime), N'Creacion de leyenda para el control Proyeccion_error_proyeccion con Idioma: Español', N'Alta', 545, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 20:14:27.140' AS DateTime), N'Creacion de leyenda para el control Proyeccion_error_proyeccion con Idioma: English', N'Alta', 546, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 20:15:25.773' AS DateTime), N'Creacion de leyenda para el control Proyeccion_label_primera_fase con Idioma: Español', N'Alta', 547, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 20:15:35.573' AS DateTime), N'Creacion de leyenda para el control Proyeccion_label_segunda_fase con Idioma: Español', N'Alta', 548, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 20:15:43.913' AS DateTime), N'Creacion de leyenda para el control Proyeccion_label_tercera_fase con Idioma: Español', N'Alta', 549, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 20:15:52.347' AS DateTime), N'Creacion de leyenda para el control Proyeccion_label_cuarta_fase con Idioma: Español', N'Alta', 550, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 20:16:07.883' AS DateTime), N'Creacion de leyenda para el control Proyeccion_label_cuarta_fase con Idioma: English', N'Alta', 551, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 20:16:15.747' AS DateTime), N'Creacion de leyenda para el control Proyeccion_label_tercera_fase con Idioma: English', N'Alta', 552, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 20:16:28.633' AS DateTime), N'Creacion de leyenda para el control Proyeccion_label_segunda_fase con Idioma: English', N'Alta', 553, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 20:16:36.583' AS DateTime), N'Creacion de leyenda para el control Proyeccion_label_primera_fase con Idioma: English', N'Alta', 554, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 20:16:48.973' AS DateTime), N'Creacion de leyenda para el control Proyeccion_button_proyeccion con Idioma: Español', N'Alta', 555, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 20:16:59.260' AS DateTime), N'Creacion de leyenda para el control Proyeccion_button_proyeccion con Idioma: English', N'Alta', 556, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 20:17:10.043' AS DateTime), N'Creacion de leyenda para el control Proyeccion_label_peso_1 con Idioma: English', N'Alta', 557, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 20:17:12.333' AS DateTime), N'Creacion de leyenda para el control Proyeccion_label_peso_2 con Idioma: English', N'Alta', 558, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 20:17:14.587' AS DateTime), N'Creacion de leyenda para el control Proyeccion_label_peso_3 con Idioma: English', N'Alta', 559, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 20:17:16.863' AS DateTime), N'Creacion de leyenda para el control Proyeccion_label_peso_4 con Idioma: English', N'Alta', 560, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 20:17:22.423' AS DateTime), N'Creacion de leyenda para el control Proyeccion_label_peso_4 con Idioma: Español', N'Alta', 561, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 20:17:24.620' AS DateTime), N'Creacion de leyenda para el control Proyeccion_label_peso_3 con Idioma: Español', N'Alta', 562, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 20:17:26.550' AS DateTime), N'Creacion de leyenda para el control Proyeccion_label_peso_2 con Idioma: Español', N'Alta', 563, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 20:17:28.717' AS DateTime), N'Creacion de leyenda para el control Proyeccion_label_peso_1 con Idioma: Español', N'Alta', 564, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 20:17:35.877' AS DateTime), N'Creacion de leyenda para el control Proyeccion_label_dias_1 con Idioma: Español', N'Alta', 565, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 20:17:38.017' AS DateTime), N'Creacion de leyenda para el control Proyeccion_label_dias_2 con Idioma: Español', N'Alta', 566, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 20:17:40.677' AS DateTime), N'Creacion de leyenda para el control Proyeccion_label_dias_3 con Idioma: Español', N'Alta', 567, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 20:17:42.957' AS DateTime), N'Creacion de leyenda para el control Proyeccion_label_dias_4 con Idioma: Español', N'Alta', 568, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 20:18:03.143' AS DateTime), N'Creacion de leyenda para el control Proyeccion_label_dias_4 con Idioma: English', N'Alta', 569, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 20:18:05.440' AS DateTime), N'Creacion de leyenda para el control Proyeccion_label_dias_3 con Idioma: English', N'Alta', 570, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 20:18:07.410' AS DateTime), N'Creacion de leyenda para el control Proyeccion_label_dias_2 con Idioma: English', N'Alta', 571, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 20:18:09.960' AS DateTime), N'Creacion de leyenda para el control Proyeccion_label_dias_1 con Idioma: English', N'Alta', 572, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 20:18:39.027' AS DateTime), N'Creacion de leyenda para el control Proyeccion_label_eje_y con Idioma: English', N'Alta', 573, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 20:18:48.843' AS DateTime), N'Creacion de leyenda para el control Proyeccion_label_eje_y con Idioma: Español', N'Alta', 574, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 20:19:11.957' AS DateTime), N'Creacion de leyenda para el control Proyeccion_label_eje_x con Idioma: English', N'Alta', 575, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 20:19:21.837' AS DateTime), N'Creacion de leyenda para el control Proyeccion_label_eje_x con Idioma: Español', N'Alta', 576, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-11 20:22:06.563' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 577, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-11 20:24:30.963' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 578, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-11 20:24:31.513' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 579, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-11 20:24:31.513' AS DateTime), N'Calculo de BFP realizado por el usuario id: 1', N'Alta', 580, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-11 20:24:32.003' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 581, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-11 20:24:32.003' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 582, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-11 20:24:32.003' AS DateTime), N'Calculo de BFP realizado por el usuario id: 1', N'Alta', 583, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Guardar Medicion', CAST(N'2019-11-11 20:24:32.007' AS DateTime), N'Se guardo una nueva medicion para el turno con ID: 7', N'Media', 584, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-11 20:29:59.887' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 585, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de turno', CAST(N'2019-11-11 20:30:56.277' AS DateTime), N'Se creo un turno para el paciente con id 3', N'Alta', 586, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-11 20:46:33.420' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 587, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 20:47:05.907' AS DateTime), N'Creacion de leyenda para el control AgregarDieta_error_calculo_calorias_diarias con Idioma: Español', N'Alta', 588, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 20:47:20.150' AS DateTime), N'Creacion de leyenda para el control AgregarDieta_error_calculo_calorias_diarias con Idioma: English', N'Alta', 589, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 20:49:18.640' AS DateTime), N'Creacion de leyenda para el control AgregarDieta_error_dieta_automatica con Idioma: English', N'Alta', 590, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 20:49:32.433' AS DateTime), N'Creacion de leyenda para el control AgregarDieta_error_dieta_automatica con Idioma: Español', N'Alta', 591, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 20:53:13.033' AS DateTime), N'Creacion de leyenda para el control AgregarDieta_error_obtener_dietas con Idioma: Español', N'Alta', 592, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 20:53:25.987' AS DateTime), N'Creacion de leyenda para el control AgregarDieta_error_obtener_dietas con Idioma: English', N'Alta', 593, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 21:02:37.553' AS DateTime), N'Creacion de leyenda para el control Plato_error_busqueda con Idioma: English', N'Alta', 594, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 21:02:50.903' AS DateTime), N'Creacion de leyenda para el control Plato_error_busqueda con Idioma: Español', N'Alta', 595, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 21:06:07.560' AS DateTime), N'Creacion de leyenda para el control AgregarDieta_error_guardado con Idioma: Español', N'Alta', 596, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 21:06:37.130' AS DateTime), N'Creacion de leyenda para el control AgregarDieta_error_guardado con Idioma: English', N'Alta', 597, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 21:09:52.610' AS DateTime), N'Creacion de leyenda para el control AgregarDieta_error_invalida con Idioma: English', N'Alta', 598, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 21:10:16.077' AS DateTime), N'Creacion de leyenda para el control AgregarDieta_error_invalida con Idioma: Español', N'Alta', 599, 1)
GO
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-11 21:14:23.023' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 600, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-11 21:17:01.347' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 601, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-11 21:17:02.150' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 602, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-11 21:17:02.150' AS DateTime), N'Calculo de BFP realizado por el usuario id: 1', N'Alta', 603, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-11 21:17:04.307' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 604, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-11 21:17:04.307' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 605, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-11 21:17:04.310' AS DateTime), N'Calculo de BFP realizado por el usuario id: 1', N'Alta', 606, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Guardar Medicion', CAST(N'2019-11-11 21:17:04.313' AS DateTime), N'Se guardo una nueva medicion para el turno con ID: 10', N'Media', 607, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo Dieta Automatica', CAST(N'2019-11-11 21:17:08.560' AS DateTime), N'Se produjo un calculo de dieta para adelgazar', N'Baja', 608, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo Dieta Automatica', CAST(N'2019-11-11 21:17:42.103' AS DateTime), N'Se produjo un calculo de dieta para adelgazar', N'Baja', 609, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Dieta Creada', CAST(N'2019-11-11 21:17:53.943' AS DateTime), N'Se creo una nueva dieta', N'Baja', 610, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-11 21:56:52.937' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 611, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 21:58:02.403' AS DateTime), N'Creacion de leyenda para el control Dieta_error_busqueda con Idioma: Español', N'Alta', 612, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 21:58:31.287' AS DateTime), N'Creacion de leyenda para el control Dieta_error_busqueda con Idioma: English', N'Alta', 613, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 22:01:25.710' AS DateTime), N'Creacion de leyenda para el control Tratamiento_error_finalizar con Idioma: Español', N'Alta', 614, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 22:01:45.927' AS DateTime), N'Creacion de leyenda para el control Tratamiento_error_finalizar con Idioma: English', N'Alta', 615, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 22:03:45.233' AS DateTime), N'Creacion de leyenda para el control Tratamiento_error_guardar con Idioma: Español', N'Alta', 616, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 22:04:19.430' AS DateTime), N'Creacion de leyenda para el control Tratamiento_error_guardar con Idioma: English', N'Alta', 617, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 22:42:15.947' AS DateTime), N'Creacion de leyenda para el control Rutina_error_guardar con Idioma: Español', N'Alta', 618, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 22:42:37.193' AS DateTime), N'Creacion de leyenda para el control Rutina_error_guardar con Idioma: English', N'Alta', 619, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 22:43:57.003' AS DateTime), N'Creacion de leyenda para el control Rutina_error_buscar_dias con Idioma: Español', N'Alta', 620, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 22:44:19.907' AS DateTime), N'Creacion de leyenda para el control Rutina_error_buscar_dias con Idioma: English', N'Alta', 621, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 22:48:21.537' AS DateTime), N'Creacion de leyenda para el control Rutina_error_calcular_calorias con Idioma: English', N'Alta', 622, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 22:48:35.597' AS DateTime), N'Creacion de leyenda para el control Rutina_error_calcular_calorias con Idioma: Español', N'Alta', 623, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 22:57:47.377' AS DateTime), N'Creacion de leyenda para el control Rutina_error_busqueda con Idioma: Español', N'Alta', 624, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 22:57:50.383' AS DateTime), N'Creacion de leyenda para el control Rutina_error_busqueda con Idioma: English', N'Alta', 625, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 22:58:20.020' AS DateTime), N'Error en la creacion de leyenda: Ya existe una leyenda para ese control y ese idioma', N'Alta', 626, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Modificacion de Leyenda', CAST(N'2019-11-11 22:58:22.783' AS DateTime), N'Se modifico la leyenda para el control Rutina_error_busqueda con ID 604', N'Media', 627, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 23:06:33.010' AS DateTime), N'Creacion de leyenda para el control Tratamiento_error_asociar con Idioma: Español', N'Alta', 628, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 23:07:30.063' AS DateTime), N'Creacion de leyenda para el control Tratamiento_error_asociar con Idioma: English', N'Alta', 629, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 23:25:18.193' AS DateTime), N'Creacion de leyenda para el control Alimento_error_agregar con Idioma: English', N'Alta', 630, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 23:25:44.837' AS DateTime), N'Creacion de leyenda para el control Alimento_error_agregar con Idioma: Español', N'Alta', 631, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 23:27:19.847' AS DateTime), N'Creacion de leyenda para el control Alimento_error_buscar con Idioma: Español', N'Alta', 632, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 23:27:39.660' AS DateTime), N'Creacion de leyenda para el control Alimento_error_buscar con Idioma: English', N'Alta', 633, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 23:30:01.553' AS DateTime), N'Creacion de leyenda para el control Alimento_error_plato_buscar con Idioma: English', N'Alta', 634, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 23:30:23.990' AS DateTime), N'Creacion de leyenda para el control Alimento_error_plato_buscar con Idioma: Español', N'Alta', 635, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 23:32:58.003' AS DateTime), N'Creacion de leyenda para el control Plato_error_agregado con Idioma: Español', N'Alta', 636, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 23:33:20.040' AS DateTime), N'Creacion de leyenda para el control Plato_error_agregado con Idioma: English', N'Alta', 637, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 23:41:42.230' AS DateTime), N'Creacion de leyenda para el control Plato_error_calculo_calorias con Idioma: English', N'Alta', 638, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 23:41:52.250' AS DateTime), N'Creacion de leyenda para el control Plato_error_calculo_calorias con Idioma: Español', N'Alta', 639, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 23:45:27.783' AS DateTime), N'Creacion de leyenda para el control AgregarDieta_error_calculo_calorias con Idioma: Español', N'Alta', 640, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 23:45:41.907' AS DateTime), N'Creacion de leyenda para el control AgregarDieta_error_calculo_calorias con Idioma: English', N'Alta', 641, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 23:47:18.557' AS DateTime), N'Creacion de leyenda para el control Alimentos_messagebox_dieta_creada con Idioma: Español', N'Alta', 642, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 23:47:27.637' AS DateTime), N'Creacion de leyenda para el control Alimentos_messagebox_dieta_creada con Idioma: English', N'Alta', 643, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 23:48:06.623' AS DateTime), N'Creacion de leyenda para el control Alimentos_messagebox_insert_name con Idioma: Español', N'Alta', 644, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-11 23:48:15.073' AS DateTime), N'Creacion de leyenda para el control Alimentos_messagebox_insert_name con Idioma: English', N'Alta', 645, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-11 23:52:15.820' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 646, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-11 23:57:18.083' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 647, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-11 23:58:26.287' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 648, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 00:03:02.973' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 649, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-12 00:04:02.990' AS DateTime), N'Creacion de leyenda para el control Alimentos_messagebox_verificar con Idioma: Español', N'Alta', 650, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-12 00:04:24.310' AS DateTime), N'Creacion de leyenda para el control Alimentos_messagebox_verificar con Idioma: English', N'Alta', 651, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 00:04:40.327' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 652, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 00:26:10.443' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 653, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 00:28:23.983' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 654, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-12 00:29:17.713' AS DateTime), N'Creacion de leyenda para el control Error_messagebox_verifique_datos con Idioma: Español', N'Alta', 655, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-12 00:29:41.983' AS DateTime), N'Creacion de leyenda para el control Error_messagebox_verifique_datos con Idioma: English', N'Alta', 656, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 00:35:34.003' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 657, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-12 00:38:38.290' AS DateTime), N'Creacion de leyenda para el control GenerarTurno_messagebox_creado con Idioma: Español', N'Alta', 658, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-12 00:38:48.747' AS DateTime), N'Creacion de leyenda para el control GenerarTurno_messagebox_creado con Idioma: English', N'Alta', 659, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 00:40:05.920' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 660, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Paciente', CAST(N'2019-11-12 00:40:24.397' AS DateTime), N'Se produjo un error al crear un paciente Ocurrio un error al interactuar con la base de datos', N'Alta', 661, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de turno', CAST(N'2019-11-12 00:40:58.563' AS DateTime), N'Se creo un turno para el paciente con id 1', N'Alta', 662, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 00:41:30.323' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 663, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de turno', CAST(N'2019-11-12 00:42:36.233' AS DateTime), N'Se creo un turno para el paciente con id 1', N'Alta', 664, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 00:54:05.610' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 665, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Rol', CAST(N'2019-11-12 01:07:43.780' AS DateTime), N'Se creo el rol GE102', N'Alta', 666, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Rol', CAST(N'2019-11-12 01:07:59.680' AS DateTime), N'Se creo el rol GE111', N'Alta', 667, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Rol', CAST(N'2019-11-12 01:08:42.147' AS DateTime), N'Se creo el rol OP007', N'Alta', 668, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Eliminacion de Rol', CAST(N'2019-11-12 01:11:06.940' AS DateTime), N'Se elimino el rol OP006', N'Alta', 669, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Eliminacion de Rol', CAST(N'2019-11-12 01:13:23.510' AS DateTime), N'Se elimino el rol OP013', N'Alta', 670, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Eliminacion de Rol', CAST(N'2019-11-12 01:13:32.300' AS DateTime), N'Se elimino el rol OP014', N'Alta', 671, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Eliminacion de Rol', CAST(N'2019-11-12 01:13:43.393' AS DateTime), N'Se elimino el rol OP010', N'Alta', 672, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Eliminacion de Rol', CAST(N'2019-11-12 01:14:33.173' AS DateTime), N'Se elimino el rol OP023', N'Alta', 673, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Eliminacion de Rol', CAST(N'2019-11-12 01:14:41.187' AS DateTime), N'Se elimino el rol OP018', N'Alta', 674, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Rol', CAST(N'2019-11-12 01:15:38.293' AS DateTime), N'Se creo el rol OP025', N'Alta', 675, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Eliminacion de Rol', CAST(N'2019-11-12 01:17:18.260' AS DateTime), N'Se elimino el rol OP017', N'Alta', 676, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Eliminacion de Rol', CAST(N'2019-11-12 01:17:25.320' AS DateTime), N'Se elimino el rol OP009', N'Alta', 677, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Eliminacion de Rol', CAST(N'2019-11-12 01:20:01.580' AS DateTime), N'Se elimino el rol OP024', N'Alta', 678, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Rol', CAST(N'2019-11-12 01:21:12.567' AS DateTime), N'Se creo el rol OP026', N'Alta', 679, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Rol', CAST(N'2019-11-12 01:28:31.237' AS DateTime), N'Se creo el rol OP043', N'Alta', 680, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Rol', CAST(N'2019-11-12 01:29:45.877' AS DateTime), N'Se creo el rol OP044', N'Alta', 681, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Rol', CAST(N'2019-11-12 01:34:14.333' AS DateTime), N'Se creo el rol GE111', N'Alta', 682, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Rol', CAST(N'2019-11-12 01:34:38.780' AS DateTime), N'Se creo el rol OP046', N'Alta', 683, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Rol', CAST(N'2019-11-12 01:35:23.297' AS DateTime), N'Se creo el rol OP047', N'Alta', 684, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Rol', CAST(N'2019-11-12 01:37:38.543' AS DateTime), N'Se creo el rol GE112', N'Alta', 685, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Eliminacion de Rol', CAST(N'2019-11-12 01:38:09.920' AS DateTime), N'Se elimino el rol GE112', N'Alta', 686, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Rol', CAST(N'2019-11-12 01:38:14.317' AS DateTime), N'Se creo el rol GE112', N'Alta', 687, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Rol', CAST(N'2019-11-12 01:38:29.223' AS DateTime), N'Se creo el rol OP50', N'Alta', 688, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Eliminacion de Rol', CAST(N'2019-11-12 01:38:35.453' AS DateTime), N'Se elimino el rol OP50', N'Alta', 689, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Rol', CAST(N'2019-11-12 01:38:42.317' AS DateTime), N'Se creo el rol OP050', N'Alta', 690, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Rol', CAST(N'2019-11-12 01:38:55.593' AS DateTime), N'Se creo el rol OP051', N'Alta', 691, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Eliminacion de Rol', CAST(N'2019-11-12 01:39:36.283' AS DateTime), N'Se elimino el rol GE112', N'Alta', 692, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 01:54:24.553' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 693, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 01:56:53.483' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 694, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 01:57:28.847' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 695, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 01:59:11.880' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 696, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Cambio de Password', CAST(N'2019-11-12 01:59:45.370' AS DateTime), N'Se cambio la password del usuario crisnieto', N'Media', 697, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Logout de Usuario', CAST(N'2019-11-12 01:59:48.877' AS DateTime), N'Se detectó un logout', N'Baja', 698, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 01:59:53.807' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 699, 6)
GO
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Logout de Usuario', CAST(N'2019-11-12 02:01:22.587' AS DateTime), N'Se detectó un logout', N'Baja', 700, 6)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 02:01:32.377' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 701, 6)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Logout de Usuario', CAST(N'2019-11-12 02:02:13.497' AS DateTime), N'Se detectó un logout', N'Baja', 702, 6)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 02:02:19.133' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 703, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 02:02:31.193' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 704, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 02:02:45.400' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 705, 6)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 02:05:04.517' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 706, 6)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 02:06:56.137' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 707, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Logout de Usuario', CAST(N'2019-11-12 02:07:39.583' AS DateTime), N'Se detectó un logout', N'Baja', 708, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 02:07:45.420' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 709, 6)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Logout de Usuario', CAST(N'2019-11-12 02:08:16.580' AS DateTime), N'Se detectó un logout', N'Baja', 710, 6)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 02:08:26.200' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 711, 6)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 02:10:25.127' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 712, 6)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 02:11:07.470' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 713, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Logout de Usuario', CAST(N'2019-11-12 02:11:10.037' AS DateTime), N'Se detectó un logout', N'Baja', 714, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 02:12:26.840' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 715, 6)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Cambio de Password', CAST(N'2019-11-12 02:12:42.687' AS DateTime), N'Se cambio la password del usuario crisnieto', N'Media', 716, 6)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 02:13:34.917' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 717, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-12 02:14:37.673' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 718, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-12 02:14:38.217' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 719, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-12 02:14:38.220' AS DateTime), N'Calculo de BFP realizado por el usuario id: 1', N'Alta', 720, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 02:15:30.550' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 721, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Nutricionista', CAST(N'2019-11-12 02:16:23.000' AS DateTime), N'Se creo el nutricionista con usuario: sinpermiso', N'Media', 722, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Logout de Usuario', CAST(N'2019-11-12 02:16:27.670' AS DateTime), N'Se detectó un logout', N'Baja', 723, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 02:16:33.897' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 724, 36)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Logout de Usuario', CAST(N'2019-11-12 02:16:38.377' AS DateTime), N'Se detectó un logout', N'Baja', 725, 36)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 02:16:44.443' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 726, 36)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Logout de Usuario', CAST(N'2019-11-12 02:16:46.523' AS DateTime), N'Se detectó un logout', N'Baja', 727, 36)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 02:16:57.287' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 728, 36)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Logout de Usuario', CAST(N'2019-11-12 02:17:05.190' AS DateTime), N'Se detectó un logout', N'Baja', 729, 36)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 02:17:14.097' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 730, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 02:20:22.787' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 731, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Asociacion de Rol', CAST(N'2019-11-12 02:21:23.800' AS DateTime), N'Error al asociar el rol GE100 del usuario test', N'Baja', 732, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 02:42:51.570' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 733, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 02:44:06.553' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 734, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 02:52:48.330' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 735, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 02:54:59.613' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 736, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 02:57:14.173' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 737, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 02:59:20.603' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 738, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 03:09:40.940' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 739, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Finalizar Tratamiento', CAST(N'2019-11-12 03:10:22.497' AS DateTime), N'Se finalizo el tratamiento con id: 7', N'Media', 740, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-12 03:10:41.943' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 741, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-12 03:10:42.750' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 742, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-12 03:10:42.753' AS DateTime), N'Calculo de BFP realizado por el usuario id: 1', N'Alta', 743, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-12 03:10:44.010' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 744, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-12 03:10:44.010' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 745, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-12 03:10:44.010' AS DateTime), N'Calculo de BFP realizado por el usuario id: 1', N'Alta', 746, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Guardar Medicion', CAST(N'2019-11-12 03:10:44.013' AS DateTime), N'Se guardo una nueva medicion para el turno con ID: 10', N'Media', 747, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo Dieta Automatica', CAST(N'2019-11-12 03:10:47.490' AS DateTime), N'Se produjo un calculo de dieta para adelgazar', N'Baja', 748, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Dieta Creada', CAST(N'2019-11-12 03:10:50.683' AS DateTime), N'Se creo una nueva dieta', N'Baja', 749, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 03:15:24.890' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 750, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 03:19:01.253' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 751, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-12 03:19:17.760' AS DateTime), N'Creacion de leyenda para el control TratamientoActual_button_guardar_resumen con Idioma: Español', N'Alta', 752, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-12 03:19:26.410' AS DateTime), N'Creacion de leyenda para el control TratamientoActual_button_guardar_resumen con Idioma: English', N'Alta', 753, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Proyeccion de peso', CAST(N'2019-11-12 03:19:53.897' AS DateTime), N'Se solicito una nueva proyeccion de peso', N'Media', 754, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 03:22:05.323' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 755, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Finalizar Tratamiento', CAST(N'2019-11-12 03:22:47.893' AS DateTime), N'Se finalizo el tratamiento con id: 8', N'Media', 756, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-12 03:23:00.983' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 757, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-12 03:23:01.557' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 758, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-12 03:23:01.560' AS DateTime), N'Calculo de BFP realizado por el usuario id: 1', N'Alta', 759, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-12 03:23:02.690' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 760, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-12 03:23:02.690' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 761, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-12 03:23:02.690' AS DateTime), N'Calculo de BFP realizado por el usuario id: 1', N'Alta', 762, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Guardar Medicion', CAST(N'2019-11-12 03:23:02.693' AS DateTime), N'Se guardo una nueva medicion para el turno con ID: 10', N'Media', 763, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo Dieta Automatica', CAST(N'2019-11-12 03:23:08.370' AS DateTime), N'Se produjo un calculo de dieta para engordar', N'Baja', 764, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Agregar Plato', CAST(N'2019-11-12 03:25:25.427' AS DateTime), N'Se agrego correctamente un nuevo plato: Omelette de Huevo', N'Alta', 765, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Agregar Alimento', CAST(N'2019-11-12 03:28:34.857' AS DateTime), N'Se agrego un nuevo alimento: Panceta', N'Media', 766, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Agregar Plato', CAST(N'2019-11-12 03:29:19.653' AS DateTime), N'Se agrego correctamente un nuevo plato: Huevos revueltos con Panceta', N'Alta', 767, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo Dieta Automatica', CAST(N'2019-11-12 03:29:27.153' AS DateTime), N'Se produjo un calculo de dieta para mantener peso', N'Baja', 768, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Agregar Plato', CAST(N'2019-11-12 03:31:02.847' AS DateTime), N'Se agrego correctamente un nuevo plato: Sandwich Simple de Jamon y Queso', N'Alta', 769, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo Dieta Automatica', CAST(N'2019-11-12 03:31:08.033' AS DateTime), N'Se produjo un calculo de dieta para mantener peso', N'Baja', 770, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo Dieta Automatica', CAST(N'2019-11-12 03:31:30.020' AS DateTime), N'Se produjo un calculo de dieta para engordar', N'Baja', 771, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Agregar Alimento', CAST(N'2019-11-12 03:33:08.873' AS DateTime), N'Se agrego un nuevo alimento: Banana Deshidratada', N'Media', 772, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Agregar Plato', CAST(N'2019-11-12 03:33:49.600' AS DateTime), N'Se agrego correctamente un nuevo plato: Porcion Chica de Almendras y Banan Deshidratada', N'Alta', 773, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo Dieta Automatica', CAST(N'2019-11-12 03:33:55.810' AS DateTime), N'Se produjo un calculo de dieta para engordar', N'Baja', 774, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo Dieta Automatica', CAST(N'2019-11-12 03:34:07.940' AS DateTime), N'Se produjo un calculo de dieta para mantener peso', N'Baja', 775, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Agregar Alimento', CAST(N'2019-11-12 03:35:13.557' AS DateTime), N'Se agrego un nuevo alimento: Vacio', N'Media', 776, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Agregar Alimento', CAST(N'2019-11-12 03:35:59.773' AS DateTime), N'Se agrego un nuevo alimento: Pure de Papas', N'Media', 777, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Agregar Plato', CAST(N'2019-11-12 03:37:53.223' AS DateTime), N'Se agrego correctamente un nuevo plato: Vacio con Pure de Papas y Cebolla Condimentado', N'Alta', 778, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo Dieta Automatica', CAST(N'2019-11-12 03:38:25.250' AS DateTime), N'Se produjo un calculo de dieta para mantener peso', N'Baja', 779, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo Dieta Automatica', CAST(N'2019-11-12 03:38:42.903' AS DateTime), N'Se produjo un calculo de dieta para mantener peso', N'Baja', 780, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo Dieta Automatica', CAST(N'2019-11-12 03:39:12.410' AS DateTime), N'Se produjo un calculo de dieta para mantener peso', N'Baja', 781, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Agregar Plato', CAST(N'2019-11-12 03:40:23.867' AS DateTime), N'Se agrego correctamente un nuevo plato: Bife con Pure', N'Alta', 782, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo Dieta Automatica', CAST(N'2019-11-12 03:40:26.327' AS DateTime), N'Se produjo un calculo de dieta para mantener peso', N'Baja', 783, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Agregar Plato', CAST(N'2019-11-12 03:42:14.643' AS DateTime), N'Se agrego correctamente un nuevo plato: Seis Canelones de Espinaca', N'Alta', 784, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo Dieta Automatica', CAST(N'2019-11-12 03:42:18.070' AS DateTime), N'Se produjo un calculo de dieta para mantener peso', N'Baja', 785, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo Dieta Automatica', CAST(N'2019-11-12 03:42:36.667' AS DateTime), N'Se produjo un calculo de dieta para engordar', N'Baja', 786, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Agregar Plato', CAST(N'2019-11-12 03:44:11.610' AS DateTime), N'Se agrego correctamente un nuevo plato: Yogur con Frutas', N'Alta', 787, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo Dieta Automatica', CAST(N'2019-11-12 03:44:13.710' AS DateTime), N'Se produjo un calculo de dieta para engordar', N'Baja', 788, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo Dieta Automatica', CAST(N'2019-11-12 03:44:26.873' AS DateTime), N'Se produjo un calculo de dieta para engordar', N'Baja', 789, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo Dieta Automatica', CAST(N'2019-11-12 03:44:41.197' AS DateTime), N'Se produjo un calculo de dieta para mantener peso', N'Baja', 790, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo Dieta Automatica', CAST(N'2019-11-12 03:46:06.887' AS DateTime), N'Se produjo un calculo de dieta para mantener peso', N'Baja', 791, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo Dieta Automatica', CAST(N'2019-11-12 03:46:14.830' AS DateTime), N'Se produjo un calculo de dieta para mantener peso', N'Baja', 792, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo Dieta Automatica', CAST(N'2019-11-12 03:46:39.060' AS DateTime), N'Se produjo un calculo de dieta para mantener peso', N'Baja', 793, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 03:47:50.237' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 794, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-12 03:48:12.623' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 795, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-12 03:48:13.130' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 796, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-12 03:48:13.133' AS DateTime), N'Calculo de BFP realizado por el usuario id: 1', N'Alta', 797, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-12 03:48:13.760' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 798, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-12 03:48:13.760' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 799, 1)
GO
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-12 03:48:13.763' AS DateTime), N'Calculo de BFP realizado por el usuario id: 1', N'Alta', 800, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Guardar Medicion', CAST(N'2019-11-12 03:48:13.763' AS DateTime), N'Se guardo una nueva medicion para el turno con ID: 10', N'Media', 801, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo Dieta Automatica', CAST(N'2019-11-12 03:48:19.830' AS DateTime), N'Se produjo un calculo de dieta para adelgazar', N'Baja', 802, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo Dieta Automatica', CAST(N'2019-11-12 03:48:26.740' AS DateTime), N'Se produjo un calculo de dieta para mantener peso', N'Baja', 803, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo Dieta Automatica', CAST(N'2019-11-12 03:48:37.130' AS DateTime), N'Se produjo un calculo de dieta para engordar', N'Baja', 804, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo Dieta Automatica', CAST(N'2019-11-12 03:48:52.810' AS DateTime), N'Se produjo un calculo de dieta para engordar', N'Baja', 805, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo Dieta Automatica', CAST(N'2019-11-12 03:49:14.840' AS DateTime), N'Se produjo un calculo de dieta para engordar', N'Baja', 806, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo Dieta Automatica', CAST(N'2019-11-12 03:49:17.027' AS DateTime), N'Se produjo un calculo de dieta para mantener peso', N'Baja', 807, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Agregar Plato', CAST(N'2019-11-12 03:52:32.023' AS DateTime), N'Se agrego correctamente un nuevo plato: Sandwich con Huevo y Leche', N'Alta', 808, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo Dieta Automatica', CAST(N'2019-11-12 03:52:42.303' AS DateTime), N'Se produjo un calculo de dieta para engordar', N'Baja', 809, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Obtener Ejercicios', CAST(N'2019-11-12 03:55:49.417' AS DateTime), N'Se guardo un nuevo ejercicio: Paddle', N'Baja', 810, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Obtener Ejercicios', CAST(N'2019-11-12 03:56:49.093' AS DateTime), N'Se guardo un nuevo ejercicio: Zumba', N'Baja', 811, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Obtener Ejercicios', CAST(N'2019-11-12 03:57:30.047' AS DateTime), N'Se guardo un nuevo ejercicio: Crossfit', N'Baja', 812, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Obtener Ejercicios', CAST(N'2019-11-12 03:58:23.367' AS DateTime), N'Se guardo un nuevo ejercicio: Spinning', N'Baja', 813, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Agregar Rutina', CAST(N'2019-11-12 03:59:14.800' AS DateTime), N'Se produjo un error al guardar una rutina: Ocurrio un error al interactuar con la base de datos', N'Alta', 814, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 04:01:50.443' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 815, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Agregar Rutina', CAST(N'2019-11-12 04:02:29.677' AS DateTime), N'Se produjo un error al guardar una rutina: Ocurrio un error al interactuar con la base de datos', N'Alta', 816, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Agregar Rutina', CAST(N'2019-11-12 04:02:47.420' AS DateTime), N'Se produjo un error al guardar una rutina: Ocurrio un error al interactuar con la base de datos', N'Alta', 817, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Agregar Rutina', CAST(N'2019-11-12 04:03:12.317' AS DateTime), N'Se produjo un error al guardar una rutina: Ocurrio un error al interactuar con la base de datos', N'Alta', 818, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 04:16:50.313' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 819, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Agregar Rutina', CAST(N'2019-11-12 04:17:48.083' AS DateTime), N'Se produjo un error al guardar una rutina: Must declare the scalar variable "@NOMBRE".', N'Alta', 820, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Agregar Rutina', CAST(N'2019-11-12 04:18:23.570' AS DateTime), N'Se produjo un error al guardar una rutina: Must declare the scalar variable "@NOMBRE".', N'Alta', 821, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Agregar Rutina', CAST(N'2019-11-12 04:20:09.683' AS DateTime), N'Se produjo un error al guardar una rutina: Ocurrio un error al interactuar con la base de datos', N'Alta', 822, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Agregar Rutina', CAST(N'2019-11-12 04:20:22.527' AS DateTime), N'Se produjo un error al guardar una rutina: Ocurrio un error al interactuar con la base de datos', N'Alta', 823, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Agregar Rutina', CAST(N'2019-11-12 04:20:46.183' AS DateTime), N'Se produjo un error al guardar una rutina: Ocurrio un error al interactuar con la base de datos', N'Alta', 824, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 04:22:02.100' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 825, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Agregar Rutina', CAST(N'2019-11-12 04:22:35.990' AS DateTime), N'Se agrego una nueva rutina: Rutina Intensa Cardiovascular', N'Media', 826, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Obtener Rutina', CAST(N'2019-11-12 04:22:46.207' AS DateTime), N'Se produjo un error al intentar obtener todas la rutinas: Specified cast is not valid.', N'Alta', 827, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 04:30:30.717' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 828, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Agregar Rutina', CAST(N'2019-11-12 04:35:06.960' AS DateTime), N'Se agrego una nueva rutina: Intensiva', N'Media', 829, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Agregar Rutina', CAST(N'2019-11-12 04:35:59.303' AS DateTime), N'Se agrego una nueva rutina: Intensiva', N'Media', 830, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Agregar Rutina', CAST(N'2019-11-12 04:37:17.120' AS DateTime), N'Se agrego una nueva rutina: Liviana', N'Media', 831, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-12 04:38:02.733' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 832, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-12 04:38:04.070' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 833, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-12 04:38:04.070' AS DateTime), N'Calculo de BFP realizado por el usuario id: 1', N'Alta', 834, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-12 04:38:04.607' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 835, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-12 04:38:04.607' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 836, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-12 04:38:04.607' AS DateTime), N'Calculo de BFP realizado por el usuario id: 1', N'Alta', 837, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Guardar Medicion', CAST(N'2019-11-12 04:38:04.610' AS DateTime), N'Se guardo una nueva medicion para el turno con ID: 10', N'Media', 838, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo Dieta Automatica', CAST(N'2019-11-12 04:38:08.430' AS DateTime), N'Se produjo un calculo de dieta para adelgazar', N'Baja', 839, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Dieta Creada', CAST(N'2019-11-12 04:38:12.220' AS DateTime), N'Se creo una nueva dieta', N'Baja', 840, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 11:06:41.373' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 841, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 11:08:27.017' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 842, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 11:11:35.717' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 843, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de turno', CAST(N'2019-11-12 11:11:53.780' AS DateTime), N'Se creo un turno para el paciente con id 1', N'Alta', 844, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 11:13:59.473' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 845, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 11:20:33.783' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 846, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 11:22:27.720' AS DateTime), N'Se detecto un login incorrecto', N'Media', 847, NULL)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 11:22:27.750' AS DateTime), N'Ocurrio un error en el login de usuario No se pudo loguear correctamente', N'Media', 848, NULL)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 11:22:35.470' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 849, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de turno', CAST(N'2019-11-12 11:22:48.837' AS DateTime), N'Se creo un turno para el paciente con id 1', N'Alta', 850, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 11:23:50.000' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 851, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 11:25:20.337' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 852, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de turno', CAST(N'2019-11-12 11:26:00.787' AS DateTime), N'Se creo un turno para el paciente con id 1', N'Alta', 853, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 11:29:16.410' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 854, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-12 11:29:49.227' AS DateTime), N'Creacion de leyenda para el control AgregarTurno_error_eliminado con Idioma: Español', N'Alta', 855, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-12 11:30:03.510' AS DateTime), N'Creacion de leyenda para el control AgregarTurno_error_eliminado con Idioma: English', N'Alta', 856, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 11:30:35.800' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 857, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Nutricionista', CAST(N'2019-11-12 11:32:07.810' AS DateTime), N'Se creo el nutricionista con usuario: nutricionista', N'Media', 858, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Asociacion de Rol', CAST(N'2019-11-12 11:32:38.507' AS DateTime), N'Se asocio el rol AA099 del usuario nutricionista', N'Media', 859, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Asociacion de Rol', CAST(N'2019-11-12 11:32:44.380' AS DateTime), N'Se asocio el rol GE107 del usuario nutricionista', N'Media', 860, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Asociacion de Rol', CAST(N'2019-11-12 11:32:50.007' AS DateTime), N'Se asocio el rol GE103 del usuario nutricionista', N'Media', 861, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Asociacion de Rol', CAST(N'2019-11-12 11:32:54.310' AS DateTime), N'Se asocio el rol GE101 del usuario nutricionista', N'Media', 862, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Asociacion de Rol', CAST(N'2019-11-12 11:32:58.853' AS DateTime), N'Se asocio el rol GE100 del usuario nutricionista', N'Media', 863, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Asociacion de Rol', CAST(N'2019-11-12 11:33:03.403' AS DateTime), N'Se asocio el rol GE110 del usuario nutricionista', N'Media', 864, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Logout de Usuario', CAST(N'2019-11-12 11:33:22.310' AS DateTime), N'Se detectó un logout', N'Baja', 865, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 11:33:42.347' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 866, 37)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de turno', CAST(N'2019-11-12 11:34:53.480' AS DateTime), N'Se creo un turno para el paciente con id 3', N'Alta', 867, 37)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Logout de Usuario', CAST(N'2019-11-12 11:40:35.497' AS DateTime), N'Se detectó un logout', N'Baja', 868, 37)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 11:40:41.037' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 869, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Logout de Usuario', CAST(N'2019-11-12 11:41:51.430' AS DateTime), N'Se detectó un logout', N'Baja', 870, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 11:42:02.993' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 871, 37)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Logout de Usuario', CAST(N'2019-11-12 11:42:28.187' AS DateTime), N'Se detectó un logout', N'Baja', 872, 37)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 11:42:34.133' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 873, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 11:47:36.147' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 874, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-12 11:48:23.813' AS DateTime), N'Creacion de leyenda para el control Plato_error_indique_tipo con Idioma: Español', N'Alta', 875, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-12 11:48:44.897' AS DateTime), N'Creacion de leyenda para el control Plato_error_indique_tipo con Idioma: English', N'Alta', 876, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 11:56:57.573' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 877, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Paciente', CAST(N'2019-11-12 12:00:51.843' AS DateTime), N'Se creo el paciente con DNI 39798434', N'Media', 878, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Paciente', CAST(N'2019-11-12 12:10:44.113' AS DateTime), N'Se creo el paciente con DNI 384623563', N'Media', 879, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de turno', CAST(N'2019-11-12 12:11:11.097' AS DateTime), N'Se creo un turno para el paciente con id 12', N'Alta', 880, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-12 12:16:07.333' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 881, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-12 12:16:59.940' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 882, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-12 12:16:59.940' AS DateTime), N'Calculo de BFP realizado por el usuario id: 1', N'Alta', 883, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-12 12:20:44.553' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 884, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-12 12:20:44.553' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 885, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-12 12:20:44.557' AS DateTime), N'Calculo de BFP realizado por el usuario id: 1', N'Alta', 886, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Guardar Medicion', CAST(N'2019-11-12 12:20:44.557' AS DateTime), N'Se guardo una nueva medicion para el turno con ID: 31', N'Media', 887, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo Dieta Automatica', CAST(N'2019-11-12 12:23:56.020' AS DateTime), N'Se produjo un calculo de dieta para adelgazar', N'Baja', 888, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo Dieta Automatica', CAST(N'2019-11-12 12:23:59.283' AS DateTime), N'Se produjo un calculo de dieta para mantener peso', N'Baja', 889, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo Dieta Automatica', CAST(N'2019-11-12 12:24:02.270' AS DateTime), N'Se produjo un calculo de dieta para engordar', N'Baja', 890, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Dieta Creada', CAST(N'2019-11-12 12:24:43.167' AS DateTime), N'Se creo una nueva dieta', N'Baja', 891, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Proyeccion de peso', CAST(N'2019-11-12 12:35:01.703' AS DateTime), N'Se solicito una nueva proyeccion de peso', N'Media', 892, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Proyeccion de peso', CAST(N'2019-11-12 12:35:57.370' AS DateTime), N'Se solicito una nueva proyeccion de peso', N'Media', 893, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 12:47:49.127' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 894, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 12:49:02.973' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 895, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-12 12:49:28.803' AS DateTime), N'Creacion de leyenda para el control Tratamiento_error_fecha_anterior con Idioma: Español', N'Alta', 896, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Leyenda', CAST(N'2019-11-12 12:50:06.407' AS DateTime), N'Creacion de leyenda para el control Tratamiento_error_fecha_anterior con Idioma: English', N'Alta', 897, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Modificacion de Leyenda', CAST(N'2019-11-12 12:50:28.760' AS DateTime), N'Se modifico la leyenda para el control Tratamiento_error_fecha_anterior con ID 635', N'Media', 898, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 13:03:48.697' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 899, 1)
GO
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-12 13:04:27.703' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 900, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-12 13:04:27.707' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 901, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-12 13:04:27.707' AS DateTime), N'Calculo de BFP realizado por el usuario id: 1', N'Alta', 902, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Guardar Medicion', CAST(N'2019-11-12 13:04:27.710' AS DateTime), N'Se guardo una nueva medicion para el turno con ID: 31', N'Media', 903, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 13:07:20.243' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 904, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 13:10:41.870' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 905, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-12 13:11:17.543' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 906, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-12 13:11:47.683' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 907, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-12 13:11:48.387' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 908, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-12 13:11:48.387' AS DateTime), N'Calculo de BFP realizado por el usuario id: 1', N'Alta', 909, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-12 13:11:49.797' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 910, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-12 13:11:49.797' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 911, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-12 13:11:49.797' AS DateTime), N'Calculo de BFP realizado por el usuario id: 1', N'Alta', 912, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Guardar Medicion', CAST(N'2019-11-12 13:11:49.800' AS DateTime), N'Se guardo una nueva medicion para el turno con ID: 31', N'Media', 913, 1)
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
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (9, 14, 17, 24, 18, 29)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (3, 14, 17, 26, 24, 30)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (8, 4, 18, 26, 25, 31)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (8, 11, 18, 24, 17, 32)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (9, 11, 17, 24, 21, 33)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (12, 3, 17, 26, 24, 34)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (3, 8, 18, 25, 21, 35)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (7, 11, 18, 26, 24, 36)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (9, 3, 18, 25, 21, 37)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (3, 14, 17, 26, 21, 38)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (12, 11, 17, 26, 24, 39)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (3, 4, 17, 26, 25, 40)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (14, 11, 18, 24, 17, 41)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (8, 4, 18, 26, 21, 42)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (7, 11, 18, 26, 17, 43)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (9, 4, 17, 25, 24, 44)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (14, 11, 17, 26, 21, 45)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (9, 14, 18, 24, 17, 46)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (3, 8, 17, 26, 25, 47)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (12, 4, 17, 24, 18, 48)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (7, 3, 18, 26, 17, 49)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (12, 3, 17, 24, 25, 50)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (3, 4, 18, 24, 25, 51)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (7, 4, 17, 26, 18, 52)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (14, 11, 18, 26, 21, 53)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (9, 3, 17, 26, 24, 54)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (9, 4, 17, 24, 18, 55)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (12, 14, 18, 24, 21, 56)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (8, 4, 17, 24, 18, 57)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (14, 4, 17, 25, 18, 58)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (14, 11, 18, 24, 17, 59)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (7, 14, 17, 25, 24, 60)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (3, 14, 17, 26, 18, 61)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (7, 3, 18, 25, 17, 62)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (9, 3, 17, 26, 18, 63)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (8, 4, 18, 26, 24, 64)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (7, 11, 18, 24, 21, 65)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (12, 14, 18, 25, 17, 66)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (7, 8, 18, 26, 24, 67)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (12, 4, 17, 24, 21, 68)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (8, 4, 17, 26, 21, 69)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (8, 11, 18, 26, 25, 70)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (15, 12, 19, 18, 20, 71)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (15, 9, 19, 18, 20, 72)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (15, 12, 19, 18, 20, 73)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (15, 9, 19, 18, 20, 74)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (15, 12, 19, 18, 20, 75)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (15, 9, 19, 18, 20, 76)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (15, 12, 19, 18, 20, 77)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (14, 11, 18, 26, 17, 78)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (8, 14, 17, 26, 24, 79)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (12, 11, 17, 26, 24, 80)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (12, 4, 18, 24, 17, 81)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (3, 11, 17, 24, 25, 82)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (12, 11, 17, 26, 18, 83)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (3, 8, 17, 24, 25, 84)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (14, 8, 17, 26, 24, 85)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (12, 14, 18, 23, 17, 86)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (7, 4, 18, 25, 17, 87)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (7, 3, 18, 26, 17, 88)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (12, 14, 18, 26, 17, 89)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (3, 11, 17, 26, 25, 90)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (12, 11, 17, 26, 24, 91)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (9, 4, 17, 26, 18, 92)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (9, 11, 17, 24, 21, 93)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (8, 14, 17, 25, 18, 94)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (8, 4, 18, 25, 21, 95)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (3, 11, 17, 24, 25, 96)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (3, 14, 17, 26, 18, 97)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (14, 11, 18, 26, 24, 98)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (8, 11, 30, 26, 21, 99)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (12, 11, 30, 25, 24, 100)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (31, 3, 30, 26, 21, 101)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (9, 4, 29, 26, 21, 102)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (14, 3, 30, 25, 29, 103)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (8, 3, 29, 26, 17, 104)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (12, 4, 30, 24, 21, 105)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (14, 11, 29, 24, 18, 106)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (12, 11, 29, 26, 21, 107)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (3, 4, 29, 24, 25, 108)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (12, 14, 30, 24, 25, 109)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (8, 14, 30, 26, 21, 110)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (9, 4, 29, 24, 18, 111)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (8, 11, 30, 26, 18, 112)
SET IDENTITY_INSERT [dbo].[DiaAlimenticio] OFF
GO
SET IDENTITY_INSERT [dbo].[DiaEjercicio] ON 

INSERT [dbo].[DiaEjercicio] ([diaEjercicioID], [ejercicioID], [duracionDia]) VALUES (22, 1, 50)
INSERT [dbo].[DiaEjercicio] ([diaEjercicioID], [ejercicioID], [duracionDia]) VALUES (23, 1, 60)
INSERT [dbo].[DiaEjercicio] ([diaEjercicioID], [ejercicioID], [duracionDia]) VALUES (24, 2, 20)
INSERT [dbo].[DiaEjercicio] ([diaEjercicioID], [ejercicioID], [duracionDia]) VALUES (25, 2, 10)
INSERT [dbo].[DiaEjercicio] ([diaEjercicioID], [ejercicioID], [duracionDia]) VALUES (26, 1, 30)
INSERT [dbo].[DiaEjercicio] ([diaEjercicioID], [ejercicioID], [duracionDia]) VALUES (27, 2, 20)
INSERT [dbo].[DiaEjercicio] ([diaEjercicioID], [ejercicioID], [duracionDia]) VALUES (28, 2, 50)
INSERT [dbo].[DiaEjercicio] ([diaEjercicioID], [ejercicioID], [duracionDia]) VALUES (29, 5, 0)
INSERT [dbo].[DiaEjercicio] ([diaEjercicioID], [ejercicioID], [duracionDia]) VALUES (31, 5, 0)
INSERT [dbo].[DiaEjercicio] ([diaEjercicioID], [ejercicioID], [duracionDia]) VALUES (33, 5, 0)
INSERT [dbo].[DiaEjercicio] ([diaEjercicioID], [ejercicioID], [duracionDia]) VALUES (35, 5, 30)
INSERT [dbo].[DiaEjercicio] ([diaEjercicioID], [ejercicioID], [duracionDia]) VALUES (37, 5, 40)
INSERT [dbo].[DiaEjercicio] ([diaEjercicioID], [ejercicioID], [duracionDia]) VALUES (38, 6, 20)
INSERT [dbo].[DiaEjercicio] ([diaEjercicioID], [ejercicioID], [duracionDia]) VALUES (39, 5, 50)
INSERT [dbo].[DiaEjercicio] ([diaEjercicioID], [ejercicioID], [duracionDia]) VALUES (40, 2, 60)
INSERT [dbo].[DiaEjercicio] ([diaEjercicioID], [ejercicioID], [duracionDia]) VALUES (41, 4, 30)
INSERT [dbo].[DiaEjercicio] ([diaEjercicioID], [ejercicioID], [duracionDia]) VALUES (42, 1, 30)
SET IDENTITY_INSERT [dbo].[DiaEjercicio] OFF
SET IDENTITY_INSERT [dbo].[Dieta] ON 

INSERT [dbo].[Dieta] ([domingo], [jueves], [lunes], [martes], [miercoles], [sabado], [viernes], [dietaID], [esGeneradaAutomaticamente], [nombre]) VALUES (21, 18, 15, 16, 17, 20, 19, 1, 0, N'Dieta Variada Levemente Baja en Calorias')
INSERT [dbo].[Dieta] ([domingo], [jueves], [lunes], [martes], [miercoles], [sabado], [viernes], [dietaID], [esGeneradaAutomaticamente], [nombre]) VALUES (28, 25, 22, 23, 24, 27, 26, 2, 0, N'Dieta de Prueba')
INSERT [dbo].[Dieta] ([domingo], [jueves], [lunes], [martes], [miercoles], [sabado], [viernes], [dietaID], [esGeneradaAutomaticamente], [nombre]) VALUES (49, 46, 43, 44, 45, 48, 47, 3, 1, NULL)
INSERT [dbo].[Dieta] ([domingo], [jueves], [lunes], [martes], [miercoles], [sabado], [viernes], [dietaID], [esGeneradaAutomaticamente], [nombre]) VALUES (56, 53, 50, 51, 52, 55, 54, 4, 1, NULL)
INSERT [dbo].[Dieta] ([domingo], [jueves], [lunes], [martes], [miercoles], [sabado], [viernes], [dietaID], [esGeneradaAutomaticamente], [nombre]) VALUES (63, 60, 57, 58, 59, 62, 61, 5, 1, NULL)
INSERT [dbo].[Dieta] ([domingo], [jueves], [lunes], [martes], [miercoles], [sabado], [viernes], [dietaID], [esGeneradaAutomaticamente], [nombre]) VALUES (70, 67, 64, 65, 66, 69, 68, 6, 1, NULL)
INSERT [dbo].[Dieta] ([domingo], [jueves], [lunes], [martes], [miercoles], [sabado], [viernes], [dietaID], [esGeneradaAutomaticamente], [nombre]) VALUES (77, 74, 71, 72, 73, 76, 75, 7, 1, NULL)
INSERT [dbo].[Dieta] ([domingo], [jueves], [lunes], [martes], [miercoles], [sabado], [viernes], [dietaID], [esGeneradaAutomaticamente], [nombre]) VALUES (84, 81, 78, 79, 80, 83, 82, 8, 1, NULL)
INSERT [dbo].[Dieta] ([domingo], [jueves], [lunes], [martes], [miercoles], [sabado], [viernes], [dietaID], [esGeneradaAutomaticamente], [nombre]) VALUES (91, 88, 85, 86, 87, 90, 89, 9, 1, NULL)
INSERT [dbo].[Dieta] ([domingo], [jueves], [lunes], [martes], [miercoles], [sabado], [viernes], [dietaID], [esGeneradaAutomaticamente], [nombre]) VALUES (98, 95, 92, 93, 94, 97, 96, 10, 1, NULL)
INSERT [dbo].[Dieta] ([domingo], [jueves], [lunes], [martes], [miercoles], [sabado], [viernes], [dietaID], [esGeneradaAutomaticamente], [nombre]) VALUES (105, 102, 99, 100, 101, 104, 103, 11, 1, NULL)
INSERT [dbo].[Dieta] ([domingo], [jueves], [lunes], [martes], [miercoles], [sabado], [viernes], [dietaID], [esGeneradaAutomaticamente], [nombre]) VALUES (112, 109, 106, 107, 108, 111, 110, 12, 1, NULL)
SET IDENTITY_INSERT [dbo].[Dieta] OFF
INSERT [dbo].[DVV] ([nombreTabla], [valor], [idDVV]) VALUES (N'Usuario', 572399, 1)
INSERT [dbo].[DVV] ([nombreTabla], [valor], [idDVV]) VALUES (N'Nutricionista', 595958, 2)
SET IDENTITY_INSERT [dbo].[Ejercicio] ON 

INSERT [dbo].[Ejercicio] ([caloriasQuemadasHora], [nombre], [ejercicioID]) VALUES (250, N'Caminata Rapida', 1)
INSERT [dbo].[Ejercicio] ([caloriasQuemadasHora], [nombre], [ejercicioID]) VALUES (100, N'Yoga', 2)
INSERT [dbo].[Ejercicio] ([caloriasQuemadasHora], [nombre], [ejercicioID]) VALUES (450, N'Paddle', 3)
INSERT [dbo].[Ejercicio] ([caloriasQuemadasHora], [nombre], [ejercicioID]) VALUES (500, N'Zumba', 4)
INSERT [dbo].[Ejercicio] ([caloriasQuemadasHora], [nombre], [ejercicioID]) VALUES (900, N'Crossfit', 5)
INSERT [dbo].[Ejercicio] ([caloriasQuemadasHora], [nombre], [ejercicioID]) VALUES (800, N'Spinning', 6)
SET IDENTITY_INSERT [dbo].[Ejercicio] OFF
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
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'10', N'27')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'10', N'27')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'24', N'27')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'64', N'28')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'10', N'28')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'10', N'28')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'23', N'29')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'24', N'29')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'46', N'29')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'65', N'30')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'52', N'30')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'38', N'31')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'38', N'31')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'33', N'31')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'66', N'31')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'67', N'31')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'30', N'31')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'45', N'32')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'67', N'32')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'16', N'33')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'16', N'33')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'16', N'33')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'16', N'33')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'16', N'33')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'16', N'33')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'6', N'34')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'29', N'34')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'28', N'34')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'23', N'35')
GO
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'46', N'35')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'46', N'35')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'10', N'35')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'4', N'35')
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
INSERT [dbo].[JoinUsuarioPermiso] ([usuarioID], [permisoID]) VALUES (37, 36)
INSERT [dbo].[JoinUsuarioPermiso] ([usuarioID], [permisoID]) VALUES (37, 37)
INSERT [dbo].[JoinUsuarioPermiso] ([usuarioID], [permisoID]) VALUES (37, 39)
INSERT [dbo].[JoinUsuarioPermiso] ([usuarioID], [permisoID]) VALUES (37, 42)
INSERT [dbo].[JoinUsuarioPermiso] ([usuarioID], [permisoID]) VALUES (37, 43)
INSERT [dbo].[JoinUsuarioPermiso] ([usuarioID], [permisoID]) VALUES (37, 48)
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
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (285, N'Pacientes_button_buscar_todos', N'Buscar Todos', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (286, N'Pacientes_button_buscar_todos', N'Search All', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (287, N'Pacientes_button_buscar', N'Search', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (288, N'Pacientes_button_buscar', N'Buscar', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (289, N'Pacientes_label_nombre', N'Nombre', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (290, N'Pacientes_label_nombre', N'Name', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (291, N'Pacientes_label_apellido', N'Surname', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (292, N'Pacientes_label_apellido', N'Apellido', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (293, N'Pacientes_label_telefono', N'Telefono', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (294, N'Pacientes_label_telefono', N'Phone Number', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (295, N'Pacientes_label_sexo', N'Sex', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (296, N'Pacientes_label_sexo', N'Sexo', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (297, N'Pacientes_label_fecha', N'Fecha Nacimiento', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (298, N'Pacientes_label_fecha', N'Date of Birth', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (299, N'Pacientes_button_crear_turno', N'Create Appointment for Selected Patient', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (300, N'Pacientes_button_crear_turno', N'Crear Turno para Paciente Seleccionado', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (301, N'Pacientes_button_agregar', N'Registrar Paciente', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (302, N'Pacientes_button_agregar', N'Register Patient', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (303, N'Pacientes_button_modificar', N'Modificar Seleccionado', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (304, N'Pacientes_button_modificar', N'Modify Selected', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (305, N'Pacientes_button_eliminar', N'Delete Selected', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (306, N'Pacientes_button_eliminar', N'Eliminar Seleccionado', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (307, N'Pacientes_messagebox_errorSeleccion', N'Se produjo un error. Verifique que exista una seleccion valida.', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (308, N'Pacientes_messagebox_errorSeleccion', N'There was an error. Please verify that there is a valid selection.', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (309, N'Pacientes_messagebox_errorDatos', N'There was an error. Please verify the data is correct.', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (310, N'Pacientes_messagebox_errorDatos', N'Se produjo un error. Por favor verifique que los datos sean correctos.', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (311, N'Pacientes_messagebox_errorEdad', N'El paciente debe tener como minimo 10 años.', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (312, N'Pacientes_messagebox_errorEdad', N'The patient must be at least 10 years old.', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (313, N'GenerarTurno_label_titulo', N'Turno sugerido para el Paciente', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (314, N'GenerarTurno_label_titulo', N'Appointment suggested for Patient', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (315, N'GenerarTurno_label_dia', N'Seleccione Dia Preferencial', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (316, N'GenerarTurno_label_dia', N'Select preferred day', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (317, N'GenerarTurno_label_manana', N'Manana', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (318, N'GenerarTurno_label_manana', N'Morning', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (319, N'GenerarTurno_label_tarde', N'Tarde', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (320, N'GenerarTurno_label_tarde', N'Afternoon', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (321, N'GenerarTurno_label_motivo', N'Motivo de la consulta', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (322, N'GenerarTurno_label_motivo', N'Reason of Appointment', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (323, N'GenerarTurno_label_crear_turno', N'Crear Turno', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (324, N'GenerarTurno_label_crear_turno', N'Create Appointment', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (325, N'GenerarTurno_messagebox_errorTurno', N'Ocurrio un error con el turno seleccionado', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (326, N'GenerarTurno_messagebox_errorTurno', N'There was an error with the selected Appointment', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (327, N'Error_messagebox_busqueda', N'Ocurrio un error al realizar al busqueda solicitada', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (328, N'Error_messagebox_busqueda', N'There was an error perfoming the requested search', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (329, N'MisTurnos_messagebox_seleccione_turno', N'Seleccione un turno', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (330, N'MisTurnos_messagebox_seleccione_turno', N'Please select an Appointment', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (331, N'Tratamiento_error_buscar_activo', N'Error buscando tratamientos activos', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (332, N'Tratamiento_error_buscar_activo', N'There was an error searching for active Treatments', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (333, N'Mediciones_label_titulo', N'Informacion Basica del Turno', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (334, N'Mediciones_label_titulo', N'Basic Information of the Appointment', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (335, N'Mediciones_label_motivo', N'Motivo de Consulta', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (336, N'Mediciones_label_motivo', N'Reason of Appointment', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (337, N'Mediciones_label_mediciones', N'Mediciones', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (338, N'Mediciones_label_mediciones', N'Measures', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (339, N'Mediciones_label_peso', N'Peso', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (340, N'Mediciones_label_peso', N'Weight', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (341, N'Mediciones_label_altura', N'Height', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (342, N'Mediciones_label_altura', N'Altura', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (343, N'Mediciones_label_edad', N'Edad', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (344, N'Mediciones_label_edad', N'Age', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (345, N'Mediciones_label_cadera', N'Perimetro de Cadera', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (346, N'Mediciones_label_cadera', N'Hip Perimeter', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (347, N'Mediciones_label_cintura', N'Perimetro de Cintura', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (348, N'Mediciones_label_cintura', N'Waist Perimeter', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (349, N'Mediciones_button_guardar_mediciones', N'Guardar Mediciones', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (350, N'Mediciones_button_guardar_mediciones', N'Save Measures', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (351, N'Mediciones_button_calcular_bmi', N'Calculate BMI', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (352, N'Mediciones_button_calcular_bmi', N'Calcular BMI', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (353, N'Mediciones_button_calcular_bfp', N'Calcular BFP', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (354, N'Mediciones_button_calcular_bfp', N'Calculate BFP', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (355, N'Mediciones_label_valor_bmi', N'Value:', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (356, N'Mediciones_label_valor_bmi', N'Valor:', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (357, N'Mediciones_label_estado_bmi', N'Estado:', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (358, N'Mediciones_label_estado_bmi', N'Status:', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (359, N'Mediciones_label_valor_bfp', N'Value:', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (360, N'Mediciones_label_estado_bfp', N'Status:', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (361, N'Mediciones_label_valor_bfp', N'Valor:', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (362, N'Mediciones_label_estado_bfp', N'Estado:', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (363, N'Mediciones_label_ultimas_mediciones', N'Ultimas Mediciones', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (364, N'Mediciones_label_ultimas_mediciones', N'Last Measures', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (365, N'Mediciones_messagebox_error_medidas_introducidas', N'Error: Verifique las medidas introducidas', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (366, N'Mediciones_messagebox_error_medidas_introducidas', N'Error: Please verfiy the introduced measures', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (367, N'Mediciones_error_calculo_bmi', N'There was an error calculating the BMI. Please verify the values introduced.', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (368, N'Mediciones_error_calculo_bfp', N'There was an error calculating the BFP. Please verify the values introduced.', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (369, N'Mediciones_error_calculo_bfp', N'Ocurrio un error calculando el BFP. Por favor verifique los valores introducidos', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (370, N'Mediciones_error_calculo_bmi', N'Ocurrio un error calculando el BMI. Por favor verifique los valores introducidos', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (371, N'Mediciones_BMI_Bajo', N'Bajo de Peso', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (372, N'Mediciones_BMI_Bajo', N'Low of Weight', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (373, N'Mediciones_BMI_Sano', N'Sano', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (374, N'Mediciones_BMI_Sano', N'Healthy', 2, 0)
GO
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (375, N'Mediciones_BMI_Sobrepeso', N'Overweight', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (376, N'Mediciones_BMI_Sobrepeso', N'Sobrepeso', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (377, N'Mediciones_BMI_Obesidad', N'Obesidad', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (378, N'Mediciones_BMI_Obesidad', N'Obesity', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (379, N'Mediciones_BMI_ExtremoObeso', N'Extremely Obese', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (380, N'Mediciones_BMI_ExtremoObeso', N'Extremadamente Obeso', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (381, N'Mediciones_BFP_Atletico', N'Atletico', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (382, N'Mediciones_BFP_Atletico', N'Athletic', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (383, N'Mediciones_BFP_Sano', N'Parametros Sanos', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (384, N'Mediciones_BFP_Sano', N'Healthy Parameters', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (385, N'Mediciones_BFP_Grasa_Excedida', N'Exceeded on Body Fat', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (386, N'Mediciones_BFP_Grasa_Excedida', N'Excedido en Grasa Corporal', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (387, N'Mediciones_error_guardar_medicion', N'Ocurrio un error al guardar la medicion. Por favor verifique los datos.', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (388, N'Mediciones_error_guardar_medicion', N'There was an error while saving the Measurement. Please verfy the data introduced.', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (389, N'AgregarDieta_radiobutton_bajar', N'Bajar de Peso', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (390, N'AgregarDieta_radiobutton_bajar', N'Lose Weight', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (391, N'AgregarDieta_radiobutton_mantener', N'Mantain Weight', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (392, N'AgregarDieta_radiobutton_mantener', N'Mantener Peso', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (393, N'AgregarDieta_radiobutton_subir', N'Subir de Peso', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (394, N'AgregarDieta_radiobutton_subir', N'Gain Weight', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (395, N'AgregarDieta_button_generar_dieta_automatica', N'Generate Automatic Diet', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (396, N'AgregarDieta_button_generar_dieta_automatica', N'Generar Dieta Automatica', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (397, N'AgregarDieta_button_nueva_dieta', N'Nueva Dieta', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (398, N'AgregarDieta_button_nueva_dieta', N'New Diet', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (399, N'AgregarDieta_label_desayuno', N'Breakfast', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (400, N'AgregarDieta_label_desayuno', N'Desayuno', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (401, N'AgregarDieta_label_colacion', N'Colacion', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (402, N'AgregarDieta_label_colacion', N'Collation', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (403, N'AgregarDieta_label_almuerzo', N'Lunch', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (404, N'AgregarDieta_label_almuerzo', N'Almuerzo', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (405, N'AgregarDieta_label_merienda', N'Merienda', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (406, N'AgregarDieta_label_merienda', N'Afternoon', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (407, N'AgregarDieta_label_cena', N'Cena', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (408, N'AgregarDieta_label_cena', N'Dinner', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (409, N'AgregarDieta_label_buscar', N'Search', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (410, N'AgregarDieta_label_buscar', N'Buscar', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (411, N'AgregarDieta_label_calorias_dia', N'Calorias del dia', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (412, N'AgregarDieta_label_calorias_dia', N'Calories of the day', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (413, N'AgregarDieta_label_calorias_totales', N'Calorias Totales', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (414, N'AgregarDieta_label_calorias_totales', N'Total Calories', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (415, N'AgregarDieta_button_iniciar_tratamiento', N'Iniciar Tratamiento', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (416, N'AgregarDieta_button_iniciar_tratamiento', N'Initiate Treatment', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (417, N'AgregarDieta_label_cambiar_plato', N'Cambiar Plato por Seleccion', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (418, N'AgregarDieta_label_cambiar_plato', N'Change Dish for Selection', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (419, N'AgregarDieta_groupbox_detalle_dieta', N'Detalle de Dieta', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (420, N'AgregarDieta_groupbox_detalle_dieta', N'Details of Diet', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (421, N'AgregarDieta_dia_lunes', N'Lunes', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (422, N'AgregarDieta_dia_martes', N'Martes', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (423, N'AgregarDieta_dia_miercoles', N'Miercoles', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (424, N'AgregarDieta_dia_jueves', N'Jueves', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (425, N'AgregarDieta_dia_viernes', N'Viernes', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (426, N'AgregarDieta_dia_sabado', N'Sabado', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (427, N'AgregarDieta_dia_domingo', N'Domingo', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (428, N'AgregarDieta_dia_lunes', N'Monday', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (429, N'AgregarDieta_dia_martes', N'Tuesday', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (430, N'AgregarDieta_dia_miercoles', N'Wednesday', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (431, N'AgregarDieta_dia_jueves', N'Thursday', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (432, N'AgregarDieta_dia_viernes', N'Friday', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (433, N'AgregarDieta_dia_sabado', N'Saturday', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (434, N'AgregarDieta_dia_domingo', N'Sunday', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (435, N'TratamientoActual_label_resumen', N'Resumen del Paciente', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (436, N'TratamientoActual_label_resumen', N'Summary of Patient', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (437, N'TratamientoActual_label_ultima_medicion', N'Last Measurment of Patient', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (438, N'TratamientoActual_label_ultima_medicion', N'Ultima Medicion del Paciente', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (439, N'TratamientoActual_label_primera_medicion', N'Primera Medicion del Paciente', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (440, N'TratamientoActual_label_primera_medicion', N'First Measurment of Patient', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (441, N'TratamientoActual_button_nueva_medicion', N'New Measurment', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (442, N'TratamientoActual_button_nueva_medicion', N'Nueva Medicion', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (443, N'TratamientoActual_button_proyecciones', N'Ver Proyecciones', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (444, N'TratamientoActual_button_proyecciones', N'View Projections', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (445, N'TratamientoActual_button_manejar_ejercicios', N'Manage Routine', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (446, N'TratamientoActual_button_manejar_ejercicios', N'Manejar Rutina', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (447, N'TratamientoActual_label_dieta_actual', N'Dieta Actual', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (448, N'TratamientoActual_label_dieta_actual', N'Actual Diet', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (449, N'AgregarDieta_button_finalizar', N'Finalizar Tratamiento', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (450, N'AgregarDieta_button_finalizar', N'Finish Treatment', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (451, N'AgregarDieta_label_rutina_actual', N'Actual Rutine', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (452, N'AgregarDieta_label_rutina_actual', N'Rutina Actual', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (453, N'AgregarDieta_label_duracion', N'Duracion', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (454, N'AgregarDieta_label_duracion', N'Duration', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (455, N'AgregarDieta_label_calorias', N'Calories', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (456, N'AgregarDieta_label_calorias', N'Calorias', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (457, N'Tratamiento_label_calorias_totales_quemadas', N'Calorias Totales', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (458, N'Tratamiento_label_calorias_totales_quemadas', N'Total Calories', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (459, N'AgregarRutina_label_ver_rutinas', N'Ver Rutinas Existentes', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (460, N'AgregarRutina_label_ver_rutinas', N'See existing Routines', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (461, N'AgregarRutina_button_asociar', N'Associate Routine', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (462, N'AgregarRutina_button_asociar', N'Asociar Rutina', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (463, N'AgregarRutina_label_calorias_quemadas_dia', N'Burnt Calories of Day', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (464, N'AgregarRutina_label_calorias_quemadas_dia', N'Calorias Quemadas del dia', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (465, N'AgregarRutina_label_calorias_quemadas_semanales', N'Calorias Semanales', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (466, N'AgregarRutina_label_calorias_quemadas_semanales', N'Weekly Calories', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (467, N'TratamientoActual_label_rutina_actual', N'Actual Routine', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (468, N'TratamientoActual_label_rutina_actual', N'Rutina Actual', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (469, N'Ejercicios_label_nombre', N'Nombre de Ejercicio', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (470, N'Ejercicios_label_nombre', N'Name of Exercise', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (471, N'Ejercicios_label_calorias_hora', N'Burnt Calories per hour', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (472, N'Ejercicios_label_calorias_hora', N'Calorias Quemadas por Hora', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (473, N'Ejercicios_label_nombre_rutina', N'Nombre de Rutina', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (474, N'Ejercicios_label_nombre_rutina', N'Name of Routine', 2, 0)
GO
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (475, N'Ejercicios_button_agregar_rutina', N'Add', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (476, N'Ejercicios_button_agregar_rutina', N'Agregar', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (477, N'Ejercicios_label_ver_rutinas_existentes', N'Ver Rutinas Existentes', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (478, N'Ejercicios_label_ver_rutinas_existentes', N'See Existing Routines', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (479, N'Ejercicios_button_limpiar', N'Clean Selection', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (480, N'Ejercicios_button_limpiar', N'Limpiar Seleccion', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (481, N'Alimentos_label_nombre_alimento', N'Nombre', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (482, N'Alimentos_label_nombre_alimento', N'Name', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (483, N'Alimentos_label_calorias_alimento', N'Calories', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (484, N'Alimentos_label_calorias_alimento', N'Calorias', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (485, N'Alimentos_label_tipo_alimento', N'Tipo Alimento', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (486, N'Alimentos_label_tipo_alimento', N'Type of Food', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (487, N'Alimentos_button_agregar', N'Add', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (488, N'Alimentos_button_agregar', N'Agregar', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (489, N'Alimentos_label_buscar_nombre_alimento', N'Buscar por Nombre', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (490, N'Alimentos_label_buscar_nombre_alimento', N'Search by Name', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (491, N'Alimentos_label_nombre_plato', N'Name of Dish', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (492, N'Alimentos_label_nombre_plato', N'Nombre de Plato', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (493, N'Alimentos_label_calorias_plato', N'Calorias (Opcional)', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (494, N'Alimentos_label_calorias_plato', N'Calories (Optional)', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (495, N'Alimentos_checkbox_desayuno', N'Breakfast', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (496, N'Alimentos_checkbox_desayuno', N'Desayuno', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (497, N'Alimentos_checkbox_colacion', N'Colacion', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (498, N'Alimentos_checkbox_colacion', N'Collation', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (499, N'Alimentos_checkbox_merienda', N'Afternoon', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (500, N'Alimentos_checkbox_merienda', N'Merienda', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (501, N'Alimentos_checkbox_plato_principal', N'Plato Principal', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (502, N'Alimentos_checkbox_plato_principal', N'Main Dish', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (503, N'Alimentos_button_limpiar_seleccion_plato', N'Clean Selection of Dish', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (504, N'Alimentos_button_limpiar_seleccion_plato', N'Limpiar Seleccion de Plato', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (505, N'Alimentos_label_buscar_nombre_plato', N'Buscar por Nombre de Plato', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (506, N'Alimentos_label_buscar_nombre_plato', N'Search by Dish Name', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (507, N'Alimentos_label_agregar_alimento_a_plato', N'Add Selected Food to Dish', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (508, N'Alimentos_label_agregar_alimento_a_plato', N'Agregar Alimento Seleccionado al Plato', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (509, N'Alimentos_label_dietas', N'Dieta', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (510, N'Alimentos_label_dietas', N'Diets', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (511, N'Alimentos_button_limpiar_desayuno', N'Limpiar', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (512, N'Alimentos_button_limpiar_colacion', N'Limpiar', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (513, N'Alimentos_button_limpiar_almuerzo', N'Limpiar', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (514, N'Alimentos_button_limpiar_merienda', N'Limpiar', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (515, N'Alimentos_button_limpiar_cena', N'Limpiar', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (516, N'Alimentos_button_limpiar_cena', N'Clean', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (517, N'Alimentos_button_limpiar_desayuno', N'Clean', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (518, N'Alimentos_button_limpiar_colacion', N'Clean', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (519, N'Alimentos_button_limpiar_almuerzo', N'Clean', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (520, N'Alimentos_button_limpiar_merienda', N'Clean', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (521, N'Alimentos_label_seleccione_dia', N'Seleccione Dia', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (522, N'Alimentos_label_seleccione_dia', N'Select Day', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (523, N'Alimentos_label_nombre_dieta', N'Name of the Diet', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (524, N'Alimentos_label_calorias_totales', N'Total Calories', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (525, N'Alimentos_label_nombre_dieta', N'Nombre de la Dieta', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (526, N'Alimentos_label_calorias_totales', N'Calorias Totales', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (527, N'Alimentos_label_calorias_dia', N'Calorias del Dia', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (528, N'Alimentos_label_calorias_dia', N'Daily Calories', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (529, N'Alimentos_button_crear_dieta', N'Create Diet', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (530, N'Alimentos_button_crear_dieta', N'Crear Dieta', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (531, N'Alimentos_label_agregar_plato', N'Add', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (532, N'Alimentos_label_agregar_plato', N'Agregar', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (533, N'GenerarTurno_messagebox_sin_turnos', N'No se encontraron turnos', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (534, N'GenerarTurno_messagebox_sin_turnos', N'There were no appointments found', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (535, N'GenerarTurno_messagebox_siguiente_semana', N'No se encontraron turnos. Mostrando para la semana siguiente', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (536, N'GenerarTurno_messagebox_siguiente_semana', N'No appointment were found. Showing next week appointments', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (537, N'Tratamiento_error_fecha_tratamiento', N'El usuario tiene un tratamiento comenzado mas reciente que la fecha de este turno.', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (538, N'Tratamiento_error_fecha_tratamiento', N'The user has a newer treatment than the date of this appointment', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (539, N'Proyeccion_label_peso_inicial', N'Peso Inicial', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (540, N'Proyeccion_label_peso_inicial', N'Initial Weight', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (541, N'Proyeccion_label_bfp', N'Body Fat Percentage', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (542, N'Proyeccion_label_bfp', N'Porcentaje de Grasa Corporal', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (543, N'Proyeccion_label_bfp_objetivo', N'Porcentaje Grasa Objetivo', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (544, N'Proyeccion_label_bfp_objetivo', N'Body Fat Percentage Goal', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (545, N'Proyeccion_error_objetivo', N'There is an error with the provided data. Please verify that the BFP goal is less than the actual BFP', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (546, N'Proyeccion_error_objetivo', N'Ocurrio un error con los datos ingresados. Verifique que el BFP Objetivo sea menor que el BFP Actual', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (547, N'Proyeccion_error_proyeccion', N'Ocurrio un error al calcular la Proyeccion. Verifique los datos.', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (548, N'Proyeccion_error_proyeccion', N'There was an error calculating the Projection. Please verify the entered data.', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (549, N'Proyeccion_label_primera_fase', N'Primera Fase', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (550, N'Proyeccion_label_segunda_fase', N'Segunda Fase', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (551, N'Proyeccion_label_tercera_fase', N'Tercera Fase', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (552, N'Proyeccion_label_cuarta_fase', N'Cuarta Fase', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (553, N'Proyeccion_label_cuarta_fase', N'Fourth Fase', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (554, N'Proyeccion_label_tercera_fase', N'Third Fase', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (555, N'Proyeccion_label_segunda_fase', N'Second Fase', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (556, N'Proyeccion_label_primera_fase', N'First Fase', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (557, N'Proyeccion_button_proyeccion', N'Obtener Proyeccion', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (558, N'Proyeccion_button_proyeccion', N'Obtain Projection', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (559, N'Proyeccion_label_peso_1', N'Weight', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (560, N'Proyeccion_label_peso_2', N'Weight', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (561, N'Proyeccion_label_peso_3', N'Weight', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (562, N'Proyeccion_label_peso_4', N'Weight', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (563, N'Proyeccion_label_peso_4', N'Peso', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (564, N'Proyeccion_label_peso_3', N'Peso', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (565, N'Proyeccion_label_peso_2', N'Peso', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (566, N'Proyeccion_label_peso_1', N'Peso', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (567, N'Proyeccion_label_dias_1', N'Dias', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (568, N'Proyeccion_label_dias_2', N'Dias', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (569, N'Proyeccion_label_dias_3', N'Dias', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (570, N'Proyeccion_label_dias_4', N'Dias', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (571, N'Proyeccion_label_dias_4', N'Days', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (572, N'Proyeccion_label_dias_3', N'Days', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (573, N'Proyeccion_label_dias_2', N'Days', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (574, N'Proyeccion_label_dias_1', N'Days', 2, 0)
GO
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (575, N'Proyeccion_label_eje_y', N'Axis Y expressed in Kilograms', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (576, N'Proyeccion_label_eje_y', N'Eje Y expresado en Kilos', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (577, N'Proyeccion_label_eje_x', N'Axis X expressed in Weeks', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (578, N'Proyeccion_label_eje_x', N'Eje X expresado en Semanas', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (579, N'AgregarDieta_error_calculo_calorias_diarias', N'Ocurrio un error calculando las calorias.', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (580, N'AgregarDieta_error_calculo_calorias_diarias', N'There was an error calculating the calories.', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (581, N'AgregarDieta_error_dieta_automatica', N'There was an error calculating the automatic Diet', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (582, N'AgregarDieta_error_dieta_automatica', N'Se produjo un error calculando la dieta automatica', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (583, N'AgregarDieta_error_obtener_dietas', N'Se produjo un error obteniendo las dietas.', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (584, N'AgregarDieta_error_obtener_dietas', N'There was an error getting the Diets', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (585, N'Plato_error_busqueda', N'There was an error searching for the requested Dishes', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (586, N'Plato_error_busqueda', N'Ocurrio un error buscando los platos deseados.', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (587, N'AgregarDieta_error_guardado', N'Ocurrio un error al guardar la dieta. Por favor verifique los datos introducidos', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (588, N'AgregarDieta_error_guardado', N'There was an error while saving the Diet data. Please verify the inserted data.', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (589, N'AgregarDieta_error_invalida', N'The inserted Diet is invalid. Please verify that each day has a dish associated.', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (590, N'AgregarDieta_error_invalida', N'La dieta ingresada es invalida. Por favor verifique que todos los dias tengan platos asociados.', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (591, N'Dieta_error_busqueda', N'Ocurrio un error al buscar la dieta. Por favor verifique la solicitud.', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (592, N'Dieta_error_busqueda', N'There was an error creating the diet, please verify the request.', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (593, N'Tratamiento_error_finalizar', N'Ocurrio un error al intentar finalizar el tratamiento. Contactar al adminsitrador en caso de que no se solucione.', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (594, N'Tratamiento_error_finalizar', N'There was an error while trying to finish the treatment. Please contact an admisntrator in case the problem persists.', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (595, N'Tratamiento_error_guardar', N'Ocurrio un error al intentar guardar el tratamiento. Por favor verifique los datos.', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (596, N'Tratamiento_error_guardar', N'There was an error trying to save the Treatment. Please verify the inserted data', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (597, N'Rutina_error_guardar', N'Ocurrio un error al intentar guardar la rutina. Por favor verifique que los datos ingresados sean validos.', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (598, N'Rutina_error_guardar', N'There was an error while trying to save the Routine. Please verify the inserted data.', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (599, N'Rutina_error_buscar_dias', N'Ocurrio un error al intentar buscar dias de Ejercicio para la rutina seleccionada.', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (600, N'Rutina_error_buscar_dias', N'There was a problem while searching the Excercise days of the selected Routine', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (601, N'Rutina_error_calcular_calorias', N'Error while calculating the total calories burnt', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (602, N'Rutina_error_calcular_calorias', N'Error al calcular el total de calorias quemadas.', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (603, N'Rutina_error_busqueda', N'Ocurrio un error al buscar las rutinas.', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (604, N'Rutina_error_busqueda', N'There was an error while searching the Routines.', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (605, N'Tratamiento_error_asociar', N'Se produjo un error al intentar asociar la rutina al tratamiento seleccionado. Verifique la rutina.', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (606, N'Tratamiento_error_asociar', N'There was an error while attempting to associate the Rotine to the Treatment. Please verify the Routine.', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (607, N'Alimento_error_agregar', N'There was a problem while saving the Food. Please verify the data.', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (608, N'Alimento_error_agregar', N'Se produjo un error al intentar guardar el Alimento. Por favor verifique que los datos son correctos.', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (609, N'Alimento_error_buscar', N'Se produjo un error al realizar la busqueda de alimentos.', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (610, N'Alimento_error_buscar', N'There was an error while seaching Foods.', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (611, N'Alimento_error_plato_buscar', N'There was a problem searching the food that is part of the requested Dish', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (612, N'Alimento_error_plato_buscar', N'Ocurrio un error mientras se buscaban los Alimentos que conforman al Plato solicitado', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (613, N'Plato_error_agregado', N'Se produjo un error al intentar crear el Plato. Por favor verifique que los datos sean correctos.', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (614, N'Plato_error_agregado', N'There was an error trying to save the Dish. Please verify that the inserted data is correct.', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (615, N'Plato_error_calculo_calorias', N'Error calculating calories of the Dish', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (616, N'Plato_error_calculo_calorias', N'Error calculando las calorias del Plato', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (617, N'AgregarDieta_error_calculo_calorias', N'Ocurrio un error calculando las calorias.', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (618, N'AgregarDieta_error_calculo_calorias', N'There was an error calculating the calories.', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (619, N'Alimentos_messagebox_dieta_creada', N'Dieta Creada Correctamente', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (620, N'Alimentos_messagebox_dieta_creada', N'Diet Created Correctly', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (621, N'Alimentos_messagebox_insert_name', N'Por favor introduzca un nombre', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (622, N'Alimentos_messagebox_insert_name', N'Please insert a name', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (623, N'Alimentos_messagebox_verificar', N'Error: Verifique que los datos sean validos', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (624, N'Alimentos_messagebox_verificar', N'Error: Please verify that the data is correct.', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (625, N'Error_messagebox_verifique_datos', N'Error: Por favor verifique que los datos necesarios sean correctos.', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (626, N'Error_messagebox_verifique_datos', N'Error: Please verify that the necessary data is correct.', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (627, N'GenerarTurno_messagebox_creado', N'Turno creado correctamente', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (628, N'GenerarTurno_messagebox_creado', N'Appointment created correctly', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (629, N'TratamientoActual_button_guardar_resumen', N'Guardar Resumen', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (630, N'TratamientoActual_button_guardar_resumen', N'Save Summary', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (631, N'AgregarTurno_error_eliminado', N'Se produjo un error al intentar eliminar el turno.', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (632, N'AgregarTurno_error_eliminado', N'There was a problem while trying to delete the Appointment', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (633, N'Plato_error_indique_tipo', N'Error: Verifique que el nombre sea correcto y haya especificado al menos un tipo de plato.', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (634, N'Plato_error_indique_tipo', N'Error: Please verify that the name is correct and at least one tipe of dish was selected.', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (635, N'Tratamiento_error_fecha_anterior', N'No es posible iniciar un turno anterior al dia de hoy.', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (636, N'Tratamiento_error_fecha_anterior', N'Its not possible to initiate an appointment with a date earlier than today', 2, 0)
SET IDENTITY_INSERT [dbo].[Leyenda] OFF
SET IDENTITY_INSERT [dbo].[Medicion] ON 

INSERT [dbo].[Medicion] ([altura], [cadera], [cintura], [peso], [medicionID], [datosAnalíticosID], [pacienteID], [turnoID], [bmi], [categoriaBmi], [bfp], [categoriaBfp]) VALUES (1.75, 80, 70, 85, 42, NULL, 1, 8, 27.8, N'Sobrepeso', 23.369999999999997, N'Parmetros Sanos')
INSERT [dbo].[Medicion] ([altura], [cadera], [cintura], [peso], [medicionID], [datosAnalíticosID], [pacienteID], [turnoID], [bmi], [categoriaBmi], [bfp], [categoriaBfp]) VALUES (1.7, 90, 80, 80, 43, NULL, 7, 14, 27.7, N'Sobrepeso', 23.709999999999994, N'Parametros Sanos')
INSERT [dbo].[Medicion] ([altura], [cadera], [cintura], [peso], [medicionID], [datosAnalíticosID], [pacienteID], [turnoID], [bmi], [categoriaBmi], [bfp], [categoriaBfp]) VALUES (1.7, 80, 90, 80, 44, NULL, 7, 10, 27.7, N'Overweight', 23.709999999999994, N'Healthy Parameters')
INSERT [dbo].[Medicion] ([altura], [cadera], [cintura], [peso], [medicionID], [datosAnalíticosID], [pacienteID], [turnoID], [bmi], [categoriaBmi], [bfp], [categoriaBfp]) VALUES (1.7, 90, 80, 80, 45, NULL, 7, 10, 27.7, N'Sobrepeso', 23.709999999999994, N'Parametros Sanos')
INSERT [dbo].[Medicion] ([altura], [cadera], [cintura], [peso], [medicionID], [datosAnalíticosID], [pacienteID], [turnoID], [bmi], [categoriaBmi], [bfp], [categoriaBfp]) VALUES (1.7, 90, 80, 80, 46, NULL, 7, 10, 27.7, N'Sobrepeso', 23.709999999999994, N'Parametros Sanos')
INSERT [dbo].[Medicion] ([altura], [cadera], [cintura], [peso], [medicionID], [datosAnalíticosID], [pacienteID], [turnoID], [bmi], [categoriaBmi], [bfp], [categoriaBfp]) VALUES (1.9, 80, 90, 80, 47, NULL, 3, 7, 22.2, N'Sano', 18.259999999999991, N'Parametros Sanos')
INSERT [dbo].[Medicion] ([altura], [cadera], [cintura], [peso], [medicionID], [datosAnalíticosID], [pacienteID], [turnoID], [bmi], [categoriaBmi], [bfp], [categoriaBfp]) VALUES (1.9, 90, 80, 80, 48, NULL, 3, 7, 22.2, N'Sano', 18.259999999999991, N'Parametros Sanos')
INSERT [dbo].[Medicion] ([altura], [cadera], [cintura], [peso], [medicionID], [datosAnalíticosID], [pacienteID], [turnoID], [bmi], [categoriaBmi], [bfp], [categoriaBfp]) VALUES (1.7, 90, 80, 80, 49, NULL, 7, 10, 27.7, N'Sobrepeso', 23.709999999999994, N'Parametros Sanos')
INSERT [dbo].[Medicion] ([altura], [cadera], [cintura], [peso], [medicionID], [datosAnalíticosID], [pacienteID], [turnoID], [bmi], [categoriaBmi], [bfp], [categoriaBfp]) VALUES (1.7, 90, 80, 80, 50, NULL, 7, 10, 27.7, N'Sobrepeso', 23.709999999999994, N'Parametros Sanos')
INSERT [dbo].[Medicion] ([altura], [cadera], [cintura], [peso], [medicionID], [datosAnalíticosID], [pacienteID], [turnoID], [bmi], [categoriaBmi], [bfp], [categoriaBfp]) VALUES (1.7, 80, 90, 80, 51, NULL, 7, 10, 27.7, N'Sobrepeso', 23.709999999999994, N'Parametros Sanos')
INSERT [dbo].[Medicion] ([altura], [cadera], [cintura], [peso], [medicionID], [datosAnalíticosID], [pacienteID], [turnoID], [bmi], [categoriaBmi], [bfp], [categoriaBfp]) VALUES (1.7, 90, 80, 80, 52, NULL, 7, 10, 27.7, N'Sobrepeso', 23.709999999999994, N'Parametros Sanos')
INSERT [dbo].[Medicion] ([altura], [cadera], [cintura], [peso], [medicionID], [datosAnalíticosID], [pacienteID], [turnoID], [bmi], [categoriaBmi], [bfp], [categoriaBfp]) VALUES (1.7, 90, 80, 80, 53, NULL, 7, 10, 27.7, N'Sobrepeso', 23.709999999999994, N'Parametros Sanos')
INSERT [dbo].[Medicion] ([altura], [cadera], [cintura], [peso], [medicionID], [datosAnalíticosID], [pacienteID], [turnoID], [bmi], [categoriaBmi], [bfp], [categoriaBfp]) VALUES (1.7, 80, 70, 80, 54, NULL, 12, 31, 27.7, N'Sobrepeso', 23.709999999999994, N'Parametros Sanos')
INSERT [dbo].[Medicion] ([altura], [cadera], [cintura], [peso], [medicionID], [datosAnalíticosID], [pacienteID], [turnoID], [bmi], [categoriaBmi], [bfp], [categoriaBfp]) VALUES (1.7, 80, 70, 79, 55, NULL, 12, 31, 27.3, N'Sobrepeso', 23.229999999999997, N'Parametros Sanos')
INSERT [dbo].[Medicion] ([altura], [cadera], [cintura], [peso], [medicionID], [datosAnalíticosID], [pacienteID], [turnoID], [bmi], [categoriaBmi], [bfp], [categoriaBfp]) VALUES (1.7, 80, 70, 78, 56, NULL, 12, 31, 27, N'Sobrepeso', 22.869999999999997, N'Parametros Sanos')
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
INSERT [dbo].[Nutricionista] ([nutricionistaID], [dni], [especialización], [matricula], [apellido], [usuarioID], [nombre], [sexo], [eliminado], [DVH]) VALUES (21, 975473, N'Nutricion', N'ASD2123', N'SinPermiso', 36, N'SinPermiso', N'M', 0, 36031)
INSERT [dbo].[Nutricionista] ([nutricionistaID], [dni], [especialización], [matricula], [apellido], [usuarioID], [nombre], [sexo], [eliminado], [DVH]) VALUES (22, 85948322, N'Nutricion', N'1290FAS2', N'Perez', 37, N'Dante', N'M', 0, 37335)
SET IDENTITY_INSERT [dbo].[Nutricionista] OFF
SET IDENTITY_INSERT [dbo].[Paciente] ON 

INSERT [dbo].[Paciente] ([email], [telefono], [pacienteID], [apellido], [dni], [nombre], [sexo], [eliminado], [fechaNacimiento]) VALUES (N'carlossanchez@live.com', 1136040313, 1, N'Sanchez', 37171096, N'Carlos', N'M', 0, CAST(N'1992-11-10' AS Date))
INSERT [dbo].[Paciente] ([email], [telefono], [pacienteID], [apellido], [dni], [nombre], [sexo], [eliminado], [fechaNacimiento]) VALUES (N'juanlopez@live.com', 1124352354, 3, N'Lopez', 1234123, N'Juancho', N'M', 0, CAST(N'1985-02-12' AS Date))
INSERT [dbo].[Paciente] ([email], [telefono], [pacienteID], [apellido], [dni], [nombre], [sexo], [eliminado], [fechaNacimiento]) VALUES (N'lola@yahoo.com', 15231234, 5, N'Lopez', 561254133, N'Lola', N'F', 1, CAST(N'1984-07-11' AS Date))
INSERT [dbo].[Paciente] ([email], [telefono], [pacienteID], [apellido], [dni], [nombre], [sexo], [eliminado], [fechaNacimiento]) VALUES (N'gaklsngfask@live.com', 11345242, 6, N'Perez', 37692345, N'Danilo', N'M', 1, CAST(N'2019-11-10' AS Date))
INSERT [dbo].[Paciente] ([email], [telefono], [pacienteID], [apellido], [dni], [nombre], [sexo], [eliminado], [fechaNacimiento]) VALUES (N'daniloperez@hotmail.com', 1136040312, 7, N'Perez', 37171097, N'Danilo', N'M', 0, CAST(N'1990-07-11' AS Date))
INSERT [dbo].[Paciente] ([email], [telefono], [pacienteID], [apellido], [dni], [nombre], [sexo], [eliminado], [fechaNacimiento]) VALUES (N'teo@gmail.com', 623512412, 11, N'Gonzalez', 39798434, N'Teodoro', N'M', 0, CAST(N'1990-07-18' AS Date))
INSERT [dbo].[Paciente] ([email], [telefono], [pacienteID], [apellido], [dni], [nombre], [sexo], [eliminado], [fechaNacimiento]) VALUES (N'ramirezisi@gmail.com', 623512412, 12, N'Ramirez', 384623563, N'Isidro', N'M', 0, CAST(N'1990-07-12' AS Date))
SET IDENTITY_INSERT [dbo].[Paciente] OFF
SET IDENTITY_INSERT [dbo].[Permiso] ON 

INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (3, N'Alta de datos de Paciente', N'OP004')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (4, N'Modificacion de datos de Paciente', N'OP005')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (6, N'Consulta de Alimentos', N'OP007')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (7, N'Alta de Alimento', N'OP008')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (10, N'Consulta de Dietas Disponibles', N'OP011')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (11, N'Alta de Dieta', N'OP012')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (21, N'Modificación de Rutina de Ejercicios', N'OP022')
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
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (85, N'Cálculo de BMI', N'OP019')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (86, N'Cálculo de BFP', N'OP020')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (87, N'Alta de Ejercicios', N'OP016')
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
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (128, N'Consulta de Rutina de Ejercicios', N'OP025')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (129, N'Calculo de Dieta Automatica', N'OP026')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (130, N'Consultar Pacientes', N'OP043')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (131, N'Obtener Turnos', N'OP044')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (132, N'Gestion de Mediciones', N'GE111')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (133, N'Consultar Mediciones', N'OP046')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (134, N'Guardar Medicion', N'OP047')
SET IDENTITY_INSERT [dbo].[Permiso] OFF
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (36, 3)
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (36, 4)
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (38, 128)
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
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (38, 129)
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (38, 10)
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (38, 11)
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (36, 130)
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (37, 131)
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (38, 21)
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (48, 132)
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (132, 133)
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (48, 38)
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (42, 79)
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (37, 80)
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (37, 81)
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (38, 82)
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (132, 134)
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (39, 85)
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (39, 86)
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (38, 87)
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
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal], [eliminado]) VALUES (27, N'Omelette de Huevo', 400, 1, 0, 1, 0, 0)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal], [eliminado]) VALUES (28, N'Huevos revueltos con Panceta', 450, 1, 0, 1, 0, 0)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal], [eliminado]) VALUES (29, N'Sandwich Simple de Jamon y Queso', 200, 1, 1, 1, 0, 0)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal], [eliminado]) VALUES (30, N'Porcion Chica de Almendras y Banan Deshidratada', 215, 1, 1, 1, 0, 0)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal], [eliminado]) VALUES (31, N'Vacio con Pure de Papas y Cebolla Condimentado', 388, 0, 0, 0, 1, 0)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal], [eliminado]) VALUES (32, N'Bife con Pure', 730, 0, 0, 0, 1, 0)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal], [eliminado]) VALUES (33, N'Seis Canelones de Espinaca', 730, 0, 0, 0, 1, 0)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal], [eliminado]) VALUES (34, N'Yogur con Frutas', 350, 0, 0, 1, 0, 0)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal], [eliminado]) VALUES (35, N'Sandwich con Huevo y Leche', 460, 1, 1, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[Plato] OFF
SET IDENTITY_INSERT [dbo].[Rutina] ON 

INSERT [dbo].[Rutina] ([idDiaEjercicioDomingo], [idDiaEjercicioJueves], [idDiaEjercicioLunes], [idDiaEjercicioMartes], [idDiaEjercicioMiercoles], [idDiaEjercicioSabado], [idDiaEjercicioViernes], [rutinaID], [nombre]) VALUES (28, 25, 22, 23, 24, 27, 26, 3, N'Prueba')
INSERT [dbo].[Rutina] ([idDiaEjercicioDomingo], [idDiaEjercicioJueves], [idDiaEjercicioLunes], [idDiaEjercicioMartes], [idDiaEjercicioMiercoles], [idDiaEjercicioSabado], [idDiaEjercicioViernes], [rutinaID], [nombre]) VALUES (NULL, 38, 37, NULL, NULL, 39, NULL, 6, N'Intensiva')
INSERT [dbo].[Rutina] ([idDiaEjercicioDomingo], [idDiaEjercicioJueves], [idDiaEjercicioLunes], [idDiaEjercicioMartes], [idDiaEjercicioMiercoles], [idDiaEjercicioSabado], [idDiaEjercicioViernes], [rutinaID], [nombre]) VALUES (NULL, NULL, 40, NULL, 41, NULL, 42, 7, N'Liviana')
SET IDENTITY_INSERT [dbo].[Rutina] OFF
SET IDENTITY_INSERT [dbo].[Tratamiento] ON 

INSERT [dbo].[Tratamiento] ([fechaFinalizado], [fechaInicio], [tratamientoID], [dietaID], [rutinaID], [pacienteID]) VALUES (NULL, CAST(N'2019-11-04' AS Date), 3, 6, 3, 1)
INSERT [dbo].[Tratamiento] ([fechaFinalizado], [fechaInicio], [tratamientoID], [dietaID], [rutinaID], [pacienteID]) VALUES (CAST(N'2019-11-11' AS Date), CAST(N'2019-11-11' AS Date), 4, 1, NULL, 7)
INSERT [dbo].[Tratamiento] ([fechaFinalizado], [fechaInicio], [tratamientoID], [dietaID], [rutinaID], [pacienteID]) VALUES (CAST(N'2019-10-29' AS Date), CAST(N'2019-10-29' AS Date), 5, 7, NULL, 3)
INSERT [dbo].[Tratamiento] ([fechaFinalizado], [fechaInicio], [tratamientoID], [dietaID], [rutinaID], [pacienteID]) VALUES (NULL, CAST(N'2019-10-29' AS Date), 6, 8, NULL, 3)
INSERT [dbo].[Tratamiento] ([fechaFinalizado], [fechaInicio], [tratamientoID], [dietaID], [rutinaID], [pacienteID]) VALUES (CAST(N'2019-11-11' AS Date), CAST(N'2019-11-11' AS Date), 7, 9, 3, 7)
INSERT [dbo].[Tratamiento] ([fechaFinalizado], [fechaInicio], [tratamientoID], [dietaID], [rutinaID], [pacienteID]) VALUES (CAST(N'2019-11-11' AS Date), CAST(N'2019-11-11' AS Date), 8, 10, 3, 7)
INSERT [dbo].[Tratamiento] ([fechaFinalizado], [fechaInicio], [tratamientoID], [dietaID], [rutinaID], [pacienteID]) VALUES (NULL, CAST(N'2019-11-11' AS Date), 9, 11, 7, 7)
INSERT [dbo].[Tratamiento] ([fechaFinalizado], [fechaInicio], [tratamientoID], [dietaID], [rutinaID], [pacienteID]) VALUES (NULL, CAST(N'2019-11-14' AS Date), 10, 12, 6, 12)
SET IDENTITY_INSERT [dbo].[Tratamiento] OFF
SET IDENTITY_INSERT [dbo].[Turno] ON 

INSERT [dbo].[Turno] ([fecha], [turnoID], [pacienteID], [nutricionistaID], [horarioID], [motivo], [eliminado]) VALUES (CAST(N'2019-10-08' AS Date), 2, 1, 1, 20, NULL, 0)
INSERT [dbo].[Turno] ([fecha], [turnoID], [pacienteID], [nutricionistaID], [horarioID], [motivo], [eliminado]) VALUES (CAST(N'2019-10-15' AS Date), 6, 1, 1, 9, N'Consulta de Rutina', 0)
INSERT [dbo].[Turno] ([fecha], [turnoID], [pacienteID], [nutricionistaID], [horarioID], [motivo], [eliminado]) VALUES (CAST(N'2019-10-29' AS Date), 7, 3, 1, 5, N'Prueba', 0)
INSERT [dbo].[Turno] ([fecha], [turnoID], [pacienteID], [nutricionistaID], [horarioID], [motivo], [eliminado]) VALUES (CAST(N'2019-11-04' AS Date), 8, 1, 1, 6, N'Control General', 0)
INSERT [dbo].[Turno] ([fecha], [turnoID], [pacienteID], [nutricionistaID], [horarioID], [motivo], [eliminado]) VALUES (CAST(N'2019-11-11' AS Date), 10, 7, 1, 5, N'', 0)
INSERT [dbo].[Turno] ([fecha], [turnoID], [pacienteID], [nutricionistaID], [horarioID], [motivo], [eliminado]) VALUES (CAST(N'2019-11-11' AS Date), 12, 7, 1, 6, N'', 0)
INSERT [dbo].[Turno] ([fecha], [turnoID], [pacienteID], [nutricionistaID], [horarioID], [motivo], [eliminado]) VALUES (CAST(N'2019-11-11' AS Date), 14, 7, 1, 19, N'', 0)
INSERT [dbo].[Turno] ([fecha], [turnoID], [pacienteID], [nutricionistaID], [horarioID], [motivo], [eliminado]) VALUES (CAST(N'2020-03-10' AS Date), 15, 7, 1, 15, N'', 0)
INSERT [dbo].[Turno] ([fecha], [turnoID], [pacienteID], [nutricionistaID], [horarioID], [motivo], [eliminado]) VALUES (CAST(N'2020-03-10' AS Date), 16, 7, 1, 16, N'', 0)
INSERT [dbo].[Turno] ([fecha], [turnoID], [pacienteID], [nutricionistaID], [horarioID], [motivo], [eliminado]) VALUES (CAST(N'2020-03-10' AS Date), 17, 7, 1, 17, N'', 0)
INSERT [dbo].[Turno] ([fecha], [turnoID], [pacienteID], [nutricionistaID], [horarioID], [motivo], [eliminado]) VALUES (CAST(N'2020-03-10' AS Date), 18, 7, 1, 18, N'', 0)
INSERT [dbo].[Turno] ([fecha], [turnoID], [pacienteID], [nutricionistaID], [horarioID], [motivo], [eliminado]) VALUES (CAST(N'2020-03-10' AS Date), 19, 7, 1, 19, N'', 0)
INSERT [dbo].[Turno] ([fecha], [turnoID], [pacienteID], [nutricionistaID], [horarioID], [motivo], [eliminado]) VALUES (CAST(N'2020-03-10' AS Date), 20, 7, 1, 20, N'', 0)
INSERT [dbo].[Turno] ([fecha], [turnoID], [pacienteID], [nutricionistaID], [horarioID], [motivo], [eliminado]) VALUES (CAST(N'2020-03-10' AS Date), 21, 7, 1, 21, N'', 0)
INSERT [dbo].[Turno] ([fecha], [turnoID], [pacienteID], [nutricionistaID], [horarioID], [motivo], [eliminado]) VALUES (CAST(N'2020-03-10' AS Date), 22, 7, 1, 22, N'', 0)
INSERT [dbo].[Turno] ([fecha], [turnoID], [pacienteID], [nutricionistaID], [horarioID], [motivo], [eliminado]) VALUES (CAST(N'2019-10-14' AS Date), 23, 3, 1, 5, N'', 0)
INSERT [dbo].[Turno] ([fecha], [turnoID], [pacienteID], [nutricionistaID], [horarioID], [motivo], [eliminado]) VALUES (CAST(N'2019-11-19' AS Date), 24, 1, 1, 9, N'Consulta tipica', 0)
INSERT [dbo].[Turno] ([fecha], [turnoID], [pacienteID], [nutricionistaID], [horarioID], [motivo], [eliminado]) VALUES (CAST(N'2019-11-26' AS Date), 25, 1, 1, 5, N'Otra consulta tipica', 0)
INSERT [dbo].[Turno] ([fecha], [turnoID], [pacienteID], [nutricionistaID], [horarioID], [motivo], [eliminado]) VALUES (CAST(N'2019-11-20' AS Date), 26, 1, 1, 8, N'Prueba', 1)
INSERT [dbo].[Turno] ([fecha], [turnoID], [pacienteID], [nutricionistaID], [horarioID], [motivo], [eliminado]) VALUES (CAST(N'2019-11-20' AS Date), 28, 1, 1, 8, N'Prueba2', 1)
INSERT [dbo].[Turno] ([fecha], [turnoID], [pacienteID], [nutricionistaID], [horarioID], [motivo], [eliminado]) VALUES (CAST(N'2019-11-20' AS Date), 29, 1, 1, 8, N'Prueba 3', 0)
INSERT [dbo].[Turno] ([fecha], [turnoID], [pacienteID], [nutricionistaID], [horarioID], [motivo], [eliminado]) VALUES (CAST(N'2019-11-19' AS Date), 30, 3, 22, 9, N'Prueba', 0)
INSERT [dbo].[Turno] ([fecha], [turnoID], [pacienteID], [nutricionistaID], [horarioID], [motivo], [eliminado]) VALUES (CAST(N'2019-11-14' AS Date), 31, 12, 1, 5, N'', 0)
SET IDENTITY_INSERT [dbo].[Turno] OFF
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([usuarioID], [username], [password], [intentos], [eliminado], [DVH]) VALUES (1, N'test', N'b08c8c585b6d67164c163767076445d6', 0, 0, 34814)
INSERT [dbo].[Usuario] ([usuarioID], [username], [password], [intentos], [eliminado], [DVH]) VALUES (6, N'crisnieto', N'a404fbc5011df2716580b9362d43fc6e', 0, 0, 35940)
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
INSERT [dbo].[Usuario] ([usuarioID], [username], [password], [intentos], [eliminado], [DVH]) VALUES (36, N'sinpermiso', N'b4a78c3c76b09317f3ec8945ec2b35ef', 0, 0, 34902)
INSERT [dbo].[Usuario] ([usuarioID], [username], [password], [intentos], [eliminado], [DVH]) VALUES (37, N'nutricionista', N'b08c8c585b6d67164c163767076445d6', 0, 0, 36280)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
/****** Object:  Index [IX_Nutricionista]    Script Date: 11/12/2019 1:14:21 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Nutricionista] ON [dbo].[Nutricionista]
(
	[dni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Paciente_1]    Script Date: 11/12/2019 1:14:21 PM ******/
ALTER TABLE [dbo].[Paciente] ADD  CONSTRAINT [IX_Paciente_1] UNIQUE NONCLUSTERED 
(
	[dni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Permiso]    Script Date: 11/12/2019 1:14:21 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Permiso] ON [dbo].[Permiso]
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Usuario]    Script Date: 11/12/2019 1:14:21 PM ******/
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
ALTER TABLE [dbo].[DiaEjercicio]  WITH CHECK ADD  CONSTRAINT [FK_DiaEjercicio_DiaEjercicio] FOREIGN KEY([ejercicioID])
REFERENCES [dbo].[Ejercicio] ([ejercicioID])
GO
ALTER TABLE [dbo].[DiaEjercicio] CHECK CONSTRAINT [FK_DiaEjercicio_DiaEjercicio]
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
ALTER TABLE [dbo].[Rutina]  WITH CHECK ADD  CONSTRAINT [FK_Rutina_DiaEjercicio_Domingo] FOREIGN KEY([idDiaEjercicioDomingo])
REFERENCES [dbo].[DiaEjercicio] ([diaEjercicioID])
GO
ALTER TABLE [dbo].[Rutina] CHECK CONSTRAINT [FK_Rutina_DiaEjercicio_Domingo]
GO
ALTER TABLE [dbo].[Rutina]  WITH CHECK ADD  CONSTRAINT [FK_Rutina_DiaEjercicio_Jueves] FOREIGN KEY([idDiaEjercicioJueves])
REFERENCES [dbo].[DiaEjercicio] ([diaEjercicioID])
GO
ALTER TABLE [dbo].[Rutina] CHECK CONSTRAINT [FK_Rutina_DiaEjercicio_Jueves]
GO
ALTER TABLE [dbo].[Rutina]  WITH CHECK ADD  CONSTRAINT [FK_Rutina_DiaEjercicio_Lunes] FOREIGN KEY([idDiaEjercicioLunes])
REFERENCES [dbo].[DiaEjercicio] ([diaEjercicioID])
GO
ALTER TABLE [dbo].[Rutina] CHECK CONSTRAINT [FK_Rutina_DiaEjercicio_Lunes]
GO
ALTER TABLE [dbo].[Rutina]  WITH CHECK ADD  CONSTRAINT [FK_Rutina_DiaEjercicio_Martes] FOREIGN KEY([idDiaEjercicioMartes])
REFERENCES [dbo].[DiaEjercicio] ([diaEjercicioID])
GO
ALTER TABLE [dbo].[Rutina] CHECK CONSTRAINT [FK_Rutina_DiaEjercicio_Martes]
GO
ALTER TABLE [dbo].[Rutina]  WITH CHECK ADD  CONSTRAINT [FK_Rutina_DiaEjercicio_Miercoles] FOREIGN KEY([idDiaEjercicioMiercoles])
REFERENCES [dbo].[DiaEjercicio] ([diaEjercicioID])
GO
ALTER TABLE [dbo].[Rutina] CHECK CONSTRAINT [FK_Rutina_DiaEjercicio_Miercoles]
GO
ALTER TABLE [dbo].[Rutina]  WITH CHECK ADD  CONSTRAINT [FK_Rutina_DiaEjercicio_Sabado] FOREIGN KEY([idDiaEjercicioSabado])
REFERENCES [dbo].[DiaEjercicio] ([diaEjercicioID])
GO
ALTER TABLE [dbo].[Rutina] CHECK CONSTRAINT [FK_Rutina_DiaEjercicio_Sabado]
GO
ALTER TABLE [dbo].[Rutina]  WITH CHECK ADD  CONSTRAINT [FK_Rutina_DiaEjercicio_Viernes] FOREIGN KEY([idDiaEjercicioViernes])
REFERENCES [dbo].[DiaEjercicio] ([diaEjercicioID])
GO
ALTER TABLE [dbo].[Rutina] CHECK CONSTRAINT [FK_Rutina_DiaEjercicio_Viernes]
GO
ALTER TABLE [dbo].[Tratamiento]  WITH CHECK ADD  CONSTRAINT [FK_Tratamiento_Dieta] FOREIGN KEY([dietaID])
REFERENCES [dbo].[Dieta] ([dietaID])
GO
ALTER TABLE [dbo].[Tratamiento] CHECK CONSTRAINT [FK_Tratamiento_Dieta]
GO
ALTER TABLE [dbo].[Tratamiento]  WITH CHECK ADD  CONSTRAINT [FK_Tratamiento_Paciente] FOREIGN KEY([pacienteID])
REFERENCES [dbo].[Paciente] ([pacienteID])
GO
ALTER TABLE [dbo].[Tratamiento] CHECK CONSTRAINT [FK_Tratamiento_Paciente]
GO
ALTER TABLE [dbo].[Tratamiento]  WITH CHECK ADD  CONSTRAINT [FK_Tratamiento_Rutina] FOREIGN KEY([rutinaID])
REFERENCES [dbo].[Rutina] ([rutinaID])
GO
ALTER TABLE [dbo].[Tratamiento] CHECK CONSTRAINT [FK_Tratamiento_Rutina]
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
