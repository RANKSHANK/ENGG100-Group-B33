function GroundSpeedVTime(time, eastingVelocity, northingVelocity) %calls for all variables and utilises easting and northing velocity for velocity 
    plot(time - time(1), sqrt((eastingVelocity).^2+(northingVelocity).^2));
    grid on;
    xlabel ('time (s)');
    ylabel ('Velocity (km/h)');
    title('Ground velocity vs time graph');
end