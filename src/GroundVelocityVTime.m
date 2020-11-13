function GroundVelocityVTime(time, eastingVelocity, northingVelocity) %calls for all variables and utilises easting and northing velocity for velocity 
    plot(timeStamp, abs(eastingVelocity)+abs(northingVelocity));
    grid on;
    xlabel ('time (s)');
    ylabel ('Velocity (km/h)');
    title('Ground velocity vs time graph');
end