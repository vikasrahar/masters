
#Question 4 train and find the MSE on training set

new_beta <- logisticRegression(auto_high_train.X ,auto_high_train.y)
print(new_beta)
inital_mse <- 0
row <- nrow(auto_high_test.X)
beta0<-new_beta[1]

for (num in 1:row) 
{
  Pi<-sigmoid(beta0,new_beta,auto_high_test.X[i,])
  inital_mse <- inital_mse + ((y[i]-Pi)^2)
}
inital_mse<-sum(inital_mse)
final_mse<-inital_mse/row
