%part 2
function AltitudeVTime (timeStamp,altitude) %graph 2 only calls for time and altitude
    plot(timeStamp,altitude); 
    grid on;
    xlabel ('Time (s)');
    ylabel ('Altitude (m)');
    title('Altitude V.S. Time');
end