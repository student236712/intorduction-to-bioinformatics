function [data1,data2] = sequencesAfterAlignment(tracBackMatrix,sequence1,sequence2)
%Funcja zmieniajaca sekwencje po ich dopasowaniu, wstawia "-" w miejscach
%gap
%Argumenty wejœciowe:
%tracBackMatrix - macierz ze sciezka powrotu
%sequence1,sequence2 - sekwencje porownywane
%Argumenty wyjœciowe:
%data1,data2 - struktury z polem 'sequence'

[i,j] = size(tracBackMatrix);
while i >= 2 || j >= 2
    if (i >= 2 && j >= 2)
        if(tracBackMatrix(i,j) == 1 && tracBackMatrix(i,j-1) == 1)
            j = j-1;
            sequence1 = insertAfter(sequence1,i,"-");
        elseif(tracBackMatrix(i,j) == 1 && tracBackMatrix(i-1,j) == 1)
            i = i-1;
            sequence2 = insertAfter(sequence2,j,"-");
        else
            j = j-1;
            i = i-1;
        end
    elseif(i < 2)
        j = j-1;
        sequence1 = insertAfter(sequence1,i,"-");
    elseif(j < 2)
        i = i-1;
        sequence2 = insertAfter(sequence2,j,"-");
    end
end
sequence1 = sequence1(2:end);
sequence2 = sequence2(2:end);
data1.sequence = sequence1;
data2.sequence = sequence2;
end

