% Main script for making the robot navigate around walls/objects
TIME_STEP = 64;
ERROR_DISTANCE = 400;
DEFAULT_SPEED = 3;
K = 0.001;


while wb_robot_step(TIME_STEP) ~= -1

    sensor_values = readsensor();
    front_sum = sum(sensor_values(3:4));
    
    while front_sum < 900
        
        sensor_values = readsensor();
        front_sum = sum(sensor_values(3:4));
        left_sum = sum(sensor_values(1:2));
        right_sum = sum(sensor_values(5:6));
        back_sum = sum(sensor_values(7:8));
         
        left_sum

        X = K*(left_sum - ERROR_DISTANCE)
        left_speed = 4; 
        right_speed = 4 - X;
        wb_differential_wheels_set_speed(left_speed,right_speed);
        wb_robot_step(TIME_STEP);
            
%         if sensor_values(2) > 800 | sensor_values(5) > 800
%             break;
%         end
        
        if (sensor_values(1) > 850) && (sensor_values(2) == 0)   
            %Turn left
            wb_differential_wheels_set_speed(-2, 2)
        end
        
        if (sensor_values(6) > 850) && (sensor_values(5) == 0) 
            %Turn right
            wb_differential_wheels_set_speed(-2, 2)
        end
                
        if ((left_sum > 1750) && (front_sum == 0) && (back_sum < 1000)) || ((right_sum > 1750) && (front_sum == 0) && (back_sum < 1000)) % || (left_sum > 1950) || (right_sum > 1950)
             sensor_values
             break;
        end
     end
    
     % stop
     wb_differential_wheels_set_speed(0, 0)
     
     sensor_values = readsensor();
     front_sum = sum(sensor_values(3:4));
     left_sum = sum(sensor_values(1:2));
     right_sum = sum(sensor_values(5:6));
     back_sum = sum(sensor_values(7:8));
     
     front_sum
     if left_sum+sensor_values(3) > right_sum+sensor_values(4)
         left_sum+sensor_values(3)
         wb_differential_wheels_set_speed(2, -2)
         
     elseif right_sum+sensor_values(4) > left_sum+sensor_values(3)
         right_sum+sensor_values(4)
         wb_differential_wheels_set_speed(-2, 2)
         
     end
end


