%this function finds the value of n for which the difference of e_actual
%and e_approximation less than input 'error'. without eps, we don't get
%exact value of particular decimal points. 
%formula is provided for e_approximation

function index = myevalueA(error)
n=2:100;
e_actual = exp(1);
e_approximation = (1./((1-(1./n)).^n));
err_rate= eps(e_approximation-e_actual);
error=eps(error);
count=err_rate<error;
index= find(count==1);
index=index(1);
end 

