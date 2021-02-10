train <- sample(1:nrow(Boston), nrow(Boston)/2)
set.seed(1110)
train_X <- Boston[train,c("lstat","rm")]
train_Y <- Boston[train,c("medv")]
test_X <- Boston[-train,c("lstat","rm")]
test_Y <- Boston[-train,c("medv")]
array_lstat <- seq(1.8, 37.9, by=0.1)
array_rm<- seq(3.6,8.7, by=0.1)

learningRate <- 0.01
B <- 1000

residuals_y <- train_Y
x_hat_value <- 0
y.hat<-0

for (num_initial in 1:B){
  array_rss_lstat <- rep(0,length(array_lstat))
  for(num in 1:length(array_lstat)){
    
    y_hat_less <- mean(train_Y[train_X["lstat"] < array_lstat[num]])
    y_hat_greater_equal<- mean(train_Y[train_X["lstat"] >= array_lstat[num]])
    
    y_i_less<- train_Y[train_X["lstat"] < array_lstat[num]]
    y_i_greater_equal <- train_Y[train_X["lstat"] >= array_lstat[num]]
    
    array_rss_lstat[num] <- sum((y_i_less-y_hat_less)^2)  + sum((y_i_greater_equal-y_hat_greater_equal)^2)
  }
  
  array_rss_rm <- rep(0,length(array_rm))
  for (num in 1:length(array_rm)){
    y_hat_less_rm <- mean(train_Y[train_X["lstat"] < array_rm[num]])
    y_hat_greater_equal_rm<- mean(train_Y[train_X["lstat"] >= array_rm[num]])
    
    y_i_less_rm<- train_Y[train_X["lstat"] < array_rm[num]]
    y_i_greater_equal_rm <- train_Y[train_X["lstat"] >= array_rm[num]]
    
    array_rss_rm[num] <- sum((y_i_less_rm-y_hat_less_rm)^2)  + sum((y_i_greater_equal_rm-y_hat_greater_equal_rm)^2)
  }
  
  min_lstat = min(array_rss_lstat)
  min_rm = min(array_rss_rm)
  
  if(min_lstat < min_rm ){
    
    #lstat_best_value <- array_lstat[which(min_lstat == array_rss_lstat)]
    best_value <- array_lstat[which(min_lstat == array_rss_lstat)]
    new_attribute <- "lstat"
    
  }else{
    
    best_value <- array_rm[which(min_rm == array_rss_rm)]
    new_attribute <- "rm"
  }
  
  y_less_predication <- mean(train_Y[train_X[new_attribute] < best_value])
  y_greater_equal_predication <- mean(train_Y[train_X[new_attribute] >= best_value])
  
  y_hat_value <- test_X[new_attribute] < best_value
  y_hat_value <- ifelse(y_hat_value, y_less_predication, y_greater_equal_predication)
  
  residuals_y <- residuals_y - learningRate*y_hat_value
  y.hat <- y.hat + learningRate*y_hat_value
}
  

rss_test_val <- sum((test_Y - y.hat)^2) / length(test_Y) #test RSS
MSE_value<-rss_test_val

print("MSE value for DS is :")
print(MSE_value)