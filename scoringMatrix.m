function [R,sequence1,sequence2,id1,id2] = scoringMatrix(match,mismatch,gap,mode,seq1,seq2)
%Funkcja za pomoc¹, której generowana jest macierz punktacji dla dwóch
%sekwencji.
%Argumenty wejœciowe:
%match - iloœæ punktów przyznawana za zgodnoœæ pary
%mismatch - iloœæ punktów przyznawana za niezgodnoœæ pary
%gap - iloœæ punktów przyznawana za przerwê
%mode - tryb porównania sekwencji: D - distance, S - similarity
%seq1,seq2 - tablice struktur sekwencji porównywanych
%Argumenty wyjœciowe:
%R - macierz punktacji dla dwóch sekwencji
%sequence1,sequence2 - sekwencje porównywane
%id1,id2 - identyfikatory sekwencji

fastaStruct1 = seq1;
fastaStruct2 = seq2;

%%isSeqenceCorrect(fastaStruct1.sequence);%sprawdzenie poprawnoœci sekwencji
%%isSeqenceCorrect(fastaStruct1.sequence);
sequence1 = "-" + fastaStruct1.sequence;
sequence2 = "-" + fastaStruct2.sequence;

n =  length(sequence1{1,1});
m =  length(sequence2{1,1});
           
H =  zeros(1,3);

if mode == 'D'
    R =  zeros(n,m);
    R((2:n),1) =  2:gap:(2*n)-1;
    R(1,(2:m)) =  2:gap:(2*m)-1;
    
elseif mode == 'S'
    R =  zeros(n,m);
    R((2:n),1) = (-2):gap:(-2*n)+1;
    R(1,(2:m)) = (-2):gap:(-2*m)+1;
       
else
    error('unexpected mode');
end
    
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
       
        if mode == 'D'
            R(i,j) = min(H);
        else
            R(i,j) = max(H);
        end
       

    end
end
sequence1 = sequence1{1,1};
sequence2 = sequence2{1,1};
id1 = fastaStruct1.identifier;
id2 = fastaStruct2.identifier;
end

