function records = outpatientreport()
%loading the dataset 'myhospital.mat'
hospitalLoad= load('myhospital.mat');
%storing the coulums of dataset in the variables
var_nameLast = hospitalLoad.LastName;
var_sex = hospitalLoad.Sex;
var_age = hospitalLoad.Age;
var_weight =hospitalLoad.Weight;
var_issmoker = hospitalLoad.isSmoker;

%building the array structure containing the patients information
for num = 1:100
    data(num,1) = struct('LastName',var_nameLast{num},'Sex',var_sex{num},'Age',var_age(num),'Weight',var_weight(num),'isSmoker',var_issmoker(num));
end 
%displaying the first 10 patients details
for num = 1:10
    j = randi(100);
    fprintf('%s %s %d %d %d\n', var_nameLast{j}, var_sex{j}, var_age(j), var_weight(j), var_issmoker(j));
end 

%drawing the boxplot weight vs smoking habits
boxplot(var_weight,var_issmoker,'labels',{'No','Yes'});
xlabel('IsSmoker?');
ylabel('Weight (kg)');

records = data;

end

