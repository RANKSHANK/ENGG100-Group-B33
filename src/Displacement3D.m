function Displacement3D (altitude,easting,northing)
    origin = [easting(1), altitude(1), northing(1)]; %idenitifies origin (0,0,0) 
    plot3(easting - origin(1), northing - origin(3), altitude - origin (2)); %data points at origin
    grid on;
    xlabel ('Eastings');
    zlabel ('Altitude');
    ylabel ('Northing');
    title('3 Dimensional Displacement');
end