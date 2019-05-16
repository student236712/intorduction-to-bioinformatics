function [R,sequence1,sequence2] = scoringMatrix(match,mismatch,gap,seq1,seq2)
%Funkcja za pomoc�, kt�rej generowana jest macierz punktacji dla dw�ch
%sekwencji.
%Argumenty wej�ciowe:
%match - ilo�� punkt�w przyznawana za zgodno�� pary
%mismatch - ilo�� punkt�w przyznawana za niezgodno�� pary
%gap - ilo�� punkt�w przyznawana za przerw�
%seq1,seq2 - tablice struktur sekwencji por�wnywanych
%Argumenty wyj�ciowe:
%R - macierz punktacji dla dw�ch sekwencji
%sequence1,sequence2 - sekwencje por�wnywane

fastaStruct1 = seq1;
fastaStruct2 = seq2;

isSeqenceCorrect(fastaStruct1.sequence);%sprawdzenie poprawno�ci sekwencji
isSeqenceCorrect(fastaStruct1.sequence);
sequence1 = "-" + fastaStruct1.sequence;
sequence2 = "-" + fastaStruct2.sequence;

n =  length(sequence1{1,1});
m =  length(sequence2{1,1});

H =  zeros(1,3);

R =  zeros(n,m);
R((2:n),1) =  2:gap:(2*n)-1;
R(1,(2:m)) =  2:gap:(2*m)-1;

for i =  2:n
    for j =  2:m
        if sequence1{1,1}(i) == sequence2{1,1}(j)
            V = match;
        else
            V = mismatch;
        end
        H(1) = R(i-1,j-1) + V;
        H(2) = R(i-1,j) + gap;
        H(3) = R(i,j-1) + gap;
        R(i,j) = min(H); %zak�adamy prac� w trybie distance - dlatego funkcja min
    end
end
sequence1 = sequence1{1,1};
sequence2 = sequence2{1,1};
end

