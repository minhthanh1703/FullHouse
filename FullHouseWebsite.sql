USE [master]
GO
/****** Object:  Database [FullHouse]    Script Date: 3/24/2019 2:42:25 PM ******/
CREATE DATABASE [FullHouse]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FullHouse', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.CODE\MSSQL\DATA\FullHouse.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FullHouse_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.CODE\MSSQL\DATA\FullHouse_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [FullHouse] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FullHouse].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FullHouse] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FullHouse] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FullHouse] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FullHouse] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FullHouse] SET ARITHABORT OFF 
GO
ALTER DATABASE [FullHouse] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FullHouse] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [FullHouse] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FullHouse] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FullHouse] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FullHouse] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FullHouse] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FullHouse] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FullHouse] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FullHouse] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FullHouse] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FullHouse] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FullHouse] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FullHouse] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FullHouse] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FullHouse] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FullHouse] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FullHouse] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FullHouse] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FullHouse] SET  MULTI_USER 
GO
ALTER DATABASE [FullHouse] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FullHouse] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FullHouse] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FullHouse] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [FullHouse]
GO
/****** Object:  StoredProcedure [dbo].[search_District_Area]    Script Date: 3/24/2019 2:42:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[search_District_Area]
@districtID int,
@areaID int
as 
begin
select district.districtName,area.areaName,house.houseID,house.price,house.roomNumber,house.acreage,house.houseStreet, house.floor, house.furniture, house.houseNumber from 
 tbl_District as district, tbl_Area as area, tbl_House as house where district.districtID = @districtID and area.areaID = @areaID
 and area.areaID = house.areaID and house.rentStatus = 0
 end
GO
/****** Object:  StoredProcedure [dbo].[search_District_Area_Price]    Script Date: 3/24/2019 2:42:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[search_District_Area_Price]
@districtID int,
@areaID int,
@PriceFrom float,
@PriceTo float
as 
begin
select district.districtName,area.areaName,house.houseID,house.price,house.roomNumber,house.acreage,house.houseStreet,house.floor, house.furniture, house.houseNumber from 
 tbl_District as district, tbl_Area as area, tbl_House as house where district.districtID = @districtID and area.areaID = @areaID
 and area.areaID = house.areaID and house.rentStatus = 0 and house.price between @PriceFrom and @PriceTo
 end
GO
/****** Object:  StoredProcedure [dbo].[search_District_Area_PriceFrom]    Script Date: 3/24/2019 2:42:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[search_District_Area_PriceFrom]
@districtID int,
@areaID int,
@PriceFrom float
as 
begin
select district.districtName,area.areaName,house.houseID,house.price,house.roomNumber,house.acreage,house.houseStreet,house.floor, house.furniture, house.houseNumber from 
 tbl_District as district, tbl_Area as area, tbl_House as house where district.districtID = @districtID and area.areaID = @areaID
 and area.areaID = house.areaID and house.rentStatus = 0 and house.price >= @PriceFrom
 end
GO
/****** Object:  StoredProcedure [dbo].[search_District_Area_PriceTo]    Script Date: 3/24/2019 2:42:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[search_District_Area_PriceTo]
@districtID int,
@areaID int,
@PriceTo float
as 
begin
select district.districtName,area.areaName,house.houseID,house.price,house.roomNumber,house.acreage,house.houseStreet,house.floor, house.furniture, house.houseNumber from 
 tbl_District as district, tbl_Area as area, tbl_House as house where district.districtID = @districtID and area.areaID = @areaID
 and area.areaID = house.areaID and house.rentStatus = 0 and house.price <= @PriceTo
 end
GO
/****** Object:  StoredProcedure [dbo].[search_Price]    Script Date: 3/24/2019 2:42:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[search_Price]
@PriceFrom float,
@PriceTo float
as 
begin
select district.districtName,area.areaName,house.houseID,house.price,house.roomNumber,house.acreage,house.houseStreet,house.floor, house.furniture, house.houseNumber from 
 tbl_District as district, tbl_Area as area, tbl_House as house where district.districtID = area.districtID 
 and area.areaID = house.areaID and house.rentStatus = 0 and house.price between @PriceFrom and @PriceTo
 end
GO
/****** Object:  StoredProcedure [dbo].[search_PriceFrom]    Script Date: 3/24/2019 2:42:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE proc [dbo].[search_PriceFrom]
@PriceFrom float
as 
begin
select district.districtName,area.areaName,house.houseID,house.price,house.roomNumber,house.acreage,house.houseStreet,house.floor, house.furniture, house.houseNumber from 
 tbl_District as district, tbl_Area as area, tbl_House as house where district.districtID = area.districtID 
 and area.areaID = house.areaID and house.rentStatus = 0 and house.price >= @PriceFrom
 end
GO
/****** Object:  StoredProcedure [dbo].[search_PriceTo]    Script Date: 3/24/2019 2:42:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE proc [dbo].[search_PriceTo]
@PriceTo float
as 
begin
select district.districtName,area.areaName,house.houseID,house.price,house.roomNumber,house.acreage,house.houseStreet,house.floor, house.furniture, house.houseNumber from 
 tbl_District as district, tbl_Area as area, tbl_House as house where district.districtID = area.districtID 
 and area.areaID = house.areaID and house.rentStatus = 0 and house.price <= @PriceTo
 end
GO
/****** Object:  Table [dbo].[tbl_Admin]    Script Date: 3/24/2019 2:42:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Admin](
	[emailAdmin] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NULL,
	[fullname] [nvarchar](50) NULL,
	[phoneNumber] [nvarchar](20) NULL,
	[bankNumber] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_Admin] PRIMARY KEY CLUSTERED 
(
	[emailAdmin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Area]    Script Date: 3/24/2019 2:42:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Area](
	[areaID] [int] IDENTITY(1,1) NOT NULL,
	[areaName] [nvarchar](50) NULL,
	[districtID] [int] NULL,
 CONSTRAINT [PK_tbl_Area] PRIMARY KEY CLUSTERED 
(
	[areaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Customer]    Script Date: 3/24/2019 2:42:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Customer](
	[customerID] [int] IDENTITY(1,1) NOT NULL,
	[fullname] [nvarchar](50) NULL,
	[phoneNumber] [nvarchar](20) NULL,
	[emailCustomer] [nvarchar](50) NULL,
	[message] [nvarchar](max) NULL,
	[emailAdmin] [nvarchar](50) NULL,
	[readStatus] [bit] NOT NULL,
	[houseID] [int] NOT NULL,
	[date] [date] NOT NULL,
 CONSTRAINT [PK_tbl_Customer] PRIMARY KEY CLUSTERED 
(
	[customerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_District]    Script Date: 3/24/2019 2:42:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_District](
	[districtID] [int] IDENTITY(1,1) NOT NULL,
	[districtName] [nvarchar](50) NULL,
	[image] [nvarchar](100) NULL,
	[details] [nvarchar](max) NULL,
 CONSTRAINT [PK_tbl_District] PRIMARY KEY CLUSTERED 
(
	[districtID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_House]    Script Date: 3/24/2019 2:42:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_House](
	[houseID] [int] IDENTITY(1,1) NOT NULL,
	[emailAdmin] [nvarchar](50) NULL,
	[price] [float] NULL,
	[roomNumber] [int] NULL,
	[furniture] [bit] NULL,
	[acreage] [float] NULL,
	[floor] [int] NULL,
	[rentStatus] [bit] NULL,
	[areaID] [int] NULL,
	[houseNumber] [nvarchar](10) NULL,
	[houseStreet] [nvarchar](20) NULL,
	[otherDetails] [nvarchar](max) NULL,
 CONSTRAINT [PK_tbl_House] PRIMARY KEY CLUSTERED 
(
	[houseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Image]    Script Date: 3/24/2019 2:42:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Image](
	[imageID] [int] IDENTITY(1,1) NOT NULL,
	[url] [nvarchar](50) NULL,
	[houseID] [int] NULL,
 CONSTRAINT [PK_tbl_Image] PRIMARY KEY CLUSTERED 
(
	[imageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[tbl_Admin] ([emailAdmin], [password], [fullname], [phoneNumber], [bankNumber]) VALUES (N'dasdsa@gmail.com.vn', N'123456', N'Duy', N'1684122720', N'1234567890')
INSERT [dbo].[tbl_Admin] ([emailAdmin], [password], [fullname], [phoneNumber], [bankNumber]) VALUES (N'duy1@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Đức Duy 1', N'1684122720', N'1234567890')
INSERT [dbo].[tbl_Admin] ([emailAdmin], [password], [fullname], [phoneNumber], [bankNumber]) VALUES (N'duy10@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Đức Duy 10', N'1684122720', N'1234567890')
INSERT [dbo].[tbl_Admin] ([emailAdmin], [password], [fullname], [phoneNumber], [bankNumber]) VALUES (N'duy2@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Đức Duy 2', N'1684122720', N'1234567890')
INSERT [dbo].[tbl_Admin] ([emailAdmin], [password], [fullname], [phoneNumber], [bankNumber]) VALUES (N'duy3@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Đức Duy 3', N'1684122720', N'1234567890')
INSERT [dbo].[tbl_Admin] ([emailAdmin], [password], [fullname], [phoneNumber], [bankNumber]) VALUES (N'duy4@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Đức Duy 4', N'1684122720', N'1234567890')
INSERT [dbo].[tbl_Admin] ([emailAdmin], [password], [fullname], [phoneNumber], [bankNumber]) VALUES (N'duy5@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Đức Duy 5', N'1684122720', N'1234567890')
INSERT [dbo].[tbl_Admin] ([emailAdmin], [password], [fullname], [phoneNumber], [bankNumber]) VALUES (N'duy6@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Đức Duy 6', N'1684122720', N'1234567890')
INSERT [dbo].[tbl_Admin] ([emailAdmin], [password], [fullname], [phoneNumber], [bankNumber]) VALUES (N'duy7@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Đức Duy 7', N'1684122720', N'1234567890')
INSERT [dbo].[tbl_Admin] ([emailAdmin], [password], [fullname], [phoneNumber], [bankNumber]) VALUES (N'duy8@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Đức Duy 8', N'1684122720', N'1234567890')
INSERT [dbo].[tbl_Admin] ([emailAdmin], [password], [fullname], [phoneNumber], [bankNumber]) VALUES (N'duy9@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Đức Duy 9', N'1684122720', N'1234567890')
INSERT [dbo].[tbl_Admin] ([emailAdmin], [password], [fullname], [phoneNumber], [bankNumber]) VALUES (N'duydd@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Dương Đức Duy', N'1684122720', N'0720980007621921')
INSERT [dbo].[tbl_Admin] ([emailAdmin], [password], [fullname], [phoneNumber], [bankNumber]) VALUES (N'duyduc@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Duy', N'1684122720', N'1234567890')
INSERT [dbo].[tbl_Admin] ([emailAdmin], [password], [fullname], [phoneNumber], [bankNumber]) VALUES (N'duyhaha@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Duy', N'1684122720', N'1234567890')
INSERT [dbo].[tbl_Admin] ([emailAdmin], [password], [fullname], [phoneNumber], [bankNumber]) VALUES (N'khanh1@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Văn Khánh', N'1684122720', N'1234567890')
INSERT [dbo].[tbl_Admin] ([emailAdmin], [password], [fullname], [phoneNumber], [bankNumber]) VALUES (N'khanh10@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Văn Khánh', N'1684122720', N'1234567890')
INSERT [dbo].[tbl_Admin] ([emailAdmin], [password], [fullname], [phoneNumber], [bankNumber]) VALUES (N'khanh2@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Văn Khánh', N'1684122720', N'1234567890')
INSERT [dbo].[tbl_Admin] ([emailAdmin], [password], [fullname], [phoneNumber], [bankNumber]) VALUES (N'khanh3@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Văn Khánh', N'1684122720', N'1234567890')
INSERT [dbo].[tbl_Admin] ([emailAdmin], [password], [fullname], [phoneNumber], [bankNumber]) VALUES (N'khanh4@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Văn Khánh', N'1684122720', N'1234567890')
INSERT [dbo].[tbl_Admin] ([emailAdmin], [password], [fullname], [phoneNumber], [bankNumber]) VALUES (N'khanh5@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Văn Khánh', N'1684122720', N'1234567890')
INSERT [dbo].[tbl_Admin] ([emailAdmin], [password], [fullname], [phoneNumber], [bankNumber]) VALUES (N'khanh6@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Văn Khánh', N'1684122720', N'1234567890')
INSERT [dbo].[tbl_Admin] ([emailAdmin], [password], [fullname], [phoneNumber], [bankNumber]) VALUES (N'khanh7@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Văn Khánh', N'1684122720', N'1234567890')
INSERT [dbo].[tbl_Admin] ([emailAdmin], [password], [fullname], [phoneNumber], [bankNumber]) VALUES (N'khanh8@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Văn Khánh', N'1684122720', N'1234567890')
INSERT [dbo].[tbl_Admin] ([emailAdmin], [password], [fullname], [phoneNumber], [bankNumber]) VALUES (N'khanh9@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Văn Khánh', N'1684122720', N'1234567890')
INSERT [dbo].[tbl_Admin] ([emailAdmin], [password], [fullname], [phoneNumber], [bankNumber]) VALUES (N'khoi1@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Văn Khôi', N'1684122720', N'1234567890')
INSERT [dbo].[tbl_Admin] ([emailAdmin], [password], [fullname], [phoneNumber], [bankNumber]) VALUES (N'khoi10@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Văn Khôi', N'1684122720', N'1234567890')
INSERT [dbo].[tbl_Admin] ([emailAdmin], [password], [fullname], [phoneNumber], [bankNumber]) VALUES (N'khoi2@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Văn Khôi', N'1684122720', N'1234567890')
INSERT [dbo].[tbl_Admin] ([emailAdmin], [password], [fullname], [phoneNumber], [bankNumber]) VALUES (N'khoi3@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Văn Khôi', N'1684122720', N'1234567890')
INSERT [dbo].[tbl_Admin] ([emailAdmin], [password], [fullname], [phoneNumber], [bankNumber]) VALUES (N'khoi4@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Văn Khôi', N'1684122720', N'1234567890')
INSERT [dbo].[tbl_Admin] ([emailAdmin], [password], [fullname], [phoneNumber], [bankNumber]) VALUES (N'khoi5@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Văn Khôi', N'1684122720', N'1234567890')
INSERT [dbo].[tbl_Admin] ([emailAdmin], [password], [fullname], [phoneNumber], [bankNumber]) VALUES (N'khoi6@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Văn Khôi', N'1684122720', N'1234567890')
INSERT [dbo].[tbl_Admin] ([emailAdmin], [password], [fullname], [phoneNumber], [bankNumber]) VALUES (N'khoi7@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Văn Khôi', N'1684122720', N'1234567890')
INSERT [dbo].[tbl_Admin] ([emailAdmin], [password], [fullname], [phoneNumber], [bankNumber]) VALUES (N'khoi8@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Văn Khôi', N'1684122720', N'1234567890')
INSERT [dbo].[tbl_Admin] ([emailAdmin], [password], [fullname], [phoneNumber], [bankNumber]) VALUES (N'khoi9@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Văn Khôi', N'1684122720', N'1234567890')
INSERT [dbo].[tbl_Admin] ([emailAdmin], [password], [fullname], [phoneNumber], [bankNumber]) VALUES (N'minhthanh@gmail.com', N'123456', N'Thành mờ lờ', N'01684122720', N'1234567890')
INSERT [dbo].[tbl_Admin] ([emailAdmin], [password], [fullname], [phoneNumber], [bankNumber]) VALUES (N'nhan1@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Văn Khôi', N'1684122720', N'1234567890')
INSERT [dbo].[tbl_Admin] ([emailAdmin], [password], [fullname], [phoneNumber], [bankNumber]) VALUES (N'thanh1@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Minh Thành 1', N'1684122720', N'3211111332')
INSERT [dbo].[tbl_Admin] ([emailAdmin], [password], [fullname], [phoneNumber], [bankNumber]) VALUES (N'thanh10@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Thành 10', N'1684122720', N'1234567890345612')
INSERT [dbo].[tbl_Admin] ([emailAdmin], [password], [fullname], [phoneNumber], [bankNumber]) VALUES (N'thanh2@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Minh Thành 2', N'1684122720', N'1234567890')
INSERT [dbo].[tbl_Admin] ([emailAdmin], [password], [fullname], [phoneNumber], [bankNumber]) VALUES (N'thanh3@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Minh Thành 3', N'1684122720', N'1234567890')
INSERT [dbo].[tbl_Admin] ([emailAdmin], [password], [fullname], [phoneNumber], [bankNumber]) VALUES (N'thanh4@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Minh Thành 4', N'1684122720', N'1234567890')
INSERT [dbo].[tbl_Admin] ([emailAdmin], [password], [fullname], [phoneNumber], [bankNumber]) VALUES (N'thanh5@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Minh Thành 5', N'1684122720', N'1234567890')
INSERT [dbo].[tbl_Admin] ([emailAdmin], [password], [fullname], [phoneNumber], [bankNumber]) VALUES (N'thanh6@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Minh Thành 6', N'1684122720', N'1234567890')
INSERT [dbo].[tbl_Admin] ([emailAdmin], [password], [fullname], [phoneNumber], [bankNumber]) VALUES (N'thanh7@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Minh Thành 7', N'1684122720', N'1234567890')
INSERT [dbo].[tbl_Admin] ([emailAdmin], [password], [fullname], [phoneNumber], [bankNumber]) VALUES (N'thanh8@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Minh Thành 8', N'1684122720', N'1234567890')
INSERT [dbo].[tbl_Admin] ([emailAdmin], [password], [fullname], [phoneNumber], [bankNumber]) VALUES (N'thanh9@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Minh Thành 9', N'1684122720', N'1234567890')
SET IDENTITY_INSERT [dbo].[tbl_Area] ON 

INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (1, N'Tân Chánh Hiệp', 12)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (2, N'Tân Thới Hiệp', 12)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (3, N'An Phú Đông', 12)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (4, N'Hiệp Thành', 12)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (5, N'Đông Hưng', 12)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (6, N'Tân Thới Nhất', 12)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (7, N'Thạnh Lộc', 12)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (8, N'Thạnh Xuân', 12)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (9, N'Thới An', 12)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (10, N'Trung Mỹ Tây', 12)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (11, N'Tân Định', 1)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (12, N'Đa Kao', 1)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (13, N'Bến Nghé', 1)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (14, N'Bến Thành', 1)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (15, N'Nguyễn Cư Trinh', 1)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (16, N'Nguyễn Thái Bình', 1)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (17, N'Cầu Ông Lãnh', 1)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (18, N'Cầu Kho', 1)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (19, N'An Khánh', 2)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (20, N'An Lợi Đông', 2)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (21, N'An Phú', 2)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (22, N'Bình An', 2)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (23, N'Bình Hưng', 2)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (24, N'Bình Trưng Đông', 2)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (25, N'Bình Trưng Tây', 2)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (26, N'Cát Lái', 2)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (27, N'Thạch Mỹ Lợi', 2)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (28, N'Thảo Điền', 2)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (29, N'Thủ Thiêm', 2)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (30, N'Phường 1', 3)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (31, N'Phường 2', 3)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (32, N'Phường 3', 3)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (33, N'Phường 4', 3)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (34, N'Phường 5', 3)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (35, N'Phường 6', 3)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (36, N'Phường 7', 3)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (37, N'Phường 8', 3)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (38, N'Phường 9', 3)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (39, N'Phường 10', 3)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (40, N'Phường 11', 3)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (41, N'Phường 12', 3)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (42, N'Phường 13', 3)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (43, N'Phường 1', 4)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (44, N'Phường 2', 4)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (45, N'Phường 3', 4)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (46, N'Phường 4', 4)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (47, N'Phường 5', 4)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (48, N'Phường 6', 4)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (49, N'Phường 7', 4)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (50, N'Phường 8', 4)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (51, N'Phường 9', 4)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (52, N'Phường 10', 4)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (53, N'Phường 11', 4)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (54, N'Phường 12', 4)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (55, N'Phường 13', 4)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (56, N'Phường 14', 4)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (57, N'Phường 15', 4)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (58, N'Phường 16', 4)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (59, N'Phường 17', 4)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (60, N'Phường 18', 4)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (61, N'Phường 1', 5)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (62, N'Phường 2', 5)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (63, N'Phường 3', 5)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (64, N'Phường 4', 5)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (65, N'Phường 5', 5)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (66, N'Phường 6', 5)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (67, N'Phường 7', 5)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (68, N'Phường 8', 5)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (69, N'Phường 9', 5)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (70, N'Phường 10', 5)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (71, N'Phường 11', 5)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (72, N'Phường 12', 5)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (73, N'Phường 13', 5)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (74, N'Phường 14', 5)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (75, N'Phường 15', 5)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (76, N'Phường 1', 6)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (77, N'Phường 2', 6)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (78, N'Phường 3', 6)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (79, N'Phường 4', 6)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (80, N'Phường 5', 6)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (81, N'Phường 6', 6)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (82, N'Phường 7', 6)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (83, N'Phường 8', 6)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (84, N'Phường 9', 6)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (85, N'Phường 10', 6)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (86, N'Phường 11', 6)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (87, N'Phường 12', 6)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (88, N'Phường 13', 6)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (89, N'Phường 14', 6)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (90, N'Bình Thuận', 7)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (91, N'Phú Mỹ', 7)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (92, N'Phú Thuận', 7)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (93, N'Tân Hưng', 7)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (94, N'Tân Kiểng', 7)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (95, N'Tân Phong', 7)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (96, N'Tân Phú', 7)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (97, N'Tân Quy', 7)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (98, N'Tân Thuận Đông', 7)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (99, N'Tân Thuận Tây', 7)
GO
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (100, N'Phường 1', 8)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (101, N'Phường 2', 8)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (102, N'Phường 3', 8)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (103, N'Phường 4', 8)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (104, N'Phường 5', 8)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (105, N'Phường 6', 8)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (106, N'Phường 7', 8)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (107, N'Phường 8', 8)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (108, N'Phường 9', 8)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (109, N'Phường 10', 8)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (110, N'Phường 11', 8)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (111, N'Phường 12', 8)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (112, N'Phường 13', 8)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (113, N'Phường 14', 8)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (114, N'Phường 15', 8)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (115, N'Phường 16', 8)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (116, N'Phường 17', 8)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (117, N'Phường 18', 8)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (118, N'Phường 1', 9)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (119, N'Phường 2', 9)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (120, N'Phường 3', 9)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (121, N'Phường 4', 9)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (122, N'Phường 5', 9)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (123, N'Phường 6', 9)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (124, N'Phường 7', 9)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (125, N'Phường 8', 9)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (126, N'Phường 9', 9)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (127, N'Phường 10', 9)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (128, N'Phường 1', 10)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (129, N'Phường 2', 10)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (130, N'Phường 3', 10)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (131, N'Phường 4', 10)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (132, N'Phường 5', 10)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (133, N'Phường 6', 10)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (134, N'Phường 7', 10)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (135, N'Phường 8', 10)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (136, N'Phường 9', 10)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (137, N'Phường 10', 10)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (138, N'Phường 11', 10)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (139, N'Phường 12', 10)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (140, N'Phường 13', 10)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (141, N'Phường 14', 10)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (142, N'Phường 15', 10)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (143, N'Bình Chiểu', 11)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (144, N'Bình Thọ', 11)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (145, N'Hiệp Bình Chánh', 11)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (146, N'Hiệp Bình Phước', 11)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (147, N'Linh Chiểu', 11)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (148, N'Linh Đông', 11)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (149, N'Linh Tây', 11)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (150, N'Linh Trung', 11)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (151, N'Linh Xuân', 11)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (152, N'Tam Bình', 11)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (153, N'Tam Phú', 11)
INSERT [dbo].[tbl_Area] ([areaID], [areaName], [districtID]) VALUES (154, N'Trường Thọ', 11)
SET IDENTITY_INSERT [dbo].[tbl_Area] OFF
SET IDENTITY_INSERT [dbo].[tbl_Customer] ON 

INSERT [dbo].[tbl_Customer] ([customerID], [fullname], [phoneNumber], [emailCustomer], [message], [emailAdmin], [readStatus], [houseID], [date]) VALUES (1, N'Minh Thành', N'0168412272', N'thanh@gmail.com', N'Tôi tìm thấy nhà của bạn trên FullHouse, xin hãy liên lạc lại với tôi', N'duydd@gmail.com', 1, 3, CAST(N'2019-03-17' AS Date))
INSERT [dbo].[tbl_Customer] ([customerID], [fullname], [phoneNumber], [emailCustomer], [message], [emailAdmin], [readStatus], [houseID], [date]) VALUES (2, N'Duy', N'0168412272', N'duongducduy@gmail.com', N'Tôi tìm thấy nhà của bạn trên FullHouse, xin hãy liên lạc lại với tôi.', N'duydd@gmail.com', 1, 6, CAST(N'2019-03-17' AS Date))
INSERT [dbo].[tbl_Customer] ([customerID], [fullname], [phoneNumber], [emailCustomer], [message], [emailAdmin], [readStatus], [houseID], [date]) VALUES (3, N'Khôi', N'0168412272', N'khoi@gmail.com', N'Tôi tìm thấy nhà của bạn trên FullHouse, xin hãy liên lạc lại với tôi.', N'duydd@gmail.com', 1, 9, CAST(N'2019-03-16' AS Date))
INSERT [dbo].[tbl_Customer] ([customerID], [fullname], [phoneNumber], [emailCustomer], [message], [emailAdmin], [readStatus], [houseID], [date]) VALUES (4, N'Khánh', N'0168412272', N'khanh@gmail.com', N'Tôi tìm thấy nhà của bạn trên FullHouse, xin hãy liên lạc lại với tôi.', N'duydd@gmail.com', 1, 6, CAST(N'2019-03-18' AS Date))
INSERT [dbo].[tbl_Customer] ([customerID], [fullname], [phoneNumber], [emailCustomer], [message], [emailAdmin], [readStatus], [houseID], [date]) VALUES (5, N'Khánh học GIỎI', N'0168412272', N'khanh@gmail.com', N'Tôi tìm thấy nhà của bạn trên FullHouse, xin hãy liên lạc lại với tôi.', N'duydd@gmail.com', 0, 5, CAST(N'2019-03-22' AS Date))
INSERT [dbo].[tbl_Customer] ([customerID], [fullname], [phoneNumber], [emailCustomer], [message], [emailAdmin], [readStatus], [houseID], [date]) VALUES (6, N'Trường', N'0168412272', N'duydd@gmail.com', N'Tôi tìm thấy nhà của bạn trên FullHouse, xin hãy liên lạc lại với tôi.', N'duydd@gmail.com', 1, 14, CAST(N'2019-03-22' AS Date))
INSERT [dbo].[tbl_Customer] ([customerID], [fullname], [phoneNumber], [emailCustomer], [message], [emailAdmin], [readStatus], [houseID], [date]) VALUES (7, N'Minh Thành', N'0168412272', N'thanh@gmail.com', N'Tôi tìm thấy nhà của bạn trên FullHouse, xin hãy liên lạc lại với tôi.', N'thanh2@gmail.com', 1, 637, CAST(N'2019-03-24' AS Date))
INSERT [dbo].[tbl_Customer] ([customerID], [fullname], [phoneNumber], [emailCustomer], [message], [emailAdmin], [readStatus], [houseID], [date]) VALUES (8, N'Khôi', N'0168412272', N'thanh@gmail.com', N'Tôi tìm thấy nhà của bạn trên FullHouse, xin hãy liên lạc lại với tôi.', N'thanh3@gmail.com', 1, 648, CAST(N'2019-03-24' AS Date))
SET IDENTITY_INSERT [dbo].[tbl_Customer] OFF
SET IDENTITY_INSERT [dbo].[tbl_District] ON 

INSERT [dbo].[tbl_District] ([districtID], [districtName], [image], [details]) VALUES (1, N'Quận 1', N'quan_1.jpg', N'Quận 1 được xem là nơi sầm uất và có mức sống cao nhất của Thành phố về mọi phương diện.Có nhiều cơ quan chính quyền, các Lãnh sự.')
INSERT [dbo].[tbl_District] ([districtID], [districtName], [image], [details]) VALUES (2, N'Quận 2', N'quan_2.jpg', N'Quận 2 là quận ít dân nhất thành phố, nhưng trong tương lai, dân số của quận có thể vượt mức 400 ngàn khi khu đô thị Thủ Thiêm làm xong.')
INSERT [dbo].[tbl_District] ([districtID], [districtName], [image], [details]) VALUES (3, N'Quận 3', N'quan_3.jpg', N'Quận 3 là một quận nội thành của Thành phố Hồ Chí Minh, là một trong các quận trung tâm và cũng thuộc khu vực Sài Gòn, Bến Nghé trước đây.')
INSERT [dbo].[tbl_District] ([districtID], [districtName], [image], [details]) VALUES (4, N'Quận 4', N'quan_4.jpg', N'Quận 4 là một quận nằm ở giữa quận 1 và quận 7 Thành phố Hồ Chí Minh. Thuận tiện trong việc đi lại giữa các quận trong nội thành.')
INSERT [dbo].[tbl_District] ([districtID], [districtName], [image], [details]) VALUES (5, N'Quận 5', N'quan_5.jpg', N'Quận 5 là 1 quận nội thành của tp HCM, ! phân khu Chợ Lớn khu trung tâm thương mại lớn nhất của người Hoa ở Việt Nam.tọa lạc ở đây')
INSERT [dbo].[tbl_District] ([districtID], [districtName], [image], [details]) VALUES (6, N'Quận 6', N'quan_6.jpg', N'Quận 6 một quận nội thành. Quận có Chợ Lớn, đây được xem một khu trung tâm thương mại lớn nhất của người Hoa ở Việt Nam.')
INSERT [dbo].[tbl_District] ([districtID], [districtName], [image], [details]) VALUES (7, N'Quận 7', N'quan_7.jpg', N'Quận 7 nổi tiếng với khu chế xuất Tân Thuận, công viên giải trí Wonderland và Khu đô thị mới Phú Mỹ Hưng (Khu đô thị Nam Sài Gòn)

')
INSERT [dbo].[tbl_District] ([districtID], [districtName], [image], [details]) VALUES (8, N'Quận Bình Thạnh', N'quan_binhthanh.jpg', N'Quận Bình Thạnh là điểm đầu mối giữa quốc lộ 1A và 13, nơi có Bến xe Miền Đông; là cửa ngõ con tuyến Đường sắt Bắc-Nam vào thành phố.')
INSERT [dbo].[tbl_District] ([districtID], [districtName], [image], [details]) VALUES (9, N'Quận Phú Nhuận', N'quan_phunhuan.jpg', N'Quận nằm về hướng Tây Bắc, cách trung tâm thành phố 4,7km, được xem là quận cửa ngõ ra vào phía Bắc của khu trung tâm Thành phố Hồ Chí Minh.')
INSERT [dbo].[tbl_District] ([districtID], [districtName], [image], [details]) VALUES (10, N'Quận Tân Bình', N'quan_tanbinh.jpg', N'Quận Tân Bình có địa lý bằng phẳng, cao trung bình là 4–5 m, cao nhất là khu sân bay khoảng 8 – 9 m,còn có kênh rạch và còn đất nông nghiệp.')
INSERT [dbo].[tbl_District] ([districtID], [districtName], [image], [details]) VALUES (11, N'Quận Thủ Đức', N'quan_thuduc.jpg', N'Quận Thủ Đức là một quận cửa ngõ phía đông bắc Thành phố Hồ Chí Minh. Được chia thành ba quận mới là Quận 2, Quận 9 và Quận Thủ Đức.')
INSERT [dbo].[tbl_District] ([districtID], [districtName], [image], [details]) VALUES (12, N'Quận 12', N'quan_12.jpg', N'Quận 12 với nhiều địa điểm tham quan và cũng là địa điểm đặt trung tâm CNTT lớn nhất nước là Công viên Phần Mềm Quang Trung.')
SET IDENTITY_INSERT [dbo].[tbl_District] OFF
SET IDENTITY_INSERT [dbo].[tbl_House] ON 

INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (633, N'thanh1@gmail.com', 50000000, 2, 1, 100, 1, 0, 11, N'1/1', N'Phạm Ngũ Lão', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (634, N'thanh1@gmail.com', 6000000, 1, 0, 100, 1, 0, 11, N'2/10', N'Phạm Ngũ Lão', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ. Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu.')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (635, N'thanh1@gmail.com', 7000000, 2, 1, 80, 1, 0, 11, N'3/10', N'Phạm Ngũ Lão', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (636, N'thanh1@gmail.com', 10000000, 3, 0, 100, 3, 0, 11, N'4/11', N'Phạm Ngũ Lão', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (637, N'thanh2@gmail.com', 2000000, 1, 1, 60, 1, 0, 12, N'11/22', N'Phạm Ngọc Thạch', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (638, N'thanh2@gmail.com', 3000000, 1, 1, 80, 1, 0, 12, N'22/22', N'Nguyễn Chí Thanh', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (639, N'thanh2@gmail.com', 5000000, 2, 1, 90, 1, 0, 12, N'33/22', N'Nguyễn Chí Thanh', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (640, N'thanh2@gmail.com', 7000000, 3, 1, 100, 2, 0, 12, N'44/22', N'Lê Thánh Tôn', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (641, N'thanh3@gmail.com', 5000000, 1, 1, 100, 1, 0, 13, N'88/22', N'Lê Quang Định', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (642, N'thanh3@gmail.com', 6000000, 1, 0, 100, 3, 0, 13, N'99/22', N'Lê Quang Định', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (643, N'thanh3@gmail.com', 7000000, 2, 0, 100, 1, 0, 13, N'99/11', N'Lý Tự Trọng', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (644, N'thanh3@gmail.com', 8000000, 1, 1, 100, 1, 0, 13, N'11/33', N'Lý Tự Trọng', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (645, N'thanh3@gmail.com', 1000000, 3, 1, 150, 3, 0, 14, N'10/33', N'Âu Cơ', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (646, N'thanh3@gmail.com', 12000000, 4, 0, 250, 3, 0, 14, N'77/11', N'Hùng Vương', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (647, N'thanh3@gmail.com', 15000000, 4, 1, 300, 3, 0, 14, N'10/11', N'Lạc Long Quân', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (648, N'thanh3@gmail.com', 7000000, 3, 1, 120, 3, 0, 14, N'11/55', N'Lạc Long Quân', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (649, N'thanh4@gmail.com', 3000000, 1, 1, 100, 1, 0, 15, N'8/1', N'Nguyễn Kiệm', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (650, N'thanh4@gmail.com', 4000000, 1, 1, 100, 2, 0, 15, N'4/10', N'Quang Trung', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (651, N'thanh4@gmail.com', 5000000, 2, 1, 120, 1, 0, 15, N'44/123', N'Nguyễn Thị Minh Khai', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (652, N'thanh4@gmail.com', 8000000, 3, 1, 200, 2, 0, 15, N'123/456', N'Nguyễn Chí Thanh', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (653, N'thanh4@gmail.com', 8000000, 1, 1, 100, 2, 0, 16, N'456/123', N'Nguyễn Thị Minh Khai', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (654, N'thanh5@gmail.com', 5000000, 3, 1, 100, 3, 0, 17, N'1/1', N'Tô Yến Thành', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (655, N'thanh5@gmail.com', 7000000, 2, 1, 100, 1, 0, 17, N'2/2', N'Tô Yến Thành', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (656, N'thanh5@gmail.com', 8000000, 1, 1, 100, 3, 0, 17, N'3/3', N'Nguyễn Thái Học', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (657, N'thanh5@gmail.com', 10000000, 3, 1, 400, 3, 0, 17, N'4/4', N'Nguyễn Thị Minh Khai', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (658, N'thanh5@gmail.com', 2000000, 1, 1, 100, 1, 0, 19, N'1/2', N'Nguyễn Kiệm', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (659, N'thanh5@gmail.com', 3000000, 1, 1, 100, 3, 0, 19, N'4/5', N'Nguyễn Hiền', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (660, N'thanh5@gmail.com', 5000000, 2, 0, 110, 2, 0, 19, N'7/8', N'Nguyễn Trãi', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (661, N'thanh5@gmail.com', 8000000, 3, 1, 100, 1, 0, 19, N'11/55', N'Nguyễn Chi Phương', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (662, N'thanh6@gmail.com', 8000000, 2, 1, 120, 2, 0, 20, N'43/11', N'Lê Đức Thọ', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (663, N'thanh6@gmail.com', 11000000, 3, 1, 130, 3, 0, 20, N'33/66', N'Nguyễn Hiền', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (664, N'thanh6@gmail.com', 12000000, 4, 1, 140, 3, 0, 20, N'31/143', N'Lê Đức Thọ', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (665, N'thanh6@gmail.com', 13000000, 3, 1, 100, 2, 0, 20, N'78/54', N'Lũy Bán Bích', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (666, N'thanh6@gmail.com', 8000000, 2, 1, 80, 2, 0, 21, N'32/13', N'Lũy Bán Bích', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (667, N'thanh6@gmail.com', 9000000, 2, 1, 90, 3, 0, 21, N'120/21', N'Nguyễn Thái Học', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (668, N'thanh7@gmail.com', 7000000, 2, 1, 120, 2, 0, 21, N'34/21', N'Nguyễn Hiền', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (669, N'thanh7@gmail.com', 15000000, 4, 1, 150, 3, 0, 21, N'34/11', N'Nguyễn Trãi', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (670, N'thanh7@gmail.com', 25000000, 5, 1, 200, 3, 0, 22, N'88/21', N'Nguyễn Thị Minh Khai', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (671, N'thanh7@gmail.com', 16000000, 3, 1, 120, 4, 0, 22, N'43/23', N'Tô Yến Thành', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (672, N'thanh7@gmail.com', 18000000, 4, 1, 140, 2, 0, 22, N'67/55', N'Lê Thánh Tôn', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (673, N'thanh7@gmail.com', 17000000, 3, 1, 120, 2, 0, 22, N'34/22', N'Lê Quang Định', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (674, N'thanh7@gmail.com', 21000000, 5, 1, 150, 3, 0, 23, N'90/91', N'Lê Thánh Tôn', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (675, N'thanh7@gmail.com', 19000000, 6, 1, 120, 4, 0, 23, N'88/55', N'Nguyễn Kiệm', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (676, N'thanh7@gmail.com', 11000000, 2, 0, 120, 2, 0, 22, N'212/11', N'Hùng Vương', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (677, N'thanh7@gmail.com', 30000000, 5, 1, 250, 4, 0, 23, N'77/231', N'Thống Nhất', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (678, N'thanh8@gmail.com', 22000000, 4, 1, 170, 3, 0, 23, N'67/55', N'Thống Nhất', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (679, N'thanh8@gmail.com', 4000000, 1, 1, 100, 1, 0, 30, N'1/5', N'Võ Văn Tần', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (680, N'thanh8@gmail.com', 5000000, 1, 1, 120, 1, 0, 30, N'1/8', N'Hòa Hưng', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (681, N'thanh8@gmail.com', 7000000, 3, 1, 150, 3, 0, 30, N'8/2', N'Võ Văn Tần', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (682, N'thanh8@gmail.com', 3000000, 1, 1, 100, 1, 0, 30, N'11/11', N'Hòa Hưng', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (683, N'thanh8@gmail.com', 5000000, 2, 1, 120, 1, 0, 31, N'10/8', N'Cách Mạng Tháng 8', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (684, N'thanh8@gmail.com', 10000000, 3, 1, 150, 3, 0, 31, N'7/3', N'Cách Mạng Tháng 8', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (685, N'thanh8@gmail.com', 12000000, 3, 1, 180, 2, 0, 31, N'188a/1', N'Mạch Đỉnh Chi', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (686, N'thanh8@gmail.com', 15000000, 4, 1, 200, 3, 0, 31, N'7/4', N'Tô Yến Thành', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (687, N'thanh9@gmail.com', 4000000, 1, 1, 100, 1, 0, 32, N'15/2', N'Tô Yến Thành', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (688, N'thanh9@gmail.com', 7000000, 2, 1, 100, 2, 0, 32, N'115/17', N'Hòa Hưng', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (689, N'thanh9@gmail.com', 10000000, 3, 1, 250, 3, 0, 32, N'14/5', N'Cách Mạng Tháng 8', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (690, N'thanh9@gmail.com', 8000000, 3, 1, 100, 3, 0, 32, N'15/02', N'Cách Mạng Tháng 8', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (691, N'thanh9@gmail.com', 7500000, 2, 1, 100, 1, 0, 33, N'11/98', N'Đinh Bộ Lĩnh', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (692, N'thanh9@gmail.com', 5500000, 3, 1, 100, 3, 0, 33, N'14/12', N'Đinh Bộ Lĩnh', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (693, N'thanh9@gmail.com', 9500000, 3, 1, 100, 3, 0, 33, N'14/78', N'Tô Yến Thành', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (694, N'thanh9@gmail.com', 10000000, 3, 1, 170, 3, 0, 33, N'12/2', N'Thống Nhất', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (695, N'thanh9@gmail.com', 4500000, 2, 1, 100, 3, 0, 34, N'17/20', N'Hòa Hưng', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (696, N'thanh9@gmail.com', 15000000, 5, 1, 300, 4, 0, 34, N'19/01', N'Cách Mạng Tháng 8', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (697, N'thanh9@gmail.com', 8000000, 3, 1, 100, 3, 0, 34, N'82/2', N'Đinh Bộ Lĩnh', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (698, N'thanh9@gmail.com', 4500000, 3, 1, 80, 3, 0, 34, N'10/3', N'Thống Nhất', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (699, N'thanh10@gmail.com', 21000000, 3, 1, 150, 4, 0, 43, N'43/31', N'Hàm Nghi', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (700, N'thanh10@gmail.com', 12000000, 2, 0, 120, 2, 0, 43, N'88/43', N'Hàm Nghi', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (701, N'thanh10@gmail.com', 11000000, 2, 1, 100, 2, 0, 43, N'76/33', N'Tô Yến Thành', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (702, N'thanh10@gmail.com', 8000000, 2, 1, 80, 1, 0, 43, N'80/80', N'Nguyễn Kiệm', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (703, N'thanh10@gmail.com', 15000000, 3, 1, 120, 2, 0, 44, N'11/31', N'Đông Bắc', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (704, N'thanh10@gmail.com', 120000000, 10, 1, 300, 4, 0, 44, N'46/67', N'Nguyễn Thị Minh Khai', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (705, N'thanh10@gmail.com', 60000000, 6, 1, 280, 3, 0, 44, N'89/66', N'Lê Quang Định', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (706, N'thanh10@gmail.com', 32000000, 5, 1, 200, 3, 0, 44, N'57/73', N'Lê Thánh Tôn', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (707, N'thanh10@gmail.com', 23000000, 4, 0, 200, 3, 0, 45, N'22/33', N'Lê Đức Thọ', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (708, N'thanh10@gmail.com', 11000000, 3, 1, 120, 3, 0, 45, N'87/55', N'Hòa Hưng', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (709, N'thanh10@gmail.com', 13000000, 2, 1, 130, 2, 0, 45, N'130/31', N'Hùng Vương', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (710, N'thanh10@gmail.com', 22000000, 3, 1, 200, 3, 0, 45, N'44/32', N'Hàm Nghi', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (711, N'duy1@gmail.com', 2000000, 1, 1, 100, 1, 0, 46, N'14/5', N'Đinh Bộ Lĩnh', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (712, N'duy1@gmail.com', 3000000, 1, 1, 100, 1, 0, 46, N'78/1', N'Đinh Bộ Lĩnh', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (713, N'duy1@gmail.com', 4500000, 2, 1, 120, 3, 0, 46, N'91/12', N'Nguyễn Trãi', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (714, N'duy1@gmail.com', 5000000, 3, 1, 150, 2, 0, 47, N'12/7', N'Nguyễn Hiền', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (715, N'duy1@gmail.com', 10000000, 3, 1, 180, 3, 0, 47, N'92/143', N'Nguyễn Chí Thanh', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (716, N'duy1@gmail.com', 12000000, 3, 1, 100, 3, 0, 47, N'456/123', N'Trường Trinh', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (717, N'duy1@gmail.com', 8000000, 5, 1, 150, 4, 0, 47, N'123/456', N'Nguyễn Tất Thành', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (718, N'duy2@gmail.com', 3000000, 2, 1, 100, 1, 0, 61, N'14', N'Cách Mạng Tháng 8', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (719, N'duy2@gmail.com', 7500000, 3, 1, 120, 2, 0, 61, N'100', N'Tô Yến Thành', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (720, N'duy2@gmail.com', 15000000, 6, 1, 350, 3, 0, 61, N'17/03', N'Võ Văn Tần', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (721, N'duy2@gmail.com', 1200000, 3, 0, 100, 1, 0, 61, N'7/01', N'Võ Văn Ngân', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (722, N'duy2@gmail.com', 1700000, 6, 1, 100, 3, 0, 62, N'14/78', N'Đinh Bộ Lĩnh', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (723, N'duy2@gmail.com', 20000000, 10, 1, 540, 5, 0, 65, N'18/77', N'Trường Sơn', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
INSERT [dbo].[tbl_House] ([houseID], [emailAdmin], [price], [roomNumber], [furniture], [acreage], [floor], [rentStatus], [areaID], [houseNumber], [houseStreet], [otherDetails]) VALUES (724, N'duy2@gmail.com', 13000000, 4, 0, 350, 3, 0, 62, N'18/2', N'Cách Mạng Tháng 8', N'Cần cho thuê căn nhà nguyên căn tại.Nhà ba tầng: Một trệt, một lửng, một lầu.Diện tích sử dụng : 100 m2.Ngang 10m, Dài 10m.Trước nhà có sân rộng 5m để xe hơi thoải mái.Nhà mới xây 2018. Chỉ ở được vài tháng do tính chất công việc.Mong muốn cho thuê để làm văn phòng công ty hoặc hộ gia đình ở lịch sự, sạch sẽ.Hình ảnh đính kèm bên trên và vui lòng liên hệ nếu có nhu cầu')
SET IDENTITY_INSERT [dbo].[tbl_House] OFF
SET IDENTITY_INSERT [dbo].[tbl_Image] ON 

INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (54, N'thanh1.jpg', 633)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (55, N'thanh2.jpg', 633)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (56, N'thanh3.jpg', 633)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (57, N'thanh4.jpg', 634)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (58, N'thanh5.jpg', 634)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (59, N'thanh6.jpg', 634)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (60, N'thanh7.jpg', 635)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (61, N'thanh8.jpg', 635)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (62, N'thanh9.jpg', 635)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (63, N'thanh10.jpg', 636)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (64, N'thanh11.jpg', 636)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (65, N'thanh12.jpg', 636)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (66, N'thanh13.jpg', 637)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (67, N'thanh14.jpg', 637)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (68, N'thanh15.jpg', 637)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (69, N'thanh16.jpg', 638)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (70, N'thanh17.jpg', 638)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (71, N'thanh18.jpg', 638)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (72, N'thanh19.jpg', 639)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (73, N'thanh20.jpg', 639)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (74, N'thanh21.jpg', 639)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (75, N'thanh22.jpg', 640)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (76, N'thanh23.jpg', 640)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (77, N'thanh24.jpg', 640)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (78, N'thanh25.jpg', 641)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (79, N'thanh26.jpg', 641)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (80, N'thanh27.jpg', 641)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (81, N'thanh28.jpg', 642)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (82, N'thanh29.jpg', 642)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (83, N'thanh30.jpg', 642)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (84, N'thanh31.jpg', 643)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (85, N'thanh32.jpg', 643)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (86, N'thanh33.jpg', 643)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (87, N'thanh34.jpg', 644)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (88, N'thanh35.jpg', 644)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (89, N'thanh36.jpg', 644)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (90, N'thanh37.jpg', 645)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (91, N'thanh38.jpg', 645)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (92, N'thanh39.jpg', 645)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (93, N'thanh40.jpg', 646)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (94, N'thanh41.jpg', 646)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (95, N'thanh42.jpg', 646)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (96, N'thanh43.jpg', 647)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (97, N'thanh44.jpg', 647)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (98, N'thanh45.jpg', 647)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (99, N'thanh46.jpg', 648)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (100, N'thanh47.jpg', 648)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (101, N'thanh48.jpg', 648)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (102, N'thanh49.jpg', 649)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (103, N'thanh50.jpg', 649)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (104, N'thanh51.jpg', 649)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (105, N'thanh52.jpg', 650)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (106, N'thanh53.jpg', 650)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (107, N'thanh54.jpg', 650)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (108, N'thanh55.jpg', 651)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (109, N'thanh56.jpg', 651)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (110, N'thanh57.jpg', 651)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (111, N'thanh58.jpg', 652)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (112, N'thanh59.jpg', 652)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (113, N'thanh60.jpg', 652)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (114, N'thanh61.jpg', 653)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (115, N'thanh62.jpg', 653)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (116, N'thanh63.jpg', 653)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (117, N'thanh64.jpg', 654)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (118, N'thanh59.jpg', 654)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (119, N'thanh33.jpg', 654)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (120, N'thanh129.jpg', 655)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (121, N'thanh98.jpg', 655)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (122, N'thanh112.jpg', 655)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (123, N'thanh110.jpg', 656)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (124, N'thanh54.jpg', 656)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (125, N'thanh58.jpg', 656)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (126, N'thanh89.jpg', 657)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (127, N'thanh145.jpg', 657)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (128, N'thanh82.jpg', 657)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (129, N'thanh131.jpg', 658)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (130, N'thanh144.jpg', 658)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (131, N'thanh166.jpg', 658)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (132, N'thanh154.jpg', 659)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (133, N'thanh159.jpg', 659)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (134, N'thanh133.jpg', 659)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (135, N'thanh165.jpg', 660)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (136, N'thanh166.jpg', 660)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (137, N'thanh164.jpg', 660)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (138, N'thanh164.jpg', 661)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (139, N'thanh10.jpg', 661)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (140, N'thanh159.jpg', 661)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (141, N'thanh135.jpg', 662)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (142, N'thanh27.jpg', 662)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (143, N'thanh165.jpg', 662)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (144, N'thanh143.jpg', 663)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (145, N'thanh8.jpg', 663)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (146, N'thanh19.jpg', 663)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (147, N'thanh55.jpg', 664)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (148, N'thanh31.jpg', 664)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (149, N'thanh14.jpg', 664)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (150, N'thanh105.jpg', 665)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (151, N'thanh34.jpg', 665)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (152, N'thanh81.jpg', 665)
GO
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (153, N'thanh64.jpg', 666)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (154, N'thanh124.jpg', 666)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (155, N'thanh149.jpg', 666)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (156, N'thanh140.jpg', 667)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (157, N'thanh4.jpg', 667)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (158, N'thanh56.jpg', 667)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (159, N'thanh92.jpg', 668)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (160, N'thanh45.jpg', 668)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (161, N'thanh57.jpg', 668)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (162, N'thanh134.jpg', 669)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (163, N'thanh148.jpg', 669)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (164, N'thanh77.jpg', 669)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (165, N'thanh125.jpg', 670)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (166, N'thanh76.jpg', 670)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (167, N'thanh101.jpg', 670)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (168, N'thanh140.jpg', 671)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (169, N'thanh107.jpg', 671)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (170, N'thanh105.jpg', 671)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (171, N'thanh97.jpg', 672)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (172, N'thanh31.jpg', 672)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (173, N'thanh75.jpg', 672)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (174, N'thanh43.jpg', 673)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (175, N'thanh143.jpg', 673)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (176, N'thanh138.jpg', 673)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (177, N'thanh125.jpg', 674)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (178, N'thanh147.jpg', 674)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (179, N'thanh2.jpg', 674)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (180, N'thanh87.jpg', 675)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (181, N'thanh51.jpg', 675)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (182, N'thanh98.jpg', 675)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (183, N'thanh142.jpg', 676)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (184, N'thanh3.jpg', 676)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (185, N'thanh107.jpg', 676)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (186, N'thanh117.jpg', 677)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (187, N'thanh137.jpg', 677)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (188, N'thanh97.jpg', 677)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (189, N'thanh150.jpg', 678)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (190, N'thanh163.jpg', 678)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (191, N'thanh134.jpg', 678)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (192, N'thanh158.jpg', 679)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (193, N'thanh156.jpg', 679)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (194, N'thanh161.jpg', 679)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (195, N'thanh164.jpg', 680)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (196, N'thanh131.jpg', 680)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (197, N'thanh152.jpg', 680)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (198, N'thanh128.jpg', 681)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (199, N'thanh127.jpg', 681)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (200, N'thanh145.jpg', 681)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (201, N'thanh121.jpg', 682)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (202, N'thanh109.jpg', 682)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (203, N'thanh137.jpg', 682)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (204, N'thanh155.jpg', 683)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (205, N'thanh142.jpg', 683)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (206, N'thanh133.jpg', 683)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (207, N'thanh130.jpg', 684)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (208, N'thanh117.jpg', 684)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (209, N'thanh108.jpg', 684)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (210, N'thanh157.jpg', 685)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (211, N'thanh128.jpg', 685)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (212, N'thanh106.jpg', 685)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (213, N'thanh158.jpg', 686)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (214, N'thanh114.jpg', 686)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (215, N'thanh100.jpg', 686)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (216, N'thanh46.jpg', 687)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (217, N'thanh48.jpg', 687)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (218, N'thanh17.jpg', 687)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (219, N'thanh128.jpg', 688)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (220, N'thanh118.jpg', 688)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (221, N'thanh122.jpg', 688)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (222, N'thanh146.jpg', 689)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (223, N'thanh128.jpg', 689)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (224, N'thanh103.jpg', 689)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (225, N'thanh114.jpg', 690)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (226, N'thanh103.jpg', 690)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (227, N'thanh83.jpg', 690)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (228, N'thanh64.jpg', 691)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (229, N'thanh68.jpg', 691)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (230, N'thanh71.jpg', 691)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (231, N'thanh127.jpg', 692)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (232, N'thanh107.jpg', 692)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (233, N'thanh129.jpg', 692)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (234, N'thanh96.jpg', 693)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (235, N'thanh78.jpg', 693)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (236, N'thanh67.jpg', 693)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (237, N'thanh84.jpg', 694)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (238, N'thanh69.jpg', 694)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (239, N'thanh69.jpg', 694)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (240, N'thanh90.jpg', 695)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (241, N'thanh78.jpg', 695)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (242, N'thanh68.jpg', 695)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (243, N'thanh69.jpg', 696)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (244, N'thanh45.jpg', 696)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (245, N'thanh162.jpg', 696)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (246, N'thanh82.jpg', 697)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (247, N'thanh156.jpg', 697)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (248, N'thanh100.jpg', 697)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (249, N'thanh137.jpg', 698)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (250, N'thanh146.jpg', 698)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (251, N'thanh164.jpg', 698)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (252, N'thanh74.jpg', 699)
GO
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (253, N'thanh163.jpg', 699)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (254, N'thanh108.jpg', 699)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (255, N'thanh159.jpg', 700)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (256, N'thanh131.jpg', 700)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (257, N'thanh166.jpg', 700)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (258, N'thanh166.jpg', 701)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (259, N'thanh163.jpg', 701)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (260, N'thanh158.jpg', 701)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (261, N'thanh120.jpg', 702)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (262, N'thanh163.jpg', 702)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (263, N'thanh60.jpg', 702)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (264, N'thanh136.jpg', 703)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (265, N'thanh133.jpg', 703)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (266, N'thanh111.jpg', 703)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (267, N'thanh131.jpg', 704)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (268, N'thanh137.jpg', 704)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (269, N'thanh133.jpg', 704)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (270, N'thanh140.jpg', 705)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (271, N'thanh52.jpg', 705)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (272, N'thanh70.jpg', 705)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (273, N'thanh121.jpg', 706)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (274, N'thanh135.jpg', 706)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (275, N'thanh166.jpg', 706)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (276, N'thanh159.jpg', 707)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (277, N'thanh133.jpg', 707)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (278, N'thanh139.jpg', 707)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (279, N'thanh89.jpg', 708)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (280, N'thanh134.jpg', 708)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (281, N'thanh91.jpg', 708)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (282, N'thanh109.jpg', 709)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (283, N'thanh134.jpg', 709)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (284, N'thanh152.jpg', 709)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (285, N'thanh40.jpg', 710)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (286, N'thanh163.jpg', 710)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (287, N'thanh46.jpg', 710)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (288, N'thanh100.jpg', 711)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (289, N'thanh148.jpg', 711)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (290, N'thanh122.jpg', 711)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (291, N'thanh96.jpg', 712)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (292, N'thanh66.jpg', 712)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (293, N'thanh134.jpg', 712)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (294, N'thanh95.jpg', 713)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (295, N'thanh56.jpg', 713)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (296, N'thanh66.jpg', 713)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (297, N'thanh102.jpg', 714)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (298, N'thanh105.jpg', 714)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (299, N'thanh135.jpg', 714)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (300, N'thanh110.jpg', 715)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (301, N'thanh60.jpg', 715)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (302, N'thanh60.jpg', 715)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (303, N'thanh159.jpg', 716)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (304, N'thanh119.jpg', 716)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (305, N'thanh99.jpg', 716)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (306, N'thanh102.jpg', 717)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (307, N'thanh63.jpg', 717)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (308, N'thanh37.jpg', 717)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (309, N'thanh166.jpg', 718)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (310, N'thanh165.jpg', 718)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (311, N'thanh164.jpg', 718)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (312, N'thanh148.jpg', 719)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (313, N'thanh134.jpg', 719)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (314, N'thanh126.jpg', 719)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (315, N'thanh159.jpg', 720)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (316, N'thanh132.jpg', 720)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (317, N'thanh120.jpg', 720)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (318, N'thanh124.jpg', 721)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (319, N'thanh97.jpg', 721)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (320, N'thanh105.jpg', 721)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (321, N'thanh66.jpg', 722)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (322, N'thanh41.jpg', 722)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (323, N'thanh18.jpg', 722)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (324, N'thanh165.jpg', 723)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (325, N'thanh131.jpg', 723)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (326, N'thanh115.jpg', 723)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (327, N'thanh161.jpg', 724)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (328, N'thanh145.jpg', 724)
INSERT [dbo].[tbl_Image] ([imageID], [url], [houseID]) VALUES (329, N'thanh117.jpg', 724)
SET IDENTITY_INSERT [dbo].[tbl_Image] OFF
ALTER TABLE [dbo].[tbl_Area]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Area_tbl_District] FOREIGN KEY([districtID])
REFERENCES [dbo].[tbl_District] ([districtID])
GO
ALTER TABLE [dbo].[tbl_Area] CHECK CONSTRAINT [FK_tbl_Area_tbl_District]
GO
ALTER TABLE [dbo].[tbl_House]  WITH CHECK ADD  CONSTRAINT [FK_tbl_House_tbl_Admin] FOREIGN KEY([emailAdmin])
REFERENCES [dbo].[tbl_Admin] ([emailAdmin])
GO
ALTER TABLE [dbo].[tbl_House] CHECK CONSTRAINT [FK_tbl_House_tbl_Admin]
GO
ALTER TABLE [dbo].[tbl_House]  WITH CHECK ADD  CONSTRAINT [FK_tbl_House_tbl_Area] FOREIGN KEY([areaID])
REFERENCES [dbo].[tbl_Area] ([areaID])
GO
ALTER TABLE [dbo].[tbl_House] CHECK CONSTRAINT [FK_tbl_House_tbl_Area]
GO
ALTER TABLE [dbo].[tbl_Image]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Image_tbl_House] FOREIGN KEY([houseID])
REFERENCES [dbo].[tbl_House] ([houseID])
GO
ALTER TABLE [dbo].[tbl_Image] CHECK CONSTRAINT [FK_tbl_Image_tbl_House]
GO
USE [master]
GO
ALTER DATABASE [FullHouse] SET  READ_WRITE 
GO
