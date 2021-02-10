#single function --------------------------------------------------------------------------------------
singlefunction <- function(X, k_value)
{
  cluster = matrix(0,64,64)
  #initial distance matrix
  distance_matrix = as.matrix(dist(X), "eculidean")
  distance_matrix[ row(distance_matrix) == col(distance_matrix) ] <- 10000
  i = 1
  while (length(cluster) != k_value){
    
    #find the indexes of minimum distances from distance_matrix
    min_index = which(distance_matrix == min(distance_matrix), arr.ind = TRUE)
    #m stores minimum index value
    m <- min(min_index)
    #n stores maximum index value
    n <- max(min_index)
    #add the respectivel values of index m and n
    cluster[i,] = cbind(X[m,],X[n,])
    #increase the value of i 
    i <- i + 1
    #delete the maximum value from the original X, therefor find the distance matrix of 
    #minimum value plus remaining values
    max1= max(X[n,],X[m,])
    index= which(X==max1)
    X <- X[-index,]
    #find the distance matrix of remaining value
    distance_matrix = as.matrix(dist(X), "eculidean")
    distance_matrix[ row(distance_matrix) == col(distance_matrix) ] <- 10000
  } 
}
#complete function --------------------------------------------------------------------------------------
completefunction <- function(X, k_value)
{
  cluster = matrix(0,64,64)
  #initial distance matrix
  distance_matrix = as.matrix(dist(X), "eculidean")
  distance_matrix[ row(distance_matrix) == col(distance_matrix) ] <- 10000
  i = 1
  while (length(cluster) != k_value){
    
    #find the indexes of minimum distances from distance_matrix
    min_index = which(distance_matrix == min(distance_matrix), arr.ind = TRUE)
    #m stores minimum index value
    m <- min(min_index)
    #n stores maximum index value
    n <- max(min_index)
    #add the respectivel values of index m and n
    cluster[i,] = cbind(X[m,],X[n,])
    #increase the value of i 
    i <- i + 1
    #delete the minimum value from the original X, therefor the distance matrix of maximum value 
    #plus remaining values
    min1= min(X[n,],X[m,])
    index= which(X==min1)
    X <- X[-index]
    #find the distance matrix of remaining value
    distance_matrix = as.matrix(dist(X), "eculidean")
    distance_matrix[ row(distance_matrix) == col(distance_matrix) ] <- 10000
  } 
}
#average function --------------------------------------------------------------------------------------
averagefunction <- function(X, k_value)
{
  cluster = matrix(0,64,64)
  #initial distance matrix
  distance_matrix = as.matrix(dist(X), "eculidean")
  distance_matrix[ row(distance_matrix) == col(distance_matrix) ] <- 10000
  i = 1
  while (length(cluster) != k_value){
    
    #find the indexes of minimum distances from distance_matrix
    min_index = which(distance_matrix == min(distance_matrix), arr.ind = TRUE)
    #m stores minimum index value
    m <- min(min_index)
    #n stores maximum index value
    n <- max(min_index)
    #add the respectivel values of index m and n
    cluster[i,] = cbind(X[m,],X[n,])
    #increase the value of i 
    i <- i + 1
    #find the average for selected rows
    #replace the minimum value with the average and delete the row with maximum values,
    #therefor the distance matrix of maximum value plus remaining values
    average= mean(X[n,],X[m,])
    max1= max(X[n,],X[m,])
    index= which(X==max1)
    X <- replace(X, min(X[n,],X[m,]), average)
    X <- X[-max1]
    #find the distance matrix of remaining value
    distance_matrix = as.matrix(dist(X), "eculidean")
    distance_matrix[ row(distance_matrix) == col(distance_matrix) ] <- 10000
  } 
}
#centroid function --------------------------------------------------------------------------------------
centroidfunction <- function(X, k_value)
{
  cluster = matrix(0,64,64)
  #initial distance matrix
  distance_matrix = as.matrix(dist(X), "eculidean")
  distance_matrix[ row(distance_matrix) == col(distance_matrix) ] <- 10000
  i = 1
  while (length(cluster) != k_value){
    
    #find the indexes of minimum distances from distance_matrix
    min_index = which(distance_matrix == min(distance_matrix), arr.ind = TRUE)
    #m stores minimum index value
    m <- min(min_index)
    #n stores maximum index value
    n <- max(min_index)
    #add the respectivel values of index m and n
    cluster[i,] = cbind(X[m,],X[n,])
    #increase the value of i 
    i <- i + 1
    #find the average
    #replace the minimum value with median values and delete the row with maximum values
    #therefor the distance matrix of maximum value plus remaining values
    median_new= median(X[n,],X[m,])
    max1= max(X[n,],X[m,])
    index= which(X==max1)
    X <- replace(X, min(X[n,],X[m,]), median_new)
    X <- X[-max1]
    #find the distance matrix of remaining value
    distance_matrix = as.matrix(dist(X), "eculidean")
    distance_matrix[ row(distance_matrix) == col(distance_matrix) ] <- 10000
  } 
}


#Question 2---------------------------------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
transpose_data = t(nci.data)
matrix_distance = as.matrix(dist(transpose_data,"eculidean"))
singlefunction(transpose_data, 3)
completefunction(transpose_data, 3)
averagefunction(transpose_data, 3)
centroidfunction(transpose_data, 3)
#Question 3---------------------------------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
transpose_data = t(nci.data)
hc.complete <- hclust(dist(transpose_data), method="complete")
hc.average <- hclust(dist(transpose_data), method="average")
hc.single <- hclust(dist(transpose_data), method="single")
hc.centroid <- hclust(dist(transpose_data), method="centroid")

plot(hc.single,main="Single Linkage",xlab="",sub ="",cex =.9)
plot(hc.complete,main="complete Linkage",xlab="",sub ="",cex =.9)
plot(hc.average,main="Average Linkage",xlab="",sub ="",cex =.9)
plot(hc.centroid,main="Centroid Linkage",xlab="",sub ="",cex =.9)

#Question 4---------------------------------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#for k value to 2
km.out <- kmeans(transpose_data, 2, nstart =20)
km.out$cluster
km.out$tot.withinss
plot(transpose_data, col=(km.out$cluster+1),main = "K Means Clustering result of NCI dataset with k value to 2", xlab="", ylab="",pch=20, cex=2)

#for k value to 5
km.out <- kmeans(transpose_data, 5, nstart =20)
km.out$cluster
km.out$tot.withinss
plot(transpose_data, col=(km.out$cluster+1),main = "K Means Clustering result of NCI dataset with k value to 5", xlab="", ylab="",pch=20, cex=2)

#for k value to 10
km.out <- kmeans(transpose_data, 10, nstart =20)
km.out$cluster
km.out$tot.withinss
plot(transpose_data, col=(km.out$cluster+1),main = "K Means Clustering result of NCI dataset with k value to 10", xlab="", ylab="",pch=20, cex=2)



