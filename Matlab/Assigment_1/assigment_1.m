%this script,load the file salesMetformin.dat
%as salesMetformin.dat file has 2 row, therefor x taking 1st row and y taking 
%2nd row, plot it with red star and red line  
%labels the x and y axis with given labels
%grid on

load salesMetformin.dat;
x=salesMetformin(1,:);
y=salesMetformin(2,:);
plot(x,y,'r*-')
xlabel('Period')
ylabel('Sales in billions (£)')
grid on
