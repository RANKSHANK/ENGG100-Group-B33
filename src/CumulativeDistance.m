 function CumulativeDistance (time,easting,northing, altitude) %calls for all these variables    
    cumulativeSum = 0;
    cumulativeDistance = zeros(length(time), 1);
    for(index = 2:length(time)) %2:719 is the size of each array where in selects a subset. (excel table)
        cumulativeSum = cumulativeSum + abs(easting(index) - easting(index - 1)) + abs(northing(index) - northing(index - 1)) + abs(altitude(index) - altitude(index - 1));
        cumulativeDistance(index) = cumulativeSum;
    end
        
    plot(time - time(1),cumulativeDistance ./ 1E3);
    grid on;
    xlabel ('Time (s)');
    ylabel ('Cumulative Distance (km)');
    title('Cumulative Distance V.S. Time');
 end
 