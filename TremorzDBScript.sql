USE [master]
GO
/****** Object:  Database [TremorzGovHack2015]    Script Date: 04/07/2015 5:20:51 PM ******/
CREATE DATABASE [TremorzGovHack2015]
GO
ALTER DATABASE [TremorzGovHack2015] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TremorzGovHack2015].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [TremorzGovHack2015] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TremorzGovHack2015] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TremorzGovHack2015] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TremorzGovHack2015] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TremorzGovHack2015] SET ARITHABORT OFF 
GO
ALTER DATABASE [TremorzGovHack2015] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TremorzGovHack2015] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TremorzGovHack2015] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TremorzGovHack2015] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TremorzGovHack2015] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TremorzGovHack2015] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TremorzGovHack2015] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TremorzGovHack2015] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TremorzGovHack2015] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TremorzGovHack2015] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TremorzGovHack2015] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TremorzGovHack2015] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TremorzGovHack2015] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TremorzGovHack2015] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [TremorzGovHack2015] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TremorzGovHack2015] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [TremorzGovHack2015] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TremorzGovHack2015] SET RECOVERY FULL 
GO
ALTER DATABASE [TremorzGovHack2015] SET  MULTI_USER 
GO
ALTER DATABASE [TremorzGovHack2015] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TremorzGovHack2015] SET DB_CHAINING OFF 
GO
USE [TremorzGovHack2015]
GO
/****** Object:  Schema [app]    Script Date: 04/07/2015 5:20:51 PM ******/
CREATE SCHEMA [app]
GO
/****** Object:  Schema [datadump]    Script Date: 04/07/2015 5:20:51 PM ******/
CREATE SCHEMA [datadump]
GO
/****** Object:  Table [app].[Message]    Script Date: 04/07/2015 5:20:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [app].[Message](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Message] [nvarchar](max) NULL,
	[Quantity] [int] NULL,
	[deviceID] [nvarchar](255) NULL,
	[UserName] [nvarchar](255) NULL,
	[TimeStamp] [datetime] NULL,
	[TypeId] [int] NULL,
	[Type] [nvarchar](10) NULL,
	[Lat] [decimal](18, 10) NULL,
	[Lon] [decimal](18, 10) NULL,
	[GeoLocation] [geography] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [datadump].[FacebookPosts]    Script Date: 04/07/2015 5:20:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [datadump].[FacebookPosts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UpdatedDate] [datetime] NULL,
	[Message] [nvarchar](4000) NULL,
	[Source] [nvarchar](500) NULL
)

GO
/****** Object:  Index [idx_facebookPosts]    Script Date: 04/07/2015 5:20:51 PM ******/
CREATE CLUSTERED INDEX [idx_facebookPosts] ON [datadump].[FacebookPosts]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Table [datadump].[LocationDataset]    Script Date: 04/07/2015 5:20:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [datadump].[LocationDataset](
	[LocationID] [int] IDENTITY(1,1) NOT NULL,
	[LocationType] [nvarchar](255) NULL,
	[WKT] [nvarchar](50) NULL,
	[SiteType] [nvarchar](255) NULL,
	[name] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
	[suburb] [nvarchar](50) NULL,
	[GEOMETRY_X] [float] NULL,
	[GEOMETRY_Y] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [datadump].[Tweets]    Script Date: 04/07/2015 5:20:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [datadump].[Tweets](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](500) NULL,
	[TweetDate] [datetime] NULL,
	[TweetText] [nvarchar](4000) NULL,
	[SearchHashtag] [nvarchar](200) NULL,
	[Hashtags] [nvarchar](4000) NULL,
	[RetweetCount] [int] NULL,
	[InsertRun] [int] NULL
)

GO
/****** Object:  Index [idx_Tweets]    Script Date: 04/07/2015 5:20:52 PM ******/
CREATE CLUSTERED INDEX [idx_Tweets] ON [datadump].[Tweets]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  View [app].[Tweets]    Script Date: 04/07/2015 5:20:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [app].[Tweets]
AS

SELECT 
       MIN([Username])		AS [Username]
      ,MAX([TweetDate])		AS [TweetDate]
      ,MIN([SearchHashtag]) AS [SearchHashtag]
      ,MAX([RetweetCount])	AS [RetweetCount]
	  ,[Hashtags]
	  ,CASE WHEN LEFT([TweetText], 4) = 'RT @' 
			THEN RIGHT([TweetText], LEN([TweetText])-4) 
			ELSE [TweetText] 
		END					AS [TweetText]
FROM [datadump].[Tweets]
GROUP BY 
	[Hashtags]
	,CASE WHEN LEFT([TweetText], 4) = 'RT @' THEN RIGHT([TweetText], LEN([TweetText])-4) ELSE [TweetText] END 
HAVING MAX([RetweetCount]) > 0


GO
USE [master]
GO
ALTER DATABASE [TremorzGovHack2015] SET  READ_WRITE 
GO
