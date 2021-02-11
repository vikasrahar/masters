% CS5810  -- Programming for data analysis 
%
%  Assignment 2 | Prof. Alberto Paccanaro
% 
% INSERT YOUR CODE HERE!
%marking id : 65138
%function recieve the vec, if vec length is < 13 and divided by 2, then it
%goes inside the if condition, otherwise it won't print anything
%inside if condition: using the inline function storig input function as
%the string  and for the each value of i in 1:length of vec, we calculates 
%the random values of x, y stores the function with the values of x
%ploting these values of x &y
%one graph is decided into number of subplots which depend upon the length
%of vec input

function out = plotfun(vec)

vecLength = length(vec);

if((vecLength < 13) && (mod(vecLength,2) == 0)) 
    str = input('Enter the mathematical Expression:','s');
    g = inline(str);
    for i = 1:vecLength
        a= 0;
        b=10;
        x = (b-a).*rand(vec(i),1) + a;
        %y = str2fun(['@(x)',str]);
        %g = str2func(['@(x)' vectorize(str)]);
        %y=g(x);
        y= g(x);
        subplot(2,2,i);
        plot(x,y,'r.');
        
        varTitle = ['number of points: ', num2str(vec(i))];
        title(varTitle);
        
    end 
    
end 
return;
end
