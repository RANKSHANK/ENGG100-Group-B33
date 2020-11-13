function TangentialAccelerationVTime(time, eastingAcceleration, northingAcceleration, altitudeAcceleration, eastingRho, northingRho, altitudeRho)
    plot(time - time(1), eastingAcceleration.^2 / eastingRho);
    hold on;
    plot(time - time(1), northingAcceleration.^ 2 / northingRho);
    plot(time - time(1), altitudeAcceleration.^2 / altitudeRho);
    plot(time - time(1), sqrt((eastingAcceleration.^2/eastingRho).^2 + (northingAcceleration.^ 2 / northingRho).^2 + (altitudeAcceleration.^2 / altitudeRho).^2));
    hold off;
    xlabel('Time (s)');
    ylabel('Tangential Acceleration (ms^-2)');
    legend('Easting Tangential Acceleration','Northing Tangential Acceleration',' Altitude Tangential Acceleration', 'Accelration Magnitude');
    title('Tangential Acceleration V.S. Time');
end