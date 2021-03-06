USE [master]
GO
/****** Object:  Database [WesternBlotDB]    Script Date: 2019-11-26 01:52:26 ******/
CREATE DATABASE [WesternBlotDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WesternBlotDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\WesternBlotDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WesternBlotDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\WesternBlotDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [WesternBlotDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WesternBlotDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WesternBlotDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WesternBlotDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WesternBlotDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WesternBlotDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WesternBlotDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [WesternBlotDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WesternBlotDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WesternBlotDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WesternBlotDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WesternBlotDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WesternBlotDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WesternBlotDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WesternBlotDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WesternBlotDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WesternBlotDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [WesternBlotDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WesternBlotDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WesternBlotDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WesternBlotDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WesternBlotDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WesternBlotDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WesternBlotDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WesternBlotDB] SET RECOVERY FULL 
GO
ALTER DATABASE [WesternBlotDB] SET  MULTI_USER 
GO
ALTER DATABASE [WesternBlotDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WesternBlotDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WesternBlotDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WesternBlotDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WesternBlotDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'WesternBlotDB', N'ON'
GO
ALTER DATABASE [WesternBlotDB] SET QUERY_STORE = OFF
GO
USE [WesternBlotDB]
GO
/****** Object:  Table [dbo].[blot]    Script Date: 2019-11-26 01:52:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[blot](
	[blot_id] [int] NOT NULL,
	[user_id] [int] NULL,
	[blot_date] [datetime] NULL,
	[protein_id] [int] NULL,
	[protein_amount] [float] NULL,
	[pa_id] [int] NULL,
	[pa_amount] [float] NULL,
	[sa_id] [int] NULL,
	[sa_amount] [float] NULL,
	[ladder_id] [int] NULL,
	[ladder_amount] [float] NULL,
	[gel_concentration] [float] NULL,
	[blot_scan] [image] NULL,
	[user_comment] [nvarchar](max) NULL,
 CONSTRAINT [PK_blot] PRIMARY KEY CLUSTERED 
(
	[blot_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ladder]    Script Date: 2019-11-26 01:52:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ladder](
	[ladder_id] [int] NOT NULL,
	[ladder_name] [varchar](50) NULL,
	[ladder_producer] [varchar](50) NULL,
	[ladder_producer_site] [nvarchar](max) NULL,
	[ladder_recommended_amount] [float] NULL,
	[ladder_min_mass] [float] NULL,
	[ladder_max_mass] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[ladder_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[primary_antibody]    Script Date: 2019-11-26 01:52:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[primary_antibody](
	[pa_id] [int] NOT NULL,
	[pa_organism] [varchar](50) NULL,
	[pa_target] [int] NULL,
	[pa_producer] [varchar](50) NULL,
	[pa_producer_site] [nvarchar](max) NULL,
	[pa_binding_sequence] [varchar](max) NULL,
	[pa_type] [varchar](50) NULL,
	[pa_recommended_concentration] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[pa_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[protein]    Script Date: 2019-11-26 01:52:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[protein](
	[protein_id] [int] NOT NULL,
	[protein_name] [varchar](50) NULL,
	[protein_symbol] [varchar](50) NULL,
	[protein_organism] [varchar](50) NULL,
	[protein_sequence] [varchar](max) NULL,
	[protein_mass] [float] NULL,
	[PDB_id] [char](10) NULL,
	[PDB_link] [nvarchar](max) NULL,
	[admin_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[protein_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[secondary_antibody]    Script Date: 2019-11-26 01:52:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[secondary_antibody](
	[sa_id] [int] NOT NULL,
	[sa_organism] [varchar](50) NULL,
	[sa_producer] [varchar](50) NULL,
	[sa_producer_site] [nvarchar](max) NULL,
	[sa_type] [varchar](50) NULL,
	[sa_recommended_concentration] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[sa_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 2019-11-26 01:52:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[user_id] [int] NOT NULL,
	[user_name] [nvarchar](50) NULL,
	[user_institute] [nvarchar](50) NULL,
	[user_login] [nvarchar](50) NULL,
	[user_password] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[blot]  WITH CHECK ADD  CONSTRAINT [FK_blot_blot] FOREIGN KEY([blot_id])
REFERENCES [dbo].[blot] ([blot_id])
GO
ALTER TABLE [dbo].[blot] CHECK CONSTRAINT [FK_blot_blot]
GO
ALTER TABLE [dbo].[blot]  WITH CHECK ADD  CONSTRAINT [FK_blot_ToTable] FOREIGN KEY([pa_id])
REFERENCES [dbo].[primary_antibody] ([pa_id])
GO
ALTER TABLE [dbo].[blot] CHECK CONSTRAINT [FK_blot_ToTable]
GO
ALTER TABLE [dbo].[blot]  WITH CHECK ADD  CONSTRAINT [FK_blot_ToTable_1] FOREIGN KEY([sa_id])
REFERENCES [dbo].[secondary_antibody] ([sa_id])
GO
ALTER TABLE [dbo].[blot] CHECK CONSTRAINT [FK_blot_ToTable_1]
GO
ALTER TABLE [dbo].[blot]  WITH CHECK ADD  CONSTRAINT [FK_blot_ToTable_2] FOREIGN KEY([ladder_id])
REFERENCES [dbo].[ladder] ([ladder_id])
GO
ALTER TABLE [dbo].[blot] CHECK CONSTRAINT [FK_blot_ToTable_2]
GO
ALTER TABLE [dbo].[blot]  WITH CHECK ADD  CONSTRAINT [FK_blot_ToTable_3] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[blot] CHECK CONSTRAINT [FK_blot_ToTable_3]
GO
ALTER TABLE [dbo].[blot]  WITH CHECK ADD  CONSTRAINT [FK_blot_ToTable_4] FOREIGN KEY([protein_id])
REFERENCES [dbo].[protein] ([protein_id])
GO
ALTER TABLE [dbo].[blot] CHECK CONSTRAINT [FK_blot_ToTable_4]
GO
ALTER TABLE [dbo].[primary_antibody]  WITH CHECK ADD  CONSTRAINT [FK_primary_antibody_ToTable] FOREIGN KEY([pa_target])
REFERENCES [dbo].[protein] ([protein_id])
GO
ALTER TABLE [dbo].[primary_antibody] CHECK CONSTRAINT [FK_primary_antibody_ToTable]
GO
USE [master]
GO
ALTER DATABASE [WesternBlotDB] SET  READ_WRITE 
GO
