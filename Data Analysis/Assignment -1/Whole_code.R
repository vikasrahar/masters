#Question 1: MSE function

sigmod_x = function(x){
  sigma <- 1/(1+exp(-x))
  return (sigma)
}

mse = function(x,y,row){
  mse_initial <- 0
  for (i in 1:row){
    mse_initial <- mse_initial + ((y[i,] - sigmod_x(x[i,]))^2)
  }  
  mse_initial <- sum(mse_initial)
  mse_final = mse_initial/ row
  return (mse_final)
}

# Logistic Regression using the alternative algorithm

sigmod = function(Beta_not,Beta_transpose,x){
  sigma <- 1/(1+exp((-Beta_not-Beta_transpose)*x))
  return (sigma)
}

sigmod_transpose = function(Beta_not,Beta_transpose,x){
  sigma_tranpose <- exp(Beta_not+Beta_transpose*x)/((1+exp(Beta_not+Beta_transpose*x))^2)
  return (sigma_tranpose)
}


logistic_regression <- function(x,y,row){
  Beta <- matrix(runif(5,-0.7,0.7),1,5)
  ita <- runif(1,0,1)
  
  for (j in 0:5){
    for (i in 1:row){
      Beta_not <-  Beta[0]
      Beta_transpose <- t(Beta)
      variable_pi <- sigmod(Beta_not,Beta_transpose,x[i,])
      sigmoid_t<-sigmod_transpose(Beta_not,Beta_transpose,x[i,])
      cofficient_di <- 2%*%(y[i,]-variable_pi[i,])%*%sigmoid_t[,i]
      weights_b[,j] <- weights_b[,j] + (ita/n)*cofficient_di*x[i,j]
     
    }
  }
}

x= matrix(c(11,22,34,4,5,6,7,8,9,10,11,12),2,6)
y = matrix(c(1,0,1,0,1),5,1)
row<- nrow(x)
logistic_regression(x,y,row)
mse_print <- mse(x,y,row)
mse_print

#Question 2: Auto data set with new variable high
Auto <- read.table("Auto.data", header = T, na.strings = "?")
attach(Auto)
row <- nrow(Auto)

auto1 <- Auto[,4:5]
auto2 <- Auto[,7:8]

high_auto <- matrix(0,row,1)

for (num in 1:row){
  if(Auto[i,1] >= 23){
    high_auto[i,1] <- 1
  }
  else
    high_auto[i,1] <- 0
}
#this loop is for origin,  creating appropriate dummy variables.
for (i in 1:row) {
  if(Auto[i,8]==1){
    auto2[i,2]<-1
  }
  else{
    auto2[i,2]<-0
  }
}
auto_high_dummy<-cbind(auto1,auto2,high_auto)
standardized.auto_high_dummy <- scale(auto_high_dummy[,-origin])
var(standardized.auto_high_dummy[,1])
var(standardized.auto_high_dummy[,2])


#question 3: split the dataset and seed for the pseudorandom number generator

Auto <- read.table("Auto.data", header = T)
fix(Auto)
Auto <- na.omit(Auto)
attach(Auto)

set.seed(602)
train<-floor(0.50 * nrow(auto_high_dummy))
auto_high_train.X <- auto_high_dummy[-(1:train), ]
auto_high_test.X <- auto_high_dummy[1:train, ]
auto_high_train.y <- auto_high_dummy[-((train):nrow(auto_high_dummy)),]
auto_high_test.y <- auto_high_dummy[(train):nrow(auto_high_dummy),]

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
