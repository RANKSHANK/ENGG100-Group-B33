% Called in main to create the graph window
function GUICreator(time, easting, northing, altitude, eastingVelocity, northingVelocity, altitudeVelocity, eastingAcceleration, northingAcceleration, altitudeAcceleration, eastingRho, northingRho, altitudeRho)
    window = figure ('NumberTitle','off','Name','Group B33');
    Displacement3D(altitude, easting, northing);

    options = {'3D Displacement';'Altitude V.S. Time'; 'Cumulative Distance V.S. Time'; 'Ground Speed V.S. Time'; 'Tangential Acceleration V.S. Time'; 'Normal Acceleration V.S. Time'};
    choose = uicontrol('style','popupmenu', 'units','normalized','position',[0.1 0.88 0.8 0.1],'fontsize',14,'string', options,'callback',{@changeGraph, time, easting, northing, altitude, eastingVelocity, northingVelocity, altitudeVelocity, eastingAcceleration, northingAcceleration, altitudeAcceleration, eastingRho, northingRho, altitudeRho});

    ax = window.CurrentAxes;
    ax.Units = 'normalized';

    ax.Position = [0.1 0.2 0.8 0.7];
    save  = uicontrol('style','push', 'units','normalized','position',[0.1 0 0.8 0.1],'fontsize',14,'string','Save Graph','callback',{@saveGraph, choose, options, ax});
end

% Called when the graph option is changed. The selection index is run
% through a switch and the respective graph is plotted.
function changeGraph(button, eventData, time, easting, northing, altitude, eastingVelocity, northingVelocity, altitudeVelocity, eastingAcceleration, northingAcceleration, altitudeAcceleration, eastingRho, northingRho, altitudeRho)
    switch(button.Value)
        case 1
            Displacement3D(altitude, easting, northing);
        case 2
            AltitudeVTime(time, altitude);
        case 3
            CumulativeDistance(time, easting, northing, altitude);
        case 4
            GroundSpeedVTime(time, eastingVelocity, northingVelocity);
        case 5
            TangentialAccelerationVTime(time, eastingAcceleration, northingAcceleration, altitudeAcceleration);
        case 6
            NormalAccelerationVTime(time, eastingAcceleration, northingAcceleration, altitudeAcceleration, eastingRho, northingRho, altitudeRho);
    end
end

% Called when the save button is pressed. Exports the graph data to a .pdf
function saveGraph(button, eventData, chooseButton, titles, ax)
    exportgraphics(ax, sprintf('Graph_%s.png', replace(replace(titles{get(chooseButton, 'Value')}, '.', ''), " ", "_")));
end