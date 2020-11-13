function Displacement3D (altitude,easting,northing)
    origin = [easting(1), altitude(1), northing(1)]; %idenitifies origin (0,0,0) 
    plot3((easting - origin(1))/1E3, (northing - origin(3)) / 1E3, altitude - origin (2)); %data points at origin
    grid on;
    xlabel ('Easting (km)');
    zlabel ('Altitude (m)');
    ylabel ('Northing (km)');
    title('3 Dimensional Displacement');
end