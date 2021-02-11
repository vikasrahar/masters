function averageOfCalories = caloriesaverage(amountOfCalories)
persistent totalAmountOfCalories
persistent number 
%if entered amount is more than 2000, then reached recommended calories
if (amountOfCalories > 2000)
    fprintf("Reached the recommended calories !!\n");
elseif (amountOfCalories == 0)
    %elseif entered amount is zero, then resets the values
    totalAmountOfCalories = 0;
    number = 0;
    averageOfCalories = 0;
    fprintf("start from zero again!\n");
elseif ((amountOfCalories < 2000) && (amountOfCalories > 0))
    %cacluating the calories
    number = number + 1;
    totalAmountOfCalories = totalAmountOfCalories + amountOfCalories;
    averageOfCalories = totalAmountOfCalories / number;
    %if total caloreis is more than 2000, then print reached the
    %recommended value
    if (totalAmountOfCalories>2000)
        fprintf("Reached the recommended calories !!\n");
    end
end 
return 
end
