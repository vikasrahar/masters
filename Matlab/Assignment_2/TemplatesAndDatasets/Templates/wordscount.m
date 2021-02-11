% CS5810  -- Programming for data analysis 
%
%  Assignment 2 | Prof. Alberto Paccanaro
% 
% INSERT YOUR CODE HERE!
%marking ID: 65138

% loading the file and spliting the files into words with the lowercase.
%using using finding the unique words with their indexes. Histcounts,
%counts the occurance of each word. Now we are sorting the count(words)
%with the descending value of count.
%returns the max occurances of first n words with their counts
%returns the min occurances of first n words with their counts
%prints all words with their count

function [max_occurance,min_occurance] = wordscount(n)

loadFile = fileread('TheTortoiseAndTheHare.txt');
wordsCount = lower(strsplit(loadFile, ' '));
[words, in, index] = unique(wordsCount);
count = histcounts(index,numel(words));
[frequency,rankIndex] = sort(count,'descend');

words = words(rankIndex);

max_occurance = cell2table({words(1:n),frequency(1:n)});
min_occurance = cell2table({words(length(words)-n:length(words)),frequency(length(words)-n:length(words))});

for i=1:length(words)
    final(i,1)=struct('Words',words{i},'Frequency',frequency(i));
end

final=struct2table(final);

fprintf("all words with their counts:\n");
disp(final);

fprintf('Least Occurance:\n');
disp(words(length(words)+1-n:length(words)));
disp(frequency(length(words)+1-n:length(words)));
end