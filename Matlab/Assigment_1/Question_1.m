load salesMetformin.dat;
y=round(salesMetformin);
x=1:length(y);
plot(x,y,'r*')
xlabel('Period')
ylabel('Sales in billions (£)')

