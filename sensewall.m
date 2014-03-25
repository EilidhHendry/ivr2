% Main script for making the robot navigate around walls/objects
wb_robot_step(64);
while 1
    
    % get the sensor values
    sensor_values = readsensor()
    
    front_sum = sum(sensor_values(3:4));
    left_sum = sum(sensor_values(1:2));
    right_sum = sum(sensor_values(5:6));
    back_sum = sum(sensor_values(7:8));
    
    % move forward until the distance from the front sensors is 900
    % NOTE threshold may need adjusted
    while front_sum < 900

  
        % keep recalculating and displaying the sensor values
        sensor_values = readsensor()
        
        front_sum = sum(sensor_values(3:4));
        left_sum = sum(sensor_values(1:2));
        right_sum = sum(sensor_values(5:6));
        back_sum = sum(sensor_values(7:8));
        
        % forward
        wb_differential_wheels_set_speed(2, 2)
        wb_robot_step(64);
        pause(2);
        
    end
    
    % stop
    wb_differential_wheels_set_speed(0, 0)
    wb_robot_step(64);
        
    % while the front sensor has something in front of it keep
    % recalculating the sensor values and turning left
    % NOTE threshold may need adjusted
    while front_sum > 100
        
        sensor_values = readsensor()
        
        front_sum = sum(sensor_values(3:4));
        left_sum = sum(sensor_values(1:2));
        right_sum = sum(sensor_values(5:6));
        back_sum = sum(sensor_values(7:8));
        
        % NOTE threshold may need adjusted
        if left_sum > 900
                        
            wb_differential_wheels_set_speed(-2, 2)
            wb_robot_step(64);
            pause(.5)
        end
    end        
end