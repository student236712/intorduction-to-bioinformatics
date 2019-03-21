 function [dotMatrix,matrixAfterFiltring,label1,label2] = filtrMatrix(window,treshold,struct1,struct2)
%Funkcja filtrujaca o podanej wielkosci okna i progu bledu

label1=struct1.identifier;
label2=struct2.identifier;

dotMatrix=computeDotMatrix(struct1.sequence,struct2.sequence);
%wygenerowanie dot plot'a dla podanych sekwencji

[rows,columns]=size(dotMatrix);

if window>rows || window>columns
    error('Podane okno dluzsze od sekwencji');
end

helperMatrix=zeros(rows,columns);

for i=window:rows 
    for j=window:columns 
       K=(dotMatrix(i-window+1:i,j-window+1:j)); %macierz o wymiarach okna, 
       %która "porusza siê" po ca³ej macierzy dotMatrix
        if sum(diag(K))>=window-treshold 
          helperMatrix(i-window+1:i,j-window+1:j)=eye(window);
        end
    end
end

matrixAfterFiltring=and(dotMatrix,helperMatrix);
end
