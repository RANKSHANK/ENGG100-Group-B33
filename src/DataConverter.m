%% Converts latitude and longitude to northing and easting respectively
%   Params
%       latitude : latitude coordinate array
%       longitude: longitude coordinate array
%   Returns
%       northing: vertical coordinates based on latitude
%       easting : horizontal coordinates based on longitude
    function [northing, easting] = DataConverter(latitude,longitude)
        % Initialize constants used for calculation
        % Equatorial Radius
        equatorialRadius = 6378137;
        % Polar Radius
        polarRadius = 6356752.3142;
        % Scale Factor
        scaleFactor = 0.9996;
        % Eccentricity
        eccentricity = sqrt(1 - (polarRadius / equatorialRadius)^2);
        e1sq = eccentricity^2 / (1 - eccentricity^2);
        n = (equatorialRadius - polarRadius) / (equatorialRadius + polarRadius);
        % Meridional Arc Constants
        A0 = equatorialRadius * (1 - n + (5 * n * n / 4) * (1 - n) + (81 * n^4 / 64) * ( 1 - n));
        B0 = (3 * equatorialRadius * n / 2) * (1 - n - (7 * n * n / 8) * ( 1 - n) + 55 * n^4 / 64);
        C0 = (15 * equatorialRadius * n^2 / 16) * (1 - n + ( 3 * n^2 / 4) * (1 - n));
        D0 = (35 * equatorialRadius * n^3 /48) * (1 - n + 11 * n^2 / 16);
        E0 = (315 * equatorialRadius * n^4 / 51) * (1 - n);
        % Calculation constants
        SIN_1 = pi / (180 * 3600);
        % Pre allocate the easting array
        easting = zeros(1,length(latitude));
        % Pre allocate the northing array
        northing = zeros(1,length(longitude));
        % iterate through the coordinates using fori
        for(index = 1:length(latitude))
            % grab the latitude at the given index
            lat = latitude(index);
            % grab the longitude at the given index
            long = longitude(index);
            % Calculations transcribed from the supplied spreadsheet.
            % There are *magic* values everywhere.
            % Here be dragons. 
            longZone = 31 + floor(long / 6);
            longZoneCM = 6 * longZone - 183;
            deltaLong = (long - longZoneCM) * 3600 / 10000;
            latitudeRadians = lat * pi / 180;
            nu = equatorialRadius / sqrt(1 - (eccentricity * sin(latitudeRadians))^2);
            meridionalArc = A0 * latitudeRadians - B0 * sin(2 * latitudeRadians) + C0 * sin(4 * latitudeRadians) - D0 * sin(6 * latitudeRadians) + E0 * sin(8 * latitudeRadians);
            Ki = meridionalArc * scaleFactor;
            Kii = nu * sin(latitudeRadians) * cos(latitudeRadians) * SIN_1^2 * scaleFactor * 100000000 / 2;
            Kiii = ((SIN_1^4 * nu * sin(latitudeRadians) * cos(latitudeRadians)^3) / 24) * (5 - tan(latitudeRadians)^2 + 9 * e1sq * cos(latitudeRadians)^2 + 4 * e1sq^2 * cos(latitudeRadians) ^ 4) * scaleFactor * 10000000000000000;
            Kiv = nu * cos(latitudeRadians) * SIN_1 * scaleFactor * 10000;
            Kv = (SIN_1 * cos(latitudeRadians))^3 * (nu / 6) * (1 - tan(latitudeRadians)^2 + e1sq * cos(latitudeRadians)^2) * scaleFactor * 1000000000000;
            rawNorthing = Ki + Kii * deltaLong^2 + Kiii * deltaLong^4;
            % Store the easting coordinates at the given index
            easting(index) = 500000 + (Kiv * deltaLong + Kv * deltaLong^3);
            % Store the northing coordinates at the given index
            if(rawNorthing < 0)
                northing(index) = 10000000 + rawNorthing;
            else
                northing(index) = rawNorthing;
            end
        end
    end

