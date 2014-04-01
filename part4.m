% Main script for making the robot navigate around walls/objects
TIME_STEP = 64;
ERROR_DISTANCE = 200;
DEFAULT_SPEED = 3;
x = 0;
y = 0;
phi = 0;
K = 0.001;


while wb_robot_step(TIME_STEP) ~= -1
    

    %Begin random walk 
    while y<200   
     wb_differential_wheels_set_speed(2, 2);
    
     [x, y, phi] = odometry( x, y, phi, 2, 2);
     
     
        wb_robot_step(TIME_STEP);
    end
    
    % Turn in walk
    while abs(phi)<4.6
     wb_differential_wheels_set_speed(-2, 2);
    
     [x, y, phi] = odometry( x, y, phi, -2, 2);
     wb_robot_step(TIME_STEP);
    end
    
    
    while abs(y)<100  % Continue walk 
     wb_differential_wheels_set_speed(2, 2);
        
     [x, y, phi] = odometry( x, y, phi, 2, 2)
        wb_robot_step(TIME_STEP);
    end
    
    %Turn back facing origin and go home
    if abs(y)>=100
        
        if mod(phi, 2*pi) >= turningAngle(x, y)
            while mod(phi, 2*pi) > turningAngle(x, y)
                wb_differential_wheels_set_speed(2, -2);
                [x, y, phi] = odometry( x, y, phi, 2, -2);
                wb_robot_step(TIME_STEP);       
            end
        else
            while mod(phi, 2*pi) < turningAngle(x, y)
                wb_differential_wheels_set_speed(-2, 2);
                [x, y, phi] = odometry( x, y, phi, -2, 2);
                wb_robot_step(TIME_STEP); 
            end
        end

        while(abs(y) > 2)
            wb_differential_wheels_set_speed(1, 1);
            [x, y, phi] = odometry( x, y, phi, 1, 1);
            
            
            wb_robot_step(TIME_STEP);
            
        end
        
        wb_differential_wheels_set_speed(0, 0);
        [x, y, phi] = odometry( x, y, phi, 0, 0);
        wb_robot_step(TIME_STEP);
        break;
    end
    
    wb_robot_step(TIME_STEP);
   
    
   
    
end






