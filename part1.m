TIME_STEP = 64;
ERROR_DISTANCE = 300;
DEFAULT_SPEED = 3;
K = 0.00001;

while wb_robot_step(TIME_STEP) ~= -1
    
    sensor_values = readsensor();
    left_sum = sum(sensor_values(1:2));
    
    X = K*(left_sum - ERROR_DISTANCE)
    left_speed = 4; 
    right_speed = 4 - X;
    wb_differential_wheels_set_speed(left_speed,right_speed);
    wb_robot_step(TIME_STEP);
    
end