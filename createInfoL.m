function [numberOfGaps,numberOfIdentity,k,compares,u,gapsPercent,identityPercent,n] = createInfoL(tracBackMatrix,sequence1,sequence2,wiersz,kolumna,koniec1,koniec2)
%Funkcja zwracaj�ca statystyki dla dopasowania globalnego dw�ch sekwencji
%oraz ko�cowe sekwencje wynikaj�ce z optymalnego dopasowania (po wstawieniu
%przerw)
%Argumenty wej�ciowe:
%tracBackMatrix - macierz ze �cie�k� optymalnego dopasowania
%sequence1,sequence2 - sekwencje por�wnywane
%wiersz - indeks wiersza macierzy punkt�w, w kt�rym ko�czy si� optymalna �cie�ka
%kolumna - indeks kolumny macierzy punkt�w, w kt�rym ko�czy si� optymalna �cie�ka
%koniec1 - indeks wiersza macierzy punkt�w, w kt�rym zaczyna si� optymalna �cie�ka
%koniec2 - indeks kolumny macierzy punkt�w, w kt�rym zaczyna si� optymalna �cie�ka
%Argumenty wyj�ciowe:
%numberOfGaps - liczba przerw w obu por�wnywanych sekwencjach
%numberOfIdentity - liczba par analogicznych w por�wnywanych sekwencjach
%k - pierwsza sekwencja po uzupe�nieniu przerwami
%compares - linia tekstu pokazuj�ca analogiczne pary "|" oraz
%nieanalogiczne " "
%u - druga sekwencja po uzupe�nieniu przerwami
%gapsPercent - procent przerw w por�wnywanych sekwencjach
%identityPercent - procent par analogicznych w por�wnywanych sekwencjach
%length - d�ugo�� sekwencji

numberOfGaps = 0;
numberOfIdentity = 0;
t = tracBackMatrix;

k = sequence1(koniec1+1:wiersz);
u = sequence2(koniec2+1:kolumna);


[one,n] = size(k);
[one,m] = size(u);
for i = n:-1:2
    for j = m:-1:2
        if(t(i,j) == 1 && t(i,j-1) == 1)
            k = insertBefore(k,i,"-");
            numberOfGaps = numberOfGaps+1;
            
        elseif(t(i,j) == 1 && t(i-1,j) == 1)
            
            u = insertBefore(u,j,"-");
            numberOfGaps = numberOfGaps+1;
            
        end
    end
end

newString = join(k,1);
k = replace(newString,newline,"");
newString2 = join(u,1);
u = replace(newString2,newline,"");
compares = k;
[one,n] = size(u);
for i = 1:n
    if k(i) == u(i)
        compares(i) = "|";
        numberOfIdentity = numberOfIdentity+1;
    else
        compares(i) = " ";
    end
    
end
gapsPercent = (numberOfGaps / n)*100;
identityPercent = (numberOfIdentity / n)*100;
end

