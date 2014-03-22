
while 1

    % display all distance sensors values
    sensor_values = readsensor()

    left_sum = sum(sensor_values(1:3));
    front_sum = sum(sensor_values(3:5));
    right_sum = sum(sensor_values(5:8));
    back_sum = sum(sensor_values(7:8));
    
    if left_sum >= 1500
        wb_differential_wheels_set_speed(-2, 2)
        wb_robot_step(64);
        pause(.5)
    else
        wb_differential_wheels_set_speed(2, -2)
        wb_robot_step(64);
        pause(.5)
    end
    
    wb_differential_wheels_set_speed(2, 2)
    wb_robot_step(64);
        
end