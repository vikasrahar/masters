x = seq(100,1500,400)
y = rep(0,4)
for(num in 1:4){
  y[num] = BDScalculate(0.01,x[num])
  print(y[num])
}
plot(x,y, main ="Graph respresentation", xlab="B",ylab="TEST MSE", type="b")
