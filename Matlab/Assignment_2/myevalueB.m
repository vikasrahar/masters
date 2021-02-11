%this function finds the value of n for which the difference of e_actual
%and e_approximation less than input 'error'. without eps, we don't get
%exact value of particular decimal points. 
%formula is provided for e_approximation

function index=myevalueB(error)
n=1:100;
e_actual=exp(1); 
error=eps(error);

for num=1:length(n)
    sum=0;
    for iter=0:num
        sum=sum+(1/factorial(iter));
    end
    e_approximation(num)=sum;
end
error_rate=eps(abs(e_approximation-e_actual));
count=error_rate<error;
index=find(count==1);
index=index(1);
end
