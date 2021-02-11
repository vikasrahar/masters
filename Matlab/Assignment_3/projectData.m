function newdataset = projectData(Xmu, U, k)
newEignVector = U(1:k,:)

newdataset = Xmu * newEignVector(1:k,:)';

end 
    


