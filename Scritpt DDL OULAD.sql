USE [master]
GO
/****** Object:  Database [OULAD]    Script Date: 14/6/2025 7:03:57 p. m. ******/
CREATE DATABASE [OULAD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OULAD', FILENAME = N'/var/opt/mssql/data/OULAD.mdf' , SIZE = 1449984KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OULAD_log', FILENAME = N'/var/opt/mssql/data/OULAD_log.ldf' , SIZE = 24576KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [OULAD] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OULAD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OULAD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OULAD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OULAD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OULAD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OULAD] SET ARITHABORT OFF 
GO
ALTER DATABASE [OULAD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OULAD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OULAD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OULAD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OULAD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OULAD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OULAD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OULAD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OULAD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OULAD] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OULAD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OULAD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OULAD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OULAD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OULAD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OULAD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OULAD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OULAD] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OULAD] SET  MULTI_USER 
GO
ALTER DATABASE [OULAD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OULAD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OULAD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OULAD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OULAD] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [OULAD] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'OULAD', N'ON'
GO
ALTER DATABASE [OULAD] SET QUERY_STORE = OFF
GO
USE [OULAD]
GO
/****** Object:  Table [dbo].[assessments]    Script Date: 14/6/2025 7:03:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[assessments](
	[id_assessment] [int] NOT NULL,
	[code_module] [varchar](10) NULL,
	[code_presentation] [varchar](10) NULL,
	[assessment_type] [varchar](50) NULL,
	[date] [int] NULL,
	[weight] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_assessment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[courses]    Script Date: 14/6/2025 7:03:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[courses](
	[code_module] [varchar](10) NOT NULL,
	[code_presentation] [varchar](10) NOT NULL,
	[module_presentation_length] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[code_module] ASC,
	[code_presentation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[studentAssessment]    Script Date: 14/6/2025 7:03:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[studentAssessment](
	[id_assessment] [int] NOT NULL,
	[id_student] [int] NOT NULL,
	[date_submitted] [int] NULL,
	[is_banked] [bit] NULL,
	[score] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_assessment] ASC,
	[id_student] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[studentInfo]    Script Date: 14/6/2025 7:03:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[studentInfo](
	[id_student] [int] NOT NULL,
	[code_module] [varchar](10) NOT NULL,
	[code_presentation] [varchar](10) NOT NULL,
	[gender] [varchar](10) NULL,
	[region] [varchar](100) NULL,
	[highest_education] [varchar](50) NULL,
	[imd_band] [varchar](10) NULL,
	[age_band] [varchar](20) NULL,
	[num_of_prev_attempts] [int] NULL,
	[studied_credits] [int] NULL,
	[disability] [varchar](10) NULL,
	[final_result] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_student] ASC,
	[code_module] ASC,
	[code_presentation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[studentRegistration]    Script Date: 14/6/2025 7:03:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[studentRegistration](
	[id_student] [int] NOT NULL,
	[code_module] [varchar](10) NOT NULL,
	[code_presentation] [varchar](10) NOT NULL,
	[date_registration] [int] NULL,
	[date_unregistration] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_student] ASC,
	[code_module] ASC,
	[code_presentation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[studentVle]    Script Date: 14/6/2025 7:03:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[studentVle](
	[id_student] [int] NOT NULL,
	[code_module] [varchar](10) NULL,
	[code_presentation] [varchar](10) NULL,
	[id_site] [int] NOT NULL,
	[date] [int] NOT NULL,
	[sum_click] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vle]    Script Date: 14/6/2025 7:03:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vle](
	[id_site] [int] NOT NULL,
	[code_module] [varchar](10) NULL,
	[code_presentation] [varchar](10) NULL,
	[activity_type] [varchar](50) NULL,
	[week_from] [int] NULL,
	[week_to] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_site] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[assessments]  WITH CHECK ADD FOREIGN KEY([code_module], [code_presentation])
REFERENCES [dbo].[courses] ([code_module], [code_presentation])
GO
ALTER TABLE [dbo].[studentAssessment]  WITH CHECK ADD  CONSTRAINT [FK_studentAssessment_assessment_] FOREIGN KEY([id_assessment])
REFERENCES [dbo].[assessments] ([id_assessment])
GO
ALTER TABLE [dbo].[studentAssessment] CHECK CONSTRAINT [FK_studentAssessment_assessment_]
GO
ALTER TABLE [dbo].[studentInfo]  WITH CHECK ADD  CONSTRAINT [FK_studentInfo_course] FOREIGN KEY([code_module], [code_presentation])
REFERENCES [dbo].[courses] ([code_module], [code_presentation])
GO
ALTER TABLE [dbo].[studentInfo] CHECK CONSTRAINT [FK_studentInfo_course]
GO
ALTER TABLE [dbo].[studentRegistration]  WITH CHECK ADD  CONSTRAINT [FK_studentRegistration_studentInfo] FOREIGN KEY([id_student], [code_module], [code_presentation])
REFERENCES [dbo].[studentInfo] ([id_student], [code_module], [code_presentation])
GO
ALTER TABLE [dbo].[studentRegistration] CHECK CONSTRAINT [FK_studentRegistration_studentInfo]
GO
ALTER TABLE [dbo].[studentVle]  WITH CHECK ADD  CONSTRAINT [FK_studentVle_studentInfo] FOREIGN KEY([id_student], [code_module], [code_presentation])
REFERENCES [dbo].[studentInfo] ([id_student], [code_module], [code_presentation])
GO
ALTER TABLE [dbo].[studentVle] CHECK CONSTRAINT [FK_studentVle_studentInfo]
GO
ALTER TABLE [dbo].[studentVle]  WITH CHECK ADD  CONSTRAINT [FK_studentVle_vle] FOREIGN KEY([id_site])
REFERENCES [dbo].[vle] ([id_site])
GO
ALTER TABLE [dbo].[studentVle] CHECK CONSTRAINT [FK_studentVle_vle]
GO
ALTER TABLE [dbo].[vle]  WITH CHECK ADD FOREIGN KEY([code_module], [code_presentation])
REFERENCES [dbo].[courses] ([code_module], [code_presentation])
GO
USE [master]
GO
ALTER DATABASE [OULAD] SET  READ_WRITE 
GO
