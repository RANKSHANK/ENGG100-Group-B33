%% Main class for executing all the scripts.
% Spec lists max number of 10 statements in this file
    % Calls the extract data script which loads and converts variables from
    %   the provided spreadsheet
    [time, altitude, latitude, longitude] = DataExtractor('Group-B33.dat');
    % Calls the converter script which converts latitude and longitude to
    %   easting and northing
    [northing, easting] = DataConverter(latitude, longitude);