function TangentialAccelerationVTime(time, eastingAcceleration, northingAcceleration, altitudeAcceleration)
    plot(time - time(1), eastingAcceleration);
    hold on;
    plot(time - time(1), northingAcceleration);
    plot(time - time(1), altitudeAcceleration);
    plot(time - time(1), sqrt(eastingAcceleration.^2 + northingAcceleration.^2 + altitudeAcceleration.^2));
    hold off;
    xlabel('Time (s)');
    ylabel('Tangential Acceleration (ms^-2)');
    legend('Easting Tangential Acceleration','Northing Tangential Acceleration',' Altitude Tangential Acceleration', 'Accelration Magnitude');
    title('Tangential Acceleration V.S. Time');
end