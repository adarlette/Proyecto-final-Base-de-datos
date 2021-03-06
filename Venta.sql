/*
UNIVERSIDAD O&M
SECCION:0541
NEIDY DEL ORBE 17-MIIN-1-045 
RONALDO PIÑA 16-SIIN-1-184 
ADARLETTE CATANO 17-MIIN-1-014
*/
USE [master]
GO
/****** Object:  Database [Ventas]    Script Date: 30/11/2018 8:04:57 p. m. ******/
CREATE DATABASE [Ventas]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Ventas', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Ventas.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Ventas_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Ventas_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Ventas] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Ventas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Ventas] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Ventas] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Ventas] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Ventas] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Ventas] SET ARITHABORT OFF 
GO
ALTER DATABASE [Ventas] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Ventas] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Ventas] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Ventas] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Ventas] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Ventas] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Ventas] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Ventas] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Ventas] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Ventas] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Ventas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Ventas] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Ventas] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Ventas] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Ventas] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Ventas] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Ventas] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Ventas] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Ventas] SET  MULTI_USER 
GO
ALTER DATABASE [Ventas] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Ventas] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Ventas] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Ventas] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Ventas] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Ventas] SET QUERY_STORE = OFF
GO
USE [Ventas]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 30/11/2018 8:04:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[IDClientes] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nchar](10) NOT NULL,
	[Apellido] [nchar](10) NOT NULL,
	[Telefono] [nchar](10) NULL,
	[Cedula] [nchar](10) NULL,
 CONSTRAINT [PK_Paciente] PRIMARY KEY CLUSTERED 
(
	[IDClientes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Facturas]    Script Date: 30/11/2018 8:04:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Facturas](
	[IDFactura] [int] IDENTITY(1,1) NOT NULL,
	[ClienteID] [int] NOT NULL,
	[ReferenciaFactura] [nchar](10) NOT NULL,
	[Fecha] [date] NOT NULL,
	[Subtotal] [numeric](18, 0) NOT NULL,
	[Itbis] [numeric](18, 0) NOT NULL,
	[Total] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_Factura] PRIMARY KEY CLUSTERED 
(
	[IDFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 30/11/2018 8:04:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[IDProducto] [int] IDENTITY(1,1) NOT NULL,
	[NombreProducto] [nchar](20) NOT NULL,
	[Precio_Producto] [numeric](18, 0) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recibos]    Script Date: 30/11/2018 8:04:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recibos](
	[IDRecibo] [int] IDENTITY(1,1) NOT NULL,
	[FacturaID] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[MontoPagado] [numeric](18, 0) NOT NULL,
	[ClienteID] [int] NOT NULL,
 CONSTRAINT [PK_Recibo] PRIMARY KEY CLUSTERED 
(
	[IDRecibo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Clientes] ON 
GO
INSERT [dbo].[Clientes] ([IDClientes], [Nombre], [Apellido], [Telefono], [Cedula]) VALUES (1, N'Alejandro ', N'Gonzalez  ', N'8093203909', N'4093000390')
GO
INSERT [dbo].[Clientes] ([IDClientes], [Nombre], [Apellido], [Telefono], [Cedula]) VALUES (2, N'Pedro     ', N'Pujols    ', N'8093203940', N'2039400290')
GO
INSERT [dbo].[Clientes] ([IDClientes], [Nombre], [Apellido], [Telefono], [Cedula]) VALUES (3, N'Maria     ', N'Concepcion', N'8092303900', N'2039049400')
GO
INSERT [dbo].[Clientes] ([IDClientes], [Nombre], [Apellido], [Telefono], [Cedula]) VALUES (4, N'Jose      ', N'Peralta   ', N'3203984020', N'3202930209')
GO
INSERT [dbo].[Clientes] ([IDClientes], [Nombre], [Apellido], [Telefono], [Cedula]) VALUES (5, N'Augusto   ', N'Moncion   ', N'2300390023', N'3940499011')
GO
INSERT [dbo].[Clientes] ([IDClientes], [Nombre], [Apellido], [Telefono], [Cedula]) VALUES (6, N'Manolo    ', N'Urena     ', N'8095678989', N'1300093273')
GO
INSERT [dbo].[Clientes] ([IDClientes], [Nombre], [Apellido], [Telefono], [Cedula]) VALUES (9, N'Angel     ', N'Medrano   ', N'1803090093', N'0019930029')
GO
INSERT [dbo].[Clientes] ([IDClientes], [Nombre], [Apellido], [Telefono], [Cedula]) VALUES (10, N'Miguelina ', N'Pujols    ', N'0982093802', N'0932098230')
GO
INSERT [dbo].[Clientes] ([IDClientes], [Nombre], [Apellido], [Telefono], [Cedula]) VALUES (11, N'Rosa      ', N'Ramirez   ', N'0912309840', N'0934023840')
GO
INSERT [dbo].[Clientes] ([IDClientes], [Nombre], [Apellido], [Telefono], [Cedula]) VALUES (14, N'Jorge     ', N'Garcia    ', N'1092048104', N'0394029384')
GO
INSERT [dbo].[Clientes] ([IDClientes], [Nombre], [Apellido], [Telefono], [Cedula]) VALUES (15, N'Daniela   ', N'Durango   ', N'1029309404', N'3203495040')
GO
SET IDENTITY_INSERT [dbo].[Clientes] OFF
GO
SET IDENTITY_INSERT [dbo].[Facturas] ON 
GO
INSERT [dbo].[Facturas] ([IDFactura], [ClienteID], [ReferenciaFactura], [Fecha], [Subtotal], [Itbis], [Total]) VALUES (1, 1, N'1         ', CAST(N'2018-01-12' AS Date), CAST(80 AS Numeric(18, 0)), CAST(20 AS Numeric(18, 0)), CAST(100 AS Numeric(18, 0)))
GO
INSERT [dbo].[Facturas] ([IDFactura], [ClienteID], [ReferenciaFactura], [Fecha], [Subtotal], [Itbis], [Total]) VALUES (3, 2, N'2         ', CAST(N'2018-01-13' AS Date), CAST(100 AS Numeric(18, 0)), CAST(20 AS Numeric(18, 0)), CAST(120 AS Numeric(18, 0)))
GO
INSERT [dbo].[Facturas] ([IDFactura], [ClienteID], [ReferenciaFactura], [Fecha], [Subtotal], [Itbis], [Total]) VALUES (4, 2, N'3         ', CAST(N'2018-01-14' AS Date), CAST(100 AS Numeric(18, 0)), CAST(20 AS Numeric(18, 0)), CAST(120 AS Numeric(18, 0)))
GO
INSERT [dbo].[Facturas] ([IDFactura], [ClienteID], [ReferenciaFactura], [Fecha], [Subtotal], [Itbis], [Total]) VALUES (6, 3, N'4         ', CAST(N'2018-01-14' AS Date), CAST(120 AS Numeric(18, 0)), CAST(25 AS Numeric(18, 0)), CAST(145 AS Numeric(18, 0)))
GO
INSERT [dbo].[Facturas] ([IDFactura], [ClienteID], [ReferenciaFactura], [Fecha], [Subtotal], [Itbis], [Total]) VALUES (7, 4, N'5         ', CAST(N'2018-01-15' AS Date), CAST(300 AS Numeric(18, 0)), CAST(30 AS Numeric(18, 0)), CAST(330 AS Numeric(18, 0)))
GO
INSERT [dbo].[Facturas] ([IDFactura], [ClienteID], [ReferenciaFactura], [Fecha], [Subtotal], [Itbis], [Total]) VALUES (8, 5, N'6         ', CAST(N'2018-01-17' AS Date), CAST(250 AS Numeric(18, 0)), CAST(30 AS Numeric(18, 0)), CAST(280 AS Numeric(18, 0)))
GO
INSERT [dbo].[Facturas] ([IDFactura], [ClienteID], [ReferenciaFactura], [Fecha], [Subtotal], [Itbis], [Total]) VALUES (9, 6, N'7         ', CAST(N'2018-01-18' AS Date), CAST(405 AS Numeric(18, 0)), CAST(45 AS Numeric(18, 0)), CAST(450 AS Numeric(18, 0)))
GO
INSERT [dbo].[Facturas] ([IDFactura], [ClienteID], [ReferenciaFactura], [Fecha], [Subtotal], [Itbis], [Total]) VALUES (13, 9, N'8         ', CAST(N'2018-01-18' AS Date), CAST(340 AS Numeric(18, 0)), CAST(40 AS Numeric(18, 0)), CAST(380 AS Numeric(18, 0)))
GO
INSERT [dbo].[Facturas] ([IDFactura], [ClienteID], [ReferenciaFactura], [Fecha], [Subtotal], [Itbis], [Total]) VALUES (14, 10, N'9         ', CAST(N'2018-01-18' AS Date), CAST(202 AS Numeric(18, 0)), CAST(38 AS Numeric(18, 0)), CAST(240 AS Numeric(18, 0)))
GO
INSERT [dbo].[Facturas] ([IDFactura], [ClienteID], [ReferenciaFactura], [Fecha], [Subtotal], [Itbis], [Total]) VALUES (15, 11, N'10        ', CAST(N'2018-01-18' AS Date), CAST(301 AS Numeric(18, 0)), CAST(19 AS Numeric(18, 0)), CAST(320 AS Numeric(18, 0)))
GO
SET IDENTITY_INSERT [dbo].[Facturas] OFF
GO
SET IDENTITY_INSERT [dbo].[Producto] ON 
GO
INSERT [dbo].[Producto] ([IDProducto], [NombreProducto], [Precio_Producto]) VALUES (3, N'Mascota             ', CAST(100 AS Numeric(18, 0)))
GO
INSERT [dbo].[Producto] ([IDProducto], [NombreProducto], [Precio_Producto]) VALUES (4, N'Lapiz               ', CAST(40 AS Numeric(18, 0)))
GO
INSERT [dbo].[Producto] ([IDProducto], [NombreProducto], [Precio_Producto]) VALUES (5, N'Libro Matematicas   ', CAST(500 AS Numeric(18, 0)))
GO
INSERT [dbo].[Producto] ([IDProducto], [NombreProducto], [Precio_Producto]) VALUES (6, N'Mascota Cocida      ', CAST(140 AS Numeric(18, 0)))
GO
INSERT [dbo].[Producto] ([IDProducto], [NombreProducto], [Precio_Producto]) VALUES (7, N'Encuadernacion      ', CAST(120 AS Numeric(18, 0)))
GO
INSERT [dbo].[Producto] ([IDProducto], [NombreProducto], [Precio_Producto]) VALUES (8, N'Empastado           ', CAST(350 AS Numeric(18, 0)))
GO
INSERT [dbo].[Producto] ([IDProducto], [NombreProducto], [Precio_Producto]) VALUES (9, N'Tijeras             ', CAST(60 AS Numeric(18, 0)))
GO
INSERT [dbo].[Producto] ([IDProducto], [NombreProducto], [Precio_Producto]) VALUES (10, N'Libro de Infomatica ', CAST(380 AS Numeric(18, 0)))
GO
INSERT [dbo].[Producto] ([IDProducto], [NombreProducto], [Precio_Producto]) VALUES (11, N'Bocina              ', CAST(590 AS Numeric(18, 0)))
GO
INSERT [dbo].[Producto] ([IDProducto], [NombreProducto], [Precio_Producto]) VALUES (12, N'Cartera de Mano     ', CAST(265 AS Numeric(18, 0)))
GO
SET IDENTITY_INSERT [dbo].[Producto] OFF
GO
SET IDENTITY_INSERT [dbo].[Recibos] ON 
GO
INSERT [dbo].[Recibos] ([IDRecibo], [FacturaID], [Fecha], [MontoPagado], [ClienteID]) VALUES (1, 1, CAST(N'2018-01-12' AS Date), CAST(100 AS Numeric(18, 0)), 1)
GO
INSERT [dbo].[Recibos] ([IDRecibo], [FacturaID], [Fecha], [MontoPagado], [ClienteID]) VALUES (2, 3, CAST(N'2018-01-13' AS Date), CAST(120 AS Numeric(18, 0)), 2)
GO
INSERT [dbo].[Recibos] ([IDRecibo], [FacturaID], [Fecha], [MontoPagado], [ClienteID]) VALUES (3, 4, CAST(N'2018-01-14' AS Date), CAST(120 AS Numeric(18, 0)), 2)
GO
INSERT [dbo].[Recibos] ([IDRecibo], [FacturaID], [Fecha], [MontoPagado], [ClienteID]) VALUES (4, 6, CAST(N'2018-01-14' AS Date), CAST(145 AS Numeric(18, 0)), 3)
GO
INSERT [dbo].[Recibos] ([IDRecibo], [FacturaID], [Fecha], [MontoPagado], [ClienteID]) VALUES (5, 7, CAST(N'2018-01-15' AS Date), CAST(330 AS Numeric(18, 0)), 4)
GO
INSERT [dbo].[Recibos] ([IDRecibo], [FacturaID], [Fecha], [MontoPagado], [ClienteID]) VALUES (6, 8, CAST(N'2018-01-17' AS Date), CAST(280 AS Numeric(18, 0)), 5)
GO
INSERT [dbo].[Recibos] ([IDRecibo], [FacturaID], [Fecha], [MontoPagado], [ClienteID]) VALUES (7, 9, CAST(N'2018-01-18' AS Date), CAST(450 AS Numeric(18, 0)), 6)
GO
INSERT [dbo].[Recibos] ([IDRecibo], [FacturaID], [Fecha], [MontoPagado], [ClienteID]) VALUES (8, 13, CAST(N'2018-01-18' AS Date), CAST(380 AS Numeric(18, 0)), 9)
GO
INSERT [dbo].[Recibos] ([IDRecibo], [FacturaID], [Fecha], [MontoPagado], [ClienteID]) VALUES (9, 14, CAST(N'2018-01-18' AS Date), CAST(240 AS Numeric(18, 0)), 10)
GO
INSERT [dbo].[Recibos] ([IDRecibo], [FacturaID], [Fecha], [MontoPagado], [ClienteID]) VALUES (10, 15, CAST(N'2018-01-18' AS Date), CAST(320 AS Numeric(18, 0)), 11)
GO
SET IDENTITY_INSERT [dbo].[Recibos] OFF
GO
ALTER TABLE [dbo].[Facturas]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Paciente] FOREIGN KEY([ClienteID])
REFERENCES [dbo].[Clientes] ([IDClientes])
GO
ALTER TABLE [dbo].[Facturas] CHECK CONSTRAINT [FK_Factura_Paciente]
GO
ALTER TABLE [dbo].[Recibos]  WITH CHECK ADD  CONSTRAINT [FK_Recibo_Factura] FOREIGN KEY([FacturaID])
REFERENCES [dbo].[Facturas] ([IDFactura])
GO
ALTER TABLE [dbo].[Recibos] CHECK CONSTRAINT [FK_Recibo_Factura]
GO
ALTER TABLE [dbo].[Recibos]  WITH CHECK ADD  CONSTRAINT [FK_Recibo_Paciente] FOREIGN KEY([ClienteID])
REFERENCES [dbo].[Clientes] ([IDClientes])
GO
ALTER TABLE [dbo].[Recibos] CHECK CONSTRAINT [FK_Recibo_Paciente]
GO
USE [master]
GO
ALTER DATABASE [Ventas] SET  READ_WRITE 
GO
