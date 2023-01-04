USE [master]
GO
/****** Object:  Database [tienda]    Script Date: 03-01-2023 23:29:01 ******/
CREATE DATABASE [tienda]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'tienda', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\tienda.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'tienda_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\tienda_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [tienda] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [tienda].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [tienda] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [tienda] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [tienda] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [tienda] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [tienda] SET ARITHABORT OFF 
GO
ALTER DATABASE [tienda] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [tienda] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [tienda] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [tienda] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [tienda] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [tienda] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [tienda] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [tienda] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [tienda] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [tienda] SET  DISABLE_BROKER 
GO
ALTER DATABASE [tienda] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [tienda] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [tienda] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [tienda] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [tienda] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [tienda] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [tienda] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [tienda] SET RECOVERY FULL 
GO
ALTER DATABASE [tienda] SET  MULTI_USER 
GO
ALTER DATABASE [tienda] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [tienda] SET DB_CHAINING OFF 
GO
ALTER DATABASE [tienda] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [tienda] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [tienda] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [tienda] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'tienda', N'ON'
GO
ALTER DATABASE [tienda] SET QUERY_STORE = OFF
GO
USE [tienda]
GO
/****** Object:  Table [dbo].[categoria]    Script Date: 03-01-2023 23:29:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categoria](
	[id_categoria] [bigint] NULL,
	[descripcion] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productos]    Script Date: 03-01-2023 23:29:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productos](
	[categoria] [bigint] NULL,
	[descripcion] [varchar](max) NULL,
	[id_product] [bigint] NULL,
	[marca] [varchar](max) NULL,
	[nombre] [varchar](max) NULL,
	[precio] [decimal](18, 2) NULL,
	[foto] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 03-01-2023 23:29:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[id_usuario] [bigint] NULL,
	[apellido] [varchar](max) NULL,
	[nombre] [varchar](max) NULL,
	[email] [varchar](max) NULL,
	[clave] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [tienda] SET  READ_WRITE 
GO
