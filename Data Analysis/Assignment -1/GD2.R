
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


