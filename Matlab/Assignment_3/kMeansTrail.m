function out = kMeansTrail(Data,k)


% choose k unique random indices between 1 and size(P,2) (number of points)
indexs = randperm(size(Data,1));
% initial centroids
initalCentroid = Data(indexs(1:k),:)

StoreIndexs = zeros(size(Data,2),1);
% init stopping criterion
stop = false; % if stopping criterion met, it changes to true

"while stop ~= true"
    
    % for each data point 
    for num = 1:size(Data,1)
        % compute distance to each centroid
        for var=1:k
            dist(var) = pdist2(Data(num,:),initalCentroid(var,:));
        end
        [~, index] = min(dist);
        StoreIndexs(num) = index;
    end 
   
     % init centroid array centr
    centr = zeros(k,size(Data,2));
    % for every cluster compute new centroid
    for num = 1:k
        % find the points in cluster number idxC and compute row-wise mean
        centr(num,:) = mean(Data(StoreIndexs==num,:));
    end
    centr
    size(centr)
 

"https://github.com/matzewolf/kMeans/blob/master/kMeans.m"
"http://aqibsaeed.github.io/2016-06-24-k-means/"
