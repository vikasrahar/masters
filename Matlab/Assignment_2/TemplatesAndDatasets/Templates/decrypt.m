% CS5810  -- Programming for data analysis 
%
%  Assignment 2 | Prof. Alberto Paccanaro
% 
% INSERT YOUR CODE HERE!
%marking ID: 65138
% case1: for value of e=1: remove the extract values inbetween the original
% message 
%case 2: for value of e=2: decrease /increase the characters by the value
%of L.
function original_message = decrypt(e,L,message)

original_message = '';

switch(e)
    case 1
        original_message = message(1);
        i=2;
        while i <= length(message)
            original_message = strcat(original_message, message(L+i));  
            i = L+i+1;
        end  
    case 2
        for i = 1: length(message)
            value = int8(message(i));
            duplicate = L ;
            if (value - L > 96 && value < 122)
                newCharacter = char(value-L);
                message(i) = newCharacter;
            else
                L = L+(122-value);
                L = mod(L, 26);
                newCharacter = char(122-L);
                message(i) = newCharacter; 
            end 
            L = duplicate; 
        end 
        original_message= message;
    otherwise
        disp('invalid value of e');
end  
