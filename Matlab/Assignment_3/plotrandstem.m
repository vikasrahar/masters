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
    
    