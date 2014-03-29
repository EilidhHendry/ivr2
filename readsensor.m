% Function to read in the sensor values and store them as an array
function sensor_values = readsensor()

% Variables
TIME_STEP = 64;
N = 8;

% get and enable distance sensors
for i=1:N
  ps(i) = wb_robot_get_device(['ds' int2str(i-1)]);
  wb_distance_sensor_enable(ps(i),TIME_STEP);
end

%enabling led - is this necessary?
led(1) = wb_robot_get_device('led0');
led(2) = wb_robot_get_device('led1');

% Loop through sensors and store them
for i=1:N
    sensor_values(i) = wb_distance_sensor_get_value(ps(i));
    wb_robot_step(64);
end

