function vector_evenodd = evenodd(n,e)
% this function calculate the even numbers at even position or odd numbers
% at odd positions
% caculate vec and us switch statement
% case 1 for odd number and case 2 for even
% for both cases, first we are finding the loaction of even/odd numbers
% then finding the odd indeices for odd/even indices for even 
% in last displaying, odd numbers at odd indices/even numbers at even indices
% if e is not 1/2, then throw error

vec = randi([0,30],1,n);
disp(vec)
switch e 
    case 1
        odd = find((mod(vec,2)));
        odd_new = find(mod(odd,2));
        fprintf('odd numbers at odd position are:\n')
        disp(vec(odd(odd_new)));
    
    case 2
        even = find(~mod(vec,2));
        even_new= find(~mod(even,2));
        fprintf('even numbers at even position are:\n')
        disp(vec(even(even_new)));
        
    otherwise
        fprintf('Invlaid e value\n')
end 
 