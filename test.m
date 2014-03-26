% Main script for making the robot navigate around walls/objects
TIME_STEP = 64;
ERROR_DISTANCE = 400;
DEFAULT_SPEED = 3;
x = 0;
y = 0;
phi = 0;
K = 0.001;


while wb_robot_step(TIME_STEP) ~= -1

    sensor_values = readsensor();
    front_sum = sum(sensor_values(3:4));
    left_sum = sum(sensor_values(1:2));
    right_sum = sum(sensor_values(5:6));
    back_sum = sum(sensor_values(7:8));
  
    
    while front_sum < 1 
        X = K*(left_sum - ERROR_DISTANCE)
        left_speed = 4; 
        right_speed = 4 - X;
        wb_differential_wheels_set_speed(left_speed,right_speed);
        wb_robot_step(TIME_STEP);
        [x, y, phi] = odometry( x, y, phi, left_speed, right_speed );

%        if sensor3_value > 0 && sensor4_value > 0
%            x = phi
%            while phi < x + pi
%                [x, y, phi] = odometry( x, y, phi, left_speed, right_speed)
%                wb_differential_wheels_set_speed(2,-2);
%            end
%        end
    end
    
    while front_sum > 1
        if left_sum > right_sum

            wb_differential_wheels_set_speed(2, -2)

        elseif right_sum > left_sum

            wb_differential_wheels_set_speed(-2, 2)

        end
    end
    



end


