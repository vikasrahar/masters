%plots uniformaly distributed & normally distributed in 2 dimensions 
%in uniformaly distributed, plot the points, as blue circle as the
%mentioned range
%in normally distributed, plot the point, as red circle as mentioned range
xmin = 30;
xmax = 40;
ymin = 10;
ymax = 20;
xticks=0:10:50;
yticks=0:5:50;

close all

x = (xmax-xmin)*rand(1,1000)+xmin;
y = (ymax-ymin)*rand(1,1000)+ymin;
plot(x,y,'bo');

xmin = 0;
xmax = 50;
ymin = 0;
ymax = 50;
axis([xmin xmax ymin ymax])

xlabel('x axis')
ylabel('y axis')

grid on
hold on 

x_mean = 20;
y_mean = 35;
variance = 1;
x = variance*randn(1,1000)+x_mean;
y = variance*randn(1,1000)+y_mean;
plot(x,y,'r*');

legend('Uniform distribution','Normal distribution')
hold off
