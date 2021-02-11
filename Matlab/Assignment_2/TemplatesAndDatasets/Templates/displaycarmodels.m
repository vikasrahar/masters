% CS5810  -- Programming for data analysis 
%
%  Assignment 2 | Prof. Alberto Paccanaro
% 
% INSERT YOUR CODE HERE!
%marking id: 65138

function out = displaycarmodels()
%loading the dataset 'cardata.mat'
loadFile = load('cardata.mat')
%menu for the choices of number of cylinders
choice = menu('Choose number of cylinders','3','4','5','6','8');
count = length(loadFile.Cylinders);
%second menu the choice for the car model for each value of the selected 
%number of cylinders. for ecah car model print the value for horsepower
% weight and origin of selected car

switch(choice)
 
    case 1
       
        choice_1=menu('Choose the model','mazda rx2 coupe','mazda rx3','mazda rx-4','mazda rx-7 gs');
        
        switch(choice_1)
        
            case 1 
                for num =1:count
                    string_1=strtrim(loadFile.Model(num,:));
                    str_cmp='mazda rx2 coupe';
                    if(strncmp(string_1,str_cmp,20)==1)
                        Horsepower=loadFile.Horsepower(num);
                        Weight=loadFile.Weight(num);
                        Origin=loadFile.Origin(num,:);
                    end
                end
                fprintf('Horsepower: %d',Horsepower);
                fprintf('\nWeight (Kg): %d',Weight);
                fprintf('\nOrigin: %s\n',Origin);
            
            case 2
                for num =1:count
                    string_1=strtrim(loadFile.Model(num,:));
                    str_cmp='mazda rx3';
                    if(strncmp(string_1,str_cmp,20)==1)
                        Horsepower=loadFile.Horsepower(num);
                        Weight=loadFile.Weight(num);
                        Origin=loadFile.Origin(num,:);
                    end
                end
                fprintf('Horsepower: %d',Horsepower);
                fprintf('\nWeight (Kg): %d',Weight);
                fprintf('\nOrigin: %s\n',Origin);
            
            case 3
                for num =1:count
                    string_1=strtrim(loadFile.Model(num,:));
                    str_cmp='mazda rx-4';
                    if(strncmp(string_1,str_cmp,20)==1)
                        Horsepower=loadFile.Horsepower(num);
                        Weight=loadFile.Weight(num);
                        Origin=loadFile.Origin(num,:);
                    end
                end
                fprintf('Horsepower: %d',Horsepower);
                fprintf('\nWeight (Kg): %d',Weight);
                fprintf('\nOrigin: %s\n',Origin);
            case 4
                for num =1:count
                    string_1=strtrim(loadFile.Model(num,:));
                    str_cmp='mazda rx-7 gs';
                    if(strncmp(string_1,str_cmp,20)==1)
                        Horsepower=loadFile.Horsepower(num);
                        Weight=loadFile.Weight(num);
                        Origin=loadFile.Origin(num,:);
                    end
                end
                fprintf('Horsepower: %d',Horsepower);
                fprintf('\nWeight (Kg): %d',Weight);
                fprintf('\nOrigin: %s\n',Origin);
        end
    
    case 2
        menu_pop_2=menu('Choose the model','citroen ds-21 pallas','toyota corona mark ii','datsun pl510');
        switch(menu_pop_2)
            case 1 
                for num =1:count
                    string_1=strtrim(loadFile.Model(num,:));
                    str_cmp='citroen ds-21 pallas';
                    if(strncmp(string_1,str_cmp,20)==1)
                        Horsepower=loadFile.Horsepower(num);
                        Weight=loadFile.Weight(num);
                        Origin=loadFile.Origin(num,:);
                    end
                end
                fprintf('Horsepower: %d',Horsepower);
                fprintf('\nWeight (Kg): %d',Weight);
                fprintf('\nOrigin: %s\n',Origin);
            case 2
                for num =1:lcount
                    string_1=strtrim(loadFile.Model(i,:));
                    str_cmp='toyota corona mark ii';
                    if(strncmp(string_1,str_cmp,20)==1)
                        Horsepower=loadFile.Horsepower(num);
                        Weight=loadFile.Weight(num);
                        Origin=loadFile.Origin(num,:);
                    end
                end
                fprintf('Horsepower: %d',Horsepower);
                fprintf('\nWeight (Kg): %d',Weight);
                fprintf('\nOrigin: %s\n',Origin);
            
            case 3
                for num =1:count
                    string_1=strtrim(loadFile.Model(i,:));
                    str_cmp='datsun pl510';
                    if(strncmp(string_1,str_cmp,20)==1)
                        Horsepower=loadFile.Horsepower(num);
                        Weight=loadFile.Weight(num);
                        Origin=loadFile.Origin(num,:);
                    end
                end
                fprintf('Horsepower: %d',Horsepower);
                fprintf('\nWeight (Kg): %d',Weight);
                fprintf('\nOrigin: %s\n',Origin);
            
        end
    
    case 3
        menu_pop_2=menu('Choose the model','audi 5000','mercedes-benz 300d','audi 5000s (diesel)');
        switch(menu_pop_2)
            case 1 
                for num =count
                    string_1=strtrim(loadFile.Model(num,:));
                    str_cmp='audi 5000';
                    if(strncmp(string_1,str_cmp,20)==1)
                        Horsepower=loadFile.Horsepower(num);
                        Weight=loadFile.Weight(num);
                        Origin=loadFile.Origin(num,:);
                    end
                end
                fprintf('Horsepower: %d',Horsepower);
                fprintf('\nWeight (Kg): %d',Weight);
                fprintf('\nOrigin: %s\n',Origin);
            case 2
                for num =1:count
                    string_1=strtrim(loadFile.Model(num,:));
                    str_cmp='mercedes-benz 300d';
                    if(strncmp(string_1,str_cmp,20)==1)
                        Horsepower=loadFile.Horsepower(num);
                        Weight=loadFile.Weight(num);
                        Origin=loadFile.Origin(num,:);
                    end
                end
                fprintf('Horsepower: %d',Horsepower);
                fprintf('\nWeight (Kg): %d',Weight);
                fprintf('\nOrigin: %s\n',Origin);
            case 3
                for num =1:count
                    string_1=strtrim(loadFile.Model(num,:));
                    str_cmp='audi 5000s (diesel)';
                    if(strncmp(string_1,str_cmp,20)==1)
                        Horsepower=loadFile.Horsepower(num);
                        Weight=loadFile.Weight(num);
                        Origin=loadFile.Origin(num,:);
                    end
                end
                fprintf('Horsepower: %d',Horsepower);
                fprintf('\nWeight (Kg): %d',Weight);
                fprintf('\nOrigin: %s\n',Origin);
        end
    
    case 4
        menu_pop_2=menu('Choose the model','datsun 810 maxima','buick century','ford granada gl');
        
        switch(menu_pop_2)
        
            case 1 
                for num =1:count
                    string_1=strtrim(loadFile.Model(num,:));
                    str_cmp='datsun 810 maxima';
                    if(strncmp(string_1,str_cmp,20)==1)
                        Horsepower=loadFile.Horsepower(num);
                        Weight=loadFile.Weight(num);
                        Origin=loadFile.Origin(num,:);
                    end
                end
                fprintf('Horsepower: %d',Horsepower);
                fprintf('\nWeight (Kg): %d',Weight);
                fprintf('\nOrigin: %s\n',Origin);
            case 2
                for num =1:count
                    string_1=strtrim(loadFile.Model(num,:));
                    str_cmp='buick century';
                    if(strncmp(string_1,str_cmp,20)==1)
                        Horsepower=loadFile.Horsepower(num);
                        Weight=loadFile.Weight(num);
                        Origin=loadFile.Origin(num,:);
                    end
                end
                fprintf('Horsepower: %d',Horsepower);
                fprintf('\nWeight (Kg): %d',Weight);
                fprintf('\nOrigin: %s\n',Origin);
                
            case 3
               for num =1:count
                    string_1=strtrim(loadFile.Model(num,:));
                    str_cmp='ford granada gl';
                    if(strncmp(string_1,str_cmp,20)==1)
                        Horsepower=loadFile.Horsepower(num);
                        Weight=loadFile.Weight(num);
                        Origin=loadFile.Origin(num,:);
                    end
                end
                fprintf('Horsepower: %d',Horsepower);
                fprintf('\nWeight (Kg): %d',Weight);
                fprintf('\nOrigin: %s\n',Origin);
        end
    
    case 5
        menu_pop_2=menu('Choose the model','citroen ds-21 pallas','toyota corona mark ii','volkswagen 1131 deluxe sedan');
        switch(menu_pop_2)
            case 1 
                for num =1:count
                    string_1=strtrim(loadFile.Model(num,:));
                    str_cmp='itroen ds-21 pallas';
                    if(strncmp(string_1,str_cmp,20)==1)
                        Horsepower=loadFile.Horsepower(num);
                        Weight=loadFile.Weight(num);
                        Origin=loadFile.Origin(num,:);
                    end
                end
                fprintf('Horsepower: %d',Horsepower);
                fprintf('\nWeight (Kg): %d',Weight);
                fprintf('\nOrigin: %s\n',Origin);
                
            case 2
                for num =1:count
                    string_1=strtrim(loadFile.Model(num,:));
                    str_cmp='toyota corona mark ii';
                    if(strncmp(string_1,str_cmp,20)==1)
                        Horsepower=loadFile.Horsepower(num);
                        Weight=loadFile.Weight(num);
                        Origin=loadFile.Origin(num,:);
                    end
                end
                fprintf('Horsepower: %d',Horsepower);
                fprintf('\nWeight (Kg): %d',Weight);
                fprintf('\nOrigin: %s\n',Origin);
            case 3
                for num =1:count
                    string_1=strtrim(loadFile.Model(num,:));
                    str_cmp='volkswagen 1131 deluxe sedan';
                    if(strncmp(string_1,str_cmp,20)==1)
                        Horsepower=loadFile.Horsepower(num);
                        Weight=loadFile.Weight(num);
                        Origin=loadFile.Origin(num,:);
                    end
                end
                fprintf('Horsepower: %d',Horsepower);
                fprintf('\nWeight (Kg): %d',Weight);
                fprintf('\nOrigin: %s\n',Origin);
        end
         
    otherwise
        fprintf('invalid numbers of cylinders\n');
end

