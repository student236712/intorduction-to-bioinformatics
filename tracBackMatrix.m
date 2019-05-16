function [alignmentMatrix,cost] = tracBackMatrix(R,match,mismatch,gap,sequence1,sequence2)
%Funkcja generuj¹ca macierz ze œcie¿k¹ optymalnego dopasowania 
%(poruszanie siê po 1 odpowiada œcie¿ce)
%Argumenty wejœciowe:
%R - macierz punktacji dla dwóch sekwencji
%match - iloœæ punktów przyznawana za zgodnoœæ pary
%mismatch - iloœæ punktów przyznawana za niezgodnoœæ pary
%gap - iloœæ punktów przyznawana za przerwê
%sequence1,sequence2 - sekwencje porównywane
%Argumenty wyjœciowe:
%alignmentMatrix - macierz ze œcie¿k¹
%cost - koszt dopasowania dwóch sekwencji

[i,j] =  size(R);
alignmentMatrix =  zeros(i,j);
alignmentMatrix(end) =  1;
H = zeros(1,3);
cost = 0;
while i >=  2 || j >= 2
    if (i >=  2 && j >= 2)
        H(1) = R(i-1,j-1);
        H(2) = R(i-1,j);
        H(3) = R(i,j-1);
       
        if ((R(i,j)- H(1)) == match ) && (sequence1(i) == sequence2(j))
            i = i-1;
            j = j-1;
            cost = cost + match;
        else
            if ((R(i,j)-H(1)) == mismatch ) && (sequence1(i) ~= sequence2(j))
                i = i-1;
                j = j-1;
                cost = cost + mismatch;
            else
                cost = cost + gap;
                if (R(i,j)- H(2) == gap)
                    i = i-1;
                else
                    if (R(i,j)- H(3) == gap )
                        j = j-1;
                    end
                end
            end
        end
    elseif (j<2)
        cost = cost + gap;
        i = i-1;
    elseif(i<2)
        cost = cost + gap;
        j = j-1;
    end
    alignmentMatrix(i,j) = 1;
end
end
