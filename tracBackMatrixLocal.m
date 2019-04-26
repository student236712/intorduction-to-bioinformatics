function [data,countMax] = tracBackMatrix(R)
%Funkcja generuj¹ca macierz ze œcie¿k¹ optymalnego dopasowania (poruszanie
%siê po 1 odpowiada œcie¿ce)
%Argumenty wejœciowe:
%scoringMatrix - macierz punktacji dla dwóch sekwencji

[n,m] =  size(R);
help = find(R == max(max(R)));
[countMax,one] = size(help);

for g = 1:countMax
    aligmentMatrix =  zeros(n,m);
    wyszukanie = help(g,1);
    r = rem(wyszukanie,n);
    if r == 0
        kolumna = wyszukanie/n;
        wiersz = wyszukanie/kolumna;
    else
        kolumna =((wyszukanie-r)/n)+1;
        wiersz = r;
    end
    H = ones(1,3);
    i =  wiersz;
    j =  kolumna;
    aligmentMatrix(i,j)=1;
    while((i>=2 || j>=2) && (H(1)~=0||H(2)~=0||H(3)~=0))
        
        H(1) = R(i-1,j);
        H(2) = R(i-1,j);
        H(3) = R(i,j-1);
        
        w = find(H == max(H),1,'first');
        
        if(w == 3)
            if H(3) == R(i,j)
                i = i-1;
                j = j-1;
            else
                j = j-1;
            end
        elseif(w == 2)
            if H(2) == R(i,j)
                i = i-1;
                j = j-1;
            else
                i = i-1;
            end
        elseif(w == 1)
            i = i-1;
            j = j-1;
        end
        if (H(1)~=0||H(2)~=0||H(3)~=0)
            aligmentMatrix(i,j) = 1;
            koniec1 = i;
            koniec2 = j;
        end
    end
    data(g).aligmentMatrix = aligmentMatrix(koniec1:wiersz,koniec2:kolumna);
    data(g).koniec1 = koniec1;
    data(g).wiersz = wiersz;
    data(g).koniec2 = koniec2;
    data(g).kolumna = kolumna;
    data(g).wholeAligmentMatrix = aligmentMatrix;
end
end