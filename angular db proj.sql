USE [master]
GO
/****** Object:  Database [AngularDB]    Script Date: 4/14/2023 5:21:16 PM ******/
CREATE DATABASE [AngularDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AngularDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\AngularDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AngularDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\AngularDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [AngularDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AngularDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AngularDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AngularDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AngularDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AngularDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AngularDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [AngularDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AngularDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AngularDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AngularDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AngularDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AngularDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AngularDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AngularDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AngularDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AngularDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AngularDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AngularDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AngularDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AngularDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AngularDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AngularDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AngularDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AngularDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AngularDB] SET  MULTI_USER 
GO
ALTER DATABASE [AngularDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AngularDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AngularDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AngularDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AngularDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AngularDB] SET QUERY_STORE = OFF
GO
USE [AngularDB]
GO
/****** Object:  Table [dbo].[Appointment]    Script Date: 4/14/2023 5:21:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointment](
	[App_Id] [int] IDENTITY(1,1) NOT NULL,
	[Pat_Id] [int] NULL,
	[D_Id] [int] NULL,
	[App_date] [varchar](10) NULL,
	[Token_numb] [varchar](70) NULL,
	[Status] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[App_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 4/14/2023 5:21:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Dept_Id] [int] IDENTITY(1,1) NOT NULL,
	[Dept_Name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Dept_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doc_note]    Script Date: 4/14/2023 5:21:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doc_note](
	[Dn_Id] [int] IDENTITY(1,1) NOT NULL,
	[Pat_Id] [int] NULL,
	[D_Id] [int] NULL,
	[note] [varchar](100) NULL,
	[date] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Dn_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 4/14/2023 5:21:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctor](
	[D_Id] [int] IDENTITY(1,1) NOT NULL,
	[S_Id] [int] NULL,
	[Dept_Id] [int] NULL,
	[consult_fee] [int] NULL,
	[book_current_token] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[D_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lab_Test]    Script Date: 4/14/2023 5:21:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lab_Test](
	[Test_Id] [int] IDENTITY(1,1) NOT NULL,
	[Test_Name] [varchar](50) NULL,
	[Test_Code]  AS ('Te-'+CONVERT([varchar](50),[Test_Id])) PERSISTED,
	[High_range] [int] NULL,
	[Low_range] [int] NULL,
	[Price] [int] NULL,
	[Unit_Id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Test_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Login]    Script Date: 4/14/2023 5:21:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[User_Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](20) NOT NULL,
	[Password] [varchar](20) NOT NULL,
	[Role_Id] [int] NULL,
	[S_Id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[User_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[med_presc]    Script Date: 4/14/2023 5:21:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[med_presc](
	[MP_Id] [int] IDENTITY(1,1) NOT NULL,
	[Pat_Id] [int] NULL,
	[D_Id] [int] NULL,
	[Med_Id] [int] NULL,
	[Quantity] [int] NULL,
	[Dosage] [varchar](20) NULL,
	[Date] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MP_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicine]    Script Date: 4/14/2023 5:21:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicine](
	[Med_Id] [int] IDENTITY(1,1) NOT NULL,
	[Med_Name] [varchar](50) NULL,
	[Med_Code]  AS ('M-'+CONVERT([varchar](50),[Med_Id])) PERSISTED,
	[Gen_Name] [varchar](50) NULL,
	[Company] [varchar](50) NULL,
	[Price] [int] NULL,
	[StockQuantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Med_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patients]    Script Date: 4/14/2023 5:21:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patients](
	[Pat_Id] [int] IDENTITY(1,1) NOT NULL,
	[Reg_Id]  AS ('OP-'+CONVERT([varchar](50),[Pat_Id])) PERSISTED,
	[F_Name] [varchar](20) NULL,
	[L_Name] [varchar](20) NULL,
	[Dob] [varchar](50) NULL,
	[Gender] [varchar](10) NULL,
	[BloodGroup] [varchar](10) NULL,
	[Address] [varchar](100) NULL,
	[Phone] [varchar](10) NULL,
	[pat_email] [varchar](50) NULL,
	[last_fee_date] [varchar](50) NULL,
	[status] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[Pat_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 4/14/2023 5:21:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Role_Id] [int] IDENTITY(1,1) NOT NULL,
	[Role_Name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Role_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 4/14/2023 5:21:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[S_Id] [int] IDENTITY(1,1) NOT NULL,
	[Staff_Id]  AS ('S-'+CONVERT([varchar](50),[S_Id])) PERSISTED,
	[Name] [varchar](20) NULL,
	[Phone] [varchar](15) NULL,
	[DoB] [varchar](50) NULL,
	[Gender] [varchar](10) NULL,
	[Staff_email] [varchar](50) NULL,
	[Address] [varchar](100) NULL,
	[Blood_Group] [varchar](10) NULL,
	[DoJ] [varchar](50) NULL,
	[Role_Id] [int] NULL,
	[Status] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[S_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[test_presc]    Script Date: 4/14/2023 5:21:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test_presc](
	[TP_Id] [int] IDENTITY(1,1) NOT NULL,
	[Pat_Id] [int] NULL,
	[D_Id] [int] NULL,
	[Test_Id] [int] NULL,
	[date] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[TP_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Test_Report]    Script Date: 4/14/2023 5:21:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test_Report](
	[Tr_Id] [int] IDENTITY(1,1) NOT NULL,
	[Pat_Id] [int] NULL,
	[D_Id] [int] NULL,
	[Test_Id] [int] NULL,
	[Result] [varchar](55) NULL,
	[Unit_Id] [int] NULL,
	[Remark] [varchar](100) NULL,
	[date] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Tr_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestUnit]    Script Date: 4/14/2023 5:21:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestUnit](
	[Unit_Id] [int] IDENTITY(1,1) NOT NULL,
	[Unit_Name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Unit_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Doctor] ADD  DEFAULT ((0)) FOR [book_current_token]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [app_docid] FOREIGN KEY([D_Id])
REFERENCES [dbo].[Doctor] ([D_Id])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [app_docid]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [app_patreg] FOREIGN KEY([Pat_Id])
REFERENCES [dbo].[Patients] ([Pat_Id])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [app_patreg]
GO
ALTER TABLE [dbo].[Doc_note]  WITH CHECK ADD  CONSTRAINT [docnote_docid] FOREIGN KEY([D_Id])
REFERENCES [dbo].[Doctor] ([D_Id])
GO
ALTER TABLE [dbo].[Doc_note] CHECK CONSTRAINT [docnote_docid]
GO
ALTER TABLE [dbo].[Doc_note]  WITH CHECK ADD  CONSTRAINT [docnote_patreg] FOREIGN KEY([Pat_Id])
REFERENCES [dbo].[Patients] ([Pat_Id])
GO
ALTER TABLE [dbo].[Doc_note] CHECK CONSTRAINT [docnote_patreg]
GO
ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD  CONSTRAINT [fk_deptid_doc] FOREIGN KEY([Dept_Id])
REFERENCES [dbo].[Department] ([Dept_Id])
GO
ALTER TABLE [dbo].[Doctor] CHECK CONSTRAINT [fk_deptid_doc]
GO
ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD  CONSTRAINT [fk_sid_doc] FOREIGN KEY([S_Id])
REFERENCES [dbo].[Staff] ([S_Id])
GO
ALTER TABLE [dbo].[Doctor] CHECK CONSTRAINT [fk_sid_doc]
GO
ALTER TABLE [dbo].[Lab_Test]  WITH CHECK ADD  CONSTRAINT [test_unitId] FOREIGN KEY([Unit_Id])
REFERENCES [dbo].[TestUnit] ([Unit_Id])
GO
ALTER TABLE [dbo].[Lab_Test] CHECK CONSTRAINT [test_unitId]
GO
ALTER TABLE [dbo].[Login]  WITH CHECK ADD  CONSTRAINT [fk_log_role] FOREIGN KEY([Role_Id])
REFERENCES [dbo].[Role] ([Role_Id])
GO
ALTER TABLE [dbo].[Login] CHECK CONSTRAINT [fk_log_role]
GO
ALTER TABLE [dbo].[Login]  WITH CHECK ADD  CONSTRAINT [fk_log_staff] FOREIGN KEY([S_Id])
REFERENCES [dbo].[Staff] ([S_Id])
GO
ALTER TABLE [dbo].[Login] CHECK CONSTRAINT [fk_log_staff]
GO
ALTER TABLE [dbo].[med_presc]  WITH CHECK ADD  CONSTRAINT [medpresc_docid] FOREIGN KEY([D_Id])
REFERENCES [dbo].[Doctor] ([D_Id])
GO
ALTER TABLE [dbo].[med_presc] CHECK CONSTRAINT [medpresc_docid]
GO
ALTER TABLE [dbo].[med_presc]  WITH CHECK ADD  CONSTRAINT [medpresc_medid] FOREIGN KEY([Med_Id])
REFERENCES [dbo].[Medicine] ([Med_Id])
GO
ALTER TABLE [dbo].[med_presc] CHECK CONSTRAINT [medpresc_medid]
GO
ALTER TABLE [dbo].[med_presc]  WITH CHECK ADD  CONSTRAINT [medpresc_patreg] FOREIGN KEY([Pat_Id])
REFERENCES [dbo].[Patients] ([Pat_Id])
GO
ALTER TABLE [dbo].[med_presc] CHECK CONSTRAINT [medpresc_patreg]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [fk_role] FOREIGN KEY([Role_Id])
REFERENCES [dbo].[Role] ([Role_Id])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [fk_role]
GO
ALTER TABLE [dbo].[test_presc]  WITH CHECK ADD  CONSTRAINT [testpresc_docid] FOREIGN KEY([D_Id])
REFERENCES [dbo].[Doctor] ([D_Id])
GO
ALTER TABLE [dbo].[test_presc] CHECK CONSTRAINT [testpresc_docid]
GO
ALTER TABLE [dbo].[test_presc]  WITH CHECK ADD  CONSTRAINT [testpresc_patreg] FOREIGN KEY([Pat_Id])
REFERENCES [dbo].[Patients] ([Pat_Id])
GO
ALTER TABLE [dbo].[test_presc] CHECK CONSTRAINT [testpresc_patreg]
GO
ALTER TABLE [dbo].[test_presc]  WITH CHECK ADD  CONSTRAINT [testpresc_testid] FOREIGN KEY([Test_Id])
REFERENCES [dbo].[Lab_Test] ([Test_Id])
GO
ALTER TABLE [dbo].[test_presc] CHECK CONSTRAINT [testpresc_testid]
GO
ALTER TABLE [dbo].[Test_Report]  WITH CHECK ADD  CONSTRAINT [testrep_docid] FOREIGN KEY([D_Id])
REFERENCES [dbo].[Doctor] ([D_Id])
GO
ALTER TABLE [dbo].[Test_Report] CHECK CONSTRAINT [testrep_docid]
GO
ALTER TABLE [dbo].[Test_Report]  WITH CHECK ADD  CONSTRAINT [testrep_patreg] FOREIGN KEY([Pat_Id])
REFERENCES [dbo].[Patients] ([Pat_Id])
GO
ALTER TABLE [dbo].[Test_Report] CHECK CONSTRAINT [testrep_patreg]
GO
ALTER TABLE [dbo].[Test_Report]  WITH CHECK ADD  CONSTRAINT [testrep_testid] FOREIGN KEY([Test_Id])
REFERENCES [dbo].[Lab_Test] ([Test_Id])
GO
ALTER TABLE [dbo].[Test_Report] CHECK CONSTRAINT [testrep_testid]
GO
ALTER TABLE [dbo].[Test_Report]  WITH CHECK ADD  CONSTRAINT [testrep_unitId] FOREIGN KEY([Unit_Id])
REFERENCES [dbo].[TestUnit] ([Unit_Id])
GO
ALTER TABLE [dbo].[Test_Report] CHECK CONSTRAINT [testrep_unitId]
GO
USE [master]
GO
ALTER DATABASE [AngularDB] SET  READ_WRITE 
GO
