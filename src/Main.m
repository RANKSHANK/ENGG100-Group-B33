%% Main class for executing all the scripts.
% Spec lists max number of 10 statements in this file
    % Calls the extract data script which loads and converts variables from
    % the provided spreadsheet
    [time, alt, lat, long] = DataExtractor('Group-B33.dat');
   