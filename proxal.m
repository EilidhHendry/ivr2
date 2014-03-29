%speed[] array is a two item arrage representing the speed of the left and
%right motor, the matrix[] array holds the values in the weighted matrix,
%and the sensor_values[] array holds the sensor values. The 512 normalizes
%the sensor values and the values i and j are values from a nested for loop
%that is used to iterate over the sensor values and weighted matrix.

matrix=zeros(8,2);
speed=zeros(8,2);

for i=matrix
    for j=sensor_values(1:8)

        speed(i) = matrix(j,i)*(1.0-(sensor_values(j)/512));
    end
end