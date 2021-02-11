% CS 5810  -- Programming for data analysis 
%
%  Assignment 3 | Prof. Alberto Paccanaro
% 
%
% 
% Insert BELOW your code 
% Marking ID is 65138
% this functions takes 2 inputs: Data and k value. initial define the
% centroid and index variable with the respective sizes
% if loop condition is false then goes inside loop, now calaculate the
% initial centroid and find the min dist and store its index. Compute the
% final centroid using the mean with of data os indicies stored in earlier
% step. if initial centroid is equal to final centroid, then makes the loop
% condition as true. Otherwise continuos with the loop. In last plot the
% centroids along the dataset points.

function [initalCentroid,StoreIndexs] = mykmeans(Data,k)

indexs = randperm(size(Data,1));
initalCentroid = Data(indexs(1:k),:);

StoreIndexs = zeros(size(Data,2),1);
loopCondition = false; 

while loopCondition ~= true
     
    for num = 1:size(Data,1)
        for var=1:k
            dist(var) = pdist2(Data(num,:),initalCentroid(var,:));
        end
        [~, index] = min(dist);
        StoreIndexs(num) = index;
    end 
   
     
    finalCentroid = zeros(k,size(Data,2));
    
    for num = 1:k
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
        

