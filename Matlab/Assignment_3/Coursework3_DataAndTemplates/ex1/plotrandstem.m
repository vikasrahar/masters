% CS 5810  -- Programming for data analysis 
%
%  Assignment 3 | Prof. Alberto Paccanaro
% 
%
% 
% Insert BELOW your code 
% 1. open the file and read using the fscanf
% 2. if entered input n is greater than column size of opened file, then it
% is error . 3. if not, generate random numbers using randi and now using
% these number gets the value of x-axis and y-axis. 5. for the updating the
% title which depend upon n value. 
function plotrandstem(fileName, n)
fclose('all');
fileOpen = fopen(fileName);
inputData= fscanf(fileOpen, '%s %f', [4 inf]);
fclose('all');
[row,col] = size(inputData);

if(n <= col) 
    randomNumber = randi([row,col],1,10);
    x = inputData(2,randomNumber);
    y = inputData(4,randomNumber);
    stem(x,y);
    xlabel('x axis');
    ylabel('y axis');
    t=[num2str(n), ' random data points'];
    title(t);
    grid on;
else 
    fprintf("Entered value of n is greater than the total numbers of data points in a file\n");
end 

return;
end
    
