#Question 6 Run Logistic Regression for fixed value of eta and stopping rule
row <- nrow(auto_high_test.X )
for (num in 1:100) 
{
  lr<-logistic_regression(auto_high_test.X ,auto_high_test.y,row)
  for (now in 1:row) 
  {
    Pi<-sigmoid(beta0,new_beta,auto_high_test.X[i,])
    inital_mse<-inital_mse+((auto_high_test.y[i]-Pi)^2)
  }
  inital_mse<-sum(inital_mse)
  final_mse[i,]<-inital_mse/row
}
final_mse<-as.table(final_mse)
