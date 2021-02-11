% CS 5810  -- Programming for data analysis 
%
%  Assignment 3 | Prof. Alberto Paccanaro
% 
%
% 
% Insert BELOW your code 
% marking ID is : 65138
% 1. load the PCADATA.MAT and plot the data with axis[0 7 2 8] call the
% subtract function. 2.Call the myPCA function and calculate the principal
% compoenents and plot it. 3. for the k value of 1, call the projectData
% function. 4. on the projected data call the recover function. 6. subplots
% the actual data with the projecr data

% for the faces code is written below: 1. load thePCAFACES.MAT file 2.
% Display first 100 faces. 3. Call subtractMean and myPCA function. 4. for
% the k value of 200 project the dataset. %. call the projectData function
%5. on the projected dataset, call the RecoverData function. 6. Subplots 2 
% a. is actual data b. recovered data.
load('pcadata.mat');
subplot(2,1,1);
plot(X(:,1),X(:,2),'bo');
title('Datapoints and their 2 principal components');
xmin=0;
xmax=7;
ymin=2;
ymax=8;
axis([xmin xmax ymin ymax]);

[Xmu, mu] = subtractMean(X);
[U,S] = myPCA(Xmu);
hold on;

principalComponents = U' + mu;
%mean_new = mean(U' +mu);

line(principalComponents(1,:),mu,'Color','r');
hold on;
line(principalComponents(2,:),mu,'Color','g');
hold on;
k = 1;
Z = projectData(Xmu, U, k);
disp(Z(1:3,:))
Xrec = recoverData(Z,U,k,mu);
subplot(2,1,2);
x1=0;
x2=7;
y1=2;
y2=8;
axis([x1 x2 y1 y2])
plot(Xrec(:,1),Xrec(:,2),'r*');

hold on;
plot(X(:,1),X(:,2),'bo');

title('Datapoints and their reconstruction');

%-------------------------------------------------------------------------%
%-------------------------------------------------------------------------%

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
