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
