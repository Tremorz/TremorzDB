USE [master]
GO
/****** Object:  Database [TremorzGovHack2015]    Script Date: 05/07/2015 3:20:01 PM ******/
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
/****** Object:  Schema [app]    Script Date: 05/07/2015 3:20:01 PM ******/
CREATE SCHEMA [app]
GO
/****** Object:  Schema [datadump]    Script Date: 05/07/2015 3:20:01 PM ******/
CREATE SCHEMA [datadump]
GO
/****** Object:  Table [app].[Message]    Script Date: 05/07/2015 3:20:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [app].[Message](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MessageHeader] [nvarchar](255) NULL,
	[Message] [nvarchar](max) NULL,
	[Quantity] [int] NULL,
	[deviceID] [nvarchar](255) NULL,
	[UserName] [nvarchar](255) NULL,
	[TimeStamp] [datetime] NULL,
	[TypeId] [int] NULL,
	[Type] [nvarchar](10) NULL,
	[Lat] [decimal](18, 6) NULL,
	[Lon] [decimal](18, 6) NULL,
	[GeoLocation] [geography] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [datadump].[FacebookPosts]    Script Date: 05/07/2015 3:20:01 PM ******/
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
/****** Object:  Index [idx_facebookPosts]    Script Date: 05/07/2015 3:20:01 PM ******/
CREATE CLUSTERED INDEX [idx_facebookPosts] ON [datadump].[FacebookPosts]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Table [datadump].[LocationDataset]    Script Date: 05/07/2015 3:20:01 PM ******/
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
/****** Object:  Table [datadump].[Tweets]    Script Date: 05/07/2015 3:20:01 PM ******/
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
/****** Object:  Index [idx_Tweets]    Script Date: 05/07/2015 3:20:01 PM ******/
CREATE CLUSTERED INDEX [idx_Tweets] ON [datadump].[Tweets]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Table [datadump].[TweetsWithLocation]    Script Date: 05/07/2015 3:20:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [datadump].[TweetsWithLocation](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](500) NULL,
	[TweetDate] [datetime] NULL,
	[TweetText] [nvarchar](4000) NULL,
	[SearchHashtag] [nvarchar](200) NULL,
	[Hashtags] [nvarchar](4000) NULL,
	[RetweetCount] [int] NULL,
	[InsertRun] [int] NULL,
	[Longitude] [float] NULL,
	[Latitude] [float] NULL,
	[LongLatString] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  View [app].[FacebookPosts]    Script Date: 05/07/2015 3:20:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [app].[FacebookPosts]
AS 
/****************************************************************
--Dev: Intergen\Saipriya G
--Date: 2015-07-04
--View retrieves any post indicating "Warning" information posted by 
--Wellington Region Emergency Management Office in the past 2 days 
*****************************************************************/
SELECT 
	'Weather'			AS [Category]
	,[Source]			AS [Username]
	,[UpdatedDate]
	,[Message] 
FROM  [datadump].[FacebookPosts]
WHERE [UpdatedDate] BETWEEN DATEADD(Day, -2, GETDATE()) AND GETDATE() 
AND [Message] LIKE '%WARNING%'
GROUP BY 
	 [UpdatedDate]
	,[Message]  
	,[Source]

GO
/****** Object:  View [app].[Tweets]    Script Date: 05/07/2015 3:20:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [app].[Tweets]
AS
/****************************************************************
--Dev: Intergen\Saipriya G
--Date: 2015-07-04
--View retrieves any tweets from the transport department and Civil Defence 
--that were re-tweeted by atleast one person. Retweet threashold could be be customised.
--Data (tweet) is retrieved for the past 2 days.
*****************************************************************/

/****************************************************************
Retrieve tweets from the following Twitter accounts:
	https://twitter.com/metlinkwgtn
	https://twitter.com/TranzMetro
	https://twitter.com/NZTAWgtn
*****************************************************************/
SELECT  
	'Transport'											AS Category
	,MIN([Username])									AS [Username]
    ,MAX([TweetDate])									AS [UpdatedDate]
	,[Hashtags]
    ,MAX([SearchHashtag])								AS [SearchHashtag]
	,CASE WHEN LEFT([TweetText], 3) = 'RT ' 
		THEN RIGHT([TweetText], LEN([TweetText])-3) 
		ELSE [TweetText] 
	END													AS [Message]
	,MAX([RetweetCount])								AS [RetweetCount]
	,CASE 
		WHEN [TweetText] LIKE '%@metlinkwgtn%' THEN -41.277935
		WHEN [TweetText] LIKE '%@TranzMetro%' THEN -41.279416
		WHEN [TweetText] LIKE '%NZTAWgtn%' THEN -41.280712
		ELSE NULL
	END													AS [Lat]
	,CASE 
		WHEN [TweetText] LIKE '%@metlinkwgtn%' THEN 174.785326
		WHEN [TweetText] LIKE '%@TranzMetro%' THEN 174.780117
		WHEN [TweetText] LIKE '%NZTAWgtn%' THEN 174.778170
		ELSE NULL
	END 												AS [Lon]
	/*,COUNT(CASE WHEN LEFT([TweetText], 3) = 'RT ' 
		THEN RIGHT([TweetText], LEN([TweetText])-3) 
		ELSE [TweetText] 
	END)												AS [TweetCount]*/
FROM [datadump].[Tweets] 
WHERE ([TweetText] LIKE '%@metlinkwgtn%'
	OR [TweetText] LIKE '%@TranzMetro%'
	OR [TweetText] LIKE '%NZTAWgtn%') 
	AND [TweetDate] BETWEEN DATEADD(Day, -2, GETDATE()) AND GETDATE() 
GROUP BY 
	[Hashtags]
	,[TweetText]
HAVING MAX([RetweetCount]) > 0

--UNION ALL

/****************************************************************
Retrieve NZ Civil Defence Tweets (https://twitter.com/NZcivildefence)
****************************************************************/
/*
SELECT 
	'Weather'											AS Category
	,MIN([Username])									AS [Username]
    ,MAX([TweetDate])									AS [UpdatedDate]
	,CASE WHEN LEFT([TweetText], 3) = 'RT ' 
		THEN RIGHT([TweetText], LEN([TweetText])-3) 
		ELSE [TweetText] 
	END													AS [Message]
	,[Hashtags]
    ,MAX([SearchHashtag])								AS [SearchHashtag]
	,MAX([RetweetCount])								AS [RetweetCount]
	/*,COUNT(CASE WHEN LEFT([TweetText], 3) = 'RT ' 
		THEN RIGHT([TweetText], LEN([TweetText])-3) 
		ELSE [TweetText] 
	END)												AS [TweetCount]*/
FROM [datadump].[Tweets] -- 69
WHERE [SearchHashtag] LIKE '%Weather%'
	AND [TweetDate] BETWEEN DATEADD(Day, -2, GETDATE()) AND GETDATE()
GROUP BY 
	[Hashtags]
	,[TweetText]
HAVING MAX([RetweetCount]) > 0
*/


GO
/****** Object:  View [app].[MessageSummary]    Script Date: 05/07/2015 3:20:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [app].[MessageSummary]
AS

/****************************************************************
--Dev: Intergen\Saipriya G
--Date: 2015-07-05
--View retrieves a summary of all information to be shown on the mobile app 
*****************************************************************/
	
SELECT 
	 'Help'					AS [Category]
	,'App'					AS [Source]
	,[Type]					AS [MessageType]
	,[UserName]
	,CASE [Type] 
		WHEN 'N' THEN 'I need ' 
		WHEN 'S' THEN 'I have '
		ELSE 'Info - ' END 
		+ [MessageHeader]	AS [MessageHeader]
    ,[Message] AS [Message]
	,[TimeStamp]			AS [TimeStamp]
	,[Lat]					AS [Latitude]
	,[Lon]					AS [Longitude]
    ,[GeoLocation]
FROM [app].[Message]

UNION ALL 

SELECT 
	'Weather'				AS [Category]
	,'FB'					AS [Source]
	,'I'					AS [MessageType]
	,[Username]
	,'Weather Information'  AS [MessageHeader]
	,'FB: ' + [Message]		AS [Message]
	,[UpdatedDate]			AS [TimeStamp]
	,-41.274247				AS [Latitude]
	,174.779305				AS [Longitude]
    ,geography::STPointFromText('POINT(' + CAST(174.779305 AS VARCHAR(20)) + ' ' + 
                    CAST(-41.274247 AS VARCHAR(20)) + ')', 4326)			AS[GeoLocation]
FROM  [app].[FacebookPosts]

UNION ALL

SELECT 
	 [Category]
	,'Twitter'				AS [Source]
	,'I'					AS [MessageType]
    ,[Username]
	,'Transport Information' AS [MessageHeader]
    ,'Tweet: ' + [Message]	AS [Message]
	,[UpdatedDate]			AS [TimeStamp]
	,[Lat] 					AS [Latitude]
	,[Lon]					AS [Longitude]
    ,geography::STPointFromText('POINT(' + CAST([Lon] AS VARCHAR(20)) + ' ' + 
                    CAST([Lat] AS VARCHAR(20)) + ')', 4326)					AS [GeoLocation]
FROM [app].[Tweets]

UNION ALL

SELECT 
	 'Community Centre' AS [Category]
	,'Govt'				AS [Source]
	,'I'				AS [MessageType]
	,'Govt'				AS [Username]
	,'Community Centre Information' AS [MessageHeader]
    ,[LocationType] + ' - ' + [name]		AS [Message]
	,GETDATE()			AS [TimeStamp]
    ,CAST([GEOMETRY_Y] AS DECIMAL(18,6))	AS [Latitude]
    ,CAST([GEOMETRY_X] AS DECIMAL(18,6))	AS [Longitude]
	,geography::STPointFromText('POINT(' + CAST([GEOMETRY_X] AS VARCHAR(20)) + ' ' + 
                    CAST([GEOMETRY_Y] AS VARCHAR(20)) + ')', 4326)				AS[GeoLocation]
FROM [datadump].[LocationDataset]
WHERE [GEOMETRY_Y] IS NOT NULL
	


GO
USE [master]
GO
ALTER DATABASE [TremorzGovHack2015] SET  READ_WRITE 
GO
