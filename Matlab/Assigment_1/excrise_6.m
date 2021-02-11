%this script generates 20000 points for x,y,z in interval (0,1)  
%plot the points in blue star for at least one point is bigger than 0.9
%hold on first plot
%now plot the points in red star for both the condition 1) at least one
%dimensions is bigger than 0.5 2) all dimensions are smaller than 0.5
%in last hold off 
x=rand(1,20000);
y=rand(1,20000);
z=rand(1,20000);

close all 


i = ((x>0.9 | y>0.9) | z>0.9);
plot3(x(i),y(i),z(i),'b*');

hold on 
grid on

bigger_than = ((x>0.4 | y>0.4) | z>0.4);
Smaller_than = ((x<0.5 & y<0.5) & z<0.5);
both= bigger_than & Smaller_than;

plot3(x(both),y(both),z(both),'r*');

xticks=0:0.2:1;
yticks=0:0.2:1;
zticks=0:0.1:1;

xlabel('x axis')
ylabel('y axis')
zlabel('z axis')
hold off