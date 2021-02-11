load('pcafaces.mat');
displayData(X(1:100,:));
[Xmu, mu] = subtractMean(X);
[U,S] = myPCA(Xmu);
k =200;
%principalComponents = U' + mu;
newdataset = projectData(Xmu, U, k);
recover = recoverData(newdataset, U, k, mu);

subplot(2,1,1);
number = displayData(X(1:100,:));
hold on;
subplot(2,1,2);
number_recover = displayData(recover(1:100,:));
hold on;

