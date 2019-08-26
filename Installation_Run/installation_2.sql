USE [master]
GO
/****** Object:  Database [nusmart]    Script Date: 8/19/2019 11:10:18 PM ******/
CREATE DATABASE [nusmart]
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
