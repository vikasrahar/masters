function area = cal_crown_area(r1, r2)
% this function calculates area of the circular crown 
%checking if lengths are equal or not 
% throw errors if inner radius is greater than outer radius
%throw error if vectors are of no equal lengths 
% calculating the area and printing 
 
length_r1 = length(r1);
length_r2 = length(r2);

if (length_r1 == length_r2)
    if any(r1>r2)
        fprintf('Invalid input\n');
        fprintf('inner radius is greater than outer radius!\n');
    else 
        area = pi *(r2.^2-r1.^2);
        fprintf('area of circular crown is %.3f\n',area );
    end
else 
    fprintf('Invalid input\n');
    fprintf('Vectors do not have the same length\n');
end

