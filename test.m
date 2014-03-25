% Main script for making the robot navigate around walls/objects
TIME_STEP = 64;
ERROR_DISTANCE = 200;
DEFAULT_SPEED = 3;
x = 0;
y = 0;
phi = 0;
K = 0.001;


while wb_robot_step(TIME_STEP) ~= -1

    sensor_values = readsensor();
    sensor1_value = sensor_values(1);
    sensor3_value = sensor_values(3);
    sensor4_value = sensor_values(4)
    sensor6_value = sensor_values(6);
    
    wb_differential_wheels_set_speed(2,2);
    
    pause(4)
    [x, y, phi] = odometry( x, y, phi, 2, 2 )
    wb_differential_wheels_set_speed(2,-2);
    
    pause(2)
    [x, y, phi] = odometry( x, y, phi, 2, -2)
    wb_differential_wheels_set_speed(2,2);
    
    pause(4)
    [x, y, phi] = odometry( x, y, phi, 2, 2 )
    
    
%     X = K*(sensor1_value - ERROR_DISTANCE)
%     left_speed = 4; 
%     right_speed = 4 - X;
%     wb_differential_wheels_set_speed(left_speed,right_speed);
%     wb_robot_step(TIME_STEP);
%     [x, y, phi] = odometry( x, y, phi, left_speed, right_speed )
%     
%    if sensor3_value > 0 && sensor4_value > 0
%        x = phi
%        while phi < x + pi
%            [x, y, phi] = odometry( x, y, phi, left_speed, right_speed)
%            wb_differential_wheels_set_speed(2,-2);
%        end
%    end
   
%    if phi > pi || phi < -pi
end


