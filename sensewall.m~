% Main script for making the robot navigate around walls/objects
TIME_STEP = 64;
while wb_robot_step(TIME_STEP) ~= -1
    
    % get the sensor values
    sensor_values = readsensor()
    
    front_sum = sum(sensor_values(3:4));
    left_sum = sum(sensor_values(1:3));
    right_sum = sum(sensor_values(4:6));
    back_sum = sum(sensor_values(7:8));
    
    % move forward until the distance from the front sensors is 900
    % NOTE threshold may need adjusted
    while front_sum < 1
        
        % keep recalculating and displaying the sensor values
        sensor_values = readsensor()
        
        front_sum = sum(sensor_values(3:4));
        left_sum = sum(sensor_values(1:3));
        right_sum = sum(sensor_values(4:6));
        back_sum = sum(sensor_values(7:8));
        
        % forward
        wb_differential_wheels_set_speed(2, 2)
        
    end
    
    % stop
    wb_differential_wheels_set_speed(0, 0)
    
    % while the front sensor has something in front of it keep
    % recalculating the sensor values and turning left
    % NOTE threshold may need adjusted
    
    sensor_values = readsensor()
    
    front_sum = sum(sensor_values(3:4));
    left_sum = sum(sensor_values(1:3));
    right_sum = sum(sensor_values(4:6));
    back_sum = sum(sensor_values(7:8));
    
    
    % NOTE threshold may need adjusted
    if left_sum > right_sum

        wb_differential_wheels_set_speed(2, -2)

    elseif right_sum > left_sum

        wb_differential_wheels_set_speed(-2, 2)

    end
    
    
end