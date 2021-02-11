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