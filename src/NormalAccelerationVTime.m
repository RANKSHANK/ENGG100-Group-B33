function TangentialAccelerationVTime(time, eastingVelocity, northingVelocity, altitudeVelocity, eastingRho, northingRho, altitudeRho)
    eastingNormal = zeros(1, length(time));
    northingNormal = zeros(1, length(time));
    altitudeNormal = zeros(1, length(time));
    for(index = 1:length(time))
       if(eastingRho(index ~= 0))
           eastingNormal(index) = eastingVelocity(index).^2 / eastingRho(index);
       end
       if(northingRho(index ~= 0))
           northingNormal(index) = northingVelocity(index).^2 / northingRho(index);
       end
       if(altitudeRho(index ~= 0))
           altitudeNormal(index) = altitudeVelocity(index).^2 / altitudeRho(index);
       end 
    end
    plot(time - time(1), eastingNormal);
    hold on;
    plot(time - time(1), northingNormal);
    plot(time - time(1), altitudeNormal);
    plot(time - time(1), sqrt(eastingNormal.^2 + (northingNormal).^2 + (altitudeNormal).^2));
    hold off;
    xlabel('Time (s)');
    ylabel('Tangential Acceleration (ms^-2)');
    legend('Easting Tangential Acceleration','Northing Tangential Acceleration',' Altitude Tangential Acceleration', 'Accelration Magnitude');
    title('Tangential Acceleration V.S. Time');
end