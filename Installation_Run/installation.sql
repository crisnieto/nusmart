USE [master]
GO
/****** Object:  Database [nusmart]    Script Date: 12/9/2019 5:06:10 PM ******/
CREATE DATABASE [nusmart]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'nusmart', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\nusmart.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'nusmart_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\nusmart_log.ldf' , SIZE = 1344KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  Table [dbo].[Alimento]    Script Date: 12/9/2019 5:06:10 PM ******/
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
 CONSTRAINT [PK_Alimento] PRIMARY KEY CLUSTERED 
(
	[alimentoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Bitacora]    Script Date: 12/9/2019 5:06:10 PM ******/
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
/****** Object:  Table [dbo].[DiaAlimenticio]    Script Date: 12/9/2019 5:06:10 PM ******/
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
/****** Object:  Table [dbo].[DiaEjercicio]    Script Date: 12/9/2019 5:06:10 PM ******/
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
/****** Object:  Table [dbo].[Dieta]    Script Date: 12/9/2019 5:06:10 PM ******/
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
/****** Object:  Table [dbo].[DVV]    Script Date: 12/9/2019 5:06:10 PM ******/
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
/****** Object:  Table [dbo].[Ejercicio]    Script Date: 12/9/2019 5:06:10 PM ******/
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
/****** Object:  Table [dbo].[Horario]    Script Date: 12/9/2019 5:06:10 PM ******/
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
/****** Object:  Table [dbo].[Idioma]    Script Date: 12/9/2019 5:06:10 PM ******/
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
/****** Object:  Table [dbo].[JoinAlimentoPlato]    Script Date: 12/9/2019 5:06:10 PM ******/
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
/****** Object:  Table [dbo].[JoinUsuarioPermiso]    Script Date: 12/9/2019 5:06:10 PM ******/
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
/****** Object:  Table [dbo].[Leyenda]    Script Date: 12/9/2019 5:06:10 PM ******/
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
/****** Object:  Table [dbo].[Medicion]    Script Date: 12/9/2019 5:06:10 PM ******/
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
/****** Object:  Table [dbo].[Nutricionista]    Script Date: 12/9/2019 5:06:10 PM ******/
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
/****** Object:  Table [dbo].[Paciente]    Script Date: 12/9/2019 5:06:10 PM ******/
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
	[fechaNacimiento] [date] NOT NULL,
 CONSTRAINT [PK_Paciente] PRIMARY KEY CLUSTERED 
(
	[pacienteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Permiso]    Script Date: 12/9/2019 5:06:10 PM ******/
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
/****** Object:  Table [dbo].[Permiso_Jerarquia]    Script Date: 12/9/2019 5:06:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permiso_Jerarquia](
	[IdPadrePermiso] [int] NOT NULL,
	[IdHijoPermiso] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Plato]    Script Date: 12/9/2019 5:06:10 PM ******/
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
 CONSTRAINT [PK_Plato] PRIMARY KEY CLUSTERED 
(
	[platoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rutina]    Script Date: 12/9/2019 5:06:10 PM ******/
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
/****** Object:  Table [dbo].[Tratamiento]    Script Date: 12/9/2019 5:06:10 PM ******/
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
/****** Object:  Table [dbo].[Turno]    Script Date: 12/9/2019 5:06:10 PM ******/
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
/****** Object:  Table [dbo].[Usuario]    Script Date: 12/9/2019 5:06:10 PM ******/
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

INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (140, N'Vaso de Leche Entera', N'Lacteo', 4)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (160, N'Huevo Hervido', N'Vegetariano', 5)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (100, N'Yogur Descremado con Cereales', N'Lacteo', 6)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (45, N'Vaso de Jugo de Naranja', N'Bebida', 7)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (120, N'Vaso de Coca Cola', N'Bebida', 8)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (0, N'Agua', N'Bebida', 9)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (140, N'Huevo a la plancha', N'Vegetariano', 10)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (130, N'Arroz Blanco', N'Vegetariano', 12)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (150, N'Pechuga de Pollo', N'Carne', 13)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (100, N'Merluza', N'Carne', 14)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (90, N'Papa al Horno', N'Vegetariano', 15)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (120, N'Canelones de Espinaca', N'Vegetariano', 16)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (15, N'Salsa de Tomate', N'Vegetariano', 17)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (65, N'Atun', N'Carne', 18)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (270, N'Fideos Tirabuzon', N'Vegetariano', 19)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (35, N'Kanikama', N'Carne', 20)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (180, N'Huevo Frito', N'Vegetariano', 21)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (90, N'Papa Hervida', N'Vegetariano', 22)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (110, N'Jamon Cocido', N'Carne', 23)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (250, N'Queso Fresco Cremoso', N'Vegetariano', 24)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (103, N'Tapa de Tarta', N'Vegetariano', 25)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (50, N'Manzana', N'Vegetariano', 26)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (55, N'Piña', N'Vegetariano', 27)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (55, N'Pera', N'Vegetariano', 28)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (90, N'Banana', N'Vegetariano', 29)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (20, N'Tomate', N'Vegetariano', 30)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (200, N'Carne Picada', N'Carne', 31)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (25, N'Berenjena', N'Vegetariano', 32)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (28, N'Cebolla Chica', N'Vegetariano', 33)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (200, N'Carne Hamburguesa', N'Carne', 34)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (180, N'Pan Hamburguesa', N'Vegetariano', 35)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (90, N'Salchicha', N'Carne', 36)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (130, N'Pan de Pancho', N'Vegetariano', 37)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (20, N'Mayonesa Light (Cucharada)', N'Vegetariano', 38)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (130, N'Lentejas', N'Vegetariano', 39)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (20, N'Ajo', N'Vegetariano', 41)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (40, N'Zanahoria', N'Vegetariano', 42)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (26, N'Calabaza', N'Vegetariano', 43)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (350, N'Papas Fritas', N'Vegetariano', 44)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (600, N'Bife Carne Grande', N'Carne', 45)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (35, N'Pan Tostado', N'Vegetariano', 46)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (55, N'Queso Untable Saborizado', N'Vegetariano', 47)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (50, N'Cafe con Leche', N'Bebida', 48)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (20, N'Azucar (Cucharada)', N'Vegetariano', 49)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (165, N'Pistachos (Puñado)', N'Vegetariano', 50)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (100, N'Nueces (Puñado)', N'Vegetariano', 51)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (162, N'Almendras (Puñado)', N'Vegetariano', 52)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (114, N'Racion de Avena', N'Vegetariano', 53)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (105, N'Leche Entera', N'Vegetariano', 54)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (64, N'Miel (cucharada)', N'Vegetariano', 55)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (64, N'Yogur Cremoso', N'Lacteo', 56)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (110, N'Cereales Copos de Maiz', N'Cereal', 57)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (61, N'Kiwi', N'Fruta', 58)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (62, N'Uva', N'Fruta', 59)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (130, N'Galletita de Agua (5)', N'Vegetariano', 60)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (200, N'Milanesa', N'Carne', 62)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (200, N'Milanesa de Soja', N'Vegetariano', 63)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (50, N'Panceta', N'Carne', 64)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (50, N'Banana Deshidratada', N'Fruta', 65)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (200, N'Vacio', N'Carne', 66)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (100, N'Pure de Papas', N'Vegetal', 67)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (95, N'Barra de Cereal', N'Vegetariano', 68)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (130, N'Almohaditas de Avena', N'Vegetariano', 69)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (180, N'Fideos Integrales', N'Vegetariano', 70)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (230, N'Churrasco Mediano', N'Carne', 71)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (110, N'Arroz Integral', N'Vegetariano', 72)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (21, N'Espinaca', N'Vegetariano', 73)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (21, N'Espinaca', N'Vegetariano', 74)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (74, N'Pure de Zapallo', N'Vegetariano', 75)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (30, N'Aceituna', N'Vegetariano', 76)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (5, N'Mostaza', N'Vegetariano', 77)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (200, N'Panqueque deAvena', N'Vegetariano', 78)
INSERT [dbo].[Alimento] ([calorias], [nombre], [tipoAlimento], [alimentoID]) VALUES (364, N'Harina', N'Vegetariano', 79)
SET IDENTITY_INSERT [dbo].[Alimento] OFF
SET IDENTITY_INSERT [dbo].[Bitacora] ON 

INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-26 14:40:05.453' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 1, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Logout de Usuario', CAST(N'2019-11-26 14:40:07.277' AS DateTime), N'Se detectó un logout', N'Baja', 2, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-26 14:40:10.273' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 3, 38)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Busqueda De Turnos', CAST(N'2019-11-26 14:40:27.760' AS DateTime), N'Error en la busqueda de turnos: No es posible crear un turno para una fecha anterior a la actual', N'Alta', 4, 38)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Busqueda De Turnos', CAST(N'2019-11-26 14:41:30.273' AS DateTime), N'Error en la busqueda de turnos: No es posible crear un turno para una fecha anterior a la actual', N'Alta', 5, 38)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de turno', CAST(N'2019-11-26 14:41:36.563' AS DateTime), N'Se creo un turno para el paciente con id 1', N'Alta', 6, 38)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de turno', CAST(N'2019-11-26 14:42:07.930' AS DateTime), N'Se creo un turno para el paciente con id 16', N'Alta', 7, 38)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-26 14:42:32.670' AS DateTime), N'Calculo de BMI realizado por el usuario id: 38', N'Alta', 8, 38)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-26 14:42:33.360' AS DateTime), N'Calculo de BMI realizado por el usuario id: 38', N'Alta', 9, 38)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-26 14:42:33.360' AS DateTime), N'Calculo de BFP realizado por el usuario id: 38', N'Alta', 10, 38)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-26 14:42:36.793' AS DateTime), N'Calculo de BMI realizado por el usuario id: 38', N'Alta', 11, 38)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-26 14:42:37.320' AS DateTime), N'Calculo de BMI realizado por el usuario id: 38', N'Alta', 12, 38)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-26 14:42:37.323' AS DateTime), N'Calculo de BFP realizado por el usuario id: 38', N'Alta', 13, 38)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-26 14:42:37.890' AS DateTime), N'Calculo de BMI realizado por el usuario id: 38', N'Alta', 14, 38)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-26 14:42:37.890' AS DateTime), N'Calculo de BFP realizado por el usuario id: 38', N'Alta', 15, 38)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-26 14:42:38.013' AS DateTime), N'Calculo de BMI realizado por el usuario id: 38', N'Alta', 16, 38)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-26 14:42:38.013' AS DateTime), N'Calculo de BFP realizado por el usuario id: 38', N'Alta', 17, 38)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-26 14:42:38.530' AS DateTime), N'Calculo de BMI realizado por el usuario id: 38', N'Alta', 18, 38)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-26 14:42:38.530' AS DateTime), N'Calculo de BMI realizado por el usuario id: 38', N'Alta', 19, 38)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-26 14:42:38.530' AS DateTime), N'Calculo de BFP realizado por el usuario id: 38', N'Alta', 20, 38)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Guardar Medicion', CAST(N'2019-11-26 14:42:38.533' AS DateTime), N'Se guardo una nueva medicion para el turno con ID: 37', N'Media', 21, 38)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo Dieta Automatica', CAST(N'2019-11-26 14:42:40.770' AS DateTime), N'Se produjo un calculo de dieta para adelgazar', N'Baja', 22, 38)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo Dieta Automatica', CAST(N'2019-11-26 14:42:49.147' AS DateTime), N'Se produjo un calculo de dieta para adelgazar', N'Baja', 23, 38)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo Dieta Automatica', CAST(N'2019-11-26 14:42:58.327' AS DateTime), N'Se produjo un calculo de dieta para mantener peso', N'Baja', 24, 38)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo Dieta Automatica', CAST(N'2019-11-26 14:43:08.683' AS DateTime), N'Se produjo un calculo de dieta para engordar', N'Baja', 25, 38)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo Dieta Automatica', CAST(N'2019-11-26 14:43:17.400' AS DateTime), N'Se produjo un calculo de dieta para adelgazar', N'Baja', 26, 38)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Dieta Creada', CAST(N'2019-11-26 14:44:36.240' AS DateTime), N'Se creo una nueva dieta', N'Baja', 27, 38)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Finalizar Tratamiento', CAST(N'2019-11-26 14:45:03.467' AS DateTime), N'Se finalizo el tratamiento con id: 13', N'Media', 28, 38)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-26 14:46:03.117' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 29, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Finalizar Tratamiento', CAST(N'2019-11-26 14:46:13.130' AS DateTime), N'Se finalizo el tratamiento con id: 12', N'Media', 30, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-26 14:46:24.547' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 31, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-26 14:46:25.077' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 32, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-26 14:46:25.080' AS DateTime), N'Calculo de BFP realizado por el usuario id: 1', N'Alta', 33, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-26 14:46:30.447' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 34, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-26 14:46:32.253' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 35, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-26 14:46:32.253' AS DateTime), N'Calculo de BFP realizado por el usuario id: 1', N'Alta', 36, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-26 14:46:35.523' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 37, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-26 14:46:35.523' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 38, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-26 14:46:35.523' AS DateTime), N'Calculo de BFP realizado por el usuario id: 1', N'Alta', 39, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Guardar Medicion', CAST(N'2019-11-26 14:46:35.527' AS DateTime), N'Se guardo una nueva medicion para el turno con ID: 25', N'Media', 40, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo Dieta Automatica', CAST(N'2019-11-26 14:46:40.800' AS DateTime), N'Se produjo un calculo de dieta para adelgazar', N'Baja', 41, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-26 14:47:47.493' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 42, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Agregar Rutina', CAST(N'2019-11-26 14:47:58.423' AS DateTime), N'Se produjo un error al guardar una rutina: Ocurrio un error al intentar guardar la rutina. Por favor verifique que los datos ingresados sean validos.', N'Alta', 43, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-26 14:48:10.213' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 44, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-26 14:48:10.217' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 45, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-26 14:48:10.217' AS DateTime), N'Calculo de BFP realizado por el usuario id: 1', N'Alta', 46, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Guardar Medicion', CAST(N'2019-11-26 14:48:10.220' AS DateTime), N'Se guardo una nueva medicion para el turno con ID: 25', N'Media', 47, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo Dieta Automatica', CAST(N'2019-11-26 14:48:20.490' AS DateTime), N'Se produjo un calculo de dieta para adelgazar', N'Baja', 48, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Logout de Usuario', CAST(N'2019-11-26 14:48:33.180' AS DateTime), N'Se detectó un logout', N'Baja', 49, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-26 14:49:16.720' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 50, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-11-26 14:51:19.560' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 51, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-26 14:51:30.107' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 52, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-26 14:51:30.107' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 53, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-11-26 14:51:30.110' AS DateTime), N'Calculo de BFP realizado por el usuario id: 1', N'Alta', 54, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Guardar Medicion', CAST(N'2019-11-26 14:51:30.110' AS DateTime), N'Se guardo una nueva medicion para el turno con ID: 25', N'Media', 55, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo Dieta Automatica', CAST(N'2019-11-26 14:51:33.613' AS DateTime), N'Se produjo un calculo de dieta para adelgazar', N'Baja', 56, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Logout de Usuario', CAST(N'2019-11-26 14:51:49.993' AS DateTime), N'Se detectó un logout', N'Baja', 57, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-12-01 19:12:12.110' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 1003, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de turno', CAST(N'2019-12-01 19:12:46.293' AS DateTime), N'Se creo un turno para el paciente con id 1', N'Alta', 1004, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-12-01 19:13:05.460' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 1005, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-12-01 19:13:05.463' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 1006, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-12-01 19:13:05.463' AS DateTime), N'Calculo de BFP realizado por el usuario id: 1', N'Alta', 1007, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Guardar Medicion', CAST(N'2019-12-01 19:13:05.467' AS DateTime), N'Se guardo una nueva medicion para el turno con ID: 1036', N'Media', 1008, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-12-01 19:21:04.813' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 1009, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Agregar Plato', CAST(N'2019-12-01 19:23:33.310' AS DateTime), N'Se agrego correctamente un nuevo plato: Yogur y Tostadas', N'Alta', 1010, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Agregar Alimento', CAST(N'2019-12-01 19:24:44.857' AS DateTime), N'Se agrego un nuevo alimento: Barra de Cereal', N'Media', 1011, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Agregar Plato', CAST(N'2019-12-01 19:25:27.477' AS DateTime), N'Se agrego correctamente un nuevo plato: Barra de Cereal con Cafe', N'Alta', 1012, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Agregar Plato', CAST(N'2019-12-01 19:27:08.623' AS DateTime), N'Se agrego correctamente un nuevo plato: Manzana de Colacion', N'Alta', 1013, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Agregar Plato', CAST(N'2019-12-01 19:27:36.523' AS DateTime), N'Se agrego correctamente un nuevo plato: Banana de Colacion', N'Alta', 1014, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Agregar Plato', CAST(N'2019-12-01 19:28:58.297' AS DateTime), N'Se agrego correctamente un nuevo plato: Yogur con Cereales y Jugo de Naranja', N'Alta', 1015, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Agregar Alimento', CAST(N'2019-12-01 19:30:32.630' AS DateTime), N'Se agrego un nuevo alimento: Almohaditas de Avena', N'Media', 1016, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Agregar Plato', CAST(N'2019-12-01 19:31:59.440' AS DateTime), N'Se agrego correctamente un nuevo plato: Almohaditas de Avena y Cafe', N'Alta', 1017, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Agregar Alimento', CAST(N'2019-12-01 19:33:32.927' AS DateTime), N'Se agrego un nuevo alimento: Fideos Integrales', N'Media', 1018, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Agregar Plato', CAST(N'2019-12-01 19:34:17.327' AS DateTime), N'Se agrego correctamente un nuevo plato: Fideos Integrales con Pollo', N'Alta', 1019, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Agregar Alimento', CAST(N'2019-12-01 19:35:17.883' AS DateTime), N'Se agrego un nuevo alimento: Churrasco Mediano', N'Media', 1020, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Agregar Plato', CAST(N'2019-12-01 19:36:06.163' AS DateTime), N'Se agrego correctamente un nuevo plato: Churrasco con Zanahoria y Queso', N'Alta', 1021, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Agregar Alimento', CAST(N'2019-12-01 19:37:19.687' AS DateTime), N'Se agrego un nuevo alimento: Arroz Integral', N'Media', 1022, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Agregar Plato', CAST(N'2019-12-01 19:38:41.287' AS DateTime), N'Se agrego correctamente un nuevo plato: Milanesa con Arroz Integral queso untable y Mayonesa', N'Alta', 1023, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Agregar Alimento', CAST(N'2019-12-01 19:39:52.517' AS DateTime), N'Se agrego un nuevo alimento: Espinaca', N'Media', 1024, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Agregar Alimento', CAST(N'2019-12-01 19:40:13.490' AS DateTime), N'Se agrego un nuevo alimento: Espinaca', N'Media', 1025, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Agregar Plato', CAST(N'2019-12-01 19:41:41.037' AS DateTime), N'Se agrego correctamente un nuevo plato: Porcion de Budin de Espinaca y Arroz', N'Alta', 1026, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Agregar Plato', CAST(N'2019-12-01 19:43:38.510' AS DateTime), N'Se agrego correctamente un nuevo plato: Milanesa con Budin de Espinaca y Arroz', N'Alta', 1027, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Agregar Plato', CAST(N'2019-12-01 19:45:29.653' AS DateTime), N'Se agrego correctamente un nuevo plato: Porcion de Tarta de Espinaca', N'Alta', 1028, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Agregar Plato', CAST(N'2019-12-01 19:47:06.900' AS DateTime), N'Se agrego correctamente un nuevo plato: Pollo con papa hervida', N'Alta', 1029, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Agregar Alimento', CAST(N'2019-12-01 19:50:03.720' AS DateTime), N'Se agrego un nuevo alimento: Pure de Zapallo', N'Media', 1030, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Agregar Alimento', CAST(N'2019-12-01 19:51:47.200' AS DateTime), N'Se agrego un nuevo alimento: Aceituna', N'Media', 1031, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Agregar Alimento', CAST(N'2019-12-01 19:52:36.800' AS DateTime), N'Se agrego un nuevo alimento: Mostaza', N'Media', 1032, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Agregar Plato', CAST(N'2019-12-01 19:53:50.337' AS DateTime), N'Se agrego correctamente un nuevo plato: Pollo con papa hervida', N'Alta', 1033, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Agregar Plato', CAST(N'2019-12-01 19:58:52.203' AS DateTime), N'Se agrego correctamente un nuevo plato: Barra de Cereal con Jugo de Frutas', N'Alta', 1034, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Agregar Plato', CAST(N'2019-12-01 20:01:39.097' AS DateTime), N'Se agrego correctamente un nuevo plato: Milanesa de Soja con Pure Mixto', N'Alta', 1035, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Agregar Alimento', CAST(N'2019-12-01 20:03:32.680' AS DateTime), N'Se agrego un nuevo alimento: Panqueque deAvena', N'Media', 1036, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Agregar Plato', CAST(N'2019-12-01 20:04:15.950' AS DateTime), N'Se agrego correctamente un nuevo plato: Panqueque con Jugo', N'Alta', 1037, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Agregar Plato', CAST(N'2019-12-01 20:05:31.807' AS DateTime), N'Se agrego correctamente un nuevo plato: Churrasco con Pure', N'Alta', 1038, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Agregar Plato', CAST(N'2019-12-01 20:06:57.383' AS DateTime), N'Se agrego correctamente un nuevo plato: Dos Porciones de Pizza', N'Alta', 1039, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Agregar Plato', CAST(N'2019-12-01 20:09:16.563' AS DateTime), N'Se agrego correctamente un nuevo plato: Dos Porciones de Pizza', N'Alta', 1040, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Agregar Alimento', CAST(N'2019-12-01 20:11:28.530' AS DateTime), N'Se agrego un nuevo alimento: Harina', N'Media', 1041, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Agregar Plato', CAST(N'2019-12-01 20:13:00.043' AS DateTime), N'Se agrego correctamente un nuevo plato: Crepe de espinaca con Pollo', N'Alta', 1042, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Dieta Creada', CAST(N'2019-12-01 20:15:03.973' AS DateTime), N'Se creo una nueva dieta', N'Baja', 1043, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de Paciente', CAST(N'2019-12-01 20:16:56.030' AS DateTime), N'Se creo el paciente con DNI 37179957', N'Media', 1044, 1)
GO
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Creacion de turno', CAST(N'2019-12-01 20:17:04.723' AS DateTime), N'Se creo un turno para el paciente con id 17', N'Alta', 1045, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-12-01 20:17:52.517' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 1046, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-12-01 20:17:53.177' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 1047, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-12-01 20:17:53.177' AS DateTime), N'Calculo de BFP realizado por el usuario id: 1', N'Alta', 1048, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-12-01 20:17:58.070' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 1049, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-12-01 20:17:59.197' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 1050, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-12-01 20:17:59.200' AS DateTime), N'Calculo de BFP realizado por el usuario id: 1', N'Alta', 1051, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-12-01 20:18:02.120' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 1052, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-12-01 20:18:02.123' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 1053, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-12-01 20:18:02.123' AS DateTime), N'Calculo de BFP realizado por el usuario id: 1', N'Alta', 1054, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Guardar Medicion', CAST(N'2019-12-01 20:18:02.123' AS DateTime), N'Se guardo una nueva medicion para el turno con ID: 1037', N'Media', 1055, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Agregar Rutina', CAST(N'2019-12-01 20:22:43.707' AS DateTime), N'Se agrego una nueva rutina: Rutina Aerobica Liviana', N'Media', 1056, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-12-07 15:08:40.820' AS DateTime), N'Se detecto un login incorrecto', N'Media', 1057, NULL)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-12-07 15:08:40.893' AS DateTime), N'Ocurrio un error en el login de usuario No se pudo loguear correctamente', N'Media', 1058, NULL)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-12-07 15:08:46.337' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 1059, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Logout de Usuario', CAST(N'2019-12-07 15:08:49.680' AS DateTime), N'Se detectó un logout', N'Baja', 1060, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-12-07 15:08:53.997' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 1061, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Logout de Usuario', CAST(N'2019-12-07 15:08:56.050' AS DateTime), N'Se detectó un logout', N'Baja', 1062, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-12-07 15:08:59.977' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 1063, 38)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Logout de Usuario', CAST(N'2019-12-07 15:09:02.290' AS DateTime), N'Se detectó un logout', N'Baja', 1064, 38)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-12-07 15:09:06.760' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 1065, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-12-08 00:12:24.760' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 1066, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Login de Usuario', CAST(N'2019-12-09 14:05:37.517' AS DateTime), N'Se detecto un evento de ingreso', N'Media', 2057, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-12-09 14:06:10.707' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 2058, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-12-09 14:06:10.710' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 2059, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-12-09 14:06:10.710' AS DateTime), N'Calculo de BFP realizado por el usuario id: 1', N'Alta', 2060, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Guardar Medicion', CAST(N'2019-12-09 14:06:10.727' AS DateTime), N'Se guardo una nueva medicion para el turno con ID: 20', N'Media', 2061, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo Dieta Automatica', CAST(N'2019-12-09 14:06:18.090' AS DateTime), N'Se produjo un calculo de dieta para adelgazar', N'Baja', 2062, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Proyeccion de peso', CAST(N'2019-12-09 14:06:35.560' AS DateTime), N'Se solicito una nueva proyeccion de peso', N'Media', 2063, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Finalizar Tratamiento', CAST(N'2019-12-09 14:06:42.063' AS DateTime), N'Se finalizo el tratamiento con id: 1015', N'Media', 2064, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-12-09 14:07:24.730' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 2065, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-12-09 14:07:24.730' AS DateTime), N'Calculo de BMI realizado por el usuario id: 1', N'Alta', 2066, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Calculo BMI', CAST(N'2019-12-09 14:07:24.733' AS DateTime), N'Calculo de BFP realizado por el usuario id: 1', N'Alta', 2067, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Guardar Medicion', CAST(N'2019-12-09 14:07:24.733' AS DateTime), N'Se guardo una nueva medicion para el turno con ID: 17', N'Media', 2068, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Proyeccion de peso', CAST(N'2019-12-09 14:07:35.770' AS DateTime), N'Se solicito una nueva proyeccion de peso', N'Media', 2069, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Finalizar Tratamiento', CAST(N'2019-12-09 14:07:46.973' AS DateTime), N'Se finalizo el tratamiento con id: 1016', N'Media', 2070, 1)
INSERT [dbo].[Bitacora] ([actividad], [fecha], [mensaje], [tipoCriticidad], [bitacoraID], [usuarioID]) VALUES (N'Logout de Usuario', CAST(N'2019-12-09 14:07:49.487' AS DateTime), N'Se detectó un logout', N'Baja', 2071, 1)
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
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (31, 11, 30, 24, 21, 113)
GO
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (3, 8, 29, 24, 21, 114)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (7, 4, 29, 26, 25, 115)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (7, 4, 30, 26, 18, 116)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (8, 11, 30, 26, 17, 117)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (9, 8, 29, 24, 17, 118)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (12, 11, 29, 26, 24, 119)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (6, 10, 20, 24, 21, 120)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (5, 7, 20, 23, 20, 121)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (4, 5, 17, 18, 24, 122)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (4, 5, 17, 24, 20, 123)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (7, 7, 17, 24, 24, 124)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (7, 7, 18, 29, 20, 125)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (5, 8, 20, 23, 21, 126)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (6, 6, 19, 26, 19, 127)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (4, 5, 24, 22, 18, 128)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (6, 5, 18, 22, 18, 129)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (3, 7, 17, 22, 19, 130)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (9, 4, 19, 23, 25, 131)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (6, 6, 19, 26, 19, 133)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (4, 5, 24, 22, 18, 134)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (6, 5, 18, 22, 18, 135)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (3, 7, 17, 22, 19, 136)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (9, 4, 19, 23, 25, 137)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (6, 7, 18, 25, 18, 138)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (5, 8, 21, 26, 17, 139)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (8, 3, 29, 25, 17, 140)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (8, 3, 30, 24, 17, 141)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (12, 8, 29, 24, 17, 142)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (5, 3, 29, 26, 18, 143)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (31, 8, 29, 25, 21, 144)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (31, 8, 30, 26, 21, 145)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (7, 4, 30, 25, 24, 146)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (5, 4, 18, 23, 21, 147)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (31, 4, 30, 25, 17, 148)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (7, 3, 30, 24, 17, 149)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (7, 3, 30, 26, 24, 150)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (12, 11, 30, 26, 18, 151)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (9, 4, 29, 24, 25, 152)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (12, 8, 30, 26, 24, 153)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (42, 43, 36, 37, 41, 1147)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (43, 44, 40, 38, 21, 1148)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (46, 48, 36, 39, 50, 1149)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (47, 49, 40, 37, 21, 1150)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (49, 51, 36, 41, 50, 1151)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (53, 54, 52, 38, 17, 1152)
INSERT [dbo].[DiaAlimenticio] ([idPlatoAlmuerzo], [idPlatoCena], [idPlatoDesayuno], [idPlatoColacion], [idPlatoMerienda], [diaAlimenticioID]) VALUES (42, 56, 1, 38, 17, 1153)
SET IDENTITY_INSERT [dbo].[DiaAlimenticio] OFF
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
INSERT [dbo].[DiaEjercicio] ([diaEjercicioID], [ejercicioID], [duracionDia]) VALUES (43, 2, 50)
INSERT [dbo].[DiaEjercicio] ([diaEjercicioID], [ejercicioID], [duracionDia]) VALUES (44, 3, 50)
INSERT [dbo].[DiaEjercicio] ([diaEjercicioID], [ejercicioID], [duracionDia]) VALUES (45, 6, 0)
INSERT [dbo].[DiaEjercicio] ([diaEjercicioID], [ejercicioID], [duracionDia]) VALUES (46, 2, 20)
INSERT [dbo].[DiaEjercicio] ([diaEjercicioID], [ejercicioID], [duracionDia]) VALUES (47, 2, 20)
INSERT [dbo].[DiaEjercicio] ([diaEjercicioID], [ejercicioID], [duracionDia]) VALUES (48, 2, 20)
INSERT [dbo].[DiaEjercicio] ([diaEjercicioID], [ejercicioID], [duracionDia]) VALUES (49, 2, 20)
INSERT [dbo].[DiaEjercicio] ([diaEjercicioID], [ejercicioID], [duracionDia]) VALUES (50, 2, 20)
INSERT [dbo].[DiaEjercicio] ([diaEjercicioID], [ejercicioID], [duracionDia]) VALUES (51, 2, 20)
INSERT [dbo].[DiaEjercicio] ([diaEjercicioID], [ejercicioID], [duracionDia]) VALUES (52, 5, 10)
INSERT [dbo].[DiaEjercicio] ([diaEjercicioID], [ejercicioID], [duracionDia]) VALUES (53, 3, 20)
INSERT [dbo].[DiaEjercicio] ([diaEjercicioID], [ejercicioID], [duracionDia]) VALUES (54, 4, 10)
INSERT [dbo].[DiaEjercicio] ([diaEjercicioID], [ejercicioID], [duracionDia]) VALUES (55, 4, 60)
INSERT [dbo].[DiaEjercicio] ([diaEjercicioID], [ejercicioID], [duracionDia]) VALUES (56, 1, 30)
INSERT [dbo].[DiaEjercicio] ([diaEjercicioID], [ejercicioID], [duracionDia]) VALUES (57, 4, 60)
INSERT [dbo].[DiaEjercicio] ([diaEjercicioID], [ejercicioID], [duracionDia]) VALUES (58, 1, 30)
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
INSERT [dbo].[Dieta] ([domingo], [jueves], [lunes], [martes], [miercoles], [sabado], [viernes], [dietaID], [esGeneradaAutomaticamente], [nombre]) VALUES (119, 116, 113, 114, 115, 118, 117, 13, 1, NULL)
INSERT [dbo].[Dieta] ([domingo], [jueves], [lunes], [martes], [miercoles], [sabado], [viernes], [dietaID], [esGeneradaAutomaticamente], [nombre]) VALUES (146, 143, 140, 141, 142, 145, 144, 16, 1, N'Dieta generada para adelgazar')
INSERT [dbo].[Dieta] ([domingo], [jueves], [lunes], [martes], [miercoles], [sabado], [viernes], [dietaID], [esGeneradaAutomaticamente], [nombre]) VALUES (153, 150, 147, 148, 149, 152, 151, 17, 1, N'Dieta generada para adelgazar')
INSERT [dbo].[Dieta] ([domingo], [jueves], [lunes], [martes], [miercoles], [sabado], [viernes], [dietaID], [esGeneradaAutomaticamente], [nombre]) VALUES (1153, 1150, 1147, 1148, 1149, 1152, 1151, 1017, 0, N'Plan de Alimentacion Semanal')
SET IDENTITY_INSERT [dbo].[Dieta] OFF
INSERT [dbo].[DVV] ([nombreTabla], [valor], [idDVV]) VALUES (N'Usuario', 608262, 1)
INSERT [dbo].[DVV] ([nombreTabla], [valor], [idDVV]) VALUES (N'Nutricionista', 633225, 2)
SET IDENTITY_INSERT [dbo].[Ejercicio] ON 

INSERT [dbo].[Ejercicio] ([caloriasQuemadasHora], [nombre], [ejercicioID]) VALUES (250, N'Caminata Rapida', 1)
INSERT [dbo].[Ejercicio] ([caloriasQuemadasHora], [nombre], [ejercicioID]) VALUES (100, N'Yoga', 2)
INSERT [dbo].[Ejercicio] ([caloriasQuemadasHora], [nombre], [ejercicioID]) VALUES (450, N'Paddle', 3)
INSERT [dbo].[Ejercicio] ([caloriasQuemadasHora], [nombre], [ejercicioID]) VALUES (500, N'Zumba', 4)
INSERT [dbo].[Ejercicio] ([caloriasQuemadasHora], [nombre], [ejercicioID]) VALUES (900, N'Crossfit', 5)
INSERT [dbo].[Ejercicio] ([caloriasQuemadasHora], [nombre], [ejercicioID]) VALUES (800, N'Spinning', 6)
INSERT [dbo].[Ejercicio] ([caloriasQuemadasHora], [nombre], [ejercicioID]) VALUES (100, N'Pruebita', 7)
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
INSERT [dbo].[Idioma] ([descripcionIdioma], [nombreIdioma], [idiomaID], [eliminado]) VALUES (N'Idioma de test', N'Test', 9, 1)
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
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'56', N'36')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'46', N'36')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'7', N'36')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'68', N'37')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'48', N'37')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'26', N'38')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'29', N'39')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'6', N'40')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'7', N'40')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'69', N'41')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'48', N'41')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'70', N'42')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'13', N'42')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'71', N'43')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'42', N'43')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'47', N'43')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'5', N'43')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'72', N'44')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'62', N'44')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'47', N'44')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'38', N'44')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'73', N'45')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'12', N'45')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'24', N'45')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'33', N'45')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'62', N'46')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'73', N'46')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'72', N'46')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'25', N'47')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'73', N'47')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'5', N'47')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'33', N'47')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'13', N'48')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'22', N'48')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'67', N'49')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'75', N'49')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'77', N'49')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'31', N'49')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'5', N'49')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'76', N'49')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'33', N'49')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'26', N'50')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'29', N'50')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'7', N'50')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'68', N'50')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'63', N'51')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'67', N'51')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'75', N'51')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'78', N'52')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'55', N'52')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'7', N'52')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'71', N'53')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'67', N'53')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'24', N'54')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'17', N'54')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'76', N'54')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'5', N'55')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'23', N'55')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'79', N'56')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'5', N'56')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'73', N'56')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'54', N'56')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'13', N'56')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'47', N'56')
INSERT [dbo].[JoinAlimentoPlato] ([alimentoID], [platoID]) VALUES (N'33', N'56')
INSERT [dbo].[JoinUsuarioPermiso] ([usuarioID], [permisoID]) VALUES (1, 36)
INSERT [dbo].[JoinUsuarioPermiso] ([usuarioID], [permisoID]) VALUES (1, 37)
INSERT [dbo].[JoinUsuarioPermiso] ([usuarioID], [permisoID]) VALUES (1, 38)
INSERT [dbo].[JoinUsuarioPermiso] ([usuarioID], [permisoID]) VALUES (1, 39)
INSERT [dbo].[JoinUsuarioPermiso] ([usuarioID], [permisoID]) VALUES (1, 42)
INSERT [dbo].[JoinUsuarioPermiso] ([usuarioID], [permisoID]) VALUES (1, 48)
INSERT [dbo].[JoinUsuarioPermiso] ([usuarioID], [permisoID]) VALUES (1, 132)
INSERT [dbo].[JoinUsuarioPermiso] ([usuarioID], [permisoID]) VALUES (6, 36)
INSERT [dbo].[JoinUsuarioPermiso] ([usuarioID], [permisoID]) VALUES (6, 37)
INSERT [dbo].[JoinUsuarioPermiso] ([usuarioID], [permisoID]) VALUES (6, 38)
INSERT [dbo].[JoinUsuarioPermiso] ([usuarioID], [permisoID]) VALUES (6, 39)
INSERT [dbo].[JoinUsuarioPermiso] ([usuarioID], [permisoID]) VALUES (6, 42)
INSERT [dbo].[JoinUsuarioPermiso] ([usuarioID], [permisoID]) VALUES (37, 36)
INSERT [dbo].[JoinUsuarioPermiso] ([usuarioID], [permisoID]) VALUES (37, 37)
INSERT [dbo].[JoinUsuarioPermiso] ([usuarioID], [permisoID]) VALUES (37, 39)
INSERT [dbo].[JoinUsuarioPermiso] ([usuarioID], [permisoID]) VALUES (37, 42)
INSERT [dbo].[JoinUsuarioPermiso] ([usuarioID], [permisoID]) VALUES (37, 48)
INSERT [dbo].[JoinUsuarioPermiso] ([usuarioID], [permisoID]) VALUES (38, 36)
INSERT [dbo].[JoinUsuarioPermiso] ([usuarioID], [permisoID]) VALUES (38, 37)
INSERT [dbo].[JoinUsuarioPermiso] ([usuarioID], [permisoID]) VALUES (38, 38)
INSERT [dbo].[JoinUsuarioPermiso] ([usuarioID], [permisoID]) VALUES (38, 39)
INSERT [dbo].[JoinUsuarioPermiso] ([usuarioID], [permisoID]) VALUES (38, 42)
INSERT [dbo].[JoinUsuarioPermiso] ([usuarioID], [permisoID]) VALUES (38, 132)
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
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (287, N'Pacientes_button_buscar', N'Search by DNI', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (288, N'Pacientes_button_buscar', N'Buscar por DNI', 1, 0)
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
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (458, N'Tratamiento_label_calorias_totales_quemadas', N'Total Calories', 2, 1)
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
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (637, N'GestionRoles_messagebox_eliminar_rol_asociado', N'It is not possible to delete a role you already have.', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (638, N'GestionRoles_messagebox_eliminar_rol_asociado', N'No es posible eliminar un rol que posee.', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (639, N'Tratamiento_label_calorias_totales_quemadas', N'Total Calories', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (640, N'Contenedor_menu_backup', N'Backups', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (641, N'Nutricionista_messagebox_usuario_inexistente', N'The user does not exists', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (642, N'Contendor_menu_gestion_bitacora', N'User Logs', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (926, N'Pacientes_messagebox_errorMail', N'Por favor introduzca un email valido.', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (927, N'Pacientes_messagebox_errorMail', N'Please enter a valid email.', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (928, N'Contenedor_menu_roles', N'Roles', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (929, N'GestionEtiqueta_button_aplicar', N'Aplicar Cambios', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (930, N'Alimentos_button_ver_dietas', N'Ver Dietas', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (931, N'Alimentos_button_ver_dietas', N'See Diets', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (932, N'Contenedor_menu_roles', N'Roles', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (933, N'GestionEtiqueta_button_aplicar', N'Apply Changes', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (934, N'GestionEtiqueta_label_falltantes', N'Leyendas Faltantes para el idioma', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (935, N'GestionEtiqueta_label_falltantes', N'Missing captions for language', 2, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (936, N'AgregarTurno_messagebox_fecha_anterior_error', N'No es posible crear un turno para una fecha anterior a la actual', 1, 0)
INSERT [dbo].[Leyenda] ([leyendaID], [nombreControl], [texto], [idiomaID], [eliminado]) VALUES (937, N'AgregarTurno_messagebox_fecha_anterior_error', N'Its not possible to create an appointment with previous date', 2, 0)
SET IDENTITY_INSERT [dbo].[Leyenda] OFF
SET IDENTITY_INSERT [dbo].[Medicion] ON 

INSERT [dbo].[Medicion] ([altura], [cadera], [cintura], [peso], [medicionID], [pacienteID], [turnoID], [bmi], [categoriaBmi], [bfp], [categoriaBfp]) VALUES (1.75, 80, 70, 85, 42, 1, 8, 27.8, N'Sobrepeso', 23.369999999999997, N'Parmetros Sanos')
INSERT [dbo].[Medicion] ([altura], [cadera], [cintura], [peso], [medicionID], [pacienteID], [turnoID], [bmi], [categoriaBmi], [bfp], [categoriaBfp]) VALUES (1.7, 90, 80, 80, 43, 7, 14, 27.7, N'Sobrepeso', 23.709999999999994, N'Parametros Sanos')
INSERT [dbo].[Medicion] ([altura], [cadera], [cintura], [peso], [medicionID], [pacienteID], [turnoID], [bmi], [categoriaBmi], [bfp], [categoriaBfp]) VALUES (1.7, 80, 90, 80, 44, 7, 10, 27.7, N'Overweight', 23.709999999999994, N'Healthy Parameters')
INSERT [dbo].[Medicion] ([altura], [cadera], [cintura], [peso], [medicionID], [pacienteID], [turnoID], [bmi], [categoriaBmi], [bfp], [categoriaBfp]) VALUES (1.7, 90, 80, 80, 45, 7, 10, 27.7, N'Sobrepeso', 23.709999999999994, N'Parametros Sanos')
INSERT [dbo].[Medicion] ([altura], [cadera], [cintura], [peso], [medicionID], [pacienteID], [turnoID], [bmi], [categoriaBmi], [bfp], [categoriaBfp]) VALUES (1.7, 90, 80, 80, 46, 7, 10, 27.7, N'Sobrepeso', 23.709999999999994, N'Parametros Sanos')
INSERT [dbo].[Medicion] ([altura], [cadera], [cintura], [peso], [medicionID], [pacienteID], [turnoID], [bmi], [categoriaBmi], [bfp], [categoriaBfp]) VALUES (1.9, 80, 90, 80, 47, 3, 7, 22.2, N'Sano', 18.259999999999991, N'Parametros Sanos')
INSERT [dbo].[Medicion] ([altura], [cadera], [cintura], [peso], [medicionID], [pacienteID], [turnoID], [bmi], [categoriaBmi], [bfp], [categoriaBfp]) VALUES (1.9, 90, 80, 80, 48, 3, 7, 22.2, N'Sano', 18.259999999999991, N'Parametros Sanos')
INSERT [dbo].[Medicion] ([altura], [cadera], [cintura], [peso], [medicionID], [pacienteID], [turnoID], [bmi], [categoriaBmi], [bfp], [categoriaBfp]) VALUES (1.7, 90, 80, 80, 49, 7, 10, 27.7, N'Sobrepeso', 23.709999999999994, N'Parametros Sanos')
INSERT [dbo].[Medicion] ([altura], [cadera], [cintura], [peso], [medicionID], [pacienteID], [turnoID], [bmi], [categoriaBmi], [bfp], [categoriaBfp]) VALUES (1.7, 90, 80, 80, 50, 7, 10, 27.7, N'Sobrepeso', 23.709999999999994, N'Parametros Sanos')
INSERT [dbo].[Medicion] ([altura], [cadera], [cintura], [peso], [medicionID], [pacienteID], [turnoID], [bmi], [categoriaBmi], [bfp], [categoriaBfp]) VALUES (1.7, 80, 90, 80, 51, 7, 10, 27.7, N'Sobrepeso', 23.709999999999994, N'Parametros Sanos')
INSERT [dbo].[Medicion] ([altura], [cadera], [cintura], [peso], [medicionID], [pacienteID], [turnoID], [bmi], [categoriaBmi], [bfp], [categoriaBfp]) VALUES (1.7, 90, 80, 80, 52, 7, 10, 27.7, N'Sobrepeso', 23.709999999999994, N'Parametros Sanos')
INSERT [dbo].[Medicion] ([altura], [cadera], [cintura], [peso], [medicionID], [pacienteID], [turnoID], [bmi], [categoriaBmi], [bfp], [categoriaBfp]) VALUES (1.7, 90, 80, 80, 53, 7, 10, 27.7, N'Sobrepeso', 23.709999999999994, N'Parametros Sanos')
INSERT [dbo].[Medicion] ([altura], [cadera], [cintura], [peso], [medicionID], [pacienteID], [turnoID], [bmi], [categoriaBmi], [bfp], [categoriaBfp]) VALUES (1.7, 80, 70, 80, 54, 12, 31, 27.7, N'Sobrepeso', 23.709999999999994, N'Parametros Sanos')
INSERT [dbo].[Medicion] ([altura], [cadera], [cintura], [peso], [medicionID], [pacienteID], [turnoID], [bmi], [categoriaBmi], [bfp], [categoriaBfp]) VALUES (1.7, 80, 70, 79, 55, 12, 31, 27.3, N'Sobrepeso', 23.229999999999997, N'Parametros Sanos')
INSERT [dbo].[Medicion] ([altura], [cadera], [cintura], [peso], [medicionID], [pacienteID], [turnoID], [bmi], [categoriaBmi], [bfp], [categoriaBfp]) VALUES (1.7, 80, 70, 78, 56, 12, 31, 27, N'Sobrepeso', 22.869999999999997, N'Parametros Sanos')
INSERT [dbo].[Medicion] ([altura], [cadera], [cintura], [peso], [medicionID], [pacienteID], [turnoID], [bmi], [categoriaBmi], [bfp], [categoriaBfp]) VALUES (1.7, 80, 90, 85, 57, 15, 33, 29.6, N'Sobrepeso', 25.99, N'Excedido en Grasa Corporal')
INSERT [dbo].[Medicion] ([altura], [cadera], [cintura], [peso], [medicionID], [pacienteID], [turnoID], [bmi], [categoriaBmi], [bfp], [categoriaBfp]) VALUES (1.85, 80, 90, 75, 58, 1, 29, 21.9, N'Sano', 16.289999999999992, N'Atletico')
INSERT [dbo].[Medicion] ([altura], [cadera], [cintura], [peso], [medicionID], [pacienteID], [turnoID], [bmi], [categoriaBmi], [bfp], [categoriaBfp]) VALUES (1.7, 80, 90, 80, 59, 11, 35, 27.7, N'Sobrepeso', 23.709999999999994, N'Parametros Sanos')
INSERT [dbo].[Medicion] ([altura], [cadera], [cintura], [peso], [medicionID], [pacienteID], [turnoID], [bmi], [categoriaBmi], [bfp], [categoriaBfp]) VALUES (1.7, 90, 80, 80, 60, 11, 35, 27.7, N'Sobrepeso', 23.709999999999994, N'Parametros Sanos')
INSERT [dbo].[Medicion] ([altura], [cadera], [cintura], [peso], [medicionID], [pacienteID], [turnoID], [bmi], [categoriaBmi], [bfp], [categoriaBfp]) VALUES (1.7, 80, 90, 80, 61, 11, 35, 27.7, N'Sobrepeso', 23.709999999999994, N'Parametros Sanos')
INSERT [dbo].[Medicion] ([altura], [cadera], [cintura], [peso], [medicionID], [pacienteID], [turnoID], [bmi], [categoriaBmi], [bfp], [categoriaBfp]) VALUES (1.7, 90, 80, 80, 62, 16, 37, 27.7, N'Sobrepeso', 23.709999999999994, N'Parametros Sanos')
INSERT [dbo].[Medicion] ([altura], [cadera], [cintura], [peso], [medicionID], [pacienteID], [turnoID], [bmi], [categoriaBmi], [bfp], [categoriaBfp]) VALUES (1.8, 80, 90, 70, 63, 1, 25, 21.6, N'Sano', 15.930000000000002, N'Atletico')
INSERT [dbo].[Medicion] ([altura], [cadera], [cintura], [peso], [medicionID], [pacienteID], [turnoID], [bmi], [categoriaBmi], [bfp], [categoriaBfp]) VALUES (1.7, 90, 80, 80, 64, 1, 25, 27.7, N'Sobrepeso', 23.249999999999993, N'Parametros Sanos')
INSERT [dbo].[Medicion] ([altura], [cadera], [cintura], [peso], [medicionID], [pacienteID], [turnoID], [bmi], [categoriaBmi], [bfp], [categoriaBfp]) VALUES (1.7, 90, 80, 80, 65, 1, 25, 27.7, N'Sobrepeso', 23.249999999999993, N'Parametros Sanos')
INSERT [dbo].[Medicion] ([altura], [cadera], [cintura], [peso], [medicionID], [pacienteID], [turnoID], [bmi], [categoriaBmi], [bfp], [categoriaBfp]) VALUES (1.9, 123, 123, 80, 1062, 1, 1036, 22.2, N'Sano', 16.649999999999991, N'Atletico')
INSERT [dbo].[Medicion] ([altura], [cadera], [cintura], [peso], [medicionID], [pacienteID], [turnoID], [bmi], [categoriaBmi], [bfp], [categoriaBfp]) VALUES (1.65, 90, 80, 95, 1063, 17, 1037, 34.9, N'Obesidad', 42.46, N'Excedido en Grasa Corporal')
INSERT [dbo].[Medicion] ([altura], [cadera], [cintura], [peso], [medicionID], [pacienteID], [turnoID], [bmi], [categoriaBmi], [bfp], [categoriaBfp]) VALUES (1.7, 90, 80, 80, 1064, 7, 20, 27.7, N'Sobrepeso', 23.709999999999994, N'Parametros Sanos')
INSERT [dbo].[Medicion] ([altura], [cadera], [cintura], [peso], [medicionID], [pacienteID], [turnoID], [bmi], [categoriaBmi], [bfp], [categoriaBfp]) VALUES (1.7, 90, 80, 80, 1065, 7, 17, 27.7, N'Sobrepeso', 23.709999999999994, N'Parametros Sanos')
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
INSERT [dbo].[Nutricionista] ([nutricionistaID], [dni], [especialización], [matricula], [apellido], [usuarioID], [nombre], [sexo], [eliminado], [DVH]) VALUES (23, 15123, N'Nutricion', N'sd', N'asd', 38, N'Pedro', N'M', 0, 37267)
SET IDENTITY_INSERT [dbo].[Nutricionista] OFF
SET IDENTITY_INSERT [dbo].[Paciente] ON 

INSERT [dbo].[Paciente] ([email], [telefono], [pacienteID], [apellido], [dni], [nombre], [sexo], [fechaNacimiento]) VALUES (N'carlossanchez@live.com', 1136040313, 1, N'Sanchez', 37171096, N'Carlitos', N'M', CAST(N'1992-11-10' AS Date))
INSERT [dbo].[Paciente] ([email], [telefono], [pacienteID], [apellido], [dni], [nombre], [sexo], [fechaNacimiento]) VALUES (N'juanlopez@live.com', 1124352354, 3, N'Lopez', 1234123, N'Juancho', N'M', CAST(N'1985-02-12' AS Date))
INSERT [dbo].[Paciente] ([email], [telefono], [pacienteID], [apellido], [dni], [nombre], [sexo], [fechaNacimiento]) VALUES (N'lola@yahoo.com', 15231234, 5, N'Lopez', 561254133, N'Lola', N'F', CAST(N'1984-07-11' AS Date))
INSERT [dbo].[Paciente] ([email], [telefono], [pacienteID], [apellido], [dni], [nombre], [sexo], [fechaNacimiento]) VALUES (N'gaklsngfask@live.com', 11345242, 6, N'Lopez', 37692345, N'Danilo', N'M', CAST(N'2019-11-10' AS Date))
INSERT [dbo].[Paciente] ([email], [telefono], [pacienteID], [apellido], [dni], [nombre], [sexo], [fechaNacimiento]) VALUES (N'daniloperez@hotmail.com', 1136040312, 7, N'Perez', 37171097, N'Danilo', N'M', CAST(N'1990-07-11' AS Date))
INSERT [dbo].[Paciente] ([email], [telefono], [pacienteID], [apellido], [dni], [nombre], [sexo], [fechaNacimiento]) VALUES (N'teo@gmail.com', 623512412, 11, N'Gonzalez', 39798434, N'Teodoro', N'M', CAST(N'1990-07-18' AS Date))
INSERT [dbo].[Paciente] ([email], [telefono], [pacienteID], [apellido], [dni], [nombre], [sexo], [fechaNacimiento]) VALUES (N'ramirezisi@gmail.com', 623512412, 12, N'Ramirez', 384623563, N'Isidro', N'M', CAST(N'1990-07-12' AS Date))
INSERT [dbo].[Paciente] ([email], [telefono], [pacienteID], [apellido], [dni], [nombre], [sexo], [fechaNacimiento]) VALUES (N'rami@hotmail.com', 11245123, 13, N'Rodriguez', 6512412, N'Ramiro', N'M', CAST(N'1992-10-12' AS Date))
INSERT [dbo].[Paciente] ([email], [telefono], [pacienteID], [apellido], [dni], [nombre], [sexo], [fechaNacimiento]) VALUES (N'alexis@live.com', 1245123, 14, N'Moreno', 254123, N'Alexis', N'M', CAST(N'1992-06-24' AS Date))
INSERT [dbo].[Paciente] ([email], [telefono], [pacienteID], [apellido], [dni], [nombre], [sexo], [fechaNacimiento]) VALUES (N'asfd@hotmail.com', 3541231, 15, N'sadas', 124123, N'asdasd', N'M', CAST(N'1990-06-20' AS Date))
INSERT [dbo].[Paciente] ([email], [telefono], [pacienteID], [apellido], [dni], [nombre], [sexo], [fechaNacimiento]) VALUES (N'pruebatest@hotmail.com', 2254124, 16, N'Test', 8674563, N'Prueba', N'M', CAST(N'1990-10-31' AS Date))
INSERT [dbo].[Paciente] ([email], [telefono], [pacienteID], [apellido], [dni], [nombre], [sexo], [fechaNacimiento]) VALUES (N'caro@hotmail.com', 1135214, 17, N'Landa', 37179957, N'Caro', N'F', CAST(N'1993-01-25' AS Date))
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
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (44, N'Gestión e informes de Nutricionistas', N'GE109')
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (46, N'Manejo Bitacora', N'OP45')
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
INSERT [dbo].[Permiso] ([permisoID], [descripcion], [codigo]) VALUES (136, N'Consultar Tratamiento', N'OP200')
SET IDENTITY_INSERT [dbo].[Permiso] OFF
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (36, 3)
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (36, 4)
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (38, 128)
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (36, 33)
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (36, 34)
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (44, 46)
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
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (132, 133)
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
INSERT [dbo].[Permiso_Jerarquia] ([IdPadrePermiso], [IdHijoPermiso]) VALUES (36, 136)
SET IDENTITY_INSERT [dbo].[Plato] ON 

INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal]) VALUES (1, N'Huevo con Jugo de Naranja', 185, 1, 0, 0, 0)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal]) VALUES (3, N'Soja con Bebida Cola', 320, 0, 0, 0, 1)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal]) VALUES (4, N'Pollo con Arroz', 280, 0, 0, 0, 1)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal]) VALUES (5, N'Pescado (Merluza) con Papas', 190, 0, 0, 0, 1)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal]) VALUES (6, N'Canelones de Espinaca con Salsa', 135, 0, 0, 0, 1)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal]) VALUES (7, N'Ensalada de Pasta con Atun y Cangrejo Kanikama', 370, 0, 0, 0, 1)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal]) VALUES (8, N'Porcion de Tortilla de Papas', 330, 0, 0, 0, 1)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal]) VALUES (9, N'Porcion de Tarta', 380, 0, 0, 0, 1)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal]) VALUES (10, N'Tomate Relleno de Atun y Papa al Horno', 175, 0, 0, 0, 1)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal]) VALUES (11, N'Berenjena Rellena con Carne', 253, 0, 0, 0, 1)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal]) VALUES (12, N'Hamburguesa Simple', 380, 0, 0, 0, 1)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal]) VALUES (13, N'Pancho Simple con Mayonesa', 240, 0, 0, 0, 1)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal]) VALUES (14, N'Guiso de Lentejas', 340, 0, 0, 0, 1)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal]) VALUES (15, N'Hamburguesa con Papas Fritas', 730, 0, 0, 0, 1)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal]) VALUES (16, N'Bife con Pastas', 870, 0, 0, 0, 1)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal]) VALUES (17, N'Tostadas con Queso y Cafe', 195, 1, 0, 1, 0)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal]) VALUES (18, N'Yogurt con cereales y banana', 190, 1, 1, 1, 0)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal]) VALUES (19, N'Porcion de Frutos Secos', 427, 1, 0, 1, 0)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal]) VALUES (20, N'Batido de Avena y Jugo', 354, 1, 0, 1, 0)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal]) VALUES (21, N'Tostada con Queso Fresco y Jugo', 150, 1, 0, 1, 0)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal]) VALUES (22, N'Banana con Miel', 154, 0, 1, 0, 0)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal]) VALUES (23, N'Yogur con Cereales', 174, 0, 1, 0, 0)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal]) VALUES (24, N'Taza de Ensalada de Frutas', 150, 1, 1, 1, 0)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal]) VALUES (25, N'Taza de Ensalada de Frutas', 150, 1, 1, 1, 0)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal]) VALUES (26, N'Banana Y Manzana', 150, 0, 1, 0, 0)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal]) VALUES (27, N'Omelette de Huevo', 400, 1, 0, 1, 0)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal]) VALUES (28, N'Huevos revueltos con Panceta', 450, 1, 0, 1, 0)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal]) VALUES (29, N'Sandwich Simple de Jamon y Queso', 200, 1, 1, 1, 0)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal]) VALUES (30, N'Porcion Chica de Almendras y Banan Deshidratada', 215, 1, 1, 1, 0)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal]) VALUES (31, N'Vacio con Pure de Papas y Cebolla Condimentado', 388, 0, 0, 0, 1)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal]) VALUES (32, N'Bife con Pure', 730, 0, 0, 0, 1)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal]) VALUES (33, N'Seis Canelones de Espinaca', 730, 0, 0, 0, 1)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal]) VALUES (34, N'Yogur con Frutas', 350, 0, 0, 1, 0)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal]) VALUES (35, N'Sandwich con Huevo y Leche', 460, 1, 1, 0, 0)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal]) VALUES (36, N'Yogur y Tostadas', 144, 1, 0, 1, 0)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal]) VALUES (37, N'Barra de Cereal con Cafe', 145, 0, 1, 1, 0)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal]) VALUES (38, N'Manzana de Colacion', 50, 0, 1, 0, 0)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal]) VALUES (39, N'Banana de Colacion', 90, 0, 1, 0, 0)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal]) VALUES (40, N'Yogur con Cereales y Jugo de Naranja', 145, 1, 0, 1, 0)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal]) VALUES (41, N'Almohaditas de Avena y Cafe', 180, 1, 1, 1, 0)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal]) VALUES (42, N'Fideos Integrales con Pollo', 330, 0, 0, 0, 1)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal]) VALUES (43, N'Churrasco con Zanahoria y Queso', 485, 0, 0, 0, 1)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal]) VALUES (44, N'Milanesa con Arroz Integral queso untable y Mayonesa', 385, 0, 0, 0, 1)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal]) VALUES (45, N'Porcion de Budin de Espinaca y Arroz', 400, 0, 0, 0, 1)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal]) VALUES (46, N'Milanesa con Budin de Espinaca y Arroz', 500, 0, 0, 0, 1)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal]) VALUES (47, N'Porcion de Tarta de Espinaca', 440, 0, 0, 0, 1)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal]) VALUES (48, N'Pollo con papa hervida', 240, 0, 0, 0, 1)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal]) VALUES (49, N'Pastel de Papa y Zapallo', 300, 0, 0, 0, 1)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal]) VALUES (50, N'Barra de Cereal con Jugo de Frutas', 200, 0, 0, 1, 0)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal]) VALUES (51, N'Milanesa de Soja con Pure Mixto', 374, 0, 0, 0, 1)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal]) VALUES (52, N'Panqueque con Jugo', 309, 1, 1, 1, 0)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal]) VALUES (53, N'Churrasco con Pure', 330, 0, 0, 0, 1)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal]) VALUES (54, N'Dos Porciones de Pizza', 500, 0, 0, 0, 1)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal]) VALUES (55, N'Omellete Chico de Huevo', 200, 1, 0, 1, 0)
INSERT [dbo].[Plato] ([platoID], [nombre], [calorias], [esDesayuno], [esColacion], [esMerienda], [esPlatoPrincipal]) VALUES (56, N'Crepe de espinaca con Pollo', 200, 0, 0, 0, 1)
SET IDENTITY_INSERT [dbo].[Plato] OFF
SET IDENTITY_INSERT [dbo].[Rutina] ON 

INSERT [dbo].[Rutina] ([idDiaEjercicioDomingo], [idDiaEjercicioJueves], [idDiaEjercicioLunes], [idDiaEjercicioMartes], [idDiaEjercicioMiercoles], [idDiaEjercicioSabado], [idDiaEjercicioViernes], [rutinaID], [nombre]) VALUES (28, 25, 22, 23, 24, 27, 26, 3, N'Prueba')
INSERT [dbo].[Rutina] ([idDiaEjercicioDomingo], [idDiaEjercicioJueves], [idDiaEjercicioLunes], [idDiaEjercicioMartes], [idDiaEjercicioMiercoles], [idDiaEjercicioSabado], [idDiaEjercicioViernes], [rutinaID], [nombre]) VALUES (NULL, 38, 37, NULL, NULL, 39, NULL, 6, N'Intensiva')
INSERT [dbo].[Rutina] ([idDiaEjercicioDomingo], [idDiaEjercicioJueves], [idDiaEjercicioLunes], [idDiaEjercicioMartes], [idDiaEjercicioMiercoles], [idDiaEjercicioSabado], [idDiaEjercicioViernes], [rutinaID], [nombre]) VALUES (NULL, NULL, 40, NULL, 41, NULL, 42, 7, N'Liviana')
INSERT [dbo].[Rutina] ([idDiaEjercicioDomingo], [idDiaEjercicioJueves], [idDiaEjercicioLunes], [idDiaEjercicioMartes], [idDiaEjercicioMiercoles], [idDiaEjercicioSabado], [idDiaEjercicioViernes], [rutinaID], [nombre]) VALUES (NULL, NULL, 53, NULL, 54, NULL, NULL, 10, N'Rutina Prueba')
INSERT [dbo].[Rutina] ([idDiaEjercicioDomingo], [idDiaEjercicioJueves], [idDiaEjercicioLunes], [idDiaEjercicioMartes], [idDiaEjercicioMiercoles], [idDiaEjercicioSabado], [idDiaEjercicioViernes], [rutinaID], [nombre]) VALUES (NULL, 57, 55, NULL, 56, 58, NULL, 11, N'Rutina Aerobica Liviana')
SET IDENTITY_INSERT [dbo].[Rutina] OFF
SET IDENTITY_INSERT [dbo].[Tratamiento] ON 

INSERT [dbo].[Tratamiento] ([fechaFinalizado], [fechaInicio], [tratamientoID], [dietaID], [rutinaID], [pacienteID]) VALUES (CAST(N'2019-11-20' AS Date), CAST(N'2019-11-04' AS Date), 3, 6, 3, 1)
INSERT [dbo].[Tratamiento] ([fechaFinalizado], [fechaInicio], [tratamientoID], [dietaID], [rutinaID], [pacienteID]) VALUES (CAST(N'2019-11-11' AS Date), CAST(N'2019-11-11' AS Date), 4, 1, NULL, 7)
INSERT [dbo].[Tratamiento] ([fechaFinalizado], [fechaInicio], [tratamientoID], [dietaID], [rutinaID], [pacienteID]) VALUES (CAST(N'2019-10-29' AS Date), CAST(N'2019-10-29' AS Date), 5, 7, NULL, 3)
INSERT [dbo].[Tratamiento] ([fechaFinalizado], [fechaInicio], [tratamientoID], [dietaID], [rutinaID], [pacienteID]) VALUES (NULL, CAST(N'2019-10-29' AS Date), 6, 8, NULL, 3)
INSERT [dbo].[Tratamiento] ([fechaFinalizado], [fechaInicio], [tratamientoID], [dietaID], [rutinaID], [pacienteID]) VALUES (CAST(N'2019-11-11' AS Date), CAST(N'2019-11-11' AS Date), 7, 9, 3, 7)
INSERT [dbo].[Tratamiento] ([fechaFinalizado], [fechaInicio], [tratamientoID], [dietaID], [rutinaID], [pacienteID]) VALUES (CAST(N'2019-11-11' AS Date), CAST(N'2019-11-11' AS Date), 8, 10, 3, 7)
INSERT [dbo].[Tratamiento] ([fechaFinalizado], [fechaInicio], [tratamientoID], [dietaID], [rutinaID], [pacienteID]) VALUES (CAST(N'2019-11-20' AS Date), CAST(N'2019-11-11' AS Date), 9, 11, 6, 7)
INSERT [dbo].[Tratamiento] ([fechaFinalizado], [fechaInicio], [tratamientoID], [dietaID], [rutinaID], [pacienteID]) VALUES (NULL, CAST(N'2019-11-14' AS Date), 10, 12, 6, 12)
INSERT [dbo].[Tratamiento] ([fechaFinalizado], [fechaInicio], [tratamientoID], [dietaID], [rutinaID], [pacienteID]) VALUES (NULL, CAST(N'2019-11-21' AS Date), 11, 13, 6, 15)
INSERT [dbo].[Tratamiento] ([fechaFinalizado], [fechaInicio], [tratamientoID], [dietaID], [rutinaID], [pacienteID]) VALUES (CAST(N'2019-11-26' AS Date), CAST(N'2019-11-20' AS Date), 12, 16, 10, 1)
INSERT [dbo].[Tratamiento] ([fechaFinalizado], [fechaInicio], [tratamientoID], [dietaID], [rutinaID], [pacienteID]) VALUES (CAST(N'2019-11-27' AS Date), CAST(N'2019-11-27' AS Date), 13, 17, NULL, 16)
INSERT [dbo].[Tratamiento] ([fechaFinalizado], [fechaInicio], [tratamientoID], [dietaID], [rutinaID], [pacienteID]) VALUES (NULL, CAST(N'2019-12-02' AS Date), 1013, 1, 3, 1)
INSERT [dbo].[Tratamiento] ([fechaFinalizado], [fechaInicio], [tratamientoID], [dietaID], [rutinaID], [pacienteID]) VALUES (NULL, CAST(N'2019-12-02' AS Date), 1014, 1017, 11, 17)
INSERT [dbo].[Tratamiento] ([fechaFinalizado], [fechaInicio], [tratamientoID], [dietaID], [rutinaID], [pacienteID]) VALUES (CAST(N'2020-03-10' AS Date), CAST(N'2020-03-10' AS Date), 1015, 1, NULL, 7)
INSERT [dbo].[Tratamiento] ([fechaFinalizado], [fechaInicio], [tratamientoID], [dietaID], [rutinaID], [pacienteID]) VALUES (CAST(N'2020-03-10' AS Date), CAST(N'2020-03-10' AS Date), 1016, 1, NULL, 7)
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
INSERT [dbo].[Turno] ([fecha], [turnoID], [pacienteID], [nutricionistaID], [horarioID], [motivo], [eliminado]) VALUES (CAST(N'2019-11-20' AS Date), 32, 7, 23, 15, N'', 1)
INSERT [dbo].[Turno] ([fecha], [turnoID], [pacienteID], [nutricionistaID], [horarioID], [motivo], [eliminado]) VALUES (CAST(N'2019-11-21' AS Date), 33, 15, 23, 5, N'', 0)
INSERT [dbo].[Turno] ([fecha], [turnoID], [pacienteID], [nutricionistaID], [horarioID], [motivo], [eliminado]) VALUES (CAST(N'2019-12-24' AS Date), 34, 1, 1, 5, N'', 0)
INSERT [dbo].[Turno] ([fecha], [turnoID], [pacienteID], [nutricionistaID], [horarioID], [motivo], [eliminado]) VALUES (CAST(N'2019-12-26' AS Date), 35, 11, 1, 7, N'', 0)
INSERT [dbo].[Turno] ([fecha], [turnoID], [pacienteID], [nutricionistaID], [horarioID], [motivo], [eliminado]) VALUES (CAST(N'2019-11-27' AS Date), 36, 1, 23, 15, N'', 0)
INSERT [dbo].[Turno] ([fecha], [turnoID], [pacienteID], [nutricionistaID], [horarioID], [motivo], [eliminado]) VALUES (CAST(N'2019-11-27' AS Date), 37, 16, 23, 16, N'', 0)
INSERT [dbo].[Turno] ([fecha], [turnoID], [pacienteID], [nutricionistaID], [horarioID], [motivo], [eliminado]) VALUES (CAST(N'2019-12-02' AS Date), 1036, 1, 1, 5, N'', 0)
INSERT [dbo].[Turno] ([fecha], [turnoID], [pacienteID], [nutricionistaID], [horarioID], [motivo], [eliminado]) VALUES (CAST(N'2019-12-02' AS Date), 1037, 17, 1, 6, N'', 0)
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
INSERT [dbo].[Usuario] ([usuarioID], [username], [password], [intentos], [eliminado], [DVH]) VALUES (38, N'Pedro', N'c6cc8094c2dc07b700ffcc36d64e2138', 0, 0, 35863)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
/****** Object:  Index [IX_Nutricionista]    Script Date: 12/9/2019 5:06:10 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Nutricionista] ON [dbo].[Nutricionista]
(
	[dni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Paciente_1]    Script Date: 12/9/2019 5:06:10 PM ******/
ALTER TABLE [dbo].[Paciente] ADD  CONSTRAINT [IX_Paciente_1] UNIQUE NONCLUSTERED 
(
	[dni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Permiso]    Script Date: 12/9/2019 5:06:10 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Permiso] ON [dbo].[Permiso]
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Usuario]    Script Date: 12/9/2019 5:06:10 PM ******/
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
