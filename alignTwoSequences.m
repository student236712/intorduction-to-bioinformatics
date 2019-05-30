function [data1,data2] = alignTwoSequences(match,mismatch,gap,seq1,seq2)
%Funkcja dopasowuj¹ca globalnie dwie sekwencje
%Argumenty wejœciowe:
%match - iloœæ punktów przyznawana za zgodnoœæ pary
%mismatch - iloœæ punktów przyznawana za niezgodnoœæ pary
%gap - iloœæ punktów przyznawana za przerwê
%seq1,seq2 - tablice struktur sekwencji porównywanych
%Argumenty wyjœciowe:
%data1,data2 - struktury sekwencji o polach 'sequence' i 'identifier'
[scoreMatrix,sequence1,sequence2] = scoringMatrix(match,mismatch,gap,seq1,seq2);
[aligmentMatrix] = tracBackMatrix(scoreMatrix,match,mismatch,gap,sequence1,sequence2);
[data1,data2] = sequencesAfterAlignment(aligmentMatrix,sequence1,sequence2);
data1.identifier = seq1.identifier;
data2.identifier = seq2.identifier;
end

