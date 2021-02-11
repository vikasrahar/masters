% CS 5810  -- Programming for data analysis
%
% 
% Assignment 3 | Prof. Alberto Paccanaro
% 
% docdistances script will calculate distances between pairs of text documents. 
% These distances will be based on a vanilla version of term frequency?inverse document 
% frequency (tf-idf). Your script will calculate the distances between 6 documents
% 
% Insert BELOW your code 
% Marking ID:65138

%this function 1. reads the files and find the unique words and store them
%in a cell array. 2. stores the files and find the unique of all the
%textfile. 3. find TF 4. Find the IDF. 5. find TF-IDF 6. Calculate teh
%cosine distance 7. calculate the distance 6*6 matrix. &. Makes the figure.

file_read1 = fileread('RedRidingHood.txt');
file_read2 = fileread('PrincessPea.txt');
file_read3 = fileread('Cinderella.txt');
file_read4 = fileread('CAFA1.txt');
file_read5 = fileread('CAFA2.txt');
file_read6 = fileread('CAFA3.txt');

text_file_1 = lower(split(file_read1,' '));
text_file_2 = lower(split(file_read2,' '));
text_file_3 = lower(split(file_read3,' '));
text_file_4 = lower(split(file_read4,' '));
text_file_5 = lower(split(file_read5,' '));
text_file_6 = lower(split(file_read6,' '));

text_file={text_file_1 text_file_2 text_file_3 text_file_4 text_file_5 text_file_6};


txt1 = unique(text_file_1);
txt2 = unique(text_file_2);
txt3 = unique(text_file_3);
txt4 = unique(text_file_4);
txt5 = unique(text_file_5);
txt6 = unique(text_file_6);

file_read={file_read1 file_read2 file_read3 file_read4 file_read5 file_read6};

txt={txt1 txt2 txt3 txt4 txt5 txt6};
tf=ones(285,6);

doc_f = cell(285,6);
for i=1:6
    for j=1:length(txt{i})
        doc_f{i}{j,1}=length(find(strcmp(txt{i}{j},text_file{i})));
    end
    doc_f{i}=cell2mat(doc_f{i});
    term_frequency((1:length(doc_f{i})),i)=doc_f{i};
end

all_doc_term_frequency = cell(285,6);

for i=1:length(doc_f)
    for k=1:length(txt)
        for j=1:length(doc_f{i})
            all_doc_term_frequency{i}{j,k}=length(find(strcmp(txt{i}{j},text_file{k})));
        end
    end
    all_doc_term_frequency{i}=cell2mat(all_doc_term_frequency{i});
end


idf_per_doc = cell(285,6);
idf_per_doc=ones(285,6);
for i=1:length(all_doc_term_frequency)
    for j=1:length(all_doc_term_frequency{i})
        count_per_doc{i}{j,1}=cell2mat(sum((all_doc_term_frequency{i}(j,:)>0))); 
        idf_per_doc{i}{j,1}=log10(6/cell2mat(sum((all_doc_term_frequency{i}(j,:)>0))));
    end
    count_per_doc{i}=cell2mat(count_per_doc{i});
    idf_per_doc{i}=cell2mat(idf_per_doc{i});
    idf_per_doc((1:length(idf_per_doc{i})),i)=idf_per_doc{i};
end


tf_idf_doc=term_frequency.*idf_per_doc;
cosine_distance=pdist(tf_idf_doc','cosine');
cos_matrix=zeros(6,6);
cos_matrix=squareform(cosine_distance);

imagesc(cos_matrix);
colormap gray;
colorbar;