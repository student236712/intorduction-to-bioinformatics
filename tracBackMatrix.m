function [data,countMax] = tracBackMatrix(R,substitutionMatrixPath,gap,sequence1,sequence2)
%Funkcja generuj¹ca macierz ze œcie¿k¹ optymalnego dopasowania (poruszanie
%siê po 1 odpowiada œcie¿ce)
%Argumenty wejœciowe:
%R - macierz punktacji dla dwóch sekwencji
%substitutionMatrixPath
%gap
%sequence1,sequence2
%Argumenty wyjœciowe:
%data  - struktura z danymi dopasowania
%countMax - ilosc znalezionych dopasowan lokalnych
[substitutionPoints,rowsNames,columnsNames] = readSubstitutionMatrix(substitutionMatrixPath);
[n,m] =  size(R);
[t,u] = size(substitutionPoints);
[a,b] = find(R == max(max(R)));
[countMax,~] = size(a);
V = 0;
for g = 1:countMax
    aligmentMatrix =  zeros(n,m);
    H = ones(1,3);
    i =  a(g,1);
    j =  b(g,1);
    aligmentMatrix(i,j) = 1;
    while((i>=2 && j>=2) && (max(H)>0))
        
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
            if((R(i,j)-H(1))== V)
                i = i-1;
                j = j-1;
            else
                if((R(i,j) - H(2)) == gap)
                    i = i-1;
                else
                    j = j-1;
                end
            end
        if (max(H)>0)
            aligmentMatrix(i,j) = 1;
            koniec1 = i;
            koniec2 = j;
        end
    end
    data(g).aligmentMatrix = aligmentMatrix(koniec1:a(g,1),koniec2:b(g,1));
    data(g).koniec1 = koniec1;
    data(g).wiersz = a(g,1);
    data(g).koniec2 = koniec2;
    data(g).kolumna = b(g,1);
    data(g).wholeAligmentMatrix = aligmentMatrix;    
end
end
