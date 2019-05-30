function [data,countMax] = tracBackMatrix(R,substitutionMatrixPath,gap,sequence1,sequence2,alignmentAmount)
%Funkcja generuj�ca macierz ze �cie�k� optymalnego dopasowania (poruszanie
%si� po 1 odpowiada �cie�ce)
%Argumenty wej�ciowe:
%R - macierz punktacji dla dw�ch sekwencji
%substitutionMatrixPath
%gap
%sequence1,sequence2
%Argumenty wyj�ciowe:
%data  - struktura z danymi dopasowania
%countMax - ilosc znalezionych dopasowan lokalnych
%alignmentAmount - ilosc szukanych sciezek dopasowan
[substitutionPoints,rowsNames,columnsNames] = readSubstitutionMatrix(substitutionMatrixPath);
[n,m] =  size(R);
[t,u] = size(substitutionPoints);
if isstring(alignmentAmount)
    if alignmentAmount == "all"
        [a,b] = find(R == max(max(R)));
    end
else
    [a,b] = find(R == max(max(R)),alignmentAmount,'last');
end
[countMax,~] = size(a);
V = 0;
for g = 1:countMax
    aligmentMatrix =  zeros(n,m);
    H = ones(1,3);
    i =  a(g,1);
    j =  b(g,1);
    aligmentMatrix(i,j) = 1;
    endSeq1 = i;
    endSeq2 = j;
    
    
    while((i >= 2 && j >= 2) && (max(H)>0))
        if ~ismember(i-1,a) && ~ismember(j-1,b)
            H(1) = R(i-1,j-1);
            H(2) = R(i-1,j);
            H(3) = R(i,j-1);
            
            for k = 1:t
                for y = 1:u
                    if ((sequence1(i) == rowsNames{k,1}) && (sequence2(j) == columnsNames{1,y}))
                        V = substitutionPoints(k,y);
                    end
                end
            end
            if((R(i,j) - H(1)) == V)
                i = i-1;
                j = j-1;
            else
                if((R(i,j) - H(2)) == gap)
                    i = i-1;
                else
                    if((R(i,j) - H(3)) == gap)
                        j = j-1;
                    else
                        break;
                    end
                end
            end
            if (max(H) > 0)
                aligmentMatrix(i,j) = 1;
                endSeq1 = i;
                endSeq2 = j;
            end
        else
            break;
        end
        
    end
    data(g).aligmentMatrix = aligmentMatrix(endSeq1:a(g,1),endSeq2:b(g,1));
    data(g).endSeq1 = endSeq1;
    data(g).startSeq1 = a(g,1);
    data(g).endSeq2 = endSeq2;
    data(g).startSeq2 = b(g,1);
    data(g).wholeAligmentMatrix = aligmentMatrix;
end
end
