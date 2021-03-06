USE [master]
GO
/****** Object:  Database [ProjectWebDB]    Script Date: 03/24/2020 11:43:29 PM ******/
CREATE DATABASE [ProjectWebDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProjectWebDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.TS\MSSQL\DATA\ProjectWebDB.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ProjectWebDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.TS\MSSQL\DATA\ProjectWebDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ProjectWebDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProjectWebDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProjectWebDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProjectWebDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProjectWebDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProjectWebDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProjectWebDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProjectWebDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProjectWebDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProjectWebDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProjectWebDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProjectWebDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProjectWebDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProjectWebDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProjectWebDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProjectWebDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProjectWebDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProjectWebDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProjectWebDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProjectWebDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProjectWebDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProjectWebDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProjectWebDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProjectWebDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProjectWebDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProjectWebDB] SET  MULTI_USER 
GO
ALTER DATABASE [ProjectWebDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProjectWebDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProjectWebDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProjectWebDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ProjectWebDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ProjectWebDB]
GO
/****** Object:  Table [dbo].[tblBook]    Script Date: 03/24/2020 11:43:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBook](
	[bookID] [int] NOT NULL,
	[title] [nvarchar](50) NULL,
	[price] [float] NULL,
 CONSTRAINT [PK_tblItem] PRIMARY KEY CLUSTERED 
(
	[bookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblCart]    Script Date: 03/24/2020 11:43:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCart](
	[cartID] [int] NOT NULL,
	[username] [varchar](20) NOT NULL,
	[total] [float] NULL,
 CONSTRAINT [PK_tblCart] PRIMARY KEY CLUSTERED 
(
	[cartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblCartDetail]    Script Date: 03/24/2020 11:43:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCartDetail](
	[cartID] [int] NOT NULL,
	[bookID] [int] NOT NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_tblCartDetail] PRIMARY KEY CLUSTERED 
(
	[cartID] ASC,
	[bookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 03/24/2020 11:43:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUser](
	[username] [varchar](20) NOT NULL,
	[password] [varchar](30) NULL,
	[lastname] [nvarchar](250) NULL,
	[isAdmin] [bit] NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tblBook] ([bookID], [title], [price]) VALUES (1, N'Java', 10000)
INSERT [dbo].[tblBook] ([bookID], [title], [price]) VALUES (2, N'JDK', 12000)
INSERT [dbo].[tblBook] ([bookID], [title], [price]) VALUES (3, N'Tomcat', 15000)
INSERT [dbo].[tblBook] ([bookID], [title], [price]) VALUES (4, N'Netbeans', 17000)
INSERT [dbo].[tblBook] ([bookID], [title], [price]) VALUES (5, N'Servlet', 20000)
INSERT [dbo].[tblBook] ([bookID], [title], [price]) VALUES (6, N'JSP', 22000)
INSERT [dbo].[tblBook] ([bookID], [title], [price]) VALUES (7, N'JavaBeans', 25000)
INSERT [dbo].[tblCart] ([cartID], [username], [total]) VALUES (1, N'cus1', 22000)
INSERT [dbo].[tblCart] ([cartID], [username], [total]) VALUES (2, N'cus1', 20000)
INSERT [dbo].[tblCart] ([cartID], [username], [total]) VALUES (3, N'customer2', 141000)
INSERT [dbo].[tblCartDetail] ([cartID], [bookID], [quantity]) VALUES (1, 1, 1)
INSERT [dbo].[tblCartDetail] ([cartID], [bookID], [quantity]) VALUES (1, 2, 1)
INSERT [dbo].[tblCartDetail] ([cartID], [bookID], [quantity]) VALUES (2, 1, 2)
INSERT [dbo].[tblCartDetail] ([cartID], [bookID], [quantity]) VALUES (3, 1, 3)
INSERT [dbo].[tblCartDetail] ([cartID], [bookID], [quantity]) VALUES (3, 2, 1)
INSERT [dbo].[tblCartDetail] ([cartID], [bookID], [quantity]) VALUES (3, 3, 1)
INSERT [dbo].[tblCartDetail] ([cartID], [bookID], [quantity]) VALUES (3, 4, 1)
INSERT [dbo].[tblCartDetail] ([cartID], [bookID], [quantity]) VALUES (3, 5, 1)
INSERT [dbo].[tblCartDetail] ([cartID], [bookID], [quantity]) VALUES (3, 6, 1)
INSERT [dbo].[tblCartDetail] ([cartID], [bookID], [quantity]) VALUES (3, 7, 1)
INSERT [dbo].[tblUser] ([username], [password], [lastname], [isAdmin]) VALUES (N'admin1', N'1', N'Admin 1', 1)
INSERT [dbo].[tblUser] ([username], [password], [lastname], [isAdmin]) VALUES (N'admin2', N'123', N'Admin 2', 1)
INSERT [dbo].[tblUser] ([username], [password], [lastname], [isAdmin]) VALUES (N'cus1', N'1', N'Customer 1', 0)
INSERT [dbo].[tblUser] ([username], [password], [lastname], [isAdmin]) VALUES (N'customer2', N'1', N'Customer 2', 0)
ALTER TABLE [dbo].[tblCart]  WITH CHECK ADD  CONSTRAINT [FK_tblCart_tblUser] FOREIGN KEY([username])
REFERENCES [dbo].[tblUser] ([username])
GO
ALTER TABLE [dbo].[tblCart] CHECK CONSTRAINT [FK_tblCart_tblUser]
GO
ALTER TABLE [dbo].[tblCartDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblCartDetail_tblBook] FOREIGN KEY([bookID])
REFERENCES [dbo].[tblBook] ([bookID])
GO
ALTER TABLE [dbo].[tblCartDetail] CHECK CONSTRAINT [FK_tblCartDetail_tblBook]
GO
ALTER TABLE [dbo].[tblCartDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblCartDetail_tblCart] FOREIGN KEY([cartID])
REFERENCES [dbo].[tblCart] ([cartID])
GO
ALTER TABLE [dbo].[tblCartDetail] CHECK CONSTRAINT [FK_tblCartDetail_tblCart]
GO
USE [master]
GO
ALTER DATABASE [ProjectWebDB] SET  READ_WRITE 
GO
