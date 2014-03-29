function [ x_, y_, phi_ ] = odometry( x, y, phi, left_speed, right_speed )
%ODOMETRY returns the estimated curent x,y and phi value in reference to
%starting position
%   implementation of odometry functions in IVR practical 5
% Optimise R to obtain more accurate results, get robot to turn 2pi radians
% several times and check our value for phi against the actual version

R = 26.5;
y_ = y + 0.5*(left_speed + right_speed)*cos(phi);
x_ = x + 0.5*(left_speed + right_speed)*sin(phi);
phi_ = phi - 0.5*(left_speed - right_speed)/ (2*R);
end

