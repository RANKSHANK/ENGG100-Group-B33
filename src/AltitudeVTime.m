%part 2
function AltitudeVTime (time, altitude) %graph 2 only calls for time and altitude
    plot(time - time(1), altitude); 
    grid on;
    xlabel ('Time (s)');
    ylabel ('Altitude (m)');
    title('Altitude V.S. Time');
end