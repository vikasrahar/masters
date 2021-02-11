function [newX, meanValue] = subtractMean(input)
meanValue = mean(input);
[row, col] = size(input)
newX(:,1:col) = input(:,1:col) - meanValue(1,1:col);

return;
end 
