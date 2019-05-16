function [numberOfGaps,numberOfIdentity,k,compares,u,gapsPercent,identityPercent,x] = createInfo(tracBackMatrix,sequence1,sequence2)
%Funkcja zwracaj�ca statystyki dla dopasowania globalnego dw�ch sekwencji
%oraz ko�cowe sekwencje wynikaj�ce z optymalnego dopasowania (po wstawieniu
%przerw)
%Argumenty wej�ciowe:
%tracBackMatrix - macierz ze �cie�k� optymalnego dopasowania
%sequence1,sequence2 - sekwencje por�wnywane
%Argumenty wyj�ciowe:
%numberOfGaps - liczba przerw w obu por�wnywanych sekwencjach
%numberOfIdentity - liczba par analogicznych w por�wnywanych sekwencjach
%k - pierwsza sekwencja po uzupe�nieniu przerwami
%compares - linia tekstu pokazuj�ca analogiczne pary "|" oraz
%nieanalogiczne "x"
%u - druga sekwencja po uzupe�nieniu przerwami
%gapsPercent - procent przerw w por�wnywanych sekwencjach
%identityPercent - procent par analogicznych w por�wnywanych sekwencjach
%length - d�ugo�� sekwencji
t = tracBackMatrix;
k = sequence1;
u = sequence2;
[i,j] = size(tracBackMatrix);
numberOfGaps = 0;
numberOfIdentity = 0;

while i >= 2 || j >= 2
    
    if (i >= 2 && j >= 2)
        if(t(i,j) == 1 && t(i,j-1) == 1)
            j = j-1;
            k = insertAfter(k,i,"-");
            numberOfGaps = numberOfGaps + 1;
            
        elseif(t(i,j) == 1 && t(i-1,j) == 1)
            i = i-1;
            u = insertAfter(u,j,"-");
            numberOfGaps = numberOfGaps + 1;
            
        else
            j = j-1;
            i = i-1;
        end
    elseif(i < 2)
        j = j-1;
        k = insertAfter(k,i,"-");
        numberOfGaps = numberOfGaps + 1;
        
    elseif(j < 2)
        i = i-1;
        u = insertAfter(u,j,"-");
        numberOfGaps = numberOfGaps + 1;
    end
end

k = k(2:end);
u = u(2:end);

x = length(k);
compares = k;
for i = 1:x
    if u(i) == k(i)
        compares(i) = "*";
        numberOfIdentity = numberOfIdentity+1;
    else
        compares(i) = " ";
    end
end
gapsPercent = (numberOfGaps / x)*100;
identityPercent = (numberOfIdentity / x)*100;
end

