% CS 5810  -- Programming for data analysis 
%
%  Assignment 3 | Prof. Alberto Paccanaro
% 
%
% 
% Insert BELOW your code 
% marking ID is : 65138
% in this function calculate the mean and subtract it in the datasets and
% return the dataset.
function [newX, meanValue] = subtractMean(input)
meanValue = mean(input);
[row, col] = size(input)
newX(:,1:col) = input(:,1:col) - meanValue(1,1:col);

return;
end 

