singlefunction <- function(matrix_cluster, k_value)
{
  row = length(matrix_cluster)
  distance_matrix = rep(0,length(row))
  
  distance_matrix = as.matrix(dist(matrix_cluster), "eculidean")
  distance_matrix[ row(distance_matrix) == col(distance_matrix) ] <- 10000
  
  min_index = which(distance_matrix == min(distance_matrix), arr.ind = TRUE)
  
    
 
  return(min_index)
}