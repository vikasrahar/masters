BDScalculate <- function(learningRate, B)
{
  train <- sample(1:nrow(Boston), nrow(Boston)/2)
  set.seed(1110)
  train_X <- Boston[train,c("lstat","rm")]
  train_Y <- Boston[train,c("medv")]
  test_X <- Boston[-train,c("lstat","rm")]
  test_Y <- Boston[-train,c("medv")]
  array_lstat <- seq(1.8, 37.9, by=0.1)
  array_rm<- seq(3.6,8.7, by=0.1)
  
  residuals_y <- train_Y
  y_hat_value <- 0
  
  for (num_initial in 1:B){
    #DS function that takes nput as y_train - resiudals with updated residuals each time and outputs a list with
    # 1. DS - "lstat" or "rm", 2. min value of "lstat" of  "rm" 3. find the best_value 4. find the value of y_hat
    # 5. calculate MSE value and residual value
    
    #step 1 ->>> a) find lstat array
    array_rss_lstat <- rep(0,length(array_lstat))
    for(num in 1:length(array_lstat)){
      
      y_hat_less <- mean( train_Y[train_X["lstat"] < array_lstat[num]])
      y_hat_greater_equal<- mean(train_Y[train_X["lstat"] >= array_lstat[num]])
      
      y_i_less<- train_Y[train_X["lstat"] < array_lstat[num]]
      y_i_greater_equal <- train_Y[train_X["lstat"] >= array_lstat[num]]
      
      array_rss_lstat[num] <- sum((y_i_less-y_hat_less)^2)  + sum((y_i_greater_equal-y_hat_greater_equal)^2)
    }
    #step 1 -> b) find lstat array
    array_rss_rm <- rep(0,length(array_rm))
    for (num in 1:length(array_rm)){
      y_hat_less_rm <- mean(train_Y[train_X["lstat"] < array_rm[num]])
      y_hat_greater_equal_rm<- mean(train_Y[train_X["lstat"] >= array_rm[num]])
      
      y_i_less_rm<- train_Y[train_X["lstat"] < array_rm[num]]
      y_i_greater_equal_rm <- train_Y[train_X["lstat"] >= array_rm[num]]
      
      array_rss_rm[num] <- sum((y_i_less_rm-y_hat_less_rm)^2)  + sum((y_i_greater_equal_rm-y_hat_greater_equal_rm)^2)
    }
    #Step 2 ->>> min value of "lstat" or "rm"
    min_lstat = min(array_rss_lstat)
    min_rm = min(array_rss_rm)
    best_value <- 0
    #Step 3 ->>> find the best_value
    if(min_lstat < min_rm ){
      
      #lstat_best_value <- array_lstat[which(min_lstat == array_rss_lstat)]
      best_value <- array_lstat[which(min_lstat == array_rss_lstat)]
      new_attribute <- "lstat"
      
    }else{
      
      best_value <- array_rm[which(min_lstat == array_rss_rm)]
      new_attribute <- "rm"
    }
    
    y_less_predication <- mean(residuals_y[train_X[new_attribute] < best_value])
    y_greater_equal_predication <- mean(residuals_y[train_X[new_attribute] >= best_value])
    #Step 4 ->>> find the value of y_hat
    y_hat_new <- test_X[new_attribute] < best_value
    y_hat_new<- ifelse(y_hat_new, y_less_predication, y_greater_equal_predication)
    #Step 5 ->>> calculate MSE value and residual value
    residuals_y <- residuals_y - (learningRate*y_hat_new)
    y_hat_value <- y_hat_value + (learningRate*y_hat_new)
    
  }
  
  new_rss<-sum(test_Y - y_hat_value)^2/ length(test_Y) #test RSS
  return(new_rss)
  
}

learningRate <- 0.01
B <- 1000
BDScalculate(learningRate, B)
