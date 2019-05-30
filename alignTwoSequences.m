function [data1,data2] = alignTwoSequences(match,mismatch,gap,seq1,seq2)
%Funkcja dopasowuj�ca globalnie dwie sekwencje
%Argumenty wej�ciowe:
%match - ilo�� punkt�w przyznawana za zgodno�� pary
%mismatch - ilo�� punkt�w przyznawana za niezgodno�� pary
%gap - ilo�� punkt�w przyznawana za przerw�
%seq1,seq2 - tablice struktur sekwencji por�wnywanych
%Argumenty wyj�ciowe:
%data1,data2 - struktury sekwencji o polach 'sequence' i 'identifier'
[scoreMatrix,sequence1,sequence2] = scoringMatrix(match,mismatch,gap,seq1,seq2);
[aligmentMatrix] = tracBackMatrix(scoreMatrix,match,mismatch,gap,sequence1,sequence2);
[data1,data2] = sequencesAfterAlignment(aligmentMatrix,sequence1,sequence2);
data1.identifier = seq1.identifier;
data2.identifier = seq2.identifier;
end

