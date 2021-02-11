function [initalCentroid,StoreIndexs] = mykmeans(Data,k)
% choose k unique random indices between 1 and size(P,2) (number of points)
indexs = randperm(size(Data,1));
% initial centroids
initalCentroid = Data(indexs(1:k),:);

StoreIndexs = zeros(size(Data,2),1);
% init stopping criterion
loopCondition = false; % if stopping criterion met, it changes to true

while loopCondition ~= true
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
    finalCentroid = zeros(k,size(Data,2));
    % for every cluster compute new centroid
    for num = 1:k
        % find the points in cluster number idxC and compute row-wise mean
        finalCentroid(num,:) = mean(Data(StoreIndexs==num,:));
    end
    
    if (finalCentroid == initalCentroid)
        loopCondition = true;
    end 
     initalCentroid = finalCentroid;  
     
end 
hold off;
for num=1:k 
    value = Data(StoreIndexs==num,:);
    plot (value(:,1),value(:,2),'x');
    hold on;
    plot(finalCentroid(num,1),finalCentroid(num,2),'d','color','k','LineWidth',2,'markerfacecolor','r','markersize',12)
    hold on; 
end 
return;
end 
        
