% Algorithm for Part A(ii) - Obstacle Avoidance

TIME_STEP = 64;

while wb_robot_step(TIME_STEP) ~= -1
    
    % Read and store the sensor values
    sensor_values = readsensor();
    front_sum = sum(sensor_values(3:4));
    
    % while there is nothing in front of the agent then move forward
    while front_sum < 1000
        
        % read and store the sensor values
        sensor_values = readsensor();
        front_sum = sum(sensor_values(3:4));
        
        % Go forward
        wb_differential_wheels_set_speed(3, 3)
        
        % If there the robot is this close to an object then break to turn
        if sensor_values(2) > 800 | sensor_values(5) > 800
            break;
        end
        
    end
    
    % If an obstacle is encountered then stop
    % This is to allow time to decide which way to turn and avoid collision
    wb_differential_wheels_set_speed(0, 0)
    
    % Recalculate and store sensor values
    sensor_values = readsensor();
    front_sum = sum(sensor_values(3:4));
    left_sum = sum(sensor_values(1:2));
    right_sum = sum(sensor_values(5:6));
    back_sum = sum(sensor_values(7:8));
    
    % If there's an object closer to the left than right then turn right
    % Otherwise turn left
    if left_sum > right_sum

        wb_differential_wheels_set_speed(2, -2)
        
    elseif right_sum > left_sum

        wb_differential_wheels_set_speed(-2, 2)
        
    end
end