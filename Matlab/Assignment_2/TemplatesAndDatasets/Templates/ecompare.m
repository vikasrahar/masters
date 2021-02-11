% CS5810  -- Programming for data analysis 
%
%  Assignment 2 | Prof. Alberto Paccanaro
% 
% INSERT YOUR CODE HERE!
% marking ID: 65138
%this function calculate the error values from 2 functions 
%plot these outputs in the grap 

function compare_value=ecompare(input)

if length(input)==5
    for i=1:length(input)
        error_value_A(i)=myevalueA(input(i));
        error_value_B(i)=myevalueB(input(i));
    end
    plot(error_value_B,input,'g*');
    hold on;
    plot(error_value_A,input,'b^');
    legend('myvalueA_ error','myvalueB_ error');
end
end