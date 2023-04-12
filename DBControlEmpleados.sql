USE [master]
GO

/****** Object:  Database [DB_ControlEmpleados]    Script Date: 12/04/2023 01:12:28 ******/
CREATE DATABASE [DB_ControlEmpleados]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_ControlEmpleados', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\DB_ControlEmpleados.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DB_ControlEmpleados_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\DB_ControlEmpleados_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_ControlEmpleados].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [DB_ControlEmpleados] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [DB_ControlEmpleados] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [DB_ControlEmpleados] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [DB_ControlEmpleados] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [DB_ControlEmpleados] SET ARITHABORT OFF 
GO

ALTER DATABASE [DB_ControlEmpleados] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [DB_ControlEmpleados] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [DB_ControlEmpleados] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [DB_ControlEmpleados] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [DB_ControlEmpleados] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [DB_ControlEmpleados] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [DB_ControlEmpleados] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [DB_ControlEmpleados] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [DB_ControlEmpleados] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [DB_ControlEmpleados] SET  DISABLE_BROKER 
GO

ALTER DATABASE [DB_ControlEmpleados] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [DB_ControlEmpleados] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [DB_ControlEmpleados] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [DB_ControlEmpleados] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [DB_ControlEmpleados] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [DB_ControlEmpleados] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [DB_ControlEmpleados] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [DB_ControlEmpleados] SET RECOVERY FULL 
GO

ALTER DATABASE [DB_ControlEmpleados] SET  MULTI_USER 
GO

ALTER DATABASE [DB_ControlEmpleados] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [DB_ControlEmpleados] SET DB_CHAINING OFF 
GO

ALTER DATABASE [DB_ControlEmpleados] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [DB_ControlEmpleados] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [DB_ControlEmpleados] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [DB_ControlEmpleados] SET QUERY_STORE = OFF
GO

ALTER DATABASE [DB_ControlEmpleados] SET  READ_WRITE 
GO


USE [DB_ControlEmpleados]
GO

/****** Object:  Table [dbo].[Departamento]    Script Date: 12/04/2023 01:10:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Departamento](
	[Codigo] [varchar](50) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Descripcion] [varchar](max) NULL,
 CONSTRAINT [PK_Departamento] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


USE [DB_ControlEmpleados]
GO

/****** Object:  Table [dbo].[Empleado]    Script Date: 12/04/2023 01:10:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Empleado](
	[Codigo] [varchar](50) NOT NULL,
	[Nombres] [varchar](50) NOT NULL,
	[Apellidos] [varchar](50) NOT NULL,
	[Fecha_n] [date] NULL,
	[Departamento] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Empleado] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK_Empleado_Departamento] FOREIGN KEY([Departamento])
REFERENCES [dbo].[Departamento] ([Codigo])
GO

ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_Empleado_Departamento]
GO
