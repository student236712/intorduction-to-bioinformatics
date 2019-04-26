function [R,sequence1,sequence2,id1,id2] = scoringMatrix(gap,seq1,seq2,substitutionMatrixPath)
%Funkcja za pomoc¹, której generowana jest macierz punktacji dla dwóch
%sekwencji.
%Argumenty wejœciowe:
%gap - iloœæ punktów przyznawana za przerwê
%seq1,seq2 - tablice struktur sekwencji porównywanych
%substitutionMatrixPath - sciezka pliku tekstowego z macierza substytucji
%Argumenty wyjœciowe:
%R - macierz punktacji dla dwóch sekwencji
%sequence1,sequence2 - sekwencje porównywane
%id1,id2 - identyfikatory sekwencji
[substitutionPoints,rowsNames,columnsNames] = readSubstitutionMatrix(substitutionMatrixPath);
fastaStruct1 = seq1;
fastaStruct2 = seq2;

isSeqenceCorrect(fastaStruct1.sequence);%sprawdzenie poprawnoœci sekwencji
isSeqenceCorrect(fastaStruct1.sequence);
sequence1 = "-" + fastaStruct1.sequence;
sequence2 = "-" + fastaStruct2.sequence;

n =  length(sequence1{1,1});
m =  length(sequence2{1,1});
[g,f] = size(substitutionPoints);
V = 0;
H = zeros(1,4);
R = zeros(n,m);
for i =  2:n
    for j =  2:m
        for k = 1:g
            for y = 1:f
                if ((sequence1{1,1}(i) == rowsNames{k,1}) && (sequence2{1,1}(j) == columnsNames{1,y}))
                    V = substitutionPoints(k,y);
                end
            end
        end
        H(1) = R(i-1,j-1) + V;
        H(2) = R(i-1,j) + gap;
        H(3) = R(i,j-1) + gap;       
        R(i,j) = max(H);  
    end
end
sequence1 = sequence1{1,1};
sequence2 = sequence2{1,1};
id1 = fastaStruct1.identifier;
id2 = fastaStruct2.identifier;
end

