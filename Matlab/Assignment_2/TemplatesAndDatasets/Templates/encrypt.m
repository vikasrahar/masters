% CS5810  -- Programming for data analysis 
%
%  Assignment 2 | Prof. Alberto Paccanaro
% 
% INSERT YOUR CODE HERE!
%marking id:65138
%empty encypted value array created with empty value
%switch condition is for the value of e
%if e = 1, case 1: loop from 1:length-1 concantate the newKey value into
%empty array and in last add the last character of input value
%for e=2, shifting the each character by the value of L for each value
%of input in the loop if value +l is greater than 122, then follow the 
%if condition if condition: calacuate the array of new characters by
%shifting and storing back into output array
function encypted_Message = encrypt(e,L,message)

encypted_Message = '';
switch(e)
    case 1
        for i = 1: (length(message)-1)
            newKey=  char(randi([97,122],1,L));
            encypted_Message = strcat(encypted_Message, strcat(message(i), newKey));  
        end
        encypted_Message = strcat(encypted_Message, message(length(message)));
    case 2
        for i = 1: length(message)
            value = int8(message(i));
            duplicate = L ;
            if (value + L > 122 && value>96)
                L = L-(122-value);
                L = mod(L, 26);
                newCharacter = char(96+L);
                message(i) = newCharacter;
            else
                newCharacter = char(value+L);
                message(i) = newCharacter;
            end 
            L = duplicate;
        end 
        encypted_Message= message;
    otherwise 
        disp('Invalid value of e\n')
end 
return;
end 
