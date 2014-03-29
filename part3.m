TIME_STEP = 64;

while wb_robot_step(TIME_STEP) ~= -1
    
    sensor_values = readsensor();
    front_sum = sum(sensor_values(3:4));
    left_sum = sum(sensor_values(1:3));
    right_sum = sum(sensor_values(4:6));
    back_sum = sum(sensor_values(7:8));
    
    while front_sum < 1000
        
        sensor_values = readsensor();
        front_sum = sum(sensor_values(3:4));
        left_sum = sum(sensor_values(1:2));
        right_sum = sum(sensor_values(5:6));
        back_sum = sum(sensor_values(7:8));
        
        wb_differential_wheels_set_speed(3, 3)
        
        if sensor_values(2) > 800 | sensor_values(5) > 800
            break;
        end
        
    end
    
    wb_differential_wheels_set_speed(0, 0)
    
    sensor_values = readsensor();
    front_sum = sum(sensor_values(3:4));
    left_sum = sum(sensor_values(1:2));
    right_sum = sum(sensor_values(5:6));
    back_sum = sum(sensor_values(7:8));
    
    if left_sum > right_sum

        wb_differential_wheels_set_speed(2, -2)
        
    elseif right_sum > left_sum

        wb_differential_wheels_set_speed(-2, 2)
        
    end
end