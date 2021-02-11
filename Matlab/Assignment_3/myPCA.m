function [eigvector,eigvalue] = myPCA(Xmu)
valueCov = cov(Xmu);
[eigvector,eigvalue] = eig(valueCov);
[eigvalue,eigvalue_sorted] = sort(diag(eigvalue),'descend');
eigvector = eigvector(:,eigvalue_sorted);


return ;



