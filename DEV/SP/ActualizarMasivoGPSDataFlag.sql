/****** Object:  StoredProcedure [dbo].[ActualizarMasivoGPSDataFlag]    Script Date: 5/03/2024 3:14:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[ActualizarMasivoGPSDataFlag]
(@DriverTripID int,
 @GPSDataTime VARCHAR(23))
AS
BEGIN

    PRINT 'DriverTripID: ' + CONVERT(VARCHAR(10), @DriverTripID)
    PRINT 'GPSDataTime: ' + @GPSDataTime
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

--EXEC ActualizarMasivoGPSDataFlag 63, ' 2024-03-01 20:19:06.000'
