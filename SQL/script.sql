USE [master]
GO
/****** Object:  Database [TestManager]    Script Date: 27-06-2020 6.15.44 PM ******/
CREATE DATABASE [TestManager]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TestManager', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\TestManager.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TestManager_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\TestManager_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TestManager] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TestManager].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TestManager] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TestManager] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TestManager] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TestManager] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TestManager] SET ARITHABORT OFF 
GO
ALTER DATABASE [TestManager] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TestManager] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TestManager] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TestManager] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TestManager] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TestManager] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TestManager] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TestManager] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TestManager] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TestManager] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TestManager] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TestManager] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TestManager] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TestManager] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TestManager] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TestManager] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TestManager] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TestManager] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TestManager] SET  MULTI_USER 
GO
ALTER DATABASE [TestManager] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TestManager] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TestManager] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TestManager] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TestManager] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TestManager] SET QUERY_STORE = OFF
GO
USE [TestManager]
GO
/****** Object:  Schema [Masters]    Script Date: 27-06-2020 6.15.44 PM ******/
CREATE SCHEMA [Masters]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 27-06-2020 6.15.44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](200) NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[PhoneNumber] [nvarchar](200) NULL,
	[PINCode] [varchar](50) NULL,
	[CityName] [nvarchar](200) NULL,
	[Email] [nvarchar](200) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Clients] ON 

INSERT [dbo].[Clients] ([Id], [FullName], [Address], [PhoneNumber], [PINCode], [CityName], [Email], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (1, N'Vidya Ganesh Yelgar', N'gggg', N'9870385321', N'400071', N'Navi Mumbai', N'vidyamagdum08@gmail.com', CAST(N'2020-06-25T18:27:06.030' AS DateTime), 0, CAST(N'2020-06-25T18:27:06.030' AS DateTime), 0)
INSERT [dbo].[Clients] ([Id], [FullName], [Address], [PhoneNumber], [PINCode], [CityName], [Email], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (2, N'Sneha J Neje', N'Seventh Floor,Seawood Railway Station', N'9870385321', N'400071', N'Navi Mumbai', N'vidyamagdum08@gmail.com', CAST(N'2020-06-26T13:45:37.177' AS DateTime), 0, CAST(N'2020-06-26T13:45:37.177' AS DateTime), 0)
INSERT [dbo].[Clients] ([Id], [FullName], [Address], [PhoneNumber], [PINCode], [CityName], [Email], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (3, N'Test User', N'Police Headquarter, Latur, Latur, Maharashtra', N'9870385321', N'400706', N'malkapur', N'vidyamagdum08@gmail.com', CAST(N'2020-06-26T13:50:05.243' AS DateTime), 0, CAST(N'2020-06-26T13:50:05.243' AS DateTime), 0)
INSERT [dbo].[Clients] ([Id], [FullName], [Address], [PhoneNumber], [PINCode], [CityName], [Email], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (1002, N'Sonali J Kale', N'Niharika Avenue,Plot No. 105, Flat No. 702, Sevent', N'8169907382', N'123456', N'Mumbai', N'sonali@gmail.com', CAST(N'2020-06-27T17:11:32.690' AS DateTime), 0, CAST(N'2020-06-27T17:11:32.690' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Clients] OFF
ALTER TABLE [dbo].[Clients] ADD  CONSTRAINT [DF_Clients_PINCode]  DEFAULT ((0)) FOR [PINCode]
GO
ALTER TABLE [dbo].[Clients] ADD  CONSTRAINT [DF_Clients_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Clients] ADD  CONSTRAINT [DF_Clients_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Clients] ADD  CONSTRAINT [DF_Clients_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Clients] ADD  CONSTRAINT [DF_Clients_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
/****** Object:  StoredProcedure [dbo].[AddClientDetails]    Script Date: 27-06-2020 6.15.44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[AddClientDetails]
(
@FullName varchar (50),
@Address varchar (50),
@Phonenumber varchar(100),
@PINCode varchar (50),
@Cityname varchar(100),
@Email varchar(100)
)
as
begin
Insert into Clients (FullName,Address,PhoneNumber,PINCode,CityName,Email) values(@FullName,@Address,@Phonenumber,@PINCode,@Cityname,@Email)
End 
 
GO
/****** Object:  StoredProcedure [dbo].[GetClients]    Script Date: 27-06-2020 6.15.44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[GetClients]  
as  
begin  
select  Id As ClientID,FullName,Address,PhoneNumber,PINCode,CityName,Email from Clients
End 
GO
/****** Object:  StoredProcedure [dbo].[UpdateClientDetails]    Script Date: 27-06-2020 6.15.44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UpdateClientDetails]
(
@ClientID int,
@FullName varchar (50),
@Address varchar (50),
@PhoneNumber varchar(100),
@PINCode varchar (50),
@Cityname varchar(100),
@Email varchar(100)
)
as
begin
Update Clients
set FullName=@FullName,
Address=@Address,
PhoneNumber=@PhoneNumber,
PINCode=@PINCode,
CityName=@Cityname,
Email=@Email
where Id=@ClientID
End 
GO
USE [master]
GO
ALTER DATABASE [TestManager] SET  READ_WRITE 
GO
