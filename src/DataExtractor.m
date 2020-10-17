% Function for extracting the valid data from the supplied data
%
% Params
%       filepath : the string path for the file
% Returns
%       timestamp: timestamp for the measurements
%       altitude : hieght coordinate
%       latitude : coordinates in latitude
%       logitude : coordinates in longitude
    function [timeStamp, altitude, latitude, longitude] = DataExtractor(filepath)
        % Open the file using the supplied filepath
        file = fopen(filepath, 'r');
        timeStamp = [];
        latitude = [];
        longitude = [];
        altitude = [];
        % Iterate through the entirety of the files
        while(~feof(file))
            % 1) Read the line without the newline character
            % 2) Remove whitespaces
            % 3) Remove the exclamation
            % 4) Remove the hash
            % 5) Split the string at the colon
            % 6) Store the split string array
            data = split(strrep(erase(erase(fgetl(file), '!'), '#'), ' ', ''),':');
            % Allocate data[2] to the correct array using a switch
            % statement on data[1]
            switch data{1}
                case 'Timestamp'
                    timeStamp = [timeStamp, str2double(data{2})];
                case 'lat'
                    latitude = [latitude, str2double(data{2})];
                case 'long'
                    longitude = [longitude, str2double(data{2})];
                case 'Altitude'
                    altitude = [altitude, str2double(data{2})];
                otherwise
                    disp('ERROR PARSING LINE DATA TYPE: ' + data{1});
            end
        end
        % ALWAYS close the stream
        fclose(file);
    end