% CS 5810  -- Programming for data analysis 
%
%  Assignment 3 | Prof. Alberto Paccanaro
% 
%
% 
% Insert BELOW your code 
% marking ID is : 65138
% 1. in this function first calculate the covariance 2. on the covariance
% calculate the eigenvectors and eigenvalue. 3. sort the eignvector based
% upon the eigenvalue in the descending order.
function [eigvector,eigvalue] = myPCA(Xmu)
valueCov = cov(Xmu);
[eigvector,eigvalue] = eig(valueCov);
[eigvalue,eigvalue_sorted] = sort(diag(eigvalue),'descend');
eigvector = eigvector(:,eigvalue_sorted);

return ;
end

