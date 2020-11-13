%%  Main class for executing all the scripts.
%   Spec lists max number of 10 statements in this file
    %   Calls the extract data script which loads and converts variables from
    %   the provided spreadsheet
    [time, altitude, latitude, longitude] = DataExtractor('Group-B33.dat');
    %   Calls the converter script which converts latitude and longitude to
    %   easting and northing
    [northing, easting] = DataConverter(latitude, longitude);
    %   Calls the dynamics processor function that extracts the velocity,
    %   acceleration, and curvature of motion from the supplied data
    [eastingVelocity, northingVelocity, altitudeVelocity, eastingAcceleration, northingAcceleration, altitudeAcceleration, eastingRho, northingRho] = DynamicsProcessor(altitude, easting, northing);
    %%  Instantiate the GUI with the relevant data
    GUICreator(time, easting, northing, altitude, eastingVelocity, northingVelocity, altitudeVelocity, eastingAcceleration, northingAcceleration, altitudeAcceleration, eastingRho, northingRho, altitudeRho);
