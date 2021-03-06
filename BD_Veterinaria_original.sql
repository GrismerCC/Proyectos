USE [master]
GO
/****** Object:  Database [Veterinaria]    Script Date: 28/10/2019 01:13:30 ******/
CREATE DATABASE [Veterinaria]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Veterinaria', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLSV\MSSQL\DATA\Veterinaria.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Veterinaria_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLSV\MSSQL\DATA\Veterinaria_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Veterinaria] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Veterinaria].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Veterinaria] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Veterinaria] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Veterinaria] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Veterinaria] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Veterinaria] SET ARITHABORT OFF 
GO
ALTER DATABASE [Veterinaria] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Veterinaria] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Veterinaria] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Veterinaria] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Veterinaria] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Veterinaria] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Veterinaria] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Veterinaria] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Veterinaria] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Veterinaria] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Veterinaria] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Veterinaria] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Veterinaria] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Veterinaria] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Veterinaria] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Veterinaria] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Veterinaria] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Veterinaria] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Veterinaria] SET  MULTI_USER 
GO
ALTER DATABASE [Veterinaria] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Veterinaria] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Veterinaria] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Veterinaria] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Veterinaria] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Veterinaria]
GO
/****** Object:  Table [dbo].[Boleta]    Script Date: 28/10/2019 01:13:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Boleta](
	[id_boleta] [varchar](10) NOT NULL,
	[id_cliente] [varchar](10) NOT NULL,
	[id_empleado] [varchar](10) NOT NULL,
	[fecha] [date] NOT NULL,
	[direccion] [varchar](50) NOT NULL,
	[total] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_boleta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Citas]    Script Date: 28/10/2019 01:13:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Citas](
	[id_citas] [varchar](10) NOT NULL,
	[id_paciente] [varchar](10) NOT NULL,
	[razon] [varchar](50) NOT NULL,
	[fecha] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_citas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 28/10/2019 01:13:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cliente](
	[id_cliente] [varchar](10) NOT NULL,
	[nombres_cliente] [varchar](40) NOT NULL,
	[apellidoPaterno] [varchar](50) NOT NULL,
	[apellidoMaterno] [varchar](50) NOT NULL,
	[dni] [char](8) NOT NULL,
	[direccion] [varchar](50) NOT NULL,
	[numero_telefono] [char](9) NOT NULL,
	[email] [nvarchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Detalle Boleta]    Script Date: 28/10/2019 01:13:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Detalle Boleta](
	[id_boleta] [varchar](10) NOT NULL,
	[id_producto] [varchar](10) NOT NULL,
	[cantidad] [int] NOT NULL,
	[descripcion] [text] NOT NULL,
	[precio_unit] [money] NOT NULL,
	[valor_venta] [money] NOT NULL,
 CONSTRAINT [pk_detbol] PRIMARY KEY CLUSTERED 
(
	[id_boleta] ASC,
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 28/10/2019 01:13:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Empleado](
	[id_empleado] [varchar](10) NOT NULL,
	[nombre_empleado] [varchar](40) NOT NULL,
	[apellidoPaterno] [varchar](40) NOT NULL,
	[apellidoMaterno] [varchar](40) NOT NULL,
	[dni] [char](8) NOT NULL,
	[edad] [int] NOT NULL,
	[telefono] [char](9) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Especie]    Script Date: 28/10/2019 01:13:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Especie](
	[id_especie] [varchar](10) NOT NULL,
	[nombre_especie] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_especie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Historial Medico]    Script Date: 28/10/2019 01:13:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Historial Medico](
	[id_historial] [varchar](10) NOT NULL,
	[id_paciente] [varchar](10) NOT NULL,
	[id_vacuna] [varchar](10) NOT NULL,
	[id_tratamiento] [varchar](10) NOT NULL,
	[fecha] [date] NOT NULL,
	[duracion] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_historial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Paciente]    Script Date: 28/10/2019 01:13:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Paciente](
	[id_paciente] [varchar](10) NOT NULL,
	[id_cliente] [varchar](10) NOT NULL,
	[id_raza] [varchar](10) NOT NULL,
	[nombre_paciente] [varchar](20) NOT NULL,
	[sexo] [varchar](1) NOT NULL,
	[edad] [int] NOT NULL,
	[alergias] [text] NOT NULL,
	[observacion] [text] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_paciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 28/10/2019 01:13:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Producto](
	[id_producto] [varchar](10) NOT NULL,
	[id_proveedor] [varchar](10) NOT NULL,
	[nombre_producto] [varchar](50) NOT NULL,
	[cantidad] [int] NOT NULL,
	[precio] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 28/10/2019 01:13:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Proveedor](
	[id_proveedor] [varchar](10) NOT NULL,
	[nombre_proveedor] [varchar](50) NOT NULL,
	[direccion] [varchar](50) NOT NULL,
	[telefono] [char](9) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_proveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Razas]    Script Date: 28/10/2019 01:13:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Razas](
	[id_raza] [varchar](10) NOT NULL,
	[id_especie] [varchar](10) NOT NULL,
	[nombre_raza] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_raza] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tratamiento]    Script Date: 28/10/2019 01:13:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tratamiento](
	[id_tratamiento] [varchar](10) NOT NULL,
	[tipo] [varchar](50) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[diagnostico] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_tratamiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Vacunas]    Script Date: 28/10/2019 01:13:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Vacunas](
	[id_vacuna] [varchar](10) NOT NULL,
	[tipo_vacuna] [varchar](40) NOT NULL,
	[nombre] [varchar](40) NOT NULL,
	[descripcion] [text] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_vacuna] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Boleta] ([id_boleta], [id_cliente], [id_empleado], [fecha], [direccion], [total]) VALUES (N'BO-00001', N'CL-00001', N'EM-00001', CAST(N'2019-05-10' AS Date), N'Av. Miraflores 145, Miraflores', 59.0000)
GO
INSERT [dbo].[Boleta] ([id_boleta], [id_cliente], [id_empleado], [fecha], [direccion], [total]) VALUES (N'BO-00002', N'CL-00002', N'EM-00002', CAST(N'2019-07-16' AS Date), N'Av. Miraflores 145, Miraflores', 80.0000)
GO
INSERT [dbo].[Boleta] ([id_boleta], [id_cliente], [id_empleado], [fecha], [direccion], [total]) VALUES (N'BO-00003', N'CL-00003', N'EM-00003', CAST(N'2019-06-01' AS Date), N'Av. Miraflores 145, Miraflores', 48.0000)
GO
INSERT [dbo].[Boleta] ([id_boleta], [id_cliente], [id_empleado], [fecha], [direccion], [total]) VALUES (N'BO-00004', N'CL-00004', N'EM-00004', CAST(N'2019-08-20' AS Date), N'Av. Miraflores 145, Miraflores', 80.0000)
GO
INSERT [dbo].[Boleta] ([id_boleta], [id_cliente], [id_empleado], [fecha], [direccion], [total]) VALUES (N'BO-00005', N'CL-00005', N'EM-00005', CAST(N'2019-08-23' AS Date), N'Av. Miraflores 145, Miraflores', 100.0000)
GO
INSERT [dbo].[Boleta] ([id_boleta], [id_cliente], [id_empleado], [fecha], [direccion], [total]) VALUES (N'BO-00006', N'CL-00006', N'EM-00006', CAST(N'2019-09-12' AS Date), N'Av. Miraflores 145, Miraflores', 60.0000)
GO
INSERT [dbo].[Boleta] ([id_boleta], [id_cliente], [id_empleado], [fecha], [direccion], [total]) VALUES (N'BO-00007', N'CL-00007', N'EM-00007', CAST(N'2019-09-15' AS Date), N'Av. Miraflores 145, Miraflores', 52.0000)
GO
INSERT [dbo].[Boleta] ([id_boleta], [id_cliente], [id_empleado], [fecha], [direccion], [total]) VALUES (N'BO-00008', N'CL-00008', N'EM-00008', CAST(N'2019-09-18' AS Date), N'Av. Miraflores 145, Miraflores', 84.0000)
GO
INSERT [dbo].[Boleta] ([id_boleta], [id_cliente], [id_empleado], [fecha], [direccion], [total]) VALUES (N'BO-00009', N'CL-00009', N'EM-00009', CAST(N'2019-09-19' AS Date), N'Av. Miraflores 145, Miraflores', 65.0000)
GO
INSERT [dbo].[Boleta] ([id_boleta], [id_cliente], [id_empleado], [fecha], [direccion], [total]) VALUES (N'BO-00010', N'CL-00010', N'EM-00010', CAST(N'2019-10-08' AS Date), N'Av. Miraflores 145, Miraflores', 120.0000)
GO
INSERT [dbo].[Boleta] ([id_boleta], [id_cliente], [id_empleado], [fecha], [direccion], [total]) VALUES (N'BO-00011', N'CL-00011', N'EM-00011', CAST(N'2019-10-10' AS Date), N'Av. Miraflores 145, Miraflores', 110.0000)
GO
INSERT [dbo].[Boleta] ([id_boleta], [id_cliente], [id_empleado], [fecha], [direccion], [total]) VALUES (N'BO-00012', N'CL-00012', N'EM-00012', CAST(N'2019-10-12' AS Date), N'Av. Miraflores 145, Miraflores', 75.0000)
GO
INSERT [dbo].[Boleta] ([id_boleta], [id_cliente], [id_empleado], [fecha], [direccion], [total]) VALUES (N'BO-00013', N'CL-00013', N'EM-00013', CAST(N'2019-10-15' AS Date), N'Av. Miraflores 145, Miraflores', 65.0000)
GO
INSERT [dbo].[Boleta] ([id_boleta], [id_cliente], [id_empleado], [fecha], [direccion], [total]) VALUES (N'BO-00014', N'CL-00014', N'EM-00014', CAST(N'2019-10-16' AS Date), N'Av. Miraflores 145, Miraflores', 70.0000)
GO
INSERT [dbo].[Boleta] ([id_boleta], [id_cliente], [id_empleado], [fecha], [direccion], [total]) VALUES (N'BO-00015', N'CL-00015', N'EM-00015', CAST(N'2019-10-20' AS Date), N'Av. Miraflores 145, Miraflores', 100.0000)
GO
INSERT [dbo].[Boleta] ([id_boleta], [id_cliente], [id_empleado], [fecha], [direccion], [total]) VALUES (N'BO-00016', N'CL-00016', N'EM-00016', CAST(N'2019-10-21' AS Date), N'Av. Miraflores 145, Miraflores', 95.0000)
GO
INSERT [dbo].[Boleta] ([id_boleta], [id_cliente], [id_empleado], [fecha], [direccion], [total]) VALUES (N'BO-00017', N'CL-00017', N'EM-00017', CAST(N'2019-10-26' AS Date), N'Av. Miraflores 145, Miraflores', 80.0000)
GO
INSERT [dbo].[Boleta] ([id_boleta], [id_cliente], [id_empleado], [fecha], [direccion], [total]) VALUES (N'BO-00018', N'CL-00018', N'EM-00018', CAST(N'2019-10-27' AS Date), N'Av. Miraflores 145, Miraflores', 70.0000)
GO
INSERT [dbo].[Boleta] ([id_boleta], [id_cliente], [id_empleado], [fecha], [direccion], [total]) VALUES (N'BO-00019', N'CL-00019', N'EM-00019', CAST(N'2019-10-29' AS Date), N'Av. Miraflores 145, Miraflores', 55.0000)
GO
INSERT [dbo].[Boleta] ([id_boleta], [id_cliente], [id_empleado], [fecha], [direccion], [total]) VALUES (N'BO-00020', N'CL-00020', N'EM-00020', CAST(N'2019-10-30' AS Date), N'Av. Miraflores 145, Miraflores', 60.0000)
GO
INSERT [dbo].[Boleta] ([id_boleta], [id_cliente], [id_empleado], [fecha], [direccion], [total]) VALUES (N'BO-00021', N'CL-00021', N'EM-00021', CAST(N'2019-11-02' AS Date), N'Av. Miraflores 145, Miraflores', 90.0000)
GO
INSERT [dbo].[Boleta] ([id_boleta], [id_cliente], [id_empleado], [fecha], [direccion], [total]) VALUES (N'BO-00022', N'CL-00022', N'EM-00022', CAST(N'2019-11-06' AS Date), N'Av. Miraflores 145, Miraflores', 140.0000)
GO
INSERT [dbo].[Boleta] ([id_boleta], [id_cliente], [id_empleado], [fecha], [direccion], [total]) VALUES (N'BO-00023', N'CL-00023', N'EM-00023', CAST(N'2019-11-08' AS Date), N'Av. Miraflores 145, Miraflores', 115.0000)
GO
INSERT [dbo].[Boleta] ([id_boleta], [id_cliente], [id_empleado], [fecha], [direccion], [total]) VALUES (N'BO-00024', N'CL-00024', N'EM-00024', CAST(N'2019-11-11' AS Date), N'Av. Miraflores 145, Miraflores', 120.0000)
GO
INSERT [dbo].[Boleta] ([id_boleta], [id_cliente], [id_empleado], [fecha], [direccion], [total]) VALUES (N'BO-00025', N'CL-00025', N'EM-00025', CAST(N'2019-11-13' AS Date), N'Av. Miraflores 145, Miraflores', 80.0000)
GO
INSERT [dbo].[Citas] ([id_citas], [id_paciente], [razon], [fecha]) VALUES (N'CI-00001', N'PA-00001', N'Tiene sarna', CAST(N'2019-05-10' AS Date))
GO
INSERT [dbo].[Citas] ([id_citas], [id_paciente], [razon], [fecha]) VALUES (N'CI-00002', N'PA-00002', N'Tiene conjuntivitis', CAST(N'2019-07-16' AS Date))
GO
INSERT [dbo].[Citas] ([id_citas], [id_paciente], [razon], [fecha]) VALUES (N'CI-00003', N'PA-00003', N'Tiene hongos', CAST(N'2019-06-01' AS Date))
GO
INSERT [dbo].[Citas] ([id_citas], [id_paciente], [razon], [fecha]) VALUES (N'CI-00004', N'PA-00004', N'Tiene Anemia', CAST(N'2019-08-20' AS Date))
GO
INSERT [dbo].[Citas] ([id_citas], [id_paciente], [razon], [fecha]) VALUES (N'CI-00005', N'PA-00005', N'Tiene conjuntivitis', CAST(N'2019-08-23' AS Date))
GO
INSERT [dbo].[Citas] ([id_citas], [id_paciente], [razon], [fecha]) VALUES (N'Cl-00006', N'PA-00006', N'Tiene rabia', CAST(N'2019-09-08' AS Date))
GO
INSERT [dbo].[Citas] ([id_citas], [id_paciente], [razon], [fecha]) VALUES (N'Cl-00007', N'PA-00007', N'Tose mucho', CAST(N'2019-09-10' AS Date))
GO
INSERT [dbo].[Citas] ([id_citas], [id_paciente], [razon], [fecha]) VALUES (N'Cl-00008', N'PA-00008', N'Caida de pelo', CAST(N'2019-09-15' AS Date))
GO
INSERT [dbo].[Citas] ([id_citas], [id_paciente], [razon], [fecha]) VALUES (N'Cl-00009', N'PA-00009', N'Ojos llorosos', CAST(N'2019-09-18' AS Date))
GO
INSERT [dbo].[Citas] ([id_citas], [id_paciente], [razon], [fecha]) VALUES (N'Cl-00010', N'PA-00010', N'Parasitos', CAST(N'2019-10-02' AS Date))
GO
INSERT [dbo].[Citas] ([id_citas], [id_paciente], [razon], [fecha]) VALUES (N'Cl-00011', N'PA-00011', N'Tiene sarna', CAST(N'2019-10-05' AS Date))
GO
INSERT [dbo].[Citas] ([id_citas], [id_paciente], [razon], [fecha]) VALUES (N'Cl-00012', N'PA-00012', N'Tiene hongos', CAST(N'2019-10-06' AS Date))
GO
INSERT [dbo].[Citas] ([id_citas], [id_paciente], [razon], [fecha]) VALUES (N'Cl-00013', N'PA-00013', N'Tose Mucho', CAST(N'2019-10-09' AS Date))
GO
INSERT [dbo].[Citas] ([id_citas], [id_paciente], [razon], [fecha]) VALUES (N'Cl-00014', N'PA-00014', N'Caida de pelo', CAST(N'2019-10-09' AS Date))
GO
INSERT [dbo].[Citas] ([id_citas], [id_paciente], [razon], [fecha]) VALUES (N'Cl-00015', N'PA-00015', N'Parasitos', CAST(N'2019-10-10' AS Date))
GO
INSERT [dbo].[Citas] ([id_citas], [id_paciente], [razon], [fecha]) VALUES (N'Cl-00016', N'PA-00016', N'Ojos llorosos', CAST(N'2019-10-11' AS Date))
GO
INSERT [dbo].[Citas] ([id_citas], [id_paciente], [razon], [fecha]) VALUES (N'Cl-00017', N'PA-00017', N'Caida de pelo', CAST(N'2019-10-13' AS Date))
GO
INSERT [dbo].[Citas] ([id_citas], [id_paciente], [razon], [fecha]) VALUES (N'Cl-00018', N'PA-00018', N'Parasitos', CAST(N'2019-10-15' AS Date))
GO
INSERT [dbo].[Citas] ([id_citas], [id_paciente], [razon], [fecha]) VALUES (N'Cl-00019', N'PA-00019', N'Parasitos', CAST(N'2019-10-16' AS Date))
GO
INSERT [dbo].[Citas] ([id_citas], [id_paciente], [razon], [fecha]) VALUES (N'Cl-00020', N'PA-00020', N'Tiene Hongos', CAST(N'2019-10-17' AS Date))
GO
INSERT [dbo].[Citas] ([id_citas], [id_paciente], [razon], [fecha]) VALUES (N'Cl-00021', N'PA-00021', N'Tiene hongos', CAST(N'2019-10-18' AS Date))
GO
INSERT [dbo].[Citas] ([id_citas], [id_paciente], [razon], [fecha]) VALUES (N'Cl-00022', N'PA-00022', N'Parasitos', CAST(N'2019-10-19' AS Date))
GO
INSERT [dbo].[Citas] ([id_citas], [id_paciente], [razon], [fecha]) VALUES (N'Cl-00023', N'PA-00023', N'Parasitos', CAST(N'2019-10-21' AS Date))
GO
INSERT [dbo].[Citas] ([id_citas], [id_paciente], [razon], [fecha]) VALUES (N'Cl-00024', N'PA-00024', N'Tiene sarna', CAST(N'2019-10-22' AS Date))
GO
INSERT [dbo].[Citas] ([id_citas], [id_paciente], [razon], [fecha]) VALUES (N'Cl-00025', N'PA-00025', N'Tiene rabia', CAST(N'2019-10-23' AS Date))
GO
INSERT [dbo].[Cliente] ([id_cliente], [nombres_cliente], [apellidoPaterno], [apellidoMaterno], [dni], [direccion], [numero_telefono], [email]) VALUES (N'CL-00001', N'Roberto Carlos', N'Ramirez', N'Americo', N'75365498', N'Psje. Las Orquideas 181, VMT', N'960487536', N'rocar_123@gmail.com')
GO
INSERT [dbo].[Cliente] ([id_cliente], [nombres_cliente], [apellidoPaterno], [apellidoMaterno], [dni], [direccion], [numero_telefono], [email]) VALUES (N'CL-00002', N'Maria Esther', N'Soriano', N'Sumac', N'75632148', N'Av. Bosques 248, Lurin', N'985432106', N'mari123@gmail.com')
GO
INSERT [dbo].[Cliente] ([id_cliente], [nombres_cliente], [apellidoPaterno], [apellidoMaterno], [dni], [direccion], [numero_telefono], [email]) VALUES (N'CL-00003', N'Raul', N'Seminario', N'Solis', N'74236974', N'Av. Lachay 456, Rimac', N'984789632', N'rase.147@gmail.com')
GO
INSERT [dbo].[Cliente] ([id_cliente], [nombres_cliente], [apellidoPaterno], [apellidoMaterno], [dni], [direccion], [numero_telefono], [email]) VALUES (N'CL-00004', N'Hugo Nicolas', N'Ugarte', N'Borges', N'74369521', N'Urb. Angamos 122', N'987423148', N'hnico@gmail.com')
GO
INSERT [dbo].[Cliente] ([id_cliente], [nombres_cliente], [apellidoPaterno], [apellidoMaterno], [dni], [direccion], [numero_telefono], [email]) VALUES (N'CL-00005', N'Fernando', N'Quispe', N'Galvez', N'73214569', N'Av. Heraud 159, La Molina', N'963215478', N'ferqui@gmail.com')
GO
INSERT [dbo].[Cliente] ([id_cliente], [nombres_cliente], [apellidoPaterno], [apellidoMaterno], [dni], [direccion], [numero_telefono], [email]) VALUES (N'CL-00006', N'Kevin', N'Taipe', N'Guillen', N'72365425', N'Etapa 4 MzZ1 lt 36, Villa el Salvador', N'988710600', N'kevinT@gmail.com')
GO
INSERT [dbo].[Cliente] ([id_cliente], [nombres_cliente], [apellidoPaterno], [apellidoMaterno], [dni], [direccion], [numero_telefono], [email]) VALUES (N'CL-00007', N'Jonathan', N'Sandoval', N'Medrano', N'76542587', N'Las malvinas lt 49, Surco', N'954875264', N'jonthanXf@gmail.com')
GO
INSERT [dbo].[Cliente] ([id_cliente], [nombres_cliente], [apellidoPaterno], [apellidoMaterno], [dni], [direccion], [numero_telefono], [email]) VALUES (N'CL-00008', N'Andres', N'Garcia', N'Lopez', N'75426912', N'Av. jose olaya 159, Miraflores', N'987521634', N'andresGL@gmail.com')
GO
INSERT [dbo].[Cliente] ([id_cliente], [nombres_cliente], [apellidoPaterno], [apellidoMaterno], [dni], [direccion], [numero_telefono], [email]) VALUES (N'CL-00009', N'Soledad', N'Guillen', N'Aliaga', N'75263452', N'Av. Jorge Basadre 498, San Isidro', N'975632676', N'soledadAl@gmail.com')
GO
INSERT [dbo].[Cliente] ([id_cliente], [nombres_cliente], [apellidoPaterno], [apellidoMaterno], [dni], [direccion], [numero_telefono], [email]) VALUES (N'CL-00010', N'Pio', N'Navarro', N'Dias', N'75236486', N'Calle Los pinos 330, San Isidro', N'975268436', N'pioNa@gmail.com')
GO
INSERT [dbo].[Cliente] ([id_cliente], [nombres_cliente], [apellidoPaterno], [apellidoMaterno], [dni], [direccion], [numero_telefono], [email]) VALUES (N'CL-00011', N'Arturo', N'Lopez', N'Martinez', N'75264236', N'Av. Jorge 24, San Isidro', N'946135426', N'arturoP@gmail.com')
GO
INSERT [dbo].[Cliente] ([id_cliente], [nombres_cliente], [apellidoPaterno], [apellidoMaterno], [dni], [direccion], [numero_telefono], [email]) VALUES (N'CL-00012', N'Jimena', N'Perez', N'Garcia', N'78462154', N'Jr. moreno 45, San Borja', N'985632145', N'jimenaGF@gmail.com')
GO
INSERT [dbo].[Cliente] ([id_cliente], [nombres_cliente], [apellidoPaterno], [apellidoMaterno], [dni], [direccion], [numero_telefono], [email]) VALUES (N'CL-00013', N'Nayeli', N'Flores', N'Molina', N'76942396', N'Av. brasil, Comas', N'965874361', N'nayelig@gmail.com')
GO
INSERT [dbo].[Cliente] ([id_cliente], [nombres_cliente], [apellidoPaterno], [apellidoMaterno], [dni], [direccion], [numero_telefono], [email]) VALUES (N'CL-00014', N'Edgar', N'Benitez', N'Acosta', N'74126358', N'Jr. reategui , VES', N'962436587', N'edgargg@gmail.com')
GO
INSERT [dbo].[Cliente] ([id_cliente], [nombres_cliente], [apellidoPaterno], [apellidoMaterno], [dni], [direccion], [numero_telefono], [email]) VALUES (N'CL-00015', N'Carlos', N'Medina', N'Herrera', N'74156286', N'Av. los rosales 10, San Juan', N'936215847', N'carlosps@gmail.com')
GO
INSERT [dbo].[Cliente] ([id_cliente], [nombres_cliente], [apellidoPaterno], [apellidoMaterno], [dni], [direccion], [numero_telefono], [email]) VALUES (N'CL-00016', N'Hilda', N'Suarez', N'Aguirre', N'74123694', N'Jr. union 25, Comas', N'932164587', N'hildakk@gmail.com')
GO
INSERT [dbo].[Cliente] ([id_cliente], [nombres_cliente], [apellidoPaterno], [apellidoMaterno], [dni], [direccion], [numero_telefono], [email]) VALUES (N'CL-00017', N'Norma', N'Pereyra', N'Rojas', N'74165254', N'Av. francisco 47, San Miguel', N'936214568', N'normath@gmail.com')
GO
INSERT [dbo].[Cliente] ([id_cliente], [nombres_cliente], [apellidoPaterno], [apellidoMaterno], [dni], [direccion], [numero_telefono], [email]) VALUES (N'CL-00018', N'Wendy', N'Molina', N'Castro', N'74169853', N'Jr. alamos 87, La Molina', N'968741254', N'wendyji@gmail.com')
GO
INSERT [dbo].[Cliente] ([id_cliente], [nombres_cliente], [apellidoPaterno], [apellidoMaterno], [dni], [direccion], [numero_telefono], [email]) VALUES (N'CL-00019', N'Jesus', N'Ortiz', N'Silva', N'72368417', N'Av. petituar, Surco', N'936212475', N'jesuspl@gmail.com')
GO
INSERT [dbo].[Cliente] ([id_cliente], [nombres_cliente], [apellidoPaterno], [apellidoMaterno], [dni], [direccion], [numero_telefono], [email]) VALUES (N'CL-00020', N'Pedro', N'Nuñez', N'Luna', N'74569236', N'Jr. central, Miraflores', N'965874821', N'pedroju@gmail.com')
GO
INSERT [dbo].[Cliente] ([id_cliente], [nombres_cliente], [apellidoPaterno], [apellidoMaterno], [dni], [direccion], [numero_telefono], [email]) VALUES (N'CL-00021', N'Judas', N'Juarez', N'Cabrera', N'74698346', N'Jr. bolognesi 21, Comas', N'934825174', N'judasTh@gmail.com')
GO
INSERT [dbo].[Cliente] ([id_cliente], [nombres_cliente], [apellidoPaterno], [apellidoMaterno], [dni], [direccion], [numero_telefono], [email]) VALUES (N'CL-00022', N'Marco', N'Godoy', N'Moreno', N'76983264', N'Av. paruro, VES', N'963485269', N'marcoty@gmail.com')
GO
INSERT [dbo].[Cliente] ([id_cliente], [nombres_cliente], [apellidoPaterno], [apellidoMaterno], [dni], [direccion], [numero_telefono], [email]) VALUES (N'CL-00023', N'Mateo', N'Ferreyra', N'Castillo', N'76359425', N'Av. cuaves 35, Lima', N'974582163', N'mateoki@gmail.com')
GO
INSERT [dbo].[Cliente] ([id_cliente], [nombres_cliente], [apellidoPaterno], [apellidoMaterno], [dni], [direccion], [numero_telefono], [email]) VALUES (N'CL-00024', N'Antonio', N'Vega', N'Vera', N'78624512', N'Av. morales 64, San Juan', N'945872167', N'antonioae@gmail.com')
GO
INSERT [dbo].[Cliente] ([id_cliente], [nombres_cliente], [apellidoPaterno], [apellidoMaterno], [dni], [direccion], [numero_telefono], [email]) VALUES (N'CL-00025', N'Jesusa', N'Muñoz', N'Ojeda', N'76982347', N'Av. los incas 65, Villa Maria', N'936284567', N'jesusa87@gmail.com')
GO
INSERT [dbo].[Detalle Boleta] ([id_boleta], [id_producto], [cantidad], [descripcion], [precio_unit], [valor_venta]) VALUES (N'BO-00001', N'PT-00001', 5, N'Esteroides para sarna', 11.0000, 55.0000)
GO
INSERT [dbo].[Detalle Boleta] ([id_boleta], [id_producto], [cantidad], [descripcion], [precio_unit], [valor_venta]) VALUES (N'BO-00002', N'PT-00002', 7, N'Gotas para ojos', 25.0000, 175.0000)
GO
INSERT [dbo].[Detalle Boleta] ([id_boleta], [id_producto], [cantidad], [descripcion], [precio_unit], [valor_venta]) VALUES (N'BO-00003', N'PT-00003', 10, N'Hierro', 32.0000, 320.0000)
GO
INSERT [dbo].[Detalle Boleta] ([id_boleta], [id_producto], [cantidad], [descripcion], [precio_unit], [valor_venta]) VALUES (N'BO-00004', N'PT-00004', 4, N'Antihongos', 7.0000, 28.0000)
GO
INSERT [dbo].[Detalle Boleta] ([id_boleta], [id_producto], [cantidad], [descripcion], [precio_unit], [valor_venta]) VALUES (N'BO-00005', N'PT-00005', 5, N'Gotas para ojos', 25.0000, 125.0000)
GO
INSERT [dbo].[Detalle Boleta] ([id_boleta], [id_producto], [cantidad], [descripcion], [precio_unit], [valor_venta]) VALUES (N'BO-00006', N'PT-00006', 4, N'Pastilla para Rabia', 9.0000, 32.0000)
GO
INSERT [dbo].[Detalle Boleta] ([id_boleta], [id_producto], [cantidad], [descripcion], [precio_unit], [valor_venta]) VALUES (N'BO-00007', N'PT-00007', 6, N'Antibiotico para Tos', 22.0000, 132.0000)
GO
INSERT [dbo].[Detalle Boleta] ([id_boleta], [id_producto], [cantidad], [descripcion], [precio_unit], [valor_venta]) VALUES (N'BO-00008', N'PT-00008', 4, N'Anticadia de pelo', 15.0000, 60.0000)
GO
INSERT [dbo].[Detalle Boleta] ([id_boleta], [id_producto], [cantidad], [descripcion], [precio_unit], [valor_venta]) VALUES (N'BO-00009', N'PT-00009', 2, N'Gotas para Ojos', 62.0000, 124.0000)
GO
INSERT [dbo].[Detalle Boleta] ([id_boleta], [id_producto], [cantidad], [descripcion], [precio_unit], [valor_venta]) VALUES (N'BO-00010', N'PT-00010', 10, N'Crema para Parasitos', 5.0000, 50.0000)
GO
INSERT [dbo].[Detalle Boleta] ([id_boleta], [id_producto], [cantidad], [descripcion], [precio_unit], [valor_venta]) VALUES (N'BO-00011', N'PT-00011', 5, N'Esteroides', 7.0000, 35.0000)
GO
INSERT [dbo].[Detalle Boleta] ([id_boleta], [id_producto], [cantidad], [descripcion], [precio_unit], [valor_venta]) VALUES (N'BO-00012', N'PT-00012', 6, N'Infecciones', 22.0000, 132.0000)
GO
INSERT [dbo].[Detalle Boleta] ([id_boleta], [id_producto], [cantidad], [descripcion], [precio_unit], [valor_venta]) VALUES (N'BO-00013', N'PT-00013', 4, N'Roturas', 11.0000, 44.0000)
GO
INSERT [dbo].[Detalle Boleta] ([id_boleta], [id_producto], [cantidad], [descripcion], [precio_unit], [valor_venta]) VALUES (N'BO-00014', N'PT-00014', 2, N'Antipulga', 4.0000, 8.0000)
GO
INSERT [dbo].[Detalle Boleta] ([id_boleta], [id_producto], [cantidad], [descripcion], [precio_unit], [valor_venta]) VALUES (N'BO-00015', N'PT-00015', 12, N'Anticaida de pelo', 15.0000, 180.0000)
GO
INSERT [dbo].[Detalle Boleta] ([id_boleta], [id_producto], [cantidad], [descripcion], [precio_unit], [valor_venta]) VALUES (N'BO-00016', N'PT-00016', 14, N'Pastillas para rabia', 13.0000, 182.0000)
GO
INSERT [dbo].[Detalle Boleta] ([id_boleta], [id_producto], [cantidad], [descripcion], [precio_unit], [valor_venta]) VALUES (N'BO-00017', N'PT-00017', 5, N'Hierro', 5.0000, 25.0000)
GO
INSERT [dbo].[Detalle Boleta] ([id_boleta], [id_producto], [cantidad], [descripcion], [precio_unit], [valor_venta]) VALUES (N'BO-00018', N'PT-00018', 3, N'Antihongos', 10.0000, 30.0000)
GO
INSERT [dbo].[Detalle Boleta] ([id_boleta], [id_producto], [cantidad], [descripcion], [precio_unit], [valor_venta]) VALUES (N'BO-00019', N'PT-00019', 2, N'Crema para Parasitos', 10.0000, 20.0000)
GO
INSERT [dbo].[Detalle Boleta] ([id_boleta], [id_producto], [cantidad], [descripcion], [precio_unit], [valor_venta]) VALUES (N'BO-00020', N'PT-00020', 7, N'Vendas', 11.0000, 77.0000)
GO
INSERT [dbo].[Detalle Boleta] ([id_boleta], [id_producto], [cantidad], [descripcion], [precio_unit], [valor_venta]) VALUES (N'BO-00021', N'PT-00021', 8, N'Anestecia', 7.0000, 56.0000)
GO
INSERT [dbo].[Detalle Boleta] ([id_boleta], [id_producto], [cantidad], [descripcion], [precio_unit], [valor_venta]) VALUES (N'BO-00022', N'PT-00022', 5, N'Gasas', 3.0000, 15.0000)
GO
INSERT [dbo].[Detalle Boleta] ([id_boleta], [id_producto], [cantidad], [descripcion], [precio_unit], [valor_venta]) VALUES (N'BO-00023', N'PT-00023', 2, N'Alcohol', 3.0000, 6.0000)
GO
INSERT [dbo].[Detalle Boleta] ([id_boleta], [id_producto], [cantidad], [descripcion], [precio_unit], [valor_venta]) VALUES (N'BO-00024', N'PT-00024', 4, N'Crema para caracha', 22.0000, 88.0000)
GO
INSERT [dbo].[Detalle Boleta] ([id_boleta], [id_producto], [cantidad], [descripcion], [precio_unit], [valor_venta]) VALUES (N'BO-00025', N'PT-00025', 4, N'Sueroz', 5.0000, 20.0000)
GO
INSERT [dbo].[Empleado] ([id_empleado], [nombre_empleado], [apellidoPaterno], [apellidoMaterno], [dni], [edad], [telefono]) VALUES (N'EM-00001', N'Pablo Raul', N'Fanta', N'Gutierrez', N'78952346', 30, N'964753658')
GO
INSERT [dbo].[Empleado] ([id_empleado], [nombre_empleado], [apellidoPaterno], [apellidoMaterno], [dni], [edad], [telefono]) VALUES (N'EM-00002', N'Fabrizio', N'Bracamonte', N'Diaz', N'77569847', 25, N'965698723')
GO
INSERT [dbo].[Empleado] ([id_empleado], [nombre_empleado], [apellidoPaterno], [apellidoMaterno], [dni], [edad], [telefono]) VALUES (N'EM-00003', N'Ayda Luz', N'Rivera', N'Gutierrez', N'74236346', 20, N'999632547')
GO
INSERT [dbo].[Empleado] ([id_empleado], [nombre_empleado], [apellidoPaterno], [apellidoMaterno], [dni], [edad], [telefono]) VALUES (N'EM-00004', N'Claudia Lucia', N'Villalba', N'Rueda', N'77896324', 20, N'960331243')
GO
INSERT [dbo].[Empleado] ([id_empleado], [nombre_empleado], [apellidoPaterno], [apellidoMaterno], [dni], [edad], [telefono]) VALUES (N'EM-00005', N'Paola', N'Torres', N'Yauya', N'75693124', 23, N'963232534')
GO
INSERT [dbo].[Empleado] ([id_empleado], [nombre_empleado], [apellidoPaterno], [apellidoMaterno], [dni], [edad], [telefono]) VALUES (N'EM-00006', N'Veronica', N'Brooks', N'Pacheco', N'75624536', 32, N'993337141')
GO
INSERT [dbo].[Empleado] ([id_empleado], [nombre_empleado], [apellidoPaterno], [apellidoMaterno], [dni], [edad], [telefono]) VALUES (N'EM-00007', N'Alexander', N'Paredes', N'Smith', N'73564258', 24, N'956842685')
GO
INSERT [dbo].[Empleado] ([id_empleado], [nombre_empleado], [apellidoPaterno], [apellidoMaterno], [dni], [edad], [telefono]) VALUES (N'EM-00008', N'Federico', N'Ochoa', N'Cruz', N'74268951', 26, N'987456257')
GO
INSERT [dbo].[Empleado] ([id_empleado], [nombre_empleado], [apellidoPaterno], [apellidoMaterno], [dni], [edad], [telefono]) VALUES (N'EM-00009', N'Fiorella', N'Buendia', N'Quiñones', N'76354124', 24, N'968542357')
GO
INSERT [dbo].[Empleado] ([id_empleado], [nombre_empleado], [apellidoPaterno], [apellidoMaterno], [dni], [edad], [telefono]) VALUES (N'EM-00010', N'Susana', N'Gamboa', N'Gonzales', N'75426891', 29, N'985234561')
GO
INSERT [dbo].[Empleado] ([id_empleado], [nombre_empleado], [apellidoPaterno], [apellidoMaterno], [dni], [edad], [telefono]) VALUES (N'EM-00011', N'Lucero', N'Ojeda', N'Ponce', N'74563261', 21, N'965874236')
GO
INSERT [dbo].[Empleado] ([id_empleado], [nombre_empleado], [apellidoPaterno], [apellidoMaterno], [dni], [edad], [telefono]) VALUES (N'EM-00012', N'Leslie', N'Villalba', N'Cardozo', N'75624815', 24, N'965842637')
GO
INSERT [dbo].[Empleado] ([id_empleado], [nombre_empleado], [apellidoPaterno], [apellidoMaterno], [dni], [edad], [telefono]) VALUES (N'EM-00013', N'Katty', N'Navarro', N'Coronel', N'76425941', 26, N'968754123')
GO
INSERT [dbo].[Empleado] ([id_empleado], [nombre_empleado], [apellidoPaterno], [apellidoMaterno], [dni], [edad], [telefono]) VALUES (N'EM-00014', N'Brayan', N'Vazques', N'Ramos', N'74158642', 19, N'936258741')
GO
INSERT [dbo].[Empleado] ([id_empleado], [nombre_empleado], [apellidoPaterno], [apellidoMaterno], [dni], [edad], [telefono]) VALUES (N'EM-00015', N'Raul', N'Vargas', N'Caceres', N'79658415', 20, N'987563284')
GO
INSERT [dbo].[Empleado] ([id_empleado], [nombre_empleado], [apellidoPaterno], [apellidoMaterno], [dni], [edad], [telefono]) VALUES (N'EM-00016', N'Ignacio', N'Arias', N'Figeroa', N'76985234', 21, N'963587642')
GO
INSERT [dbo].[Empleado] ([id_empleado], [nombre_empleado], [apellidoPaterno], [apellidoMaterno], [dni], [edad], [telefono]) VALUES (N'EM-00017', N'Pedro', N'Cordova', N'Correa', N'78541972', 23, N'968741264')
GO
INSERT [dbo].[Empleado] ([id_empleado], [nombre_empleado], [apellidoPaterno], [apellidoMaterno], [dni], [edad], [telefono]) VALUES (N'EM-00018', N'Cristian', N'Maldonado', N'Paz', N'74186475', 26, N'936874124')
GO
INSERT [dbo].[Empleado] ([id_empleado], [nombre_empleado], [apellidoPaterno], [apellidoMaterno], [dni], [edad], [telefono]) VALUES (N'EM-00019', N'Marvin', N'Rivero', N'Miranda', N'79623841', 25, N'936248712')
GO
INSERT [dbo].[Empleado] ([id_empleado], [nombre_empleado], [apellidoPaterno], [apellidoMaterno], [dni], [edad], [telefono]) VALUES (N'EM-00020', N'Ricardo', N'Roldan', N'Mendez', N'79865432', 24, N'986354765')
GO
INSERT [dbo].[Empleado] ([id_empleado], [nombre_empleado], [apellidoPaterno], [apellidoMaterno], [dni], [edad], [telefono]) VALUES (N'EM-00021', N'Victoria', N'Guzman', N'Aguero', N'78426571', 20, N'986465416')
GO
INSERT [dbo].[Empleado] ([id_empleado], [nombre_empleado], [apellidoPaterno], [apellidoMaterno], [dni], [edad], [telefono]) VALUES (N'EM-00022', N'Chabela', N'Cruz', N'Paez', N'79632481', 25, N'963542178')
GO
INSERT [dbo].[Empleado] ([id_empleado], [nombre_empleado], [apellidoPaterno], [apellidoMaterno], [dni], [edad], [telefono]) VALUES (N'EM-00023', N'Lupe', N'Escobar', N'Mendoza', N'74698235', 21, N'936248517')
GO
INSERT [dbo].[Empleado] ([id_empleado], [nombre_empleado], [apellidoPaterno], [apellidoMaterno], [dni], [edad], [telefono]) VALUES (N'EM-00024', N'Dora', N'Barrios', N'Bustos', N'79412347', 22, N'932145255')
GO
INSERT [dbo].[Empleado] ([id_empleado], [nombre_empleado], [apellidoPaterno], [apellidoMaterno], [dni], [edad], [telefono]) VALUES (N'EM-00025', N'Pilar', N'Ayala', N'Blanco', N'79636528', 29, N'947523365')
GO
INSERT [dbo].[Especie] ([id_especie], [nombre_especie]) VALUES (N'EP-00001', N'Perro')
GO
INSERT [dbo].[Especie] ([id_especie], [nombre_especie]) VALUES (N'EP-00002', N'Gato')
GO
INSERT [dbo].[Especie] ([id_especie], [nombre_especie]) VALUES (N'EP-00003', N'Tortuga')
GO
INSERT [dbo].[Especie] ([id_especie], [nombre_especie]) VALUES (N'EP-00004', N'Caballo')
GO
INSERT [dbo].[Especie] ([id_especie], [nombre_especie]) VALUES (N'EP-00005', N'Conejo')
GO
INSERT [dbo].[Especie] ([id_especie], [nombre_especie]) VALUES (N'EP-00006', N'Cerdo')
GO
INSERT [dbo].[Especie] ([id_especie], [nombre_especie]) VALUES (N'EP-00007', N'Loro')
GO
INSERT [dbo].[Especie] ([id_especie], [nombre_especie]) VALUES (N'EP-00008', N'Tarantula')
GO
INSERT [dbo].[Especie] ([id_especie], [nombre_especie]) VALUES (N'EP-00009', N'Iguana')
GO
INSERT [dbo].[Especie] ([id_especie], [nombre_especie]) VALUES (N'EP-00010', N'Ardilla')
GO
INSERT [dbo].[Especie] ([id_especie], [nombre_especie]) VALUES (N'EP-00011', N'Vacas')
GO
INSERT [dbo].[Especie] ([id_especie], [nombre_especie]) VALUES (N'EP-00012', N'Pericos')
GO
INSERT [dbo].[Especie] ([id_especie], [nombre_especie]) VALUES (N'EP-00013', N'Erizos')
GO
INSERT [dbo].[Especie] ([id_especie], [nombre_especie]) VALUES (N'EP-00014', N'Lagarto')
GO
INSERT [dbo].[Especie] ([id_especie], [nombre_especie]) VALUES (N'EP-00015', N'Conejillos')
GO
INSERT [dbo].[Especie] ([id_especie], [nombre_especie]) VALUES (N'EP-00016', N'Mono')
GO
INSERT [dbo].[Especie] ([id_especie], [nombre_especie]) VALUES (N'EP-00017', N'Gallinas')
GO
INSERT [dbo].[Especie] ([id_especie], [nombre_especie]) VALUES (N'EP-00018', N'Serpiente')
GO
INSERT [dbo].[Especie] ([id_especie], [nombre_especie]) VALUES (N'EP-00019', N'Ratones')
GO
INSERT [dbo].[Especie] ([id_especie], [nombre_especie]) VALUES (N'EP-00020', N'Ratas')
GO
INSERT [dbo].[Especie] ([id_especie], [nombre_especie]) VALUES (N'EP-00021', N'Camello')
GO
INSERT [dbo].[Especie] ([id_especie], [nombre_especie]) VALUES (N'EP-00022', N'Avestruz')
GO
INSERT [dbo].[Especie] ([id_especie], [nombre_especie]) VALUES (N'EP-00023', N'Canguro')
GO
INSERT [dbo].[Especie] ([id_especie], [nombre_especie]) VALUES (N'EP-00024', N'Hiena')
GO
INSERT [dbo].[Especie] ([id_especie], [nombre_especie]) VALUES (N'EP-00025', N'Nutria')
GO
INSERT [dbo].[Historial Medico] ([id_historial], [id_paciente], [id_vacuna], [id_tratamiento], [fecha], [duracion]) VALUES (N'HM-00001', N'PA-00001', N'VA-00001', N'TR-00001', CAST(N'2019-07-10' AS Date), N'3 meses')
GO
INSERT [dbo].[Historial Medico] ([id_historial], [id_paciente], [id_vacuna], [id_tratamiento], [fecha], [duracion]) VALUES (N'HM-00002', N'PA-00002', N'VA-00002', N'TR-00002', CAST(N'2019-07-15' AS Date), N'2 meses')
GO
INSERT [dbo].[Historial Medico] ([id_historial], [id_paciente], [id_vacuna], [id_tratamiento], [fecha], [duracion]) VALUES (N'HM-00003', N'PA-00003', N'VA-00003', N'TR-00003', CAST(N'2019-07-19' AS Date), N'1 mes')
GO
INSERT [dbo].[Historial Medico] ([id_historial], [id_paciente], [id_vacuna], [id_tratamiento], [fecha], [duracion]) VALUES (N'HM-00004', N'PA-00004', N'VA-00004', N'TR-00004', CAST(N'2019-08-20' AS Date), N'25 dias')
GO
INSERT [dbo].[Historial Medico] ([id_historial], [id_paciente], [id_vacuna], [id_tratamiento], [fecha], [duracion]) VALUES (N'HM-00005', N'PA-00005', N'VA-00002', N'TR-00002', CAST(N'2019-08-21' AS Date), N'1 meses')
GO
INSERT [dbo].[Historial Medico] ([id_historial], [id_paciente], [id_vacuna], [id_tratamiento], [fecha], [duracion]) VALUES (N'HM-00006', N'PA-00006', N'VA-00006', N'TR-00005', CAST(N'2019-09-08' AS Date), N'1 mes')
GO
INSERT [dbo].[Historial Medico] ([id_historial], [id_paciente], [id_vacuna], [id_tratamiento], [fecha], [duracion]) VALUES (N'HM-00007', N'PA-00007', N'VA-00007', N'TR-00006', CAST(N'2019-09-10' AS Date), N'2 meses')
GO
INSERT [dbo].[Historial Medico] ([id_historial], [id_paciente], [id_vacuna], [id_tratamiento], [fecha], [duracion]) VALUES (N'HM-00008', N'PA-00008', N'VA-00008', N'TR-00007', CAST(N'2019-09-15' AS Date), N'1 mes')
GO
INSERT [dbo].[Historial Medico] ([id_historial], [id_paciente], [id_vacuna], [id_tratamiento], [fecha], [duracion]) VALUES (N'HM-00009', N'PA-00009', N'VA-00009', N'TR-00008', CAST(N'2019-09-18' AS Date), N'3 meses')
GO
INSERT [dbo].[Historial Medico] ([id_historial], [id_paciente], [id_vacuna], [id_tratamiento], [fecha], [duracion]) VALUES (N'HM-00010', N'PA-00010', N'VA-00010', N'TR-00009', CAST(N'2019-10-12' AS Date), N'1 mes')
GO
INSERT [dbo].[Historial Medico] ([id_historial], [id_paciente], [id_vacuna], [id_tratamiento], [fecha], [duracion]) VALUES (N'HM-00011', N'PA-00011', N'VA-00011', N'TR-00010', CAST(N'2019-10-13' AS Date), N'2 meses')
GO
INSERT [dbo].[Historial Medico] ([id_historial], [id_paciente], [id_vacuna], [id_tratamiento], [fecha], [duracion]) VALUES (N'HM-00012', N'PA-00012', N'VA-00012', N'TR-00011', CAST(N'2019-10-14' AS Date), N'1 mes')
GO
INSERT [dbo].[Historial Medico] ([id_historial], [id_paciente], [id_vacuna], [id_tratamiento], [fecha], [duracion]) VALUES (N'HM-00013', N'PA-00013', N'VA-00013', N'TR-00012', CAST(N'2019-10-15' AS Date), N'2 meses')
GO
INSERT [dbo].[Historial Medico] ([id_historial], [id_paciente], [id_vacuna], [id_tratamiento], [fecha], [duracion]) VALUES (N'HM-00014', N'PA-00014', N'VA-00014', N'TR-00013', CAST(N'2019-10-16' AS Date), N'1 mes')
GO
INSERT [dbo].[Historial Medico] ([id_historial], [id_paciente], [id_vacuna], [id_tratamiento], [fecha], [duracion]) VALUES (N'HM-00015', N'PA-00015', N'VA-00015', N'TR-00014', CAST(N'2019-10-17' AS Date), N'3 meses')
GO
INSERT [dbo].[Historial Medico] ([id_historial], [id_paciente], [id_vacuna], [id_tratamiento], [fecha], [duracion]) VALUES (N'HM-00016', N'PA-00016', N'VA-00016', N'TR-00015', CAST(N'2019-10-19' AS Date), N'1 mes')
GO
INSERT [dbo].[Historial Medico] ([id_historial], [id_paciente], [id_vacuna], [id_tratamiento], [fecha], [duracion]) VALUES (N'HM-00017', N'PA-00017', N'VA-00017', N'TR-00016', CAST(N'2019-10-20' AS Date), N'1 mes')
GO
INSERT [dbo].[Historial Medico] ([id_historial], [id_paciente], [id_vacuna], [id_tratamiento], [fecha], [duracion]) VALUES (N'HM-00018', N'PA-00018', N'VA-00018', N'TR-00017', CAST(N'2019-10-21' AS Date), N'2 meses')
GO
INSERT [dbo].[Historial Medico] ([id_historial], [id_paciente], [id_vacuna], [id_tratamiento], [fecha], [duracion]) VALUES (N'HM-00019', N'PA-00019', N'VA-00019', N'TR-00018', CAST(N'2019-10-22' AS Date), N'3 meses')
GO
INSERT [dbo].[Historial Medico] ([id_historial], [id_paciente], [id_vacuna], [id_tratamiento], [fecha], [duracion]) VALUES (N'HM-00020', N'PA-00020', N'VA-00020', N'TR-00019', CAST(N'2019-10-23' AS Date), N'1 mes')
GO
INSERT [dbo].[Historial Medico] ([id_historial], [id_paciente], [id_vacuna], [id_tratamiento], [fecha], [duracion]) VALUES (N'HM-00021', N'PA-00021', N'VA-00021', N'TR-00020', CAST(N'2019-10-24' AS Date), N'1 mes')
GO
INSERT [dbo].[Historial Medico] ([id_historial], [id_paciente], [id_vacuna], [id_tratamiento], [fecha], [duracion]) VALUES (N'HM-00022', N'PA-00022', N'VA-00022', N'TR-00021', CAST(N'2019-10-25' AS Date), N'2 meses')
GO
INSERT [dbo].[Historial Medico] ([id_historial], [id_paciente], [id_vacuna], [id_tratamiento], [fecha], [duracion]) VALUES (N'HM-00023', N'PA-00023', N'VA-00023', N'TR-00022', CAST(N'2019-10-28' AS Date), N'1 mes')
GO
INSERT [dbo].[Historial Medico] ([id_historial], [id_paciente], [id_vacuna], [id_tratamiento], [fecha], [duracion]) VALUES (N'HM-00024', N'PA-00024', N'VA-00024', N'TR-00023', CAST(N'2019-10-29' AS Date), N'3 meses')
GO
INSERT [dbo].[Historial Medico] ([id_historial], [id_paciente], [id_vacuna], [id_tratamiento], [fecha], [duracion]) VALUES (N'HM-00025', N'PA-00025', N'VA-00025', N'TR-00024', CAST(N'2019-10-30' AS Date), N'1 mes')
GO
INSERT [dbo].[Paciente] ([id_paciente], [id_cliente], [id_raza], [nombre_paciente], [sexo], [edad], [alergias], [observacion]) VALUES (N'PA-00001', N'CL-00001', N'RZ-00001', N'Chimoc', N'M', 1, N'Ninguna', N'Perro enfermo')
GO
INSERT [dbo].[Paciente] ([id_paciente], [id_cliente], [id_raza], [nombre_paciente], [sexo], [edad], [alergias], [observacion]) VALUES (N'PA-00002', N'CL-00002', N'RZ-00003', N'Michi', N'M', 1, N'Ninguna', N'Gato enfermo')
GO
INSERT [dbo].[Paciente] ([id_paciente], [id_cliente], [id_raza], [nombre_paciente], [sexo], [edad], [alergias], [observacion]) VALUES (N'PA-00003', N'CL-00003', N'RZ-00006', N'Tortuneitor', N'M', 10, N'Ninguna', N'Tortuga enferma')
GO
INSERT [dbo].[Paciente] ([id_paciente], [id_cliente], [id_raza], [nombre_paciente], [sexo], [edad], [alergias], [observacion]) VALUES (N'PA-00004', N'CL-00004', N'RZ-00007', N'Lucky', N'H', 4, N'Ninguna', N'Yegua enferma')
GO
INSERT [dbo].[Paciente] ([id_paciente], [id_cliente], [id_raza], [nombre_paciente], [sexo], [edad], [alergias], [observacion]) VALUES (N'PA-00005', N'CL-00005', N'RZ-00010', N'Lola', N'H', 2, N'Ninguna', N'Coneja enferma')
GO
INSERT [dbo].[Paciente] ([id_paciente], [id_cliente], [id_raza], [nombre_paciente], [sexo], [edad], [alergias], [observacion]) VALUES (N'PA-00006', N'CL-00006', N'RZ-00008', N'Rocky', N'M', 8, N'Ninguna', N'Perro Enfermo')
GO
INSERT [dbo].[Paciente] ([id_paciente], [id_cliente], [id_raza], [nombre_paciente], [sexo], [edad], [alergias], [observacion]) VALUES (N'PA-00007', N'CL-00007', N'RZ-00002', N'Mustafa', N'H', 4, N'Ninguna', N'Gato Enfermo')
GO
INSERT [dbo].[Paciente] ([id_paciente], [id_cliente], [id_raza], [nombre_paciente], [sexo], [edad], [alergias], [observacion]) VALUES (N'PA-00008', N'CL-00008', N'RZ-00010', N'Cone', N'M', 5, N'Ninguna', N'Conejo Enfermo')
GO
INSERT [dbo].[Paciente] ([id_paciente], [id_cliente], [id_raza], [nombre_paciente], [sexo], [edad], [alergias], [observacion]) VALUES (N'PA-00009', N'CL-00009', N'RZ-00007', N'Spirit', N'M', 7, N'Ninguna', N'Caballo Enfermo')
GO
INSERT [dbo].[Paciente] ([id_paciente], [id_cliente], [id_raza], [nombre_paciente], [sexo], [edad], [alergias], [observacion]) VALUES (N'PA-00010', N'CL-00010', N'RZ-00006', N'Perla', N'H', 10, N'Ninguna', N'Tortuga Enfermo')
GO
INSERT [dbo].[Paciente] ([id_paciente], [id_cliente], [id_raza], [nombre_paciente], [sexo], [edad], [alergias], [observacion]) VALUES (N'PA-00011', N'CL-00011', N'RZ-00012', N'Ollin', N'M', 8, N'Ninguna', N'Cerdo Enfermo')
GO
INSERT [dbo].[Paciente] ([id_paciente], [id_cliente], [id_raza], [nombre_paciente], [sexo], [edad], [alergias], [observacion]) VALUES (N'PA-00012', N'CL-00012', N'RZ-00002', N'Gringita', N'H', 12, N'Ninguna', N'Gato Enfermo')
GO
INSERT [dbo].[Paciente] ([id_paciente], [id_cliente], [id_raza], [nombre_paciente], [sexo], [edad], [alergias], [observacion]) VALUES (N'PA-00013', N'CL-00013', N'RZ-00008', N'Bronco', N'M', 5, N'Ninguna', N'Perro Enfermo')
GO
INSERT [dbo].[Paciente] ([id_paciente], [id_cliente], [id_raza], [nombre_paciente], [sexo], [edad], [alergias], [observacion]) VALUES (N'PA-00014', N'CL-00014', N'RZ-00010', N'Bos', N'H', 4, N'Ninguna', N'Conejo Enfermo')
GO
INSERT [dbo].[Paciente] ([id_paciente], [id_cliente], [id_raza], [nombre_paciente], [sexo], [edad], [alergias], [observacion]) VALUES (N'PA-00015', N'CL-00015', N'RZ-00007', N'Velos', N'H', 6, N'Ninguna', N'Caballo Enfermo')
GO
INSERT [dbo].[Paciente] ([id_paciente], [id_cliente], [id_raza], [nombre_paciente], [sexo], [edad], [alergias], [observacion]) VALUES (N'PA-00016', N'CL-00016', N'RZ-00006', N'Lanca', N'M', 7, N'Ninguna', N'Tortuga Enfermo')
GO
INSERT [dbo].[Paciente] ([id_paciente], [id_cliente], [id_raza], [nombre_paciente], [sexo], [edad], [alergias], [observacion]) VALUES (N'PA-00017', N'CL-00017', N'RZ-00017', N'Cresta', N'H', 1, N'Ninguna', N'Iguana Enfermo')
GO
INSERT [dbo].[Paciente] ([id_paciente], [id_cliente], [id_raza], [nombre_paciente], [sexo], [edad], [alergias], [observacion]) VALUES (N'PA-00018', N'CL-00018', N'RZ-00011', N'Malefico', N'M', 3, N'Ninguna', N'Cerdo Enfermo')
GO
INSERT [dbo].[Paciente] ([id_paciente], [id_cliente], [id_raza], [nombre_paciente], [sexo], [edad], [alergias], [observacion]) VALUES (N'PA-00019', N'CL-00019', N'RZ-00018', N'Lenguin', N'H', 2, N'Ninguna', N'Iguana Enfermo')
GO
INSERT [dbo].[Paciente] ([id_paciente], [id_cliente], [id_raza], [nombre_paciente], [sexo], [edad], [alergias], [observacion]) VALUES (N'PA-00020', N'CL-00020', N'RZ-00013', N'Picos', N'H', 4, N'Ninguna', N'Loro Enfermo')
GO
INSERT [dbo].[Paciente] ([id_paciente], [id_cliente], [id_raza], [nombre_paciente], [sexo], [edad], [alergias], [observacion]) VALUES (N'PA-00021', N'CL-00021', N'RZ-00019', N'Dienton', N'M', 5, N'Ninguna', N'Ardilla Enfermo')
GO
INSERT [dbo].[Paciente] ([id_paciente], [id_cliente], [id_raza], [nombre_paciente], [sexo], [edad], [alergias], [observacion]) VALUES (N'PA-00022', N'CL-00022', N'RZ-00014', N'Parlanchin', N'M', 6, N'Ninguna', N'Loro Enfermo')
GO
INSERT [dbo].[Paciente] ([id_paciente], [id_cliente], [id_raza], [nombre_paciente], [sexo], [edad], [alergias], [observacion]) VALUES (N'PA-00023', N'CL-00023', N'RZ-00020', N'Machin', N'M', 8, N'Ninguna', N'Ardilla Enfermo')
GO
INSERT [dbo].[Paciente] ([id_paciente], [id_cliente], [id_raza], [nombre_paciente], [sexo], [edad], [alergias], [observacion]) VALUES (N'PA-00024', N'CL-00024', N'RZ-00008', N'Tony', N'H', 7, N'Ninguna', N'Perro Enfermo')
GO
INSERT [dbo].[Paciente] ([id_paciente], [id_cliente], [id_raza], [nombre_paciente], [sexo], [edad], [alergias], [observacion]) VALUES (N'PA-00025', N'CL-00025', N'RZ-00002', N'Pelusa', N'H', 9, N'Ninguna', N'Gato Enfermo')
GO
INSERT [dbo].[Producto] ([id_producto], [id_proveedor], [nombre_producto], [cantidad], [precio]) VALUES (N'PT-00001', N'PV-00001', N'Esteroides', 100, 1000.0000)
GO
INSERT [dbo].[Producto] ([id_producto], [id_proveedor], [nombre_producto], [cantidad], [precio]) VALUES (N'PT-00002', N'PV-00002', N'Gotas para ojos', 50, 1200.0000)
GO
INSERT [dbo].[Producto] ([id_producto], [id_proveedor], [nombre_producto], [cantidad], [precio]) VALUES (N'PT-00003', N'PV-00003', N'Hierro en pastillas', 40, 1200.0000)
GO
INSERT [dbo].[Producto] ([id_producto], [id_proveedor], [nombre_producto], [cantidad], [precio]) VALUES (N'PT-00004', N'PV-00004', N'Antihongos', 60, 300.0000)
GO
INSERT [dbo].[Producto] ([id_producto], [id_proveedor], [nombre_producto], [cantidad], [precio]) VALUES (N'PT-00005', N'PV-00005', N'Juguetes', 100, 1000.0000)
GO
INSERT [dbo].[Producto] ([id_producto], [id_proveedor], [nombre_producto], [cantidad], [precio]) VALUES (N'PT-00006', N'PV-00006', N'Pastillas para Rabia', 50, 400.0000)
GO
INSERT [dbo].[Producto] ([id_producto], [id_proveedor], [nombre_producto], [cantidad], [precio]) VALUES (N'PT-00007', N'PV-00007', N'Antibiotico para Tos', 30, 600.0000)
GO
INSERT [dbo].[Producto] ([id_producto], [id_proveedor], [nombre_producto], [cantidad], [precio]) VALUES (N'PT-00008', N'PV-00008', N'Anticadia de pelo', 60, 800.0000)
GO
INSERT [dbo].[Producto] ([id_producto], [id_proveedor], [nombre_producto], [cantidad], [precio]) VALUES (N'PT-00009', N'PV-00009', N'Gotas para Ojos', 20, 1200.0000)
GO
INSERT [dbo].[Producto] ([id_producto], [id_proveedor], [nombre_producto], [cantidad], [precio]) VALUES (N'PT-00010', N'PV-00010', N'Crema para Parasitos', 70, 250.0000)
GO
INSERT [dbo].[Producto] ([id_producto], [id_proveedor], [nombre_producto], [cantidad], [precio]) VALUES (N'PT-00011', N'PV-00011', N'Esteroides', 20, 120.0000)
GO
INSERT [dbo].[Producto] ([id_producto], [id_proveedor], [nombre_producto], [cantidad], [precio]) VALUES (N'PT-00012', N'PV-00012', N'Infecciones', 15, 300.0000)
GO
INSERT [dbo].[Producto] ([id_producto], [id_proveedor], [nombre_producto], [cantidad], [precio]) VALUES (N'PT-00013', N'PV-00013', N'Roturas', 15, 140.0000)
GO
INSERT [dbo].[Producto] ([id_producto], [id_proveedor], [nombre_producto], [cantidad], [precio]) VALUES (N'PT-00014', N'PV-00014', N'Antipulga', 60, 145.0000)
GO
INSERT [dbo].[Producto] ([id_producto], [id_proveedor], [nombre_producto], [cantidad], [precio]) VALUES (N'PT-00015', N'PV-00015', N'Anticaida de pelo', 10, 150.0000)
GO
INSERT [dbo].[Producto] ([id_producto], [id_proveedor], [nombre_producto], [cantidad], [precio]) VALUES (N'PT-00016', N'PV-00016', N'Pastillas para rabia', 18, 200.0000)
GO
INSERT [dbo].[Producto] ([id_producto], [id_proveedor], [nombre_producto], [cantidad], [precio]) VALUES (N'PT-00017', N'PV-00017', N'Hierro', 25, 120.0000)
GO
INSERT [dbo].[Producto] ([id_producto], [id_proveedor], [nombre_producto], [cantidad], [precio]) VALUES (N'PT-00018', N'PV-00018', N'Antihongos', 10, 100.0000)
GO
INSERT [dbo].[Producto] ([id_producto], [id_proveedor], [nombre_producto], [cantidad], [precio]) VALUES (N'PT-00019', N'PV-00019', N'Crema para Parasitos', 30, 300.0000)
GO
INSERT [dbo].[Producto] ([id_producto], [id_proveedor], [nombre_producto], [cantidad], [precio]) VALUES (N'PT-00020', N'PV-00020', N'Vendas', 15, 150.0000)
GO
INSERT [dbo].[Producto] ([id_producto], [id_proveedor], [nombre_producto], [cantidad], [precio]) VALUES (N'PT-00021', N'PV-00021', N'Anestecia', 20, 120.0000)
GO
INSERT [dbo].[Producto] ([id_producto], [id_proveedor], [nombre_producto], [cantidad], [precio]) VALUES (N'PT-00022', N'PV-00022', N'Gasas', 120, 240.0000)
GO
INSERT [dbo].[Producto] ([id_producto], [id_proveedor], [nombre_producto], [cantidad], [precio]) VALUES (N'PT-00023', N'PV-00023', N'Alcohol', 100, 250.0000)
GO
INSERT [dbo].[Producto] ([id_producto], [id_proveedor], [nombre_producto], [cantidad], [precio]) VALUES (N'PT-00024', N'PV-00024', N'Crema para caracha', 15, 300.0000)
GO
INSERT [dbo].[Producto] ([id_producto], [id_proveedor], [nombre_producto], [cantidad], [precio]) VALUES (N'PT-00025', N'PV-00025', N'Sueroz', 80, 400.0000)
GO
INSERT [dbo].[Proveedor] ([id_proveedor], [nombre_proveedor], [direccion], [telefono], [email]) VALUES (N'PV-00001', N'Laboratorio Animals', N'Jr. Ficus 178, San Isidro', N'965789345', N'lab1@gmail.com')
GO
INSERT [dbo].[Proveedor] ([id_proveedor], [nombre_proveedor], [direccion], [telefono], [email]) VALUES (N'PV-00002', N'Laboratorio Pets', N'Jr. Guerrero 147, San Borja', N'965424796', N'lab2@gmail.com')
GO
INSERT [dbo].[Proveedor] ([id_proveedor], [nombre_proveedor], [direccion], [telefono], [email]) VALUES (N'PV-00003', N'Laboratorio Mascotas', N'Psje. Las Flores 24, Surco', N'978954632', N'lab3@gmail.com')
GO
INSERT [dbo].[Proveedor] ([id_proveedor], [nombre_proveedor], [direccion], [telefono], [email]) VALUES (N'PV-00004', N'Juguetes Animals', N'Jr. Galvez 235, Surco', N'987523104', N'lab4@gmail.com')
GO
INSERT [dbo].[Proveedor] ([id_proveedor], [nombre_proveedor], [direccion], [telefono], [email]) VALUES (N'PV-00005', N'Accesorios Animals', N'Av. Sanchez 56, Miraflores', N'966632001', N'lab5@gmail.com')
GO
INSERT [dbo].[Proveedor] ([id_proveedor], [nombre_proveedor], [direccion], [telefono], [email]) VALUES (N'PV-00006', N'Laboratorio Tuamigo', N'Jr. Matute,San Borja', N'986523465', N'labTuamigo@gmail.com')
GO
INSERT [dbo].[Proveedor] ([id_proveedor], [nombre_proveedor], [direccion], [telefono], [email]) VALUES (N'PV-00007', N'Antibiotico Animal', N'Av 12 Mareategui,San Borja', N'995642358', N'AntAnimal@gmail.com')
GO
INSERT [dbo].[Proveedor] ([id_proveedor], [nombre_proveedor], [direccion], [telefono], [email]) VALUES (N'PV-00008', N'Microsalud', N'jr. Caqueta,Miraflores', N'965841236', N'microSalud@gmail.com')
GO
INSERT [dbo].[Proveedor] ([id_proveedor], [nombre_proveedor], [direccion], [telefono], [email]) VALUES (N'PV-00009', N'ClinicFast', N'Av. Angamos,La Molina', N'987415423', N'clinicFast@gmail.com')
GO
INSERT [dbo].[Proveedor] ([id_proveedor], [nombre_proveedor], [direccion], [telefono], [email]) VALUES (N'PV-00010', N'Toy Planet', N'Jr. LaMuerte,La Victoria', N'954728634', N'toyPlanet@gmail.com')
GO
INSERT [dbo].[Proveedor] ([id_proveedor], [nombre_proveedor], [direccion], [telefono], [email]) VALUES (N'PV-00011', N'FastPet', N'Jr. matute,Surco', N'946258715', N'fastpet@gmail.com')
GO
INSERT [dbo].[Proveedor] ([id_proveedor], [nombre_proveedor], [direccion], [telefono], [email]) VALUES (N'PV-00012', N'Los Veloces', N'Jr. angamos,Comas', N'974155623', N'velocesps@gmail.com')
GO
INSERT [dbo].[Proveedor] ([id_proveedor], [nombre_proveedor], [direccion], [telefono], [email]) VALUES (N'PV-00013', N'Union Latino', N'Av. rosales,La Molina', N'963526418', N'unionLatino@gmail.com')
GO
INSERT [dbo].[Proveedor] ([id_proveedor], [nombre_proveedor], [direccion], [telefono], [email]) VALUES (N'PV-00014', N'Liga Animal', N'Jr. cusco,Callao', N'976584126', N'ligaAnimal@gmail.com')
GO
INSERT [dbo].[Proveedor] ([id_proveedor], [nombre_proveedor], [direccion], [telefono], [email]) VALUES (N'PV-00015', N'Animal help', N'Av. maria,La Victoria', N'947123649', N'animalHelp@gmail.com')
GO
INSERT [dbo].[Proveedor] ([id_proveedor], [nombre_proveedor], [direccion], [telefono], [email]) VALUES (N'PV-00016', N'Vida sana', N'Jr. paruro,VES', N'914122635', N'VisaSana@gmail.com')
GO
INSERT [dbo].[Proveedor] ([id_proveedor], [nombre_proveedor], [direccion], [telefono], [email]) VALUES (N'PV-00017', N'Laboratorio N1', N'Av. las malvinas,Santa Anita', N'975862142', N'laboratorioN1@gmail.com')
GO
INSERT [dbo].[Proveedor] ([id_proveedor], [nombre_proveedor], [direccion], [telefono], [email]) VALUES (N'PV-00018', N'Laboratorio Tu Ayuda', N'Av. Careta,San Isidro', N'913213542', N'labTuayuda@gmail.com')
GO
INSERT [dbo].[Proveedor] ([id_proveedor], [nombre_proveedor], [direccion], [telefono], [email]) VALUES (N'PV-00019', N'Friends pet', N'Jr. Aloma,Lima', N'954213543', N'friendpet@gmail.com')
GO
INSERT [dbo].[Proveedor] ([id_proveedor], [nombre_proveedor], [direccion], [telefono], [email]) VALUES (N'PV-00020', N'Los vengadores', N'Av. Reategui,La Victoria', N'912124150', N'losVengadores@gmail.com')
GO
INSERT [dbo].[Proveedor] ([id_proveedor], [nombre_proveedor], [direccion], [telefono], [email]) VALUES (N'PV-00021', N'Laboratorio Felecidad', N'Jr. Union,Comas', N'932132133', N'labFelecidad@gmail.com')
GO
INSERT [dbo].[Proveedor] ([id_proveedor], [nombre_proveedor], [direccion], [telefono], [email]) VALUES (N'PV-00022', N'Laboratorio Tigre', N'Av. san Ignancio,San Miguel', N'954356132', N'labTigre@gmail.com')
GO
INSERT [dbo].[Proveedor] ([id_proveedor], [nombre_proveedor], [direccion], [telefono], [email]) VALUES (N'PV-00023', N'Amigo Fiel', N'Jr. caqueta,San Juan', N'951321220', N'amigoFiel@gmail.com')
GO
INSERT [dbo].[Proveedor] ([id_proveedor], [nombre_proveedor], [direccion], [telefono], [email]) VALUES (N'PV-00024', N'Laboratorio N2', N'Av. forest,La Victoria', N'932356212', N'labN2@gmail.com')
GO
INSERT [dbo].[Proveedor] ([id_proveedor], [nombre_proveedor], [direccion], [telefono], [email]) VALUES (N'PV-00025', N'Animales Unidos', N'Av. octubre,La Molina', N'913546542', N'aniamlesUnidos@gmail.com')
GO
INSERT [dbo].[Razas] ([id_raza], [id_especie], [nombre_raza]) VALUES (N'RZ-00001', N'EP-00001', N'Bulldog')
GO
INSERT [dbo].[Razas] ([id_raza], [id_especie], [nombre_raza]) VALUES (N'RZ-00002', N'EP-00001', N'Chihuahua')
GO
INSERT [dbo].[Razas] ([id_raza], [id_especie], [nombre_raza]) VALUES (N'RZ-00003', N'EP-00002', N'Persa')
GO
INSERT [dbo].[Razas] ([id_raza], [id_especie], [nombre_raza]) VALUES (N'RZ-00004', N'EP-00002', N'Siames')
GO
INSERT [dbo].[Razas] ([id_raza], [id_especie], [nombre_raza]) VALUES (N'RZ-00005', N'EP-00003', N'Rusa')
GO
INSERT [dbo].[Razas] ([id_raza], [id_especie], [nombre_raza]) VALUES (N'RZ-00006', N'EP-00003', N'Mediterranea')
GO
INSERT [dbo].[Razas] ([id_raza], [id_especie], [nombre_raza]) VALUES (N'RZ-00007', N'EP-00004', N'Arabe')
GO
INSERT [dbo].[Razas] ([id_raza], [id_especie], [nombre_raza]) VALUES (N'RZ-00008', N'EP-00004', N'Purasangre')
GO
INSERT [dbo].[Razas] ([id_raza], [id_especie], [nombre_raza]) VALUES (N'RZ-00009', N'EP-00005', N'Californiano')
GO
INSERT [dbo].[Razas] ([id_raza], [id_especie], [nombre_raza]) VALUES (N'RZ-00010', N'EP-00005', N'Arlequin')
GO
INSERT [dbo].[Razas] ([id_raza], [id_especie], [nombre_raza]) VALUES (N'RZ-00011', N'EP-00006', N'Poland')
GO
INSERT [dbo].[Razas] ([id_raza], [id_especie], [nombre_raza]) VALUES (N'RZ-00012', N'EP-00006', N'Duroc')
GO
INSERT [dbo].[Razas] ([id_raza], [id_especie], [nombre_raza]) VALUES (N'RZ-00013', N'EP-00007', N'Griz')
GO
INSERT [dbo].[Razas] ([id_raza], [id_especie], [nombre_raza]) VALUES (N'RZ-00014', N'EP-00007', N'Aliverde')
GO
INSERT [dbo].[Razas] ([id_raza], [id_especie], [nombre_raza]) VALUES (N'RZ-00015', N'EP-00008', N'Mexica')
GO
INSERT [dbo].[Razas] ([id_raza], [id_especie], [nombre_raza]) VALUES (N'RZ-00016', N'EP-00008', N'Del desierto')
GO
INSERT [dbo].[Razas] ([id_raza], [id_especie], [nombre_raza]) VALUES (N'RZ-00017', N'EP-00009', N'Verde')
GO
INSERT [dbo].[Razas] ([id_raza], [id_especie], [nombre_raza]) VALUES (N'RZ-00018', N'EP-00009', N'Terrestre')
GO
INSERT [dbo].[Razas] ([id_raza], [id_especie], [nombre_raza]) VALUES (N'RZ-00019', N'EP-00010', N'Roja')
GO
INSERT [dbo].[Razas] ([id_raza], [id_especie], [nombre_raza]) VALUES (N'RZ-00020', N'EP-00010', N'Coreana')
GO
INSERT [dbo].[Razas] ([id_raza], [id_especie], [nombre_raza]) VALUES (N'RZ-00021', N'EP-00011', N'Romagnola')
GO
INSERT [dbo].[Razas] ([id_raza], [id_especie], [nombre_raza]) VALUES (N'RZ-00022', N'EP-00011', N'Lechera')
GO
INSERT [dbo].[Razas] ([id_raza], [id_especie], [nombre_raza]) VALUES (N'RZ-00023', N'EP-00012', N'Clamer')
GO
INSERT [dbo].[Razas] ([id_raza], [id_especie], [nombre_raza]) VALUES (N'RZ-00024', N'EP-00012', N'Glauco')
GO
INSERT [dbo].[Razas] ([id_raza], [id_especie], [nombre_raza]) VALUES (N'RZ-00025', N'EP-00013', N'Egipsio')
GO
INSERT [dbo].[Razas] ([id_raza], [id_especie], [nombre_raza]) VALUES (N'RZ-00026', N'EP-00013', N'Europeo')
GO
INSERT [dbo].[Razas] ([id_raza], [id_especie], [nombre_raza]) VALUES (N'RZ-00027', N'EP-00014', N'Marina')
GO
INSERT [dbo].[Razas] ([id_raza], [id_especie], [nombre_raza]) VALUES (N'RZ-00028', N'EP-00014', N'Azul')
GO
INSERT [dbo].[Razas] ([id_raza], [id_especie], [nombre_raza]) VALUES (N'RZ-00029', N'EP-00015', N'Abisinio')
GO
INSERT [dbo].[Razas] ([id_raza], [id_especie], [nombre_raza]) VALUES (N'RZ-00030', N'EP-00015', N'Peruana')
GO
INSERT [dbo].[Razas] ([id_raza], [id_especie], [nombre_raza]) VALUES (N'RZ-00031', N'EP-00016', N'Aulladores')
GO
INSERT [dbo].[Razas] ([id_raza], [id_especie], [nombre_raza]) VALUES (N'RZ-00032', N'EP-00016', N'Titis')
GO
INSERT [dbo].[Razas] ([id_raza], [id_especie], [nombre_raza]) VALUES (N'RZ-00033', N'EP-00017', N'Furness')
GO
INSERT [dbo].[Razas] ([id_raza], [id_especie], [nombre_raza]) VALUES (N'RZ-00034', N'EP-00017', N'Brahma')
GO
INSERT [dbo].[Razas] ([id_raza], [id_especie], [nombre_raza]) VALUES (N'RZ-00035', N'EP-00018', N'Cascabel')
GO
INSERT [dbo].[Razas] ([id_raza], [id_especie], [nombre_raza]) VALUES (N'RZ-00036', N'EP-00018', N'Manba')
GO
INSERT [dbo].[Razas] ([id_raza], [id_especie], [nombre_raza]) VALUES (N'RZ-00037', N'EP-00019', N'Comun')
GO
INSERT [dbo].[Razas] ([id_raza], [id_especie], [nombre_raza]) VALUES (N'RZ-00038', N'EP-00019', N'Chino')
GO
INSERT [dbo].[Razas] ([id_raza], [id_especie], [nombre_raza]) VALUES (N'RZ-00039', N'EP-00020', N'Rex')
GO
INSERT [dbo].[Razas] ([id_raza], [id_especie], [nombre_raza]) VALUES (N'RZ-00040', N'EP-00020', N'Dumbo')
GO
INSERT [dbo].[Razas] ([id_raza], [id_especie], [nombre_raza]) VALUES (N'RZ-00041', N'EP-00021', N'Dromedario')
GO
INSERT [dbo].[Razas] ([id_raza], [id_especie], [nombre_raza]) VALUES (N'RZ-00042', N'EP-00021', N'Bactriano')
GO
INSERT [dbo].[Razas] ([id_raza], [id_especie], [nombre_raza]) VALUES (N'RZ-00043', N'EP-00022', N'Cuello rojo')
GO
INSERT [dbo].[Razas] ([id_raza], [id_especie], [nombre_raza]) VALUES (N'RZ-00044', N'EP-00022', N'Cuello azul')
GO
INSERT [dbo].[Razas] ([id_raza], [id_especie], [nombre_raza]) VALUES (N'RZ-00045', N'EP-00023', N'Rojo')
GO
INSERT [dbo].[Razas] ([id_raza], [id_especie], [nombre_raza]) VALUES (N'RZ-00046', N'EP-00023', N'Gris oriental')
GO
INSERT [dbo].[Razas] ([id_raza], [id_especie], [nombre_raza]) VALUES (N'RZ-00047', N'EP-00024', N'Manchada')
GO
INSERT [dbo].[Razas] ([id_raza], [id_especie], [nombre_raza]) VALUES (N'RZ-00048', N'EP-00024', N'Parda')
GO
INSERT [dbo].[Razas] ([id_raza], [id_especie], [nombre_raza]) VALUES (N'RZ-00049', N'EP-00025', N'Europea')
GO
INSERT [dbo].[Razas] ([id_raza], [id_especie], [nombre_raza]) VALUES (N'RZ-00050', N'EP-00025', N'Gigante')
GO
INSERT [dbo].[Tratamiento] ([id_tratamiento], [tipo], [nombre], [diagnostico]) VALUES (N'TR-00001', N'Tratamiento para perros', N'Tratamiento para sarna', N'Sarna')
GO
INSERT [dbo].[Tratamiento] ([id_tratamiento], [tipo], [nombre], [diagnostico]) VALUES (N'TR-00002', N'Tratamiento para gatos', N'Tratamiento para conjuntivitis', N'Conjuntivitis')
GO
INSERT [dbo].[Tratamiento] ([id_tratamiento], [tipo], [nombre], [diagnostico]) VALUES (N'TR-00003', N'Tratamiento para tortugas', N'Tratamiento para hongo', N'Hongos')
GO
INSERT [dbo].[Tratamiento] ([id_tratamiento], [tipo], [nombre], [diagnostico]) VALUES (N'TR-00004', N'Tratamiento para caballos', N'Tratamiento para anemia', N'Anemia')
GO
INSERT [dbo].[Tratamiento] ([id_tratamiento], [tipo], [nombre], [diagnostico]) VALUES (N'TR-00005', N'Tratamiento para cerdo', N'Tratamiento para rabia', N'Rabia')
GO
INSERT [dbo].[Tratamiento] ([id_tratamiento], [tipo], [nombre], [diagnostico]) VALUES (N'TR-00006', N'Tratamiento para loro', N'Tratamiento para tos', N'Tos')
GO
INSERT [dbo].[Tratamiento] ([id_tratamiento], [tipo], [nombre], [diagnostico]) VALUES (N'TR-00007', N'Tratamiento para tarantula', N'Tratamiento anticaida de pelo', N'Caida de pelo')
GO
INSERT [dbo].[Tratamiento] ([id_tratamiento], [tipo], [nombre], [diagnostico]) VALUES (N'TR-00008', N'Tratamiento para iguana', N'Tratamiento para ojos', N'Ojos llorosos')
GO
INSERT [dbo].[Tratamiento] ([id_tratamiento], [tipo], [nombre], [diagnostico]) VALUES (N'TR-00009', N'Tratamiento para ardilla', N'Tratamiento para parasito', N'Parasito')
GO
INSERT [dbo].[Tratamiento] ([id_tratamiento], [tipo], [nombre], [diagnostico]) VALUES (N'TR-00010', N'Tratamiento para vaca', N'Tratamiento para sarna', N'Sarna')
GO
INSERT [dbo].[Tratamiento] ([id_tratamiento], [tipo], [nombre], [diagnostico]) VALUES (N'TR-00011', N'Tratamiento para perico', N'Tratamiento para infecciones', N'Infecciones')
GO
INSERT [dbo].[Tratamiento] ([id_tratamiento], [tipo], [nombre], [diagnostico]) VALUES (N'TR-00012', N'Tratamiento para erizo', N'Tratamiento para roturas', N'Roturas')
GO
INSERT [dbo].[Tratamiento] ([id_tratamiento], [tipo], [nombre], [diagnostico]) VALUES (N'TR-00013', N'Tratamiento para lagarto', N'Tratamiento para parasito', N'Parasito')
GO
INSERT [dbo].[Tratamiento] ([id_tratamiento], [tipo], [nombre], [diagnostico]) VALUES (N'TR-00014', N'Tratamiento para conejillo', N'Tratamiento para anticaida', N'Caida de pelo')
GO
INSERT [dbo].[Tratamiento] ([id_tratamiento], [tipo], [nombre], [diagnostico]) VALUES (N'TR-00015', N'Tratamiento para mono', N'Tratamiento para tos', N'Tos')
GO
INSERT [dbo].[Tratamiento] ([id_tratamiento], [tipo], [nombre], [diagnostico]) VALUES (N'TR-00016', N'Tratamiento para gallina', N'Tratamiento para anemia', N'Anemia')
GO
INSERT [dbo].[Tratamiento] ([id_tratamiento], [tipo], [nombre], [diagnostico]) VALUES (N'TR-00017', N'Tratamiento para serpiente', N'Tratamiento para hongos', N'Hongos')
GO
INSERT [dbo].[Tratamiento] ([id_tratamiento], [tipo], [nombre], [diagnostico]) VALUES (N'TR-00018', N'Tratamiento para ratones', N'Tratamiento para ojos lagrimosos', N'Ojos llorosos')
GO
INSERT [dbo].[Tratamiento] ([id_tratamiento], [tipo], [nombre], [diagnostico]) VALUES (N'TR-00019', N'Tratamiento para ratas', N'Tratamiento para tos', N'Tos')
GO
INSERT [dbo].[Tratamiento] ([id_tratamiento], [tipo], [nombre], [diagnostico]) VALUES (N'TR-00020', N'Tratamiento para camellos', N'Tratamiento para rotura', N'Rotura')
GO
INSERT [dbo].[Tratamiento] ([id_tratamiento], [tipo], [nombre], [diagnostico]) VALUES (N'TR-00021', N'Tratamiento para avestruz', N'Tratamiento para parasito', N'Parasito')
GO
INSERT [dbo].[Tratamiento] ([id_tratamiento], [tipo], [nombre], [diagnostico]) VALUES (N'TR-00022', N'Tratamiento para canguro', N'Tratamiento para infecciones', N'Infecciones')
GO
INSERT [dbo].[Tratamiento] ([id_tratamiento], [tipo], [nombre], [diagnostico]) VALUES (N'TR-00023', N'Tratamiento para hiena', N'Tratamiento para roturas', N'Rotura')
GO
INSERT [dbo].[Tratamiento] ([id_tratamiento], [tipo], [nombre], [diagnostico]) VALUES (N'TR-00024', N'Tratamiento para nutria', N'Tratamiento para anemia', N'Anemia')
GO
INSERT [dbo].[Vacunas] ([id_vacuna], [tipo_vacuna], [nombre], [descripcion]) VALUES (N'VA-00001', N'Vacuna para la sarna', N'Esteroides para la sarna', N'Esteroides para la curacion de la sarna')
GO
INSERT [dbo].[Vacunas] ([id_vacuna], [tipo_vacuna], [nombre], [descripcion]) VALUES (N'VA-00002', N'Vacuna para la conjuntivitis', N'Crema para el ojo', N'Crema para curacion del ojo')
GO
INSERT [dbo].[Vacunas] ([id_vacuna], [tipo_vacuna], [nombre], [descripcion]) VALUES (N'VA-00003', N'Vacuna para los hongos', N'Antihongos', N'Antihongos para la curacion')
GO
INSERT [dbo].[Vacunas] ([id_vacuna], [tipo_vacuna], [nombre], [descripcion]) VALUES (N'VA-00004', N'Vacuna para la anemia', N'Hierro para la anemia', N'Hierro en muchas cantidades')
GO
INSERT [dbo].[Vacunas] ([id_vacuna], [tipo_vacuna], [nombre], [descripcion]) VALUES (N'VA-00006', N'Vacuna para la rabia', N'Antibiotico para rabia', N'Curan la rabia')
GO
INSERT [dbo].[Vacunas] ([id_vacuna], [tipo_vacuna], [nombre], [descripcion]) VALUES (N'VA-00007', N'Vacuna para la tos', N'Antibiotico para tos', N'Curan la tos')
GO
INSERT [dbo].[Vacunas] ([id_vacuna], [tipo_vacuna], [nombre], [descripcion]) VALUES (N'VA-00008', N'Vacuna para la caida de pelo', N'Antibiotico anticaida', N'Evitan la caida de pelo')
GO
INSERT [dbo].[Vacunas] ([id_vacuna], [tipo_vacuna], [nombre], [descripcion]) VALUES (N'VA-00009', N'Vacuna para ojos lagrimosos', N'Antibiotico para ojos', N'Curan los ojos lagrimosos')
GO
INSERT [dbo].[Vacunas] ([id_vacuna], [tipo_vacuna], [nombre], [descripcion]) VALUES (N'VA-00010', N'Vacuna para parasitos', N'Antibiotico para parasito', N'Cura para parasitos')
GO
INSERT [dbo].[Vacunas] ([id_vacuna], [tipo_vacuna], [nombre], [descripcion]) VALUES (N'VA-00011', N'Vacuna para la sarna', N'Antibiotico para esteroidde', N'Cura para sarna')
GO
INSERT [dbo].[Vacunas] ([id_vacuna], [tipo_vacuna], [nombre], [descripcion]) VALUES (N'VA-00012', N'Vacuna para infecciones', N'Antibiotico para infecciones', N'Cura para las infecciones')
GO
INSERT [dbo].[Vacunas] ([id_vacuna], [tipo_vacuna], [nombre], [descripcion]) VALUES (N'VA-00013', N'Vacuna para roturas', N'Antibiotico para dolor', N'Calam el dolor')
GO
INSERT [dbo].[Vacunas] ([id_vacuna], [tipo_vacuna], [nombre], [descripcion]) VALUES (N'VA-00014', N'Vacuna para pulgas', N'Antibiotico para pulgas', N'Evita las pulgas')
GO
INSERT [dbo].[Vacunas] ([id_vacuna], [tipo_vacuna], [nombre], [descripcion]) VALUES (N'VA-00015', N'Vacuna para caida de pelo', N'Antibiotico para anticaida', N'Evita caida de pelo')
GO
INSERT [dbo].[Vacunas] ([id_vacuna], [tipo_vacuna], [nombre], [descripcion]) VALUES (N'VA-00016', N'Vacuna para rabia', N'Antibiotico para rabia', N'Cura la rabias')
GO
INSERT [dbo].[Vacunas] ([id_vacuna], [tipo_vacuna], [nombre], [descripcion]) VALUES (N'VA-00017', N'Vacuna para anemia', N'Antibiotico de hierro', N'Cura la anemia')
GO
INSERT [dbo].[Vacunas] ([id_vacuna], [tipo_vacuna], [nombre], [descripcion]) VALUES (N'VA-00018', N'Vacuna para hongos', N'Antibiotico para hongos', N'Cura los hongos')
GO
INSERT [dbo].[Vacunas] ([id_vacuna], [tipo_vacuna], [nombre], [descripcion]) VALUES (N'VA-00019', N'Vacuna para ojos lagrimosos', N'Antibiotico para ojos', N'Curan los ojos lagrimosos')
GO
INSERT [dbo].[Vacunas] ([id_vacuna], [tipo_vacuna], [nombre], [descripcion]) VALUES (N'VA-00020', N'Vacuna para la tos', N'Antibiotico para tos', N'Curan la tos')
GO
INSERT [dbo].[Vacunas] ([id_vacuna], [tipo_vacuna], [nombre], [descripcion]) VALUES (N'VA-00021', N'Vacuna para la sarna', N'Antibiotico para esteroidde', N'Cura para sarna')
GO
INSERT [dbo].[Vacunas] ([id_vacuna], [tipo_vacuna], [nombre], [descripcion]) VALUES (N'VA-00022', N'Vacuna para caida de pelo', N'Antibiotico para anticaida', N'Evita caida de pelo')
GO
INSERT [dbo].[Vacunas] ([id_vacuna], [tipo_vacuna], [nombre], [descripcion]) VALUES (N'VA-00023', N'Vacuna para infecciones', N'Antibiotico para infecciones', N'Cura para las infecciones')
GO
INSERT [dbo].[Vacunas] ([id_vacuna], [tipo_vacuna], [nombre], [descripcion]) VALUES (N'VA-00024', N'Vacuna para roturas', N'Antibiotico para dolor', N'Calam el dolor')
GO
INSERT [dbo].[Vacunas] ([id_vacuna], [tipo_vacuna], [nombre], [descripcion]) VALUES (N'VA-00025', N'Vacuna para la sarna', N'Antibiotico para esteroidde', N'Cura para sarna')
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [uni_dni]    Script Date: 28/10/2019 01:13:30 ******/
ALTER TABLE [dbo].[Cliente] ADD  CONSTRAINT [uni_dni] UNIQUE NONCLUSTERED 
(
	[dni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Boleta]  WITH CHECK ADD  CONSTRAINT [fk_cli] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[Cliente] ([id_cliente])
GO
ALTER TABLE [dbo].[Boleta] CHECK CONSTRAINT [fk_cli]
GO
ALTER TABLE [dbo].[Boleta]  WITH CHECK ADD  CONSTRAINT [fk_emple] FOREIGN KEY([id_empleado])
REFERENCES [dbo].[Empleado] ([id_empleado])
GO
ALTER TABLE [dbo].[Boleta] CHECK CONSTRAINT [fk_emple]
GO
ALTER TABLE [dbo].[Citas]  WITH CHECK ADD  CONSTRAINT [fk_paciente] FOREIGN KEY([id_paciente])
REFERENCES [dbo].[Paciente] ([id_paciente])
GO
ALTER TABLE [dbo].[Citas] CHECK CONSTRAINT [fk_paciente]
GO
ALTER TABLE [dbo].[Detalle Boleta]  WITH CHECK ADD  CONSTRAINT [fk_bol] FOREIGN KEY([id_boleta])
REFERENCES [dbo].[Boleta] ([id_boleta])
GO
ALTER TABLE [dbo].[Detalle Boleta] CHECK CONSTRAINT [fk_bol]
GO
ALTER TABLE [dbo].[Detalle Boleta]  WITH CHECK ADD  CONSTRAINT [fk_pro] FOREIGN KEY([id_producto])
REFERENCES [dbo].[Producto] ([id_producto])
GO
ALTER TABLE [dbo].[Detalle Boleta] CHECK CONSTRAINT [fk_pro]
GO
ALTER TABLE [dbo].[Historial Medico]  WITH CHECK ADD  CONSTRAINT [fk_pac] FOREIGN KEY([id_paciente])
REFERENCES [dbo].[Paciente] ([id_paciente])
GO
ALTER TABLE [dbo].[Historial Medico] CHECK CONSTRAINT [fk_pac]
GO
ALTER TABLE [dbo].[Historial Medico]  WITH CHECK ADD  CONSTRAINT [fk_tra] FOREIGN KEY([id_tratamiento])
REFERENCES [dbo].[Tratamiento] ([id_tratamiento])
GO
ALTER TABLE [dbo].[Historial Medico] CHECK CONSTRAINT [fk_tra]
GO
ALTER TABLE [dbo].[Historial Medico]  WITH CHECK ADD  CONSTRAINT [fk_vac] FOREIGN KEY([id_vacuna])
REFERENCES [dbo].[Vacunas] ([id_vacuna])
GO
ALTER TABLE [dbo].[Historial Medico] CHECK CONSTRAINT [fk_vac]
GO
ALTER TABLE [dbo].[Paciente]  WITH CHECK ADD  CONSTRAINT [fk_cliente] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[Cliente] ([id_cliente])
GO
ALTER TABLE [dbo].[Paciente] CHECK CONSTRAINT [fk_cliente]
GO
ALTER TABLE [dbo].[Paciente]  WITH CHECK ADD  CONSTRAINT [fk_raza] FOREIGN KEY([id_raza])
REFERENCES [dbo].[Razas] ([id_raza])
GO
ALTER TABLE [dbo].[Paciente] CHECK CONSTRAINT [fk_raza]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [fk_prov] FOREIGN KEY([id_proveedor])
REFERENCES [dbo].[Proveedor] ([id_proveedor])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [fk_prov]
GO
ALTER TABLE [dbo].[Razas]  WITH CHECK ADD  CONSTRAINT [fk_especie] FOREIGN KEY([id_especie])
REFERENCES [dbo].[Especie] ([id_especie])
GO
ALTER TABLE [dbo].[Razas] CHECK CONSTRAINT [fk_especie]
GO
ALTER TABLE [dbo].[Paciente]  WITH CHECK ADD  CONSTRAINT [CK_sexo] CHECK  (([sexo]='H' OR [sexo]='M'))
GO
ALTER TABLE [dbo].[Paciente] CHECK CONSTRAINT [CK_sexo]
GO
USE [master]
GO
ALTER DATABASE [Veterinaria] SET  READ_WRITE 
GO


use Veterinaria;
select AVG(Veterinaria.dbo.Producto.precio) from Producto; /*promedio del total de la boleta*/

select count (precio) from Producto; /*cuenta los 25 datos en id_cliente*/

select max (precio) from Producto;

select min (precio) from Producto;

select sum (precio) from Producto;

select *  from Producto;

select UPPER (nombre_producto) from Producto;

select LOWER (nombre_producto) From Producto;

select GETDATE () from Producto;

SELECT LEN (precio) from Producto;
select * from Producto;

select SUBSTRING (nombre_producto,1,3) from Producto;

SELECT FORMAT (GETDATE(), 'YYYY-MM-DD') from Producto;
select * from Producto;
select * from [Detalle Boleta];

select DB.id_boleta, P.nombre_producto, P.cantidad as Stock, P.precio AS [Precio por unidad], DB.cantidad as [cantidad comprada en una Boleta], 
DB.valor_venta from Producto P

INNER JOIN [Detalle Boleta] DB ON P.id_producto=DB.id_producto

group by DB.id_boleta, P.nombre_producto, P.cantidad, P.precio, DB.cantidad, DB.valor_venta

select * from Producto

select * from [Detalle Boleta]


/*01*/select id_empleado, nombre_empleado from Empleado
/*02*/select distinct edad from Empleado
/*03*/select id_producto, precio from Producto where precio%2!=0
/*04*/select precio from Producto where precio< 1000 and (precio> 250);
	  select id_producto, precio from Producto where precio%2!=0 or (precio> 500);
/*05*/select * from Producto where nombre_producto in ('Esteroides', 'Juguetes')
/*06*/select id_producto, precio from Producto where precio between '250' and '800'
/*07*/select nombre_producto from Producto where nombre_producto like ('A%')
/*08*/select id_empleado, nombre_empleado, edad from Empleado where edad>23 order by nombre_empleado desc
/*09*/select AVG(Veterinaria.dbo.Producto.precio) from Producto
	  select count (precio) from Producto
	  select max (precio) from Producto
	  select min (precio) from Producto
	  select sum (precio) from Producto
/*10*/select count (nombre_producto) from Producto
/*11*/select nombre_producto, sum(cantidad) from Producto group by nombre_producto
/*12*/select nombre_producto, sum(cantidad) from Producto group by nombre_producto having sum(cantidad)>60
/*13*/select distinct P.nombre_producto Productos, P.cantidad Stock from Producto P group by P.nombre_producto, P.cantidad
/*14*/select DB.id_boleta #Boleta, DB.valor_venta Total, P.id_producto IdProducto from Producto P, [Detalle Boleta] DB where P.id_producto=DB.id_producto group by DB.id_boleta, P.id_producto, DB.valor_venta
/*15*/select DB.id_producto #Producto, DB.cantidad CantidadPedida, P.cantidad Stock from [Detalle Boleta] DB left outer join Producto P on DB.id_producto=P.id_producto order by DB.id_producto, P.cantidad, DB.cantidad
/*16*/select concat (nombre_producto,' --> ', precio) from Producto where precio>=800
/*17*/select SUBSTRING (nombre_producto,1,5) from Producto
/*18*/select LTRIM('  hola  ')
	  select RTRIM('  hola  ')

select id_producto, precio from Producto where precio>=800
select cantidad from Producto where cantidad<= 120 and (cantidad> 18 or cantidad>20)
select * from Producto where cantidad in ('30', '50')
select id_producto, precio from Producto where id_producto between 'PT-00004' and 'PT-00023'
select nombre_producto from Producto where nombre_producto like ('%ES%')
select id_empleado, nombre_empleado, edad from Empleado where edad<24 order by nombre_empleado asc
select max (cantidad) from Producto
select SUBSTRING (nombre_empleado,1,4) from Empleado



/*P A*/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BCliente]
	-- Add the parameters for the stored procedure here
	@nombreC varchar(30),
	@numerodni  int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Cliente.nombres_cliente, Cliente.dni, Cliente.email from Cliente 
	where Cliente.nombres_cliente like @nombreC and dni >= @numerodni
END
GO


DECLARE	@return_value int
EXEC	@return_value = [dbo].[BCliente]
		@nombreC = '%Ma%',
		@numerodni = '70000000'

SELECT	'Return Value' = @return_value
GO

exec BCliente '%Ma%','75000000'

drop Procedure BCliente 

/*FILA 2 PROCEDIMIENTO ALMACENADO*/