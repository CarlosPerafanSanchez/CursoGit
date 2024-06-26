/* Comentario indicando que puedo seguir programando desde GitHub */
/****** Object:  Database [GoApp_Dev]    Script Date: 17/02/2024 10:38:31 a. m. ******/
CREATE DATABASE [GoApp_Dev]  (EDITION = 'Standard', SERVICE_OBJECTIVE = 'S0', MAXSIZE = 50 GB) WITH CATALOG_COLLATION = SQL_Latin1_General_CP1_CI_AS, LEDGER = OFF;
GO
ALTER DATABASE [GoApp_Dev] SET COMPATIBILITY_LEVEL = 150
GO
ALTER DATABASE [GoApp_Dev] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GoApp_Dev] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GoApp_Dev] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GoApp_Dev] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GoApp_Dev] SET ARITHABORT OFF 
GO
ALTER DATABASE [GoApp_Dev] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GoApp_Dev] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GoApp_Dev] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GoApp_Dev] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GoApp_Dev] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GoApp_Dev] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GoApp_Dev] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GoApp_Dev] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GoApp_Dev] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [GoApp_Dev] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GoApp_Dev] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [GoApp_Dev] SET  MULTI_USER 
GO
ALTER DATABASE [GoApp_Dev] SET ENCRYPTION ON
GO
ALTER DATABASE [GoApp_Dev] SET QUERY_STORE = ON
GO
ALTER DATABASE [GoApp_Dev] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 100, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
/*** The scripts of database scoped configurations in Azure should be executed inside the target database connection. ***/
GO
-- ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 8;
GO
/****** Object:  DatabaseScopedCredential [https://routetracking.blob.core.windows.net/sqldbauditlogs]    Script Date: 17/02/2024 10:38:32 a. m. ******/
CREATE DATABASE SCOPED CREDENTIAL [https://routetracking.blob.core.windows.net/sqldbauditlogs] WITH IDENTITY = N'SHARED ACCESS SIGNATURE'
GO
/****** Object:  UserDefinedTableType [dbo].[GPSDataTestType]    Script Date: 17/02/2024 10:38:32 a. m. ******/
CREATE TYPE [dbo].[GPSDataTestType] AS TABLE(
	[GPSID] [nvarchar](200) NULL,
	[DriverTripID] [int] NULL,
	[Lat] [float] NULL,
	[Long] [float] NULL,
	[Speed] [nvarchar](50) NULL,
	[BateryLavel] [nvarchar](50) NULL,
	[HDOP] [nvarchar](50) NULL,
	[VDOP] [nvarchar](50) NULL,
	[Satellite] [nvarchar](50) NULL,
	[GPSDataTime] [datetime2](7) NULL,
	[isGpsValid] [bit] NULL,
	[isIgnitionOn] [bit] NULL,
	[isOnGeoTabServer] [bit] NULL,
	[isOnlineGPSData] [bit] NULL,
	[GPSDataReceivedDateTime] [datetime2](7) NULL,
	[InternetSpeedInKBPS] [int] NULL,
	[VehicleNearByDriver] [bit] NULL,
	[GPSDataCurrentZoneDateTime] [nvarchar](max) NULL,
	[Flag] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[GPSDataType]    Script Date: 17/02/2024 10:38:32 a. m. ******/
CREATE TYPE [dbo].[GPSDataType] AS TABLE(
	[GPSID] [nvarchar](200) NULL,
	[DriverTripID] [int] NULL,
	[Lat] [float] NULL,
	[Long] [float] NULL,
	[Speed] [nvarchar](50) NULL,
	[BateryLavel] [nvarchar](50) NULL,
	[HDOP] [nvarchar](50) NULL,
	[VDOP] [nvarchar](50) NULL,
	[Satellite] [nvarchar](50) NULL,
	[GPSDataTime] [datetime2](7) NULL,
	[isGpsValid] [bit] NULL,
	[isIgnitionOn] [bit] NULL,
	[isOnGeoTabServer] [bit] NULL,
	[isOnlineGPSData] [bit] NULL,
	[GPSDataReceivedDateTime] [datetime2](7) NULL,
	[InternetSpeedInKBPS] [int] NULL,
	[VehicleNearByDriver] [bit] NULL,
	[GPSDataCurrentZoneDateTime] [nvarchar](max) NULL
)
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 17/02/2024 10:38:32 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActionLog]    Script Date: 17/02/2024 10:38:32 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActionLog](
	[OID] [uniqueidentifier] NOT NULL,
	[Message] [nvarchar](max) NULL,
	[Status] [nvarchar](max) NULL,
	[StatusCode] [nvarchar](max) NULL,
	[ExceptionMessage] [nvarchar](max) NULL,
	[ExceptionStackTrace] [nvarchar](max) NULL,
	[ActionLocation] [nvarchar](max) NULL,
	[ID] [nvarchar](max) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ActionLog] PRIMARY KEY CLUSTERED 
(
	[OID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AdminUser]    Script Date: 17/02/2024 10:38:32 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminUser](
	[AdminID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](200) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[MobileNo] [nvarchar](50) NULL,
	[IsActive] [bit] NOT NULL,
	[IsFirstTime] [bit] NOT NULL,
	[Role] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[UpdatedDate] [datetime2](7) NOT NULL,
	[TokenKey] [uniqueidentifier] NOT NULL,
	[LinkExpiredTime] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_AdminUser] PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Driver]    Script Date: 17/02/2024 10:38:32 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Driver](
	[DriverID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](200) NULL,
	[DriverAltEmail] [nvarchar](50) NOT NULL,
	[DriverMobile] [nvarchar](50) NULL,
	[LicenseNo] [nvarchar](50) NULL,
	[DateOfIssue] [datetime2](7) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[DOB] [datetime2](7) NOT NULL,
	[Gender] [nvarchar](50) NULL,
	[Address] [nvarchar](100) NULL,
	[Country] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[Zipcode] [int] NULL,
	[ImageName] [nvarchar](200) NOT NULL,
	[ProfileImageLink] [nvarchar](max) NOT NULL,
	[DocumentName] [nvarchar](200) NOT NULL,
	[DocumentLink] [nvarchar](max) NOT NULL,
	[IsActive] [nvarchar](20) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[UpdatedDate] [datetime2](7) NOT NULL,
	[UpdatedBy] [nvarchar](50) NOT NULL,
	[DIGToken] [nvarchar](max) NOT NULL,
	[DIGTokenCreatedDate] [datetime2](7) NOT NULL,
	[DriverSessionID] [nvarchar](200) NOT NULL,
	[IsLoggedIn] [bit] NOT NULL,
	[VehicleAllotted] [nvarchar](max) NOT NULL,
	[VehicleAllocatedTime] [datetime2](7) NOT NULL,
	[AppVersion] [nvarchar](50) NOT NULL,
	[DeviceID] [nvarchar](500) NULL,
	[LanguegeID] [int] NOT NULL,
 CONSTRAINT [PK_Driver] PRIMARY KEY CLUSTERED 
(
	[DriverID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DriverTrip]    Script Date: 17/02/2024 10:38:32 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DriverTrip](
	[DriverTripID] [int] IDENTITY(1,1) NOT NULL,
	[DriverID] [int] NOT NULL,
	[VehicleID] [int] NOT NULL,
	[TripStart] [datetime2](7) NOT NULL,
	[TripEnd] [datetime2](7) NOT NULL,
	[TripRunningStatus] [bit] NOT NULL,
	[GPSDataTimeZone] [nvarchar](max) NULL,
	[TripLogsLink] [nvarchar](max) NULL,
 CONSTRAINT [PK_DriverTrip] PRIMARY KEY CLUSTERED 
(
	[DriverTripID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DriverTripHistory]    Script Date: 17/02/2024 10:38:32 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DriverTripHistory](
	[DriverTripHistoryID] [int] IDENTITY(1,1) NOT NULL,
	[DriverTripID] [int] NOT NULL,
	[DriverID] [int] NOT NULL,
	[VehicleID] [int] NOT NULL,
	[TripStart] [datetime2](7) NOT NULL,
	[TripEnd] [datetime2](7) NOT NULL,
	[TripRunningStatus] [bit] NOT NULL,
	[GPSDataTimeZone] [nvarchar](max) NULL,
	[TripLogsLink] [nvarchar](max) NOT NULL,
	[PartitionDate] [int] NOT NULL,
 CONSTRAINT [PK_DriverTripHistory] PRIMARY KEY CLUSTERED 
(
	[DriverTripHistoryID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GPSData]    Script Date: 17/02/2024 10:38:32 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GPSData](
	[GPSID] [uniqueidentifier] NOT NULL,
	[DriverTripID] [int] NOT NULL,
	[Lat] [float] NOT NULL,
	[Long] [float] NOT NULL,
	[Speed] [nvarchar](50) NOT NULL,
	[BatteryLevel] [nvarchar](50) NOT NULL,
	[HDOP] [nvarchar](50) NOT NULL,
	[VDOP] [nvarchar](50) NOT NULL,
	[Satellite] [nvarchar](50) NOT NULL,
	[GPSDataTime] [datetime2](7) NOT NULL,
	[isGpsValid] [bit] NOT NULL,
	[isIgnitionOn] [bit] NOT NULL,
	[isOnGeoTabServer] [bit] NOT NULL,
	[isOnlineGPSData] [bit] NOT NULL,
	[GPSDataReceivedDateTime] [datetime2](7) NOT NULL,
	[InternetSpeedInKBPS] [int] NOT NULL,
	[VehicleNearByDriver] [bit] NOT NULL,
	[GPSDataCurrentZoneDateTime] [nvarchar](max) NULL,
 CONSTRAINT [PK_GPSData] PRIMARY KEY CLUSTERED 
(
	[GPSID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GPSDataHistory]    Script Date: 17/02/2024 10:38:32 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GPSDataHistory](
	[GPSDataHistoryID] [int] IDENTITY(1,1) NOT NULL,
	[GPSID] [uniqueidentifier] NOT NULL,
	[DriverTripID] [int] NOT NULL,
	[Lat] [float] NOT NULL,
	[Long] [float] NOT NULL,
	[Speed] [nvarchar](50) NOT NULL,
	[BateryLavel] [nvarchar](50) NOT NULL,
	[HDOP] [nvarchar](50) NOT NULL,
	[VDOP] [nvarchar](50) NOT NULL,
	[Satellite] [nvarchar](50) NOT NULL,
	[GPSDataTime] [datetime2](7) NOT NULL,
	[isGpsValid] [bit] NOT NULL,
	[isIgnitionOn] [bit] NOT NULL,
	[isOnGeoTabServer] [bit] NOT NULL,
	[isOnlineGPSData] [bit] NOT NULL,
	[GPSDataReceivedDateTime] [datetime2](7) NOT NULL,
	[InternetSpeedInKBPS] [int] NOT NULL,
	[VehicleNearByDriver] [bit] NOT NULL,
	[GPSDataCurrentZoneDateTime] [nvarchar](max) NULL,
	[Flag] [int] NULL,
	[PartitionDate] [int] NOT NULL,
 CONSTRAINT [PK_GPSDataHistory] PRIMARY KEY CLUSTERED 
(
	[GPSDataHistoryID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GPSDataTest]    Script Date: 17/02/2024 10:38:32 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GPSDataTest](
	[GPSID] [uniqueidentifier] NOT NULL,
	[DriverTripID] [int] NOT NULL,
	[Lat] [float] NOT NULL,
	[Long] [float] NOT NULL,
	[Speed] [nvarchar](50) NOT NULL,
	[BatteryLevel] [nvarchar](50) NOT NULL,
	[HDOP] [nvarchar](50) NOT NULL,
	[VDOP] [nvarchar](50) NOT NULL,
	[Satellite] [nvarchar](50) NOT NULL,
	[GPSDataTime] [datetime2](7) NOT NULL,
	[isGpsValid] [bit] NOT NULL,
	[isIgnitionOn] [bit] NOT NULL,
	[isOnGeoTabServer] [bit] NOT NULL,
	[isOnlineGPSData] [bit] NOT NULL,
	[GPSDataReceivedDateTime] [datetime2](7) NOT NULL,
	[InternetSpeedInKBPS] [int] NOT NULL,
	[VehicleNearByDriver] [bit] NOT NULL,
	[GPSDataCurrentZoneDateTime] [nvarchar](max) NULL,
	[Flag] [int] NULL,
 CONSTRAINT [PK_GPSDataTest] PRIMARY KEY CLUSTERED 
(
	[GPSID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GPSDataTime]    Script Date: 17/02/2024 10:38:32 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GPSDataTime](
	[OID] [int] IDENTITY(1,1) NOT NULL,
	[BatteryLevel] [nvarchar](50) NULL,
	[GPSTime] [nvarchar](50) NULL,
 CONSTRAINT [PK_GPSDataTime] PRIMARY KEY CLUSTERED 
(
	[OID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InputActionLog]    Script Date: 17/02/2024 10:38:32 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InputActionLog](
	[InputID] [int] IDENTITY(1,1) NOT NULL,
	[InputField] [nvarchar](max) NULL,
	[InputLocation] [nvarchar](max) NULL,
	[ID] [nvarchar](max) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_InputActionLog] PRIMARY KEY CLUSTERED 
(
	[InputID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MngToken]    Script Date: 17/02/2024 10:38:32 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MngToken](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](200) NOT NULL,
	[IsActive] [nvarchar](20) NOT NULL,
	[DIGToken] [nvarchar](max) NOT NULL,
	[DIGTokenCreatedDate] [datetime2](7) NOT NULL,
	[DIGTokenExpiresDate] [datetime2](7) NOT NULL,
	[DIGTokenRefresh] [nvarchar](max) NOT NULL,
	[DIGTokenRefreshCreatedDate] [datetime2](7) NOT NULL,
	[DIGTokenRefreshExpiresDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserID] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 17/02/2024 10:38:32 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[NotificationID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NULL,
	[Title] [nvarchar](50) NULL,
	[Message] [nvarchar](50) NULL,
	[SpanishTitle] [nvarchar](50) NULL,
	[SpanishMessage] [nvarchar](50) NULL,
	[UpdatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Notification] PRIMARY KEY CLUSTERED 
(
	[NotificationID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NotificationHistory]    Script Date: 17/02/2024 10:38:32 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NotificationHistory](
	[OID] [int] IDENTITY(1,1) NOT NULL,
	[NotificationID] [int] NOT NULL,
	[DriverTripID] [int] NOT NULL,
	[NotificationDatetime] [datetime2](7) NOT NULL,
	[IsSendNotification] [bit] NOT NULL,
	[Count] [int] NOT NULL,
	[GPSDataCurrentZoneDateTime] [nvarchar](max) NULL,
	[PartitionDate] [int] NOT NULL,
 CONSTRAINT [PK_NotificationHistory] PRIMARY KEY CLUSTERED 
(
	[OID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Settings]    Script Date: 17/02/2024 10:38:32 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Settings](
	[SID] [int] IDENTITY(1,1) NOT NULL,
	[Speed] [nvarchar](50) NULL,
	[HDOP] [nvarchar](50) NULL,
	[VehicleAllocatedTime] [nvarchar](50) NULL,
	[LogsDeletedTime] [int] NOT NULL,
	[TripBackupTime] [int] NOT NULL,
	[SendRange] [int] NULL,
	[Timeout] [int] NULL,
	[Response] [int] NULL,
	[InternetSpeed] [int] NULL,
 CONSTRAINT [PK_Settings] PRIMARY KEY CLUSTERED 
(
	[SID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trip]    Script Date: 17/02/2024 10:38:32 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trip](
	[OID] [int] IDENTITY(1,1) NOT NULL,
	[TripID] [nvarchar](50) NULL,
	[DriverTripID] [int] NOT NULL,
	[VehicleName] [nvarchar](50) NULL,
	[Device] [nvarchar](50) NULL,
	[Distance] [float] NOT NULL,
	[averageSpeed] [real] NULL,
	[engineHours] [float] NULL,
	[isSeatBeltOff] [bit] NULL,
	[workDistance] [real] NULL,
	[MaxSpeed] [real] NULL,
	[TripStart] [datetime2](7) NOT NULL,
	[TripEnd] [datetime2](7) NOT NULL,
	[DrivingDuration] [nvarchar](50) NULL,
	[IdlingDuration] [nvarchar](50) NULL,
	[StopDuration] [nvarchar](50) NULL,
	[stopPointX] [real] NULL,
	[stopPointY] [real] NULL,
	[afterHoursDistance] [real] NULL,
	[afterHoursDrivingDuration] [nvarchar](50) NULL,
	[afterHoursEnd] [bit] NULL,
	[afterHoursStart] [bit] NULL,
	[afterHoursStopDuration] [nvarchar](50) NULL,
	[nextTripStart] [datetime2](7) NOT NULL,
	[speedRange1] [real] NULL,
	[speedRange1Duration] [nvarchar](50) NULL,
	[speedRange2] [real] NULL,
	[speedRange2Duration] [nvarchar](50) NULL,
	[speedRange3] [real] NULL,
	[speedRange3Duration] [nvarchar](50) NULL,
	[workDrivingDuration] [nvarchar](50) NULL,
	[workStopDuration] [nvarchar](50) NULL,
	[deviceID] [nvarchar](50) NULL,
	[driver] [nvarchar](50) NULL,
 CONSTRAINT [PK_Trip] PRIMARY KEY CLUSTERED 
(
	[OID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TripHistory]    Script Date: 17/02/2024 10:38:32 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TripHistory](
	[TripHistoryID] [int] IDENTITY(1,1) NOT NULL,
	[OID] [int] NOT NULL,
	[TripID] [nvarchar](50) NULL,
	[DriverTripID] [int] NOT NULL,
	[VehicleName] [nvarchar](50) NULL,
	[Device] [nvarchar](50) NULL,
	[Distance] [float] NOT NULL,
	[averageSpeed] [real] NULL,
	[engineHours] [float] NULL,
	[isSeatBeltOff] [bit] NULL,
	[workDistance] [real] NULL,
	[MaxSpeed] [real] NULL,
	[TripStart] [datetime2](7) NOT NULL,
	[TripEnd] [datetime2](7) NOT NULL,
	[DrivingDuration] [nvarchar](50) NULL,
	[IdlingDuration] [nvarchar](50) NULL,
	[StopDuration] [nvarchar](50) NULL,
	[stopPointX] [real] NULL,
	[stopPointY] [real] NULL,
	[afterHoursDistance] [real] NULL,
	[afterHoursDrivingDuration] [nvarchar](50) NULL,
	[afterHoursEnd] [bit] NULL,
	[afterHoursStart] [bit] NULL,
	[afterHoursStopDuration] [nvarchar](50) NULL,
	[nextTripStart] [datetime2](7) NOT NULL,
	[speedRange1] [real] NULL,
	[speedRange1Duration] [nvarchar](50) NULL,
	[speedRange2] [real] NULL,
	[speedRange2Duration] [nvarchar](50) NULL,
	[speedRange3] [real] NULL,
	[speedRange3Duration] [nvarchar](50) NULL,
	[workDrivingDuration] [nvarchar](50) NULL,
	[workStopDuration] [nvarchar](50) NULL,
	[deviceID] [nvarchar](50) NULL,
	[driver] [nvarchar](50) NULL,
 CONSTRAINT [PK_TripHistory] PRIMARY KEY CLUSTERED 
(
	[TripHistoryID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserData]    Script Date: 17/02/2024 10:38:32 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserData](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](200) NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_UserData] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehicle]    Script Date: 17/02/2024 10:38:32 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicle](
	[VehicleID] [int] IDENTITY(1,1) NOT NULL,
	[VehicleSerialNo] [nvarchar](50) NULL,
	[LicensePlate] [nvarchar](50) NULL,
	[Model] [nvarchar](50) NULL,
	[BeaconID] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[UpdatedDate] [datetime2](7) NOT NULL,
	[UpdatedBy] [nvarchar](50) NOT NULL,
	[MACAddress] [nvarchar](50) NOT NULL,
	[VehicleType] [nvarchar](50) NULL,
 CONSTRAINT [PK_Vehicle] PRIMARY KEY CLUSTERED 
(
	[VehicleID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_DriverTrip_DriverID]    Script Date: 17/02/2024 10:38:32 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_DriverTrip_DriverID] ON [dbo].[DriverTrip]
(
	[DriverID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_DriverTrip_VehicleID]    Script Date: 17/02/2024 10:38:32 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_DriverTrip_VehicleID] ON [dbo].[DriverTrip]
(
	[VehicleID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_DriverTripHistory_DriverID]    Script Date: 17/02/2024 10:38:32 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_DriverTripHistory_DriverID] ON [dbo].[DriverTripHistory]
(
	[DriverID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_DriverTripHistory_VehicleID]    Script Date: 17/02/2024 10:38:32 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_DriverTripHistory_VehicleID] ON [dbo].[DriverTripHistory]
(
	[VehicleID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_GPSData_DriverTripID]    Script Date: 17/02/2024 10:38:32 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_GPSData_DriverTripID] ON [dbo].[GPSData]
(
	[DriverTripID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [nci_wi_GPSData_03A124226C2807DCBFFB011714AB91FA]    Script Date: 17/02/2024 10:38:32 a. m. ******/
CREATE NONCLUSTERED INDEX [nci_wi_GPSData_03A124226C2807DCBFFB011714AB91FA] ON [dbo].[GPSData]
(
	[DriverTripID] ASC,
	[isOnGeoTabServer] ASC,
	[isIgnitionOn] ASC
)
INCLUDE([BatteryLevel],[GPSDataReceivedDateTime],[GPSDataTime],[HDOP],[InternetSpeedInKBPS],[isGpsValid],[isOnlineGPSData],[Lat],[Long],[Satellite],[Speed],[VDOP]) WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [nci_wi_GPSDataTest_6674B2EFB7FABA01C7BDBAFC31A1EAAF]    Script Date: 17/02/2024 10:38:32 a. m. ******/
CREATE NONCLUSTERED INDEX [nci_wi_GPSDataTest_6674B2EFB7FABA01C7BDBAFC31A1EAAF] ON [dbo].[GPSDataTest]
(
	[DriverTripID] ASC,
	[isIgnitionOn] ASC,
	[GPSDataTime] ASC
)
INCLUDE([BatteryLevel],[Flag],[GPSDataCurrentZoneDateTime],[GPSDataReceivedDateTime],[HDOP],[InternetSpeedInKBPS],[isGpsValid],[isOnGeoTabServer],[isOnlineGPSData],[Lat],[Long],[Satellite],[Speed],[VDOP],[VehicleNearByDriver]) WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [nci_wi_GPSDataTest_7218743B1383FD74A7AF564E1D3D966F]    Script Date: 17/02/2024 10:38:32 a. m. ******/
CREATE NONCLUSTERED INDEX [nci_wi_GPSDataTest_7218743B1383FD74A7AF564E1D3D966F] ON [dbo].[GPSDataTest]
(
	[isOnGeoTabServer] ASC,
	[DriverTripID] ASC,
	[isIgnitionOn] ASC,
	[Flag] ASC,
	[GPSDataTime] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_NotificationHistory_NotificationID]    Script Date: 17/02/2024 10:38:32 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_NotificationHistory_NotificationID] ON [dbo].[NotificationHistory]
(
	[NotificationID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Trip_DriverTripID]    Script Date: 17/02/2024 10:38:32 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_Trip_DriverTripID] ON [dbo].[Trip]
(
	[DriverTripID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Driver] ADD  DEFAULT (N'') FOR [AppVersion]
GO
ALTER TABLE [dbo].[Driver] ADD  DEFAULT ((0)) FOR [LanguegeID]
GO
ALTER TABLE [dbo].[DriverTripHistory] ADD  DEFAULT ((20230101)) FOR [PartitionDate]
GO
ALTER TABLE [dbo].[GPSData] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [GPSDataReceivedDateTime]
GO
ALTER TABLE [dbo].[GPSData] ADD  DEFAULT ((0)) FOR [InternetSpeedInKBPS]
GO
ALTER TABLE [dbo].[GPSData] ADD  DEFAULT (CONVERT([bit],(0))) FOR [VehicleNearByDriver]
GO
ALTER TABLE [dbo].[GPSDataHistory] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [GPSDataReceivedDateTime]
GO
ALTER TABLE [dbo].[GPSDataHistory] ADD  DEFAULT ((0)) FOR [InternetSpeedInKBPS]
GO
ALTER TABLE [dbo].[GPSDataHistory] ADD  DEFAULT (CONVERT([bit],(0))) FOR [VehicleNearByDriver]
GO
ALTER TABLE [dbo].[GPSDataHistory] ADD  DEFAULT ((20230101)) FOR [PartitionDate]
GO
ALTER TABLE [dbo].[GPSDataTest] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [GPSDataReceivedDateTime]
GO
ALTER TABLE [dbo].[GPSDataTest] ADD  DEFAULT ((0)) FOR [InternetSpeedInKBPS]
GO
ALTER TABLE [dbo].[GPSDataTest] ADD  DEFAULT (CONVERT([bit],(0))) FOR [VehicleNearByDriver]
GO
ALTER TABLE [dbo].[NotificationHistory] ADD  DEFAULT ((0)) FOR [Count]
GO
ALTER TABLE [dbo].[NotificationHistory] ADD  DEFAULT ((20230101)) FOR [PartitionDate]
GO
ALTER TABLE [dbo].[Settings] ADD  DEFAULT ((0)) FOR [LogsDeletedTime]
GO
ALTER TABLE [dbo].[Settings] ADD  DEFAULT ((0)) FOR [TripBackupTime]
GO
ALTER TABLE [dbo].[DriverTrip]  WITH CHECK ADD  CONSTRAINT [FK_DriverTrip_Driver_DriverID] FOREIGN KEY([DriverID])
REFERENCES [dbo].[Driver] ([DriverID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DriverTrip] CHECK CONSTRAINT [FK_DriverTrip_Driver_DriverID]
GO
ALTER TABLE [dbo].[DriverTrip]  WITH CHECK ADD  CONSTRAINT [FK_DriverTrip_Vehicle_VehicleID] FOREIGN KEY([VehicleID])
REFERENCES [dbo].[Vehicle] ([VehicleID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DriverTrip] CHECK CONSTRAINT [FK_DriverTrip_Vehicle_VehicleID]
GO
ALTER TABLE [dbo].[DriverTripHistory]  WITH CHECK ADD  CONSTRAINT [FK_DriverTripHistory_Driver_DriverID] FOREIGN KEY([DriverID])
REFERENCES [dbo].[Driver] ([DriverID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DriverTripHistory] CHECK CONSTRAINT [FK_DriverTripHistory_Driver_DriverID]
GO
ALTER TABLE [dbo].[DriverTripHistory]  WITH CHECK ADD  CONSTRAINT [FK_DriverTripHistory_Vehicle_VehicleID] FOREIGN KEY([VehicleID])
REFERENCES [dbo].[Vehicle] ([VehicleID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DriverTripHistory] CHECK CONSTRAINT [FK_DriverTripHistory_Vehicle_VehicleID]
GO
ALTER TABLE [dbo].[GPSData]  WITH CHECK ADD  CONSTRAINT [FK_GPSData_DriverTrip_DriverTripID] FOREIGN KEY([DriverTripID])
REFERENCES [dbo].[DriverTrip] ([DriverTripID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GPSData] CHECK CONSTRAINT [FK_GPSData_DriverTrip_DriverTripID]
GO
ALTER TABLE [dbo].[GPSDataTest]  WITH CHECK ADD  CONSTRAINT [FK_GPSDataTest_DriverTrip_DriverTripID] FOREIGN KEY([DriverTripID])
REFERENCES [dbo].[DriverTrip] ([DriverTripID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GPSDataTest] CHECK CONSTRAINT [FK_GPSDataTest_DriverTrip_DriverTripID]
GO
ALTER TABLE [dbo].[NotificationHistory]  WITH CHECK ADD  CONSTRAINT [FK_NotificationHistory_Notification_NotificationID] FOREIGN KEY([NotificationID])
REFERENCES [dbo].[Notification] ([NotificationID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NotificationHistory] CHECK CONSTRAINT [FK_NotificationHistory_Notification_NotificationID]
GO
ALTER TABLE [dbo].[Trip]  WITH CHECK ADD  CONSTRAINT [FK_Trip_DriverTrip_DriverTripID] FOREIGN KEY([DriverTripID])
REFERENCES [dbo].[DriverTrip] ([DriverTripID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Trip] CHECK CONSTRAINT [FK_Trip_DriverTrip_DriverTripID]
GO
/****** Object:  StoredProcedure [dbo].[ActualizarGPSDataFlag]    Script Date: 17/02/2024 10:38:32 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ActualizarGPSDataFlag]
(@LastUpdateDate VARCHAR(23))
AS
BEGIN
    DECLARE @Speed INT;
    DECLARE @HDOP INT;
    SET @Speed = (SELECT Speed FROM dbo.Settings);
    SET @HDOP = (SELECT HDOP FROM dbo.Settings);
    DECLARE @DriverTripID INT;
 
    DECLARE @Resultado INT;
    SET @Resultado = 0;


    DECLARE trip_cursor CURSOR FOR

        SELECT DISTINCT D.DriverTripID
        FROM dbo.DriverTrip D
        JOIN dbo.GpsDataTest Gt ON D.DriverTripID = Gt.DriverTripID
        AND CONVERT(VARCHAR, Gt.GPSDataTime, 23) >= (SELECT CONVERT(VARCHAR, GETUTCDATE(), 23) AS CurrentUTCDate)
        JOIN dbo.Vehicle V ON D.VehicleID = V.VehicleID;

    OPEN trip_cursor;

    FETCH NEXT FROM trip_cursor INTO @DriverTripID;

    WHILE @@FETCH_STATUS = 0 
	BEGIN
        -- Filtro 1 (FLAG = 0)

		PRINT 'Antes de la actualización';
  
            IF EXISTS (
                    SELECT TOP 1 1
                    FROM dbo.GPSDataTest
                    WHERE DriverTripID = @DriverTripID
                    AND isIgnitionOn = 1
                    AND isOnGeoTabServer = 0
                    AND Flag = 0
					AND CONVERT(VARCHAR, GPSDataTime, 23) <= @LastUpdateDate 
                    ORDER BY GPSDataTime ASC
                )
				BEGIN
				PRINT 'Condición para la actualización es verdadera del Flag = 0';
    
						UPDATE dbo.GPSDataTest set isOnGeoTabServer= 1
						WHERE DriverTripID = @DriverTripID
						AND GPSDataTime = (
								SELECT TOP (1) GPSDataTime
								FROM dbo.GPSDataTest
								WHERE DriverTripID =  @DriverTripID
								AND isIgnitionOn = 1
								AND isOnGeoTabServer = 0
								AND Flag = 0
								AND CONVERT(VARCHAR, GPSDataTime, 23) <= @LastUpdateDate 
								ORDER BY GPSDataTime DESC
							)
				  END;

		-- Filtro 2 (FLAG = 1)

		  SET @Resultado = COALESCE(
			(SELECT TOP 1 Flag
			 FROM dbo.GPSDataTest
			 WHERE DriverTripID = @DriverTripID
			   AND isOnGeoTabServer = 1
			   AND isIgnitionOn = 1
			   AND CONVERT(VARCHAR, GPSDataTime, 23) <= @LastUpdateDate
			 ORDER BY GPSDataTime DESC), -1);

			PRINT 'Condición para la actualización es verdadera del Flag = 1';
			PRINT @Resultado

			IF @Resultado = 1
			BEGIN
				UPDATE dbo.GPSDataTest set isOnGeoTabServer= 1
				WHERE DriverTripID = @DriverTripID
				AND GPSDataTime <= (
						SELECT TOP (1) GPSDataTime
						FROM dbo.GPSDataTest
						WHERE DriverTripID = @DriverTripID
						AND CONVERT(VARCHAR, GPSDataTime, 23) <= @LastUpdateDate
						ORDER BY GPSDataTime DESC
					)
				AND GPSDataTime > (
						SELECT TOP (1) GPSDataTime
						FROM dbo.GPSDataTest
						WHERE DriverTripID = @DriverTripID
						AND isOnGeoTabServer = 1
						AND CONVERT(VARCHAR, GPSDataTime, 23) <= @LastUpdateDate
						ORDER BY GPSDataTime DESC
					)
				AND Flag =  1
				AND Speed > @Speed
				AND HDOP < @HDOP
			END;
			ELSE 
				BEGIN
					UPDATE dbo.GPSDataTest set isOnGeoTabServer= 1
					WHERE DriverTripID = @DriverTripID
					AND GPSDataTime <= (
							SELECT TOP (1) GPSDataTime
							FROM dbo.GPSDataTest
							WHERE DriverTripID = @DriverTripID
							AND isIgnitionOn = 1
							AND CONVERT(VARCHAR, GPSDataTime, 23) <= @LastUpdateDate
							ORDER BY GPSDataTime DESC
						)
					AND GPSDataTime > (
							SELECT TOP (1) GPSDataTime
							FROM dbo.GPSDataTest
							WHERE DriverTripID = @DriverTripID
							AND isIgnitionOn = 1						
							AND ((@Resultado =-1 AND isOnGeoTabServer = 0)
							OR (@Resultado = 0 AND isOnGeoTabServer = 1))						
							AND Flag = 0
							AND CONVERT(VARCHAR, GPSDataTime, 23) <= @LastUpdateDate
							ORDER BY GPSDataTime DESC
						)
					AND Speed > @Speed
					AND HDOP < @HDOP;
				END;

        -- Filtro 3 (FLAG = 2)
				IF EXISTS (
						SELECT TOP 1 1
						FROM dbo.GPSDataTest
						WHERE DriverTripID = @DriverTripID
						AND Flag = 2
						AND CONVERT(VARCHAR, GPSDataTime, 23) <= @LastUpdateDate
						ORDER BY GPSDataTime DESC
					)
                BEGIN
				PRINT 'Condición para la actualización es verdadera del Flag = 2';
					UPDATE dbo.GPSDataTest set isOnGeoTabServer= 1
					WHERE DriverTripID = @DriverTripID
					AND GPSDataTime = (
							SELECT TOP (1) GPSDataTime
							FROM dbo.GPSDataTest
							WHERE DriverTripID = @DriverTripID
							AND CONVERT(VARCHAR, GPSDataTime, 23) <= @LastUpdateDate
							ORDER BY GPSDataTime DESC
						)
					AND isIgnitionOn = 0;
				END;

           FETCH NEXT FROM trip_cursor INTO @DriverTripID;

	END;
    CLOSE trip_cursor;
    DEALLOCATE trip_cursor;
END  
 




--EXEC ActualizarGPSDataFlag '2023-10-08 12:12:49.000'
GO
/****** Object:  StoredProcedure [dbo].[ActualizarMasivoGPSDataFlag]    Script Date: 17/02/2024 10:38:32 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ActualizarMasivoGPSDataFlag]
(@DriverTripID int,
 @GPSDataTime VARCHAR(23))
AS
BEGIN
    DECLARE @Speed INT;
    DECLARE @HDOP INT;
    SELECT @Speed = Speed, @HDOP = HDOP FROM dbo.Settings;

        
            IF EXISTS (
                    SELECT 1
                    FROM dbo.GPSDataTest
                    WHERE DriverTripID = @DriverTripID
					AND GPSDataTime = @GPSDataTime 
                )
				BEGIN
				DECLARE @Flag INT;

				SELECT @Flag = Flag
				FROM dbo.GPSDataTest
				WHERE DriverTripID	= @DriverTripID
				AND GPSDataTime		= @GPSDataTime
				AND isOnGeoTabServer = 0;

				IF @Flag = 0
				BEGIN
					UPDATE dbo.GPSDataTest
					SET isOnGeoTabServer = 1
					WHERE DriverTripID = @DriverTripID
					AND GPSDataTime = @GPSDataTime
					AND Flag = 0;
				END;
				ELSE IF @Flag = 1
				BEGIN
					UPDATE dbo.GPSDataTest
					SET isOnGeoTabServer = 1
					WHERE DriverTripID = @DriverTripID
					AND GPSDataTime = @GPSDataTime
					AND Speed > @Speed
					AND HDOP < @HDOP
					AND Flag = 1;
				END;
				ELSE IF @Flag = 2
				BEGIN
					UPDATE dbo.GPSDataTest
					SET isOnGeoTabServer = 1
					WHERE DriverTripID = @DriverTripID
					AND GPSDataTime = @GPSDataTime
					AND isIgnitionOn = 0
					AND Flag = 2;
				END;
    END;
END;

--EXEC ActualizarMasivoGPSDataFlag 1486, '2023-10-24 16:51:29.000'
GO
/****** Object:  StoredProcedure [dbo].[DeleteLogByDate]    Script Date: 17/02/2024 10:38:32 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteLogByDate]
AS
BEGIN
	DECLARE @No_of_hours int
	DECLARE @Days int
	Set @Days = (select LogsDeletedTime from Settings)	
	Set @No_of_hours = @Days * 24

		DELETE from InputActionLog WHERE @No_of_hours <= DATEDIFF(hour, CreatedDate, getdate())	

		DELETE from ActionLog WHERE @No_of_hours <= DATEDIFF(hour, CreatedDate, getdate())
	print @No_of_hours
END

---EXEC DeleteLogByDate
--select * from Settings
GO
/****** Object:  StoredProcedure [dbo].[GetFilteredGPSDataDriverTripFlag]    Script Date: 17/02/2024 10:38:32 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetFilteredGPSDataDriverTripFlag]
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @boolValue BIT;
    SET @boolValue = 0; /* False */

    DECLARE @Speed INT;
    DECLARE @HDOP INT;
	DECLARE @SendRange INT;

    SELECT @Speed = Speed, @HDOP = HDOP, @SendRange = SendRange FROM dbo.Settings;

    DECLARE @TempResults TABLE (
        DriverTripID INT,
        dateTime DATETIME,
        serialNo NVARCHAR(20),
        type NVARCHAR(20),
        isAuxiliary1On BIT,
        isAuxiliary2On BIT,
        isAuxiliary3On BIT,
        isAuxiliary4On BIT,
        isAuxiliary5On BIT,
        isAuxiliary6On BIT,
        isAuxiliary7On BIT,
        isAuxiliary8On BIT,
        isGpsValid BIT,
        isIgnitionOn BIT,
        Latitude FLOAT,
        Longitude FLOAT,
        Speed NVARCHAR(20)
    );

    INSERT INTO @TempResults
    SELECT TOP (@SendRange)
        D.DriverTripID,
        Gt.GPSDataTime AS dateTime,
        V.VehicleSerialNo AS serialNo,
        'GpsRecord' AS type,
        @boolValue AS isAuxiliary1On,
        @boolValue AS isAuxiliary2On,
        @boolValue AS isAuxiliary3On,
        @boolValue AS isAuxiliary4On,
        @boolValue AS isAuxiliary5On,
        @boolValue AS isAuxiliary6On,
        @boolValue AS isAuxiliary7On,
        @boolValue AS isAuxiliary8On,
        Gt.isGpsValid,
        Gt.isIgnitionOn,
        Gt.Lat AS Latitude,
        Gt.Long AS Longitude,
        Gt.Speed AS Speed
    FROM dbo.DriverTrip D
    JOIN dbo.GpsDataTest Gt ON D.DriverTripID = Gt.DriverTripID
    JOIN dbo.Vehicle V ON D.VehicleID = V.VehicleID
    WHERE Gt.isOnGeoTabServer = 0
    AND (
        (Gt.Flag = 0 AND Gt.isIgnitionOn = 1)
        OR
        (Gt.Flag = 1 AND Gt.isIgnitionOn = 1 AND Gt.Speed > @Speed AND Gt.HDOP < @HDOP)
        OR
        (Gt.Flag = 2 AND Gt.isIgnitionOn = 0)
    )
    ORDER BY Gt.GPSDataTime;

    SELECT * FROM @TempResults ORDER BY dateTime;
END

--exec GetFilteredGPSDataDriverTripFlag
GO
/****** Object:  StoredProcedure [dbo].[GetFilteredGPSDataFlag]    Script Date: 17/02/2024 10:38:32 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetFilteredGPSDataFlag]
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @boolValue BIT;
    SET @boolValue = 0; /* False */

    DECLARE @Speed INT;
    DECLARE @HDOP INT;
    SET @Speed = (SELECT Speed FROM dbo.Settings);
    SET @HDOP = (SELECT HDOP FROM dbo.Settings);

    DECLARE @DriverTripID INT;
    DECLARE @VehicleSerialNo NVARCHAR(20);
    DECLARE @RecordCount INT;
    SET @RecordCount = 0;

    DECLARE @Resultado INT;
    SET @Resultado = 0;

    -- Crear una tabla temporal para almacenar los resultados
    CREATE TABLE #TempResults (
        DriverTripID INT,
        dateTime DATETIME,
        serialNo NVARCHAR(20),
        type NVARCHAR(20),
        isAuxiliary1On BIT,
        isAuxiliary2On BIT,
        isAuxiliary3On BIT,
        isAuxiliary4On BIT,
        isAuxiliary5On BIT,
        isAuxiliary6On BIT,
        isAuxiliary7On BIT,
        isAuxiliary8On BIT,
        isGpsValid BIT,
        isIgnitionOn BIT,
        Latitude FLOAT,
        Longitude FLOAT,
        Speed NVARCHAR(20)
    );

    DECLARE trip_cursor CURSOR FOR

        SELECT DISTINCT D.DriverTripID, V.VehicleSerialNo
        FROM dbo.DriverTrip D
        JOIN dbo.GpsDataTest Gt ON D.DriverTripID = Gt.DriverTripID
        AND CONVERT(VARCHAR, Gt.GPSDataTime, 23) >= (SELECT CONVERT(VARCHAR, GETUTCDATE(), 23) AS CurrentUTCDate)
        JOIN dbo.Vehicle V ON D.VehicleID = V.VehicleID;

    OPEN trip_cursor;

    FETCH NEXT FROM trip_cursor INTO @DriverTripID, @VehicleSerialNo;

    WHILE @@FETCH_STATUS = 0 AND @RecordCount < 2000
    BEGIN
        -- Filtro 1 (FLAG = 0)
        IF @RecordCount < 2000
        BEGIN
            IF EXISTS (
                    SELECT TOP 1 1
                    FROM dbo.GPSDataTest
                    WHERE DriverTripID = @DriverTripID
                    AND isIgnitionOn = 1
                    AND isOnGeoTabServer = 0
                    AND Flag = 0
                    ORDER BY GPSDataTime ASC
                )
                INSERT INTO #TempResults
                SELECT TOP (2000 - @RecordCount) @DriverTripID AS DriverTripID, 
						GPSDataTime AS dateTime,
                        @VehicleSerialNo AS serialNo,
                        'GpsRecord' AS type,
                        @boolValue AS isAuxiliary1On,
                        @boolValue AS isAuxiliary2On,
                        @boolValue AS isAuxiliary3On,
                        @boolValue AS isAuxiliary4On,
                        @boolValue AS isAuxiliary5On,
                        @boolValue AS isAuxiliary6On,
                        @boolValue AS isAuxiliary7On,
                        @boolValue AS isAuxiliary8On,
                        isGpsValid AS isGpsValid,
                        isIgnitionOn AS isIgnitionOn,
                        Lat AS Latitude,
                        Long AS Longitude,
                        Speed AS Speed
                FROM dbo.GPSDataTest
                WHERE DriverTripID = @DriverTripID
                AND GPSDataTime = (
                        SELECT TOP (1) GPSDataTime
                        FROM dbo.GPSDataTest
                        WHERE DriverTripID = @DriverTripID
                        AND isIgnitionOn = 1
                        AND isOnGeoTabServer = 0
                        AND Flag = 0
                        ORDER BY GPSDataTime DESC
                    )

                ORDER BY GPSDataTime;

            SET @RecordCount = @RecordCount + @@ROWCOUNT;
       END;
 
        -- Filtro 2 (FLAG = 1)
        IF @RecordCount < 2000
		SET @Resultado = COALESCE(
			(SELECT TOP 1 Flag
			 FROM dbo.GPSDataTest
			 WHERE DriverTripID = @DriverTripID
			   AND isOnGeoTabServer = 1
			   AND isIgnitionOn = 1
			 ORDER BY GPSDataTime DESC), -1);

        IF @Resultado = 1
        BEGIN
            INSERT INTO #TempResults
            SELECT TOP (2000 - @RecordCount) @DriverTripID AS DriverTripID, 
					GPSDataTime AS dateTime,
                    @VehicleSerialNo AS serialNo,
                    'GpsRecord' AS type,
                    @boolValue AS isAuxiliary1On,
                    @boolValue AS isAuxiliary2On,
                    @boolValue AS isAuxiliary3On,
                    @boolValue AS isAuxiliary4On,
                    @boolValue AS isAuxiliary5On,
                    @boolValue AS isAuxiliary6On,
                    @boolValue AS isAuxiliary7On,
                    @boolValue AS isAuxiliary8On,
                    isGpsValid AS isGpsValid,
                    isIgnitionOn AS isIgnitionOn,
                    Lat AS Latitude,
                    Long AS Longitude,
                    Speed AS Speed
            FROM dbo.GPSDataTest
            WHERE DriverTripID = @DriverTripID
            AND GPSDataTime <= (
                    SELECT TOP (1) GPSDataTime
                    FROM dbo.GPSDataTest
                    WHERE DriverTripID = @DriverTripID
                    ORDER BY GPSDataTime DESC
                )
            AND GPSDataTime > (
                    SELECT TOP (1) GPSDataTime
                    FROM dbo.GPSDataTest
                    WHERE DriverTripID = @DriverTripID
                    AND isOnGeoTabServer = 1
                    ORDER BY GPSDataTime DESC
                )
			AND Flag =  1
            AND Speed > @Speed
            AND HDOP < @HDOP

            ORDER BY GPSDataTime;

            SET @RecordCount = @RecordCount + @@ROWCOUNT;
		END;
        ELSE 
			BEGIN
				INSERT INTO #TempResults
				SELECT TOP (2000 - @RecordCount) @DriverTripID AS DriverTripID, 
						GPSDataTime AS dateTime,
						@VehicleSerialNo AS serialNo,
						'GpsRecord' AS type,
						@boolValue AS isAuxiliary1On,
						@boolValue AS isAuxiliary2On,
						@boolValue AS isAuxiliary3On,
						@boolValue AS isAuxiliary4On,
						@boolValue AS isAuxiliary5On,
						@boolValue AS isAuxiliary6On,
						@boolValue AS isAuxiliary7On,
						@boolValue AS isAuxiliary8On,
						isGpsValid AS isGpsValid,
						isIgnitionOn AS isIgnitionOn,
						Lat AS Latitude,
						Long AS Longitude,
						Speed AS Speed
				FROM dbo.GPSDataTest
				WHERE DriverTripID = @DriverTripID
				AND GPSDataTime <= (
						SELECT TOP (1) GPSDataTime
						FROM dbo.GPSDataTest
						WHERE DriverTripID = @DriverTripID
						AND isIgnitionOn = 1
						ORDER BY GPSDataTime DESC
					)
				AND GPSDataTime > (
						SELECT TOP (1) GPSDataTime
						FROM dbo.GPSDataTest
						WHERE DriverTripID = @DriverTripID
						AND isIgnitionOn = 1						
						AND ((@Resultado =-1 AND isOnGeoTabServer = 0)
						OR (@Resultado = 0 AND isOnGeoTabServer = 1))						
						AND Flag = 0
						ORDER BY GPSDataTime DESC
					)
				AND Speed > @Speed
				AND HDOP < @HDOP;
			END;


        -- Filtro 3 (FLAG = 2)
        IF @RecordCount < 2000
        BEGIN
            IF EXISTS (
                    SELECT TOP 1 1
                    FROM dbo.GPSDataTest
                    WHERE DriverTripID = @DriverTripID
                    AND Flag = 2
                    ORDER BY GPSDataTime DESC
                )
                INSERT INTO #TempResults
                SELECT TOP (2000 - @RecordCount) @DriverTripID AS DriverTripID, 
						GPSDataTime AS dateTime,
                        @VehicleSerialNo AS serialNo,
                        'GpsRecord' AS type,
                        @boolValue AS isAuxiliary1On,
                        @boolValue AS isAuxiliary2On,
                        @boolValue AS isAuxiliary3On,
                        @boolValue AS isAuxiliary4On,
                        @boolValue AS isAuxiliary5On,
                        @boolValue AS isAuxiliary6On,
                        @boolValue AS isAuxiliary7On,
                        @boolValue AS isAuxiliary8On,
                        isGpsValid AS isGpsValid,
                        isIgnitionOn AS isIgnitionOn,
                        Lat AS Latitude,
                        Long AS Longitude,
                        Speed AS Speed
                FROM dbo.GPSDataTest
                WHERE DriverTripID = @DriverTripID
                AND GPSDataTime = (
                        SELECT TOP (1) GPSDataTime
                        FROM dbo.GPSDataTest
                        WHERE DriverTripID = @DriverTripID
                        ORDER BY GPSDataTime DESC
                    )
                AND isIgnitionOn = 0;

            SET @RecordCount = @RecordCount + @@ROWCOUNT;
        END;
	 	
        FETCH NEXT FROM trip_cursor INTO @DriverTripID, @VehicleSerialNo;
   END;

    CLOSE trip_cursor;
    DEALLOCATE trip_cursor;

    -- Seleccionar todos los registros acumulados al final
    SELECT  dateTime,serialNo,type,isAuxiliary1On,isAuxiliary2On,isAuxiliary3On,isAuxiliary4On,isAuxiliary5On,isAuxiliary6On,isAuxiliary7On,isAuxiliary8On,isGpsValid,
			isIgnitionOn,Latitude ,Longitude,Speed 
	FROM #TempResults ORDER BY dateTime;

    -- Eliminar la tabla temporal
    DROP TABLE #TempResults;
END

--exec GetFilteredGPSDataFlag
GO
/****** Object:  StoredProcedure [dbo].[GPSDataOnGeotabProc]    Script Date: 17/02/2024 10:38:32 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GPSDataOnGeotabProc]
(
   @VehicleSerialNo nvarchar(20),
   @DriverTripID int,
   @flag int
)
AS
BEGIN

DECLARE @boolValue bit
Set @boolValue = 0  /* False */

DECLARE @Speed int
DECLARE @HDOP int
Set @Speed = (select Speed from Settings)
Set @HDOP = (select HDOP from Settings)

if(@flag = 0)
	begin
	--start the Trip in online and offline
		select GPSDataTime as dateTime,
			@VehicleSerialNo as serialNo,
			'GpsRecord' as type,
			@boolValue as isAuxiliary1On,
			@boolValue as isAuxiliary2On,
			@boolValue as isAuxiliary3On,
			@boolValue as isAuxiliary4On,
			@boolValue as isAuxiliary5On,
			@boolValue as isAuxiliary6On,
			@boolValue as isAuxiliary7On,
			@boolValue as isAuxiliary8On,
			isGpsValid as isGpsValid,
			isIgnitionOn as isIgnitionOn,
			Lat  AS Latitude,
			Long  AS Longitude,
			speed as Speed
			from GPSData where DriverTripID=@DriverTripID And (GPSDataTime = ( select TOP(1) GPSDataTime from GPSData where DriverTripID = @DriverTripID and isIgnitionOn = 1 and isOnGeoTabServer = 0 order by GPSDataTime desc))order by GPSDataTime

	end
else if(@flag = 1)
	begin
	--Trip data in online and offline
		select GPSDataTime as dateTime,
			@VehicleSerialNo as serialNo,
			'GpsRecord' as type,
			@boolValue as isAuxiliary1On,
			@boolValue as isAuxiliary2On,
			@boolValue as isAuxiliary3On,
			@boolValue as isAuxiliary4On,
			@boolValue as isAuxiliary5On,
			@boolValue as isAuxiliary6On,
			@boolValue as isAuxiliary7On,
			@boolValue as isAuxiliary8On,
			isGpsValid as isGpsValid,
			isIgnitionOn as isIgnitionOn,
			Lat  AS Latitude,
			Long  AS Longitude,
			speed as Speed
			from GPSData where DriverTripID = @DriverTripID And (GPSDataTime <= (select TOP(1) GPSDataTime from GPSData where DriverTripID = @DriverTripID order by GPSDataTime desc) and 
			GPSDataTime > (select TOP(1) GPSDataTime from GPSData where DriverTripID = @DriverTripID and isOnGeoTabServer = 1 order by GPSDataTime desc ) and Speed > @Speed and HDOP < @HDOP)  order by GPSDataTime
	end
else
	begin
	--end the Trip in online
		select GPSDataTime as dateTime,
			@VehicleSerialNo as serialNo,
			'GpsRecord' as type,
			@boolValue as isAuxiliary1On,
			@boolValue as isAuxiliary2On,
			@boolValue as isAuxiliary3On,
			@boolValue as isAuxiliary4On,
			@boolValue as isAuxiliary5On,
			@boolValue as isAuxiliary6On,
			@boolValue as isAuxiliary7On,
			@boolValue as isAuxiliary8On,
			isGpsValid as isGpsValid,
			isIgnitionOn as isIgnitionOn,
			Lat  AS Latitude,
			Long  AS Longitude,
			speed as Speed
			from GPSData where DriverTripID=@DriverTripID And (GPSDataTime = ( select TOP(1) GPSDataTime from GPSData where DriverTripID = @DriverTripID order by GPSDataTime desc)and isIgnitionOn = 0) order by GPSDataTime
	end
END

--exec GPSDataOnGeotabProc 'CX8D2141A250',86,1

GO
/****** Object:  StoredProcedure [dbo].[InsertGPSDataProc]    Script Date: 17/02/2024 10:38:32 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[InsertGPSDataProc]  
   @GPSData dbo.GPSDataType READONLY   
AS  
BEGIN  

   INSERT INTO dbo.GPSData
   SELECT GPSID,DriverTripID,Lat,Long,Speed,BateryLavel,HDOP,VDOP,Satellite,GPSDataTime,isGpsValid,isIgnitionOn,isOnGeoTabServer,isOnlineGPSData,GPSDataReceivedDateTime,InternetSpeedInKBPS,VehicleNearByDriver,GPSDataCurrentZoneDateTime FROM @GPSData  

END


GO
/****** Object:  StoredProcedure [dbo].[InsertGPSDataTestProc]    Script Date: 17/02/2024 10:38:32 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[InsertGPSDataTestProc]  
   @GPSDataTest dbo.GPSDataTestType READONLY   
AS  
BEGIN  

   INSERT INTO dbo.GPSDataTest
   SELECT GPSID,DriverTripID,Lat,Long,Speed,BateryLavel,HDOP,VDOP,Satellite,GPSDataTime,isGpsValid,isIgnitionOn,isOnGeoTabServer,isOnlineGPSData,GPSDataReceivedDateTime,InternetSpeedInKBPS,VehicleNearByDriver,GPSDataCurrentZoneDateTime,Flag FROM @GPSDataTest  

END
GO
/****** Object:  StoredProcedure [dbo].[TripBackupProc]    Script Date: 17/02/2024 10:38:32 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[TripBackupProc]

AS
		BEGIN
		SET NOCOUNT ON
		---Insert trip tables values in history tables 		
		DECLARE @Date datetime2
		DECLARE @No_of_days int
		Set @No_of_days = (select TripBackupTime from Settings)		
		Set @Date = DATEADD(DAY, -@No_of_days, getdate())

		-- DriverTripHistory Table
		Create Table #DriverTripHistoryTemp (DriverTripID Int,DriverID int,VehicleID int,TripStart datetime2,TripEnd datetime2,TripRunningStatus bit,GPSDataTimeZone nvarchar(max),TripLogsLink nvarchar(max),PartitionDate int)

		INSERT INTO #DriverTripHistoryTemp SELECT DriverTripID,DriverID,VehicleID,TripStart,TripEnd,TripRunningStatus,GPSDataTimeZone,TripLogsLink,CONVERT(int, FORMAT([TripStart], 'yyyyMM')) FROM DriverTrip WHERE CAST(TripStart AS DATE) < CAST(@Date AS DATE);

		INSERT INTO DriverTripHistory SELECT  DriverTripID,DriverID,VehicleID,TripStart,TripEnd,TripRunningStatus,GPSDataTimeZone,TripLogsLink,PartitionDate FROM #DriverTripHistoryTemp
		

		-- GPSDataHistory Table
		Create Table #GPSDataHistoryTemp (GPSID uniqueidentifier,DriverTripID int,Lat float,Long float,Speed nvarchar(50),BatteryLevel nvarchar(50),HDOP nvarchar(50),VDOP nvarchar(50),Satellite nvarchar(50),GPSDataTime datetime2(7),isGpsValid bit,isIgnitionOn bit,isOnGeoTabServer bit,isOnlineGPSData bit,GPSDataReceivedDateTime datetime2,InternetSpeedInKBPS int,VehicleNearByDriver bit,GPSDataCurrentZoneDateTime nvarchar(max),Flag int,PartitionDate int)

		INSERT INTO #GPSDataHistoryTemp select GPSID,DriverTripID,Lat,Long,Speed,BatteryLevel,HDOP,VDOP,Satellite,GPSDataTime,isGpsValid,isIgnitionOn,isOnGeoTabServer,isOnlineGPSData,GPSDataReceivedDateTime,InternetSpeedInKBPS,VehicleNearByDriver,GPSDataCurrentZoneDateTime,Flag,CONVERT(int, FORMAT([GPSDataTime], 'yyyyMMdd')) from GPSDataTest where DriverTripID in (Select DriverTripID from #DriverTripHistoryTemp)

		INSERT INTO GPSDataHistory SELECT GPSID,DriverTripID,Lat,Long,Speed,BatteryLevel,HDOP,VDOP,Satellite,GPSDataTime,isGpsValid,isIgnitionOn,isOnGeoTabServer,isOnlineGPSData,GPSDataReceivedDateTime,InternetSpeedInKBPS,VehicleNearByDriver,GPSDataCurrentZoneDateTime,Flag,PartitionDate FROM #GPSDataHistoryTemp
		

		--delete from GPSData where DriverTripID in(Select DriverTripID from #DriverTripTemp)
		delete from DriverTrip where DriverTripID in(Select DriverTripID from #DriverTripHistoryTemp) 


		--select * from #DriverTripHistoryTemp
		--select * from #GPSDataHistoryTemp


		print CAST(@No_of_days AS  int);
		print CAST(@Date AS DATE);


	END

--EXEC TripBackupProc;
GO
/****** Object:  StoredProcedure [dbo].[UpdateIsOnGeoTabServerOnGPSDataProc]    Script Date: 17/02/2024 10:38:32 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[UpdateIsOnGeoTabServerOnGPSDataProc]
(
   @DriverTripID int,
   @flag int
)
AS
BEGIN

DECLARE @Speed int
DECLARE @HDOP int
Set @Speed = (select Speed from Settings)
Set @HDOP = (select HDOP from Settings)

if(@flag = 0)
	begin
	--update isOnGeoTabServer on start gps data
		update GPSData set isOnGeoTabServer= 1 
		 where DriverTripID=@DriverTripID And GPSDataTime = ( select TOP(1) GPSDataTime from GPSData where DriverTripID = @DriverTripID and isIgnitionOn = 1 and isOnGeoTabServer = 0 order by GPSDataTime desc) 
	end

else if(@flag = 1)
	begin
	--update isOnGeoTabServer Trip data
		update GPSData set isOnGeoTabServer= 1 
		 where DriverTripID = @DriverTripID And (GPSDataTime <= (select TOP(1) GPSDataTime from GPSData where DriverTripID = @DriverTripID order by GPSDataTime desc) and 
		 GPSDataTime > (select TOP(1) GPSDataTime from GPSData where DriverTripID = @DriverTripID and isOnGeoTabServer = 1 order by GPSDataTime desc ) and Speed > @Speed and HDOP < @HDOP)
	end

else
	begin
	--update isOnGeoTabServer end gps data
		 update GPSData set isOnGeoTabServer= 1 
		 where DriverTripID=@DriverTripID And GPSDataTime = ( select TOP(1) GPSDataTime from GPSData where DriverTripID = @DriverTripID order by GPSDataTime desc)and isIgnitionOn = 0 

	end
END
GO
/****** Object:  StoredProcedure [dbo].[VehicleRelease]    Script Date: 17/02/2024 10:38:32 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[VehicleRelease]

AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    --SELECT * FROM Driver WHERE VehicleAlloted Like'%_%'
		DECLARE @VehicleReleasedtime int
		Set @VehicleReleasedtime = (select VehicleAllocatedTime from Settings)

		/*update Driver
		set VehicleAllotted = ''
		WHERE VehicleAllotted like '%_%' and DATEDIFF(MINUTE, VehicleAllocatedTime, CURRENT_TIMESTAMP ) > @VehicleReleasedtime
		and Driver.DriverID not IN (select DriverTrip.DriverID from DriverTrip where TripRunningStatus = 1)
		*/

		--update Driver
		--set VehicleAllotted = ''
		--WHERE VehicleAllotted like '%_%' and DATEDIFF(MINUTE, VehicleAllocatedTime, CURRENT_TIMESTAMP ) > 5
		--and Driver.DriverID not IN (select DriverTrip.DriverID from DriverTrip where TripRunningStatus = 1)

	--select * from Driver
	--WHERE VehicleAlloted like '%_%' and DATEDIFF(MINUTE, VehicleAllocatedTime, CURRENT_TIMESTAMP ) > 5
	--and  Driver.DriverID not IN (select DriverTrip.DriverID from DriverTrip where TripRunningStatus = 1)
END
GO
ALTER DATABASE [GoApp_Dev] SET  READ_WRITE 
GO
