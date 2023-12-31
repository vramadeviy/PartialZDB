USE [master]
GO
/****** Object:  Database [PartialZ]    Script Date: 03-07-2023 11:51:11 ******/
CREATE DATABASE [PartialZ]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PartialZ', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\PartialZ.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PartialZ_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\PartialZ_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [PartialZ] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PartialZ].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PartialZ] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PartialZ] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PartialZ] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PartialZ] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PartialZ] SET ARITHABORT OFF 
GO
ALTER DATABASE [PartialZ] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PartialZ] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PartialZ] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PartialZ] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PartialZ] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PartialZ] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PartialZ] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PartialZ] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PartialZ] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PartialZ] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PartialZ] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PartialZ] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PartialZ] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PartialZ] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PartialZ] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PartialZ] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PartialZ] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PartialZ] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PartialZ] SET  MULTI_USER 
GO
ALTER DATABASE [PartialZ] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PartialZ] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PartialZ] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PartialZ] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PartialZ] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PartialZ] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PartialZ] SET QUERY_STORE = ON
GO
ALTER DATABASE [PartialZ] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [PartialZ]
GO
/****** Object:  Table [dbo].[EmailTemplates]    Script Date: 03-07-2023 11:51:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmailTemplates](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Template] [nvarchar](max) NULL,
	[Subject] [nvarchar](500) NULL,
	[Description] [nvarchar](max) NULL,
	[IsActive] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[LastModifedDate] [datetime] NULL,
 CONSTRAINT [PK_EmailTemplates] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 03-07-2023 11:51:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
	[Email] [nvarchar](150) NULL,
	[Password] [nvarchar](max) NULL,
	[BusinessTitle] [nvarchar](500) NULL,
	[PhoneNumber] [nvarchar](15) NULL,
	[IsVerified] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[LastModifedDate] [datetime] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeWorkHistory]    Script Date: 03-07-2023 11:51:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeWorkHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmployerId] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[PayrollEndDay] [datetime] NULL,
	[CreatedDate] [datetime] NULL,
	[LastModifedDate] [datetime] NULL,
 CONSTRAINT [PK_EmployeeWorkHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employer]    Script Date: 03-07-2023 11:51:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employer](
	[EmployerId] [int] IDENTITY(1,1) NOT NULL,
	[EANNumber] [nvarchar](100) NULL,
	[FEINNumber] [nvarchar](100) NULL,
	[EmployerEmail] [nvarchar](100) NULL,
	[Name] [nvarchar](500) NULL,
	[Address] [nvarchar](max) NULL,
	[City] [nvarchar](100) NULL,
	[State] [nvarchar](100) NULL,
	[ZipCode] [nvarchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[LastModifedDate] [datetime] NULL,
 CONSTRAINT [PK_Employer] PRIMARY KEY CLUSTERED 
(
	[EmployerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[EmailTemplates] ADD  CONSTRAINT [DF_EmailTemplates_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[EmailTemplates] ADD  CONSTRAINT [DF_ETCD]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[EmailTemplates] ADD  CONSTRAINT [DF_ETLMD]  DEFAULT (getdate()) FOR [LastModifedDate]
GO
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [DF_Employee_IsVerified]  DEFAULT ((0)) FOR [IsVerified]
GO
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [DF_CD]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [DF_LMD]  DEFAULT (getdate()) FOR [LastModifedDate]
GO
ALTER TABLE [dbo].[EmployeeWorkHistory] ADD  CONSTRAINT [DF_EWHCD]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[EmployeeWorkHistory] ADD  CONSTRAINT [DF_EHWLMD]  DEFAULT (getdate()) FOR [LastModifedDate]
GO
ALTER TABLE [dbo].[Employer] ADD  CONSTRAINT [DF_ERCD]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Employer] ADD  CONSTRAINT [DF_ERLMD]  DEFAULT (getdate()) FOR [LastModifedDate]
GO
USE [master]
GO
ALTER DATABASE [PartialZ] SET  READ_WRITE 
GO
