X = matrix(c(10,7,28,20,35),5,1)
cluster = matrix(0,5,2)
distance_matrix = as.matrix(dist(X), "eculidean")
distance_matrix
distance_matrix[ row(distance_matrix) == col(distance_matrix) ] <- 10000

min_index = which(distance_matrix == min(distance_matrix), arr.ind = TRUE)
min_index
m <- min(min_index)
n <- max(min_index)
i=1
i=2
i=3
i=4

cluster[i,] = cbind(X[m],X[n])
max1= max(X[n],X[m])
index= which(X==max1)
X <- X[-index]
distance_matrix = distance_matrix[-n,-n]



distance_matrix = as.matrix(dist(X), "eculidean")
distance_matrix
distance_matrix[ row(distance_matrix) == col(distance_matrix) ] <- 10000


for(i in 1:5){
  distance_matrix[m][i] = distance_matrix[i][m] =  min(distance_matrix[m][i], distance_matrix[n][i])
}
distance_matrix = distance_matrix[-2,]



X
View(distance_matrix)
distance_matrix = distance_matrix[,-2]
View(distance_matrix)

n = -(1:5) 
distance_matrix[ row(distance_matrix) == col(distance_matrix) ] <- 10000
min_index = which(distance_matrix == min(distance_matrix), arr.ind = TRUE)
min_index = min_index[1,,drop=FALSE]
min_index
pair = {}
pair= X[min_index]
pair
pair = pair[order(pair)]
pair
merge = matrix(0,5,1)
merge[1,]=pair #1=j loop value
merge
grp = cbind(min_index, which(n %in% n[min_index[1,n[min_index]>0]]))
X[grp]=1 #=j which is loop variable



