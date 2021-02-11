function [max_occurance,min_occurance,all_words] = example(n)

loadFile = fileread('TheTortoiseAndTheHare.txt');
wordsCount = lower(strsplit(loadFile, ' '));
[words, in, index] = unique(wordsCount);
count = histcounts(index,numel(words));
[frequency,rankIndex] = sort(count,'descend');

words = words(rankIndex);

max_occurance = {words(1:n),frequency(1:n)};
min_occurance = {words(length(words)-n:length(words)),frequency(length(words)-n:length(words))};
all_words = {words(1:length(words)),frequency(1:length(words))};


