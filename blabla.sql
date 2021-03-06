USE [master]
GO
/****** Object:  Database [Hospital]    Script Date: 8/29/2014 2:49:58 PM ******/
CREATE DATABASE [Hospital]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Hospital', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Hospital.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Hospital_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Hospital_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Hospital] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Hospital].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Hospital] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Hospital] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Hospital] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Hospital] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Hospital] SET ARITHABORT OFF 
GO
ALTER DATABASE [Hospital] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Hospital] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Hospital] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Hospital] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Hospital] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Hospital] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Hospital] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Hospital] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Hospital] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Hospital] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Hospital] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Hospital] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Hospital] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Hospital] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Hospital] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Hospital] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Hospital] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Hospital] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Hospital] SET RECOVERY FULL 
GO
ALTER DATABASE [Hospital] SET  MULTI_USER 
GO
ALTER DATABASE [Hospital] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Hospital] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Hospital] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Hospital] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Hospital]
GO
/****** Object:  Table [dbo].[_Factura]    Script Date: 8/29/2014 2:49:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_Factura](
	[serial_no] [nvarchar](50) NOT NULL,
	[total] [float] NULL,
	[data_emiterii] [datetime] NULL,
	[Patient_id] [int] NULL,
 CONSTRAINT [PK__Factura] PRIMARY KEY CLUSTERED 
(
	[serial_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[_Pacient]    Script Date: 8/29/2014 2:49:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_Pacient](
	[Patient_id] [int] NOT NULL,
	[nume_pacient] [nvarchar](50) NULL,
	[prenume_pacient] [nvarchar](50) NULL,
	[sex] [int] NULL,
	[adresa_pacient] [nvarchar](50) NULL,
	[dob_pacient] [datetime] NULL,
	[age] [int] NULL,
	[Room_number] [int] NULL,
	[diagnostic] [nvarchar](50) NULL,
	[id_personal] [int] NULL,
 CONSTRAINT [PK__Pacient] PRIMARY KEY CLUSTERED 
(
	[Patient_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[_Personal]    Script Date: 8/29/2014 2:49:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_Personal](
	[id_personal] [int] NOT NULL,
	[id_functie] [int] NULL,
	[nume] [nvarchar](50) NULL,
	[prenume] [nvarchar](50) NULL,
	[adresa] [nvarchar](50) NULL,
	[id_sectie] [int] NULL,
	[cnp] [nvarchar](50) NULL,
 CONSTRAINT [PK__Personal] PRIMARY KEY CLUSTERED 
(
	[id_personal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[_Sectie]    Script Date: 8/29/2014 2:49:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_Sectie](
	[id_sectie] [int] NOT NULL,
	[nume_sectie] [nvarchar](50) NULL,
 CONSTRAINT [PK__Sectie] PRIMARY KEY CLUSTERED 
(
	[id_sectie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Equipment]    Script Date: 8/29/2014 2:49:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipment](
	[Serial_no] [nchar](10) NOT NULL,
	[Description] [nvarchar](50) NULL,
	[Cost] [float] NULL,
	[Room_number] [int] NULL,
 CONSTRAINT [PK_Equipment] PRIMARY KEY CLUSTERED 
(
	[Serial_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Functii]    Script Date: 8/29/2014 2:49:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Functii](
	[id_functie] [int] NOT NULL,
	[nume_functie] [nvarchar](50) NULL,
 CONSTRAINT [PK_Functii] PRIMARY KEY CLUSTERED 
(
	[id_functie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Room]    Script Date: 8/29/2014 2:49:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[Room_number] [int] NOT NULL,
	[Type] [nvarchar](50) NULL,
	[Num_beds] [int] NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[Room_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[_Factura] ([serial_no], [total], [data_emiterii], [Patient_id]) VALUES (N'F01', 500, CAST(0x0000A2D000000000 AS DateTime), 7000)
INSERT [dbo].[_Factura] ([serial_no], [total], [data_emiterii], [Patient_id]) VALUES (N'F02', 900, CAST(0x0000A3D800000000 AS DateTime), 7001)
INSERT [dbo].[_Factura] ([serial_no], [total], [data_emiterii], [Patient_id]) VALUES (N'F03', 100, CAST(0x0000A32200000000 AS DateTime), 7002)
INSERT [dbo].[_Factura] ([serial_no], [total], [data_emiterii], [Patient_id]) VALUES (N'F04', 300, CAST(0x0000A2B200000000 AS DateTime), 7003)
INSERT [dbo].[_Pacient] ([Patient_id], [nume_pacient], [prenume_pacient], [sex], [adresa_pacient], [dob_pacient], [age], [Room_number], [diagnostic], [id_personal]) VALUES (7000, N'Paun', N'Daniel', 1, N'Braila, Str. Margaritar, Nr. 1', CAST(0x000081BE00000000 AS DateTime), 24, 2000, N'Sangerari Interne', 8000)
INSERT [dbo].[_Pacient] ([Patient_id], [nume_pacient], [prenume_pacient], [sex], [adresa_pacient], [dob_pacient], [age], [Room_number], [diagnostic], [id_personal]) VALUES (7001, N'Cretu', N'Cezar', 1, N'Radauti, Str. Dorintei, Nr.2', CAST(0x0000844100000000 AS DateTime), 21, 2000, N'Sangerari Nazale', 8000)
INSERT [dbo].[_Pacient] ([Patient_id], [nume_pacient], [prenume_pacient], [sex], [adresa_pacient], [dob_pacient], [age], [Room_number], [diagnostic], [id_personal]) VALUES (7002, N'Ciobotaru', N'Costel', 1, N'Galati, Str. Toganel, Nr. 13', CAST(0x000081DE00000000 AS DateTime), 22, 2001, N'Boala de Inima, Stadiu Avansat', 8001)
INSERT [dbo].[_Pacient] ([Patient_id], [nume_pacient], [prenume_pacient], [sex], [adresa_pacient], [dob_pacient], [age], [Room_number], [diagnostic], [id_personal]) VALUES (7003, N'Defta', N'Radulian', 1, N'Com. Rusanesti, Str. Brutariei, Nr. 14', CAST(0x000084B000000000 AS DateTime), 21, 2002, N'Transplat de Inima, Urgent', 8001)
INSERT [dbo].[_Personal] ([id_personal], [id_functie], [nume], [prenume], [adresa], [id_sectie], [cnp]) VALUES (8000, 1, N'Defta', N'Marina', N'Com.Rusanesti, Jud. Olt', 2000, N'2901008282206')
INSERT [dbo].[_Personal] ([id_personal], [id_functie], [nume], [prenume], [adresa], [id_sectie], [cnp]) VALUES (8001, 2, N'Defta', N'Virginia', N'Com. Rusanesti, Jud. Olt, Nr. 14', 2000, N'2681209282204')
INSERT [dbo].[_Personal] ([id_personal], [id_functie], [nume], [prenume], [adresa], [id_sectie], [cnp]) VALUES (8002, 2, N'Defta', N'Gelu', N'Com. Rusanesti', 2000, N'1681012282236')
INSERT [dbo].[_Personal] ([id_personal], [id_functie], [nume], [prenume], [adresa], [id_sectie], [cnp]) VALUES (8003, 3, N'Bocai', N'Floarea', N'Sat Jieni, Str. Principala', 2000, N'1560612030201')
INSERT [dbo].[_Personal] ([id_personal], [id_functie], [nume], [prenume], [adresa], [id_sectie], [cnp]) VALUES (8004, 3, N'Ghigeanu', N'Irinel', N'Cicarlau, Str. Oltenia, Nr. 3', 2000, N'1781203451230')
INSERT [dbo].[_Personal] ([id_personal], [id_functie], [nume], [prenume], [adresa], [id_sectie], [cnp]) VALUES (8005, 4, N'Dorca', N'Carla', N'Cicarlau, Str. Olt, Nr. 13', 2000, N'2951103256574')
INSERT [dbo].[_Personal] ([id_personal], [id_functie], [nume], [prenume], [adresa], [id_sectie], [cnp]) VALUES (8006, 4, N'Popescu', N'Mircea', N'Rovinari, Str. Zambilei, Nr. 1', 2000, N'1651211486139')
INSERT [dbo].[_Personal] ([id_personal], [id_functie], [nume], [prenume], [adresa], [id_sectie], [cnp]) VALUES (8007, 3, N'Eminescu', N'Mihail', N'Com. Pletoasa, Str. Ghiocel, Nr.11', 2000, N'1450712659874')
INSERT [dbo].[_Personal] ([id_personal], [id_functie], [nume], [prenume], [adresa], [id_sectie], [cnp]) VALUES (8008, 1, N'Ghimes', N'Ana-Maria', N'Bucuresti, Sector 4, Str. Renasterii, Nr. 13', 3000, N'2901215457812')
INSERT [dbo].[_Personal] ([id_personal], [id_functie], [nume], [prenume], [adresa], [id_sectie], [cnp]) VALUES (8009, 2, N'Ailutoae', N'Ana', N'Braila, Str. Cunoasterii, Nr. 21', 3000, N'2941104326191')
INSERT [dbo].[_Personal] ([id_personal], [id_functie], [nume], [prenume], [adresa], [id_sectie], [cnp]) VALUES (8010, 2, N'Capra', N'Mihai', N'Bucuresti, Sector 2, Str. Liviu Rebreanu, Nr. 2', 3000, N'1800102030405')
INSERT [dbo].[_Personal] ([id_personal], [id_functie], [nume], [prenume], [adresa], [id_sectie], [cnp]) VALUES (8011, 3, N'Nedelcu', N'Ionel', N'Caracal, Str. Intrarea Buzesti, Nr. 3', 3000, N'1890512456555')
INSERT [dbo].[_Personal] ([id_personal], [id_functie], [nume], [prenume], [adresa], [id_sectie], [cnp]) VALUES (8012, 3, N'Mircescu', N'Maria', N'Slatina, Str. Antonius Caracalla, Nr. 41', 3000, N'2881203468520')
INSERT [dbo].[_Personal] ([id_personal], [id_functie], [nume], [prenume], [adresa], [id_sectie], [cnp]) VALUES (8013, 4, N'Ionescu', N'Bogdan', N'Deveselu, Str. Armatei, Nr.111', 3000, N'1930113282415')
INSERT [dbo].[_Personal] ([id_personal], [id_functie], [nume], [prenume], [adresa], [id_sectie], [cnp]) VALUES (8014, 4, N'Marinescu', N'Raluca', N'Caracal, Str. Interzisa, Nr. 21', 3000, N'2900901241637')
INSERT [dbo].[_Personal] ([id_personal], [id_functie], [nume], [prenume], [adresa], [id_sectie], [cnp]) VALUES (8015, 1, N'Togan', N'Mihai', N'Bucuresti, Sector 1 , Str. Zece, Nr. 9', 4000, N'1741205458724')
INSERT [dbo].[_Personal] ([id_personal], [id_functie], [nume], [prenume], [adresa], [id_sectie], [cnp]) VALUES (8016, 2, N'Plesca', N'Cezar', N'Bucuresti, Sector 2, Str. Binefacerii, Nr. 13', 4000, N'1750310498701')
INSERT [dbo].[_Personal] ([id_personal], [id_functie], [nume], [prenume], [adresa], [id_sectie], [cnp]) VALUES (8017, 2, N'Coconcea', N'Alexandra', N'Slobozia, Str. Invierii, Nr. 3', 4000, N'2900608284651')
INSERT [dbo].[_Personal] ([id_personal], [id_functie], [nume], [prenume], [adresa], [id_sectie], [cnp]) VALUES (8018, 3, N'Margarit', N'Laurentiu', N'Bucuresti, Str. Foametei, Nr. 31', 4000, N'1703009154266')
INSERT [dbo].[_Personal] ([id_personal], [id_functie], [nume], [prenume], [adresa], [id_sectie], [cnp]) VALUES (8019, 3, N'Soare', N'Mihaela', N'Sinaia, Str. Zapezii, Nr. 41', 4000, N'2650907421530')
INSERT [dbo].[_Personal] ([id_personal], [id_functie], [nume], [prenume], [adresa], [id_sectie], [cnp]) VALUES (8020, 4, N'Bumbacea', N'Andrei', N'Caracal, Str. Mosilor, Nr. 31', 4000, N'1920203154246')
INSERT [dbo].[_Personal] ([id_personal], [id_functie], [nume], [prenume], [adresa], [id_sectie], [cnp]) VALUES (8021, 4, N'Afloarei', N'Anca', N'Rosiorii de Vede, Str. Inteligentei, Nr.30', 4000, N'2890412043567')
INSERT [dbo].[_Personal] ([id_personal], [id_functie], [nume], [prenume], [adresa], [id_sectie], [cnp]) VALUES (8022, 1, N'Defta', N'Radulian', N'Com. Rusanesti, Jud. Olt, Nr. 14', 5000, N'1930113282205')
INSERT [dbo].[_Personal] ([id_personal], [id_functie], [nume], [prenume], [adresa], [id_sectie], [cnp]) VALUES (8023, 2, N'Crihana', N'Iulian', N'Galati, Str. Mare, Nr. 1', 5000, N'1920303651423')
INSERT [dbo].[_Personal] ([id_personal], [id_functie], [nume], [prenume], [adresa], [id_sectie], [cnp]) VALUES (8024, 2, N'Tapliga', N'Mirel', N'Drobeta Turnu Severi, Str. Calomfirescu, Nr. 3', 5000, N'1920624231201')
INSERT [dbo].[_Personal] ([id_personal], [id_functie], [nume], [prenume], [adresa], [id_sectie], [cnp]) VALUES (8025, 3, N'Laba', N'Mihail', N'Labus, Str. Proasta, Nr 2', 5000, N'1651020664455')
INSERT [dbo].[_Personal] ([id_personal], [id_functie], [nume], [prenume], [adresa], [id_sectie], [cnp]) VALUES (8026, 3, N'Copil', N'Prost', N'Tusnad, Str. Tusei, Nr.999', 5000, N'1781005451200')
INSERT [dbo].[_Personal] ([id_personal], [id_functie], [nume], [prenume], [adresa], [id_sectie], [cnp]) VALUES (8027, 4, N'Stan', N'Alexandru', N'Caracal, Str. Libertarii, Nr. 73', 5000, N'1940215421535')
INSERT [dbo].[_Personal] ([id_personal], [id_functie], [nume], [prenume], [adresa], [id_sectie], [cnp]) VALUES (8028, 4, N'Diaconu', N'Emanuel', N'Giurgiu, Str. Falezei, Nr. 31', 5000, N'1940604124578')
INSERT [dbo].[_Personal] ([id_personal], [id_functie], [nume], [prenume], [adresa], [id_sectie], [cnp]) VALUES (8029, 1, N'Badea', N'Mircea', N'Bucuresti, Sector 3', 6000, N'1851212457846')
INSERT [dbo].[_Personal] ([id_personal], [id_functie], [nume], [prenume], [adresa], [id_sectie], [cnp]) VALUES (8030, 2, N'Corondan', N'Mihaela', N'Bucuresti, Sector 2, Str. Emanciparii, Nr. 4', 6000, N'2650301242516')
INSERT [dbo].[_Personal] ([id_personal], [id_functie], [nume], [prenume], [adresa], [id_sectie], [cnp]) VALUES (8031, 2, N'House', N'Gregory', N'Londra, Str. Lacramioara, Nr. 4', 6000, N'1851203456124')
INSERT [dbo].[_Personal] ([id_personal], [id_functie], [nume], [prenume], [adresa], [id_sectie], [cnp]) VALUES (8032, 3, N'Watson', N'Emma', N'Paris, Str. Boulacrouz, Nr 5', 6000, N'2891010245130')
INSERT [dbo].[_Personal] ([id_personal], [id_functie], [nume], [prenume], [adresa], [id_sectie], [cnp]) VALUES (8033, 3, N'Ezreal', N'TPA', N'Summoner, Str. Rift, Nr.10', 6000, N'1800419246891')
INSERT [dbo].[_Personal] ([id_personal], [id_functie], [nume], [prenume], [adresa], [id_sectie], [cnp]) VALUES (8034, 4, N'Cargo', N'Vrajitoarele', N'Padurea, Str. Soarelui, Nr. 31', 6000, N'1801020457819')
INSERT [dbo].[_Personal] ([id_personal], [id_functie], [nume], [prenume], [adresa], [id_sectie], [cnp]) VALUES (8035, 4, N'Birdy', N'York', N'Bucuresti, Sector 2, Str. Reginald, Nr. 31', 6000, N'2030512435549')
INSERT [dbo].[_Personal] ([id_personal], [id_functie], [nume], [prenume], [adresa], [id_sectie], [cnp]) VALUES (8036, 1, N'Tanasescu', N'Andrei', N'Craiova, Str. Berii, Nr. 1', 7000, N'1921128731542')
INSERT [dbo].[_Personal] ([id_personal], [id_functie], [nume], [prenume], [adresa], [id_sectie], [cnp]) VALUES (8037, 2, N'Cretu', N'Cezar', N'Radauti, Str. Gloriei, Nr. 31', 7000, N'1920604183472')
INSERT [dbo].[_Personal] ([id_personal], [id_functie], [nume], [prenume], [adresa], [id_sectie], [cnp]) VALUES (8038, 2, N'Sportul', N'Studentesc', N'Bucuresti, Sector 2, Str. Sperantei Tacute, Nr. 41', 7000, N'1680913864512')
INSERT [dbo].[_Personal] ([id_personal], [id_functie], [nume], [prenume], [adresa], [id_sectie], [cnp]) VALUES (8039, 3, N'Prodanca', N'Maria', N'Bucuresti, Sector 6, Str. Stelei, Nr. 25', 7000, N'2791017432105')
INSERT [dbo].[_Personal] ([id_personal], [id_functie], [nume], [prenume], [adresa], [id_sectie], [cnp]) VALUES (8040, 3, N'zAMFIR', N'Laurentiu', N'Tusnad, Calea Rahovei, Nr. 3', 7000, N'1650112451672')
INSERT [dbo].[_Personal] ([id_personal], [id_functie], [nume], [prenume], [adresa], [id_sectie], [cnp]) VALUES (8041, 4, N'Ciobotaru', N'Costel-Valentin', N'Braila, Str. Industriei, Nr. 3', 7000, N'1921212457812')
INSERT [dbo].[_Personal] ([id_personal], [id_functie], [nume], [prenume], [adresa], [id_sectie], [cnp]) VALUES (8042, 4, N'Celine', N'Dion', N'Londra, Str. Giganta, Nr. 41', 7000, N'2771230451291')
INSERT [dbo].[_Personal] ([id_personal], [id_functie], [nume], [prenume], [adresa], [id_sectie], [cnp]) VALUES (8043, 1, N'Jarvan', N'Patru', N'Demacia, Str. Victoriei, Nr. 4', 8000, N'1801029134679')
INSERT [dbo].[_Personal] ([id_personal], [id_functie], [nume], [prenume], [adresa], [id_sectie], [cnp]) VALUES (8044, 2, N'Shen', N'MD', N'MistyMountains, Str. Junglei, Nr. 22', 8000, N'1801208562317')
INSERT [dbo].[_Personal] ([id_personal], [id_functie], [nume], [prenume], [adresa], [id_sectie], [cnp]) VALUES (8045, 2, N'Kennen', N'Medica', N'Demacia, Str. Veveritei, Nr. 97', 8000, N'2800627154320')
INSERT [dbo].[_Personal] ([id_personal], [id_functie], [nume], [prenume], [adresa], [id_sectie], [cnp]) VALUES (8046, 3, N'Akali', N'Aristocrata', N'Summoner, Str. Alba, Nr. 22', 8000, N'2800327562300')
INSERT [dbo].[_Personal] ([id_personal], [id_functie], [nume], [prenume], [adresa], [id_sectie], [cnp]) VALUES (8047, 3, N'Mos', N'Craciun', N'Laponia, Str. Cadourilor, Nr. 10', 8000, N'1281225352635')
INSERT [dbo].[_Personal] ([id_personal], [id_functie], [nume], [prenume], [adresa], [id_sectie], [cnp]) VALUES (8048, 4, N'Mihai', N'Alexandru', N'Studina, Str. Mihai Eminescu, Nr. 444', 8000, N'1861224101010')
INSERT [dbo].[_Personal] ([id_personal], [id_functie], [nume], [prenume], [adresa], [id_sectie], [cnp]) VALUES (8049, 4, N'Stefan', N'Statisor', N'Focsani, Str. Libertatii, Nr. 9', 8000, N'1891104671832')
INSERT [dbo].[_Personal] ([id_personal], [id_functie], [nume], [prenume], [adresa], [id_sectie], [cnp]) VALUES (8050, 1, N'Elsa', N'Olaf', N'Erebor, Str. Aurului, Nr. 22', 9000, N'1801212456532')
INSERT [dbo].[_Personal] ([id_personal], [id_functie], [nume], [prenume], [adresa], [id_sectie], [cnp]) VALUES (8051, 2, N'Stefan', N'Ana', N'Bucuresti, Sector 4, Str. Giugiului, Nr. 31', 9000, N'2900301254672')
INSERT [dbo].[_Personal] ([id_personal], [id_functie], [nume], [prenume], [adresa], [id_sectie], [cnp]) VALUES (8052, 2, N'Rebiga', N'Marinel', N'Com. Rusanesti, Jud. Olt, Nr. 31', 9000, N'1920513201649')
INSERT [dbo].[_Personal] ([id_personal], [id_functie], [nume], [prenume], [adresa], [id_sectie], [cnp]) VALUES (8053, 3, N'Guta', N'Andreea-Laura', N'Com. Rusanesti, Str. Preotimii, Nr. 666', 9000, N'2942904951230')
INSERT [dbo].[_Personal] ([id_personal], [id_functie], [nume], [prenume], [adresa], [id_sectie], [cnp]) VALUES (8054, 3, N'Defta', N'Mihai', N'Videle, Str. Primariei, Nr. 4', 9000, N'1901026351024')
INSERT [dbo].[_Personal] ([id_personal], [id_functie], [nume], [prenume], [adresa], [id_sectie], [cnp]) VALUES (8055, 4, N'Amariei', N'Andrei', N'Iasi, Str. Luncasi, Nr. 98', 9000, N'1861204153542')
INSERT [dbo].[_Personal] ([id_personal], [id_functie], [nume], [prenume], [adresa], [id_sectie], [cnp]) VALUES (8056, 4, N'Briceag', N'Roxana', N'Craiova, Str. Intrarea Mihail, Nr. 21', 9000, N'1920513246895')
INSERT [dbo].[_Sectie] ([id_sectie], [nume_sectie]) VALUES (1000, N'Administratie')
INSERT [dbo].[_Sectie] ([id_sectie], [nume_sectie]) VALUES (2000, N'Cardiologie')
INSERT [dbo].[_Sectie] ([id_sectie], [nume_sectie]) VALUES (3000, N'Chirurgie')
INSERT [dbo].[_Sectie] ([id_sectie], [nume_sectie]) VALUES (4000, N'Ortopedie')
INSERT [dbo].[_Sectie] ([id_sectie], [nume_sectie]) VALUES (5000, N'Reanimare')
INSERT [dbo].[_Sectie] ([id_sectie], [nume_sectie]) VALUES (6000, N'Terapie Intensiva')
INSERT [dbo].[_Sectie] ([id_sectie], [nume_sectie]) VALUES (7000, N'Urgente')
INSERT [dbo].[_Sectie] ([id_sectie], [nume_sectie]) VALUES (8000, N'Maternitate')
INSERT [dbo].[_Sectie] ([id_sectie], [nume_sectie]) VALUES (9000, N'Psihiatrie')
INSERT [dbo].[Equipment] ([Serial_no], [Description], [Cost], [Room_number]) VALUES (N'E001      ', N'Aparat Respiratoriu', 5000, 2002)
INSERT [dbo].[Equipment] ([Serial_no], [Description], [Cost], [Room_number]) VALUES (N'E002      ', N'RMN', 2000, 2000)
INSERT [dbo].[Equipment] ([Serial_no], [Description], [Cost], [Room_number]) VALUES (N'E003      ', N'Raze X', 500, 2001)
INSERT [dbo].[Equipment] ([Serial_no], [Description], [Cost], [Room_number]) VALUES (N'E004      ', N'Aparat Ventilatie Aer', 1000, 2001)
INSERT [dbo].[Equipment] ([Serial_no], [Description], [Cost], [Room_number]) VALUES (N'E005      ', N'Aparat Control Puls', 50, 2000)
INSERT [dbo].[Equipment] ([Serial_no], [Description], [Cost], [Room_number]) VALUES (N'E006      ', N'Aparat Control Inima', 900, 2003)
INSERT [dbo].[Equipment] ([Serial_no], [Description], [Cost], [Room_number]) VALUES (N'E007      ', N'Aparat Control Musculatura', 800, 2004)
INSERT [dbo].[Equipment] ([Serial_no], [Description], [Cost], [Room_number]) VALUES (N'E008      ', N'Aparat Masurat Temperatura', 60, 2005)
INSERT [dbo].[Equipment] ([Serial_no], [Description], [Cost], [Room_number]) VALUES (N'E009      ', N'Aparat Control Ritm Cardiac', 800, 2006)
INSERT [dbo].[Equipment] ([Serial_no], [Description], [Cost], [Room_number]) VALUES (N'E010      ', N'Aparat de Testare Sange', 600, 2007)
INSERT [dbo].[Equipment] ([Serial_no], [Description], [Cost], [Room_number]) VALUES (N'E011      ', N'Aparat de Testat Saliva', 40, 2008)
INSERT [dbo].[Equipment] ([Serial_no], [Description], [Cost], [Room_number]) VALUES (N'E012      ', N'Pensete, Cleme, Siringi', 50, 2009)
INSERT [dbo].[Equipment] ([Serial_no], [Description], [Cost], [Room_number]) VALUES (N'E013      ', N'Aparat Control Puls', 50, 2010)
INSERT [dbo].[Equipment] ([Serial_no], [Description], [Cost], [Room_number]) VALUES (N'E014      ', N'Aparat Control Puls', 50, 2011)
INSERT [dbo].[Equipment] ([Serial_no], [Description], [Cost], [Room_number]) VALUES (N'E015      ', N'Aparat Control Puls', 50, 2012)
INSERT [dbo].[Functii] ([id_functie], [nume_functie]) VALUES (1, N'Manager')
INSERT [dbo].[Functii] ([id_functie], [nume_functie]) VALUES (2, N'Medic')
INSERT [dbo].[Functii] ([id_functie], [nume_functie]) VALUES (3, N'Asistenta')
INSERT [dbo].[Functii] ([id_functie], [nume_functie]) VALUES (4, N'Infirmiera')
INSERT [dbo].[Room] ([Room_number], [Type], [Num_beds]) VALUES (2000, N'Privat', 5)
INSERT [dbo].[Room] ([Room_number], [Type], [Num_beds]) VALUES (2001, N'Semi-Privat', 8)
INSERT [dbo].[Room] ([Room_number], [Type], [Num_beds]) VALUES (2002, N'Inchis', 1)
INSERT [dbo].[Room] ([Room_number], [Type], [Num_beds]) VALUES (2003, N'Privat', 3)
INSERT [dbo].[Room] ([Room_number], [Type], [Num_beds]) VALUES (2004, N'Privat', 2)
INSERT [dbo].[Room] ([Room_number], [Type], [Num_beds]) VALUES (2005, N'Semi-Privat', 7)
INSERT [dbo].[Room] ([Room_number], [Type], [Num_beds]) VALUES (2006, N'Deschis', 10)
INSERT [dbo].[Room] ([Room_number], [Type], [Num_beds]) VALUES (2007, N'Inchis', 1)
INSERT [dbo].[Room] ([Room_number], [Type], [Num_beds]) VALUES (2008, N'Privat', 3)
INSERT [dbo].[Room] ([Room_number], [Type], [Num_beds]) VALUES (2009, N'Privat', 2)
INSERT [dbo].[Room] ([Room_number], [Type], [Num_beds]) VALUES (2010, N'Inchis', 1)
INSERT [dbo].[Room] ([Room_number], [Type], [Num_beds]) VALUES (2011, N'Semi-Privat', 6)
INSERT [dbo].[Room] ([Room_number], [Type], [Num_beds]) VALUES (2012, N'Deschis', 9)
INSERT [dbo].[Room] ([Room_number], [Type], [Num_beds]) VALUES (2013, N'Deschis', 9)
INSERT [dbo].[Room] ([Room_number], [Type], [Num_beds]) VALUES (2014, N'Deschis', 9)
INSERT [dbo].[Room] ([Room_number], [Type], [Num_beds]) VALUES (2015, N'Privat', 3)
INSERT [dbo].[Room] ([Room_number], [Type], [Num_beds]) VALUES (2016, N'Privat', 4)
INSERT [dbo].[Room] ([Room_number], [Type], [Num_beds]) VALUES (2017, N'Privat', 4)
INSERT [dbo].[Room] ([Room_number], [Type], [Num_beds]) VALUES (2018, N'Semi-Privat', 7)
INSERT [dbo].[Room] ([Room_number], [Type], [Num_beds]) VALUES (2019, N'Semi-Privat', 9)
INSERT [dbo].[Room] ([Room_number], [Type], [Num_beds]) VALUES (2020, N'Inchis', 1)
ALTER TABLE [dbo].[_Factura]  WITH CHECK ADD  CONSTRAINT [FK__Factura__Pacient] FOREIGN KEY([Patient_id])
REFERENCES [dbo].[_Pacient] ([Patient_id])
GO
ALTER TABLE [dbo].[_Factura] CHECK CONSTRAINT [FK__Factura__Pacient]
GO
ALTER TABLE [dbo].[_Pacient]  WITH CHECK ADD  CONSTRAINT [FK__Pacient__Personal] FOREIGN KEY([id_personal])
REFERENCES [dbo].[_Personal] ([id_personal])
GO
ALTER TABLE [dbo].[_Pacient] CHECK CONSTRAINT [FK__Pacient__Personal]
GO
ALTER TABLE [dbo].[_Pacient]  WITH CHECK ADD  CONSTRAINT [FK__Pacient_Room] FOREIGN KEY([Room_number])
REFERENCES [dbo].[Room] ([Room_number])
GO
ALTER TABLE [dbo].[_Pacient] CHECK CONSTRAINT [FK__Pacient_Room]
GO
ALTER TABLE [dbo].[_Personal]  WITH CHECK ADD  CONSTRAINT [FK__Personal__Sectie] FOREIGN KEY([id_sectie])
REFERENCES [dbo].[_Sectie] ([id_sectie])
GO
ALTER TABLE [dbo].[_Personal] CHECK CONSTRAINT [FK__Personal__Sectie]
GO
ALTER TABLE [dbo].[_Personal]  WITH CHECK ADD  CONSTRAINT [FK__Personal_Functii] FOREIGN KEY([id_functie])
REFERENCES [dbo].[Functii] ([id_functie])
GO
ALTER TABLE [dbo].[_Personal] CHECK CONSTRAINT [FK__Personal_Functii]
GO
ALTER TABLE [dbo].[Equipment]  WITH CHECK ADD  CONSTRAINT [FK_Equipment_Room] FOREIGN KEY([Room_number])
REFERENCES [dbo].[Room] ([Room_number])
GO
ALTER TABLE [dbo].[Equipment] CHECK CONSTRAINT [FK_Equipment_Room]
GO
USE [master]
GO
ALTER DATABASE [Hospital] SET  READ_WRITE 
GO
