function original_message = dencrypt(e,L,message)

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
