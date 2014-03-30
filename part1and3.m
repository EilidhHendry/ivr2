% Main script for Part B of the assignment. Combines wall following,
% obstacle avoidance and odometry.

% Variables
TIME_STEP = 64;
ERROR_DISTANCE = 400;
K = 0.001;


while wb_robot_step(TIME_STEP) ~= -1

    % get the sensor values and store them. Additionally store the sum of
    % the front two sensors.
    sensor_values = readsensor();
    front_sum = sum(sensor_values(3:4));
    
    % While there is nothing in front of the agent move forward
    % wall following algorithm
    while front_sum < 1000
        
        % Each iteration recalculate and store sensor values
        sensor_values = readsensor();
        front_sum = sum(sensor_values(3:4));
        left_sum = sum(sensor_values(1:3));
        right_sum = sum(sensor_values(4:6));
        back_sum = sum(sensor_values(7:8));
         
        % Proportional Error Control
        X = K*(sensor_values(1)+sensor_values(2) - ERROR_DISTANCE)
        left_speed = 4; 
        right_speed = 4 - X;
        wb_differential_wheels_set_speed(left_speed,right_speed);
        [x, y, phi] = odometry( x, y, phi, left_speed, right_speed);
        wb_robot_step(TIME_STEP); % Is this necessary?
            
        % Catches for when the robot gets to the edge of an obstacle.
        % Should it steer back in towards the wall?
%         if (sensor_values(1) > 850) && (sensor_values(2) == 0)   
%             %Turn left
%             wb_differential_wheels_set_speed(-2, 2)
%         end
%         
%         if (sensor_values(6) > 850) && (sensor_values(5) == 0) 
%             %Turn right
%             wb_differential_wheels_set_speed(-2, 2)
%         end
          
        % If it is this close to a wall it's probably stuck so break
        if left_sum > 2000 || right_sum > 2000
            break;
        end
          
        % If it's close to a wall but there's nothing in front of it and
        % it's back isn't to a wall (aka a corner) the stuck so break
        if ((left_sum > 1300) && (front_sum == 0) && (back_sum < 1000)) || ((right_sum > 1300) && (front_sum == 0) && (back_sum < 1000))
             sensor_values
             break;
        end
        
        % Another catch for if it's right against a wall. Are both
        % necessary?
        if  sensor_values(5) > 980 || sensor_values(1) > 980
            break;
        end
    end
    
    % Now entering the obstacle avoidance part of the code.  
    
     % stop
     wb_differential_wheels_set_speed(0, 0)
     [x, y, phi] = odometry( x, y, phi, 0, 0);
     
     % Recalculate and store sensor values
     sensor_values = readsensor();
     front_sum = sum(sensor_values(3:4));
     left_sum = sum(sensor_values(1:3));
     right_sum = sum(sensor_values(4:6));
     back_sum = sum(sensor_values(7:8));
     
     % If the agent is closer to the left than the right then turn right
     % Otherwise turn left
     if left_sum > right_sum
         wb_differential_wheels_set_speed(2, -2)
         [x, y, phi] = odometry( x, y, phi, 2, -2);
     elseif right_sum > left_sum
         wb_differential_wheels_set_speed(-2, 2)
         [x, y, phi] = odometry( x, y, phi, -2, 2);
     end
end


