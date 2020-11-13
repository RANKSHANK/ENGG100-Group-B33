%% Employs dynamics principals to generate velocity & acceleration arrays
%   Params
%       altitude : altitude coordinate array
%       latitude : latitude coordinate array
%       longitude: longitude coordinate array
%   Returns
%       northingVelocity    : horizontal velocity array based on northing
%       eastingVelocity     : horizontal velocity array based on easting
%       altitudeVelocity    : vertical velocity array based on altitude
%       northingAcceleration: horizontal acceleration array based on northing
%       eastingAcceleration : horizontal acceleration array based on easting
%       altitudeAcceleration: vertical acceleration array based on altitude
%       eastingRho          : easting rho array used for normal accel.
%       northingRho         : easting rho array used for normal accel.
%       altitudeRh          : altitude rho array used for normal accel.
function [eastingVelocity, northingVelocity, altitudeVelocity, eastingAcceleration, northingAcceleration, altitudeAcceleration, eastingRho, northingRho, altitudeRho] = DynamicsProcessor(time, altitude, easting, northing)
    % Preallocate arrays of size with zeros
    eastingVelocity = zeros(1, length(easting));
    northingVelocity = zeros(1, length(easting));
    altitudeVelocity = zeros(1, length(easting));
    eastingAcceleration = zeros(1, length(easting));
    northingAcceleration = zeros(1, length(easting));
    altitudeAcceleration = zeros(1, length(easting));
    eastingRho = zeros(1, length(easting));
    northingRho = zeros(1, length(easting));
    altitudeRho = zeros(1, length(easting));

    % Parse through the arrays, assuming the initial acceleration and
    % velocity are zero
    for(index = 2:length(easting))
        % Calculate the time delta
        deltaTime = time(index) - time(index - 1);
        % Calculate the velocities via the change in displacement
        eastingVelocity(index) = (eastingVelocity(index) - eastingVelocity(index - 1)) / deltaTime;
        northingVelocity(index) = (northing(index) - northing(index - 1)) / deltaTime;
        altitudeVelocity(index) = (altitude(index) - altitude(index -1)) / deltaTime;
        % Calculate the acceleration via change in velocity
        eastingAcceleration(index) = (eastingVelocity(index) - eastingVelocity(index - 1)) / deltaTime;
        northingAcceleration(index) = (northingVelocity(index) - northingVelocity(index - 1)) / deltaTime;
        altitudeAcceleration(index) = (altitudeVelocity(index) - altitudeVelocity(index - 1)) / deltaTime;
        % Calculate Rho using the acceleration and velocity
        eastingRho(index) = abs(((1 + (eastingVelocity(index) ^ 2))) ^ 1.5 / (eastingAcceleration(index)));
        northingRho(index) = abs(((1 + (eastingVelocity(index) ^ 2))) ^ 1.5 / (eastingAcceleration(index)));
        altitudeRho(index) = abs(((1 + (altitudeVelocity(index) ^ 2))) ^ 1.5 / (altitudeAcceleration(index)));
    end
end