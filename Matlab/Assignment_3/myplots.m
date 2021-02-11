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
