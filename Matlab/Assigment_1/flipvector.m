function vector = flipvector(v)
% this function flips the input arguments
% here first finding if the input is matrix/scalar or not, if yes print it
% else finding if row or column vector 
% flip the row or column vector

find_size = size(v);

if ((find_size(1) > 1 && find_size(2) > 1)|| (find_size(1) == 1 && find_size(2) == 1))
    fprintf('input argumnet is matrix or scalar \n')
    disp(v)
elseif (find_size(1) == 1)
    fprintf('input argumnet is row vector \n')
     disp(fliplr(v));
    
    
else 
    fprintf('input argumnet is column vector \n')
    disp(flipud(v));
end

    
