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
