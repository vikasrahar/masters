% CS 5810  -- Programming for data analysis 
%
%  Assignment 3 | Prof. Alberto Paccanaro
% 
%
% 
% Insert BELOW your code 
% marking ID is : 65138
% 1. calcualte the datset for first k values of eigenvector. 2. get dot
% product of Xmu with the calulated daatset and return
function newdataset = projectData(Xmu, U, k)
newEignVector = U(1:k,:)

newdataset = Xmu * newEignVector(1:k,:)';

return;
end 

