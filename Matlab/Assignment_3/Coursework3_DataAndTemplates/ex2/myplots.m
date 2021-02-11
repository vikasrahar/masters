% CS 5810  -- Programming for data analysis 
%
%  Assignment 3 | Prof. Alberto Paccanaro
% 
%
% 
% Insert BELOW your code 
% marking ID is : 65138
% functions takes 3 input cell arrays. if any of cellarray input is less
% than 4 then it is input error. Otherwise convert the entered function
% into the char using char. X interval should be [-2*pi, 2*pi]. now for
% each entered function, calacuate the y using eval and plot with it. After
% that makes the required changes with the SET and Axis. 

function out = myplots(string, color, marker)
stringLength = length(string);
colorLength = length(color);
markerLength = length(marker);

if ((stringLength ~= 4) && (colorLength ~= 4) && (markerLength ~= 4))
    fprintf("input vectors have length different than 4\n");
else 
     stringNew = char(string);
     x_interval = [-2*pi:0.3:2*pi];
     for num= 1:4
         subplot(2,2,num);
         y = eval(strcat(stringNew(num,:),'(x_interval)'));
         plt = plot(x_interval,y);
         grid on;
         axis = gca;
         axis.XLim = [-10 10];
         set(plt, 'color', color(num));
         set(plt,'marker', marker(num));
         title(strcat(stringNew(num,:),'(x)'));
     end
end 

return;
end

