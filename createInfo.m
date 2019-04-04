function [numberOfGaps,numberOfIdentity,k,compares,u,gapsPercent,identityPercent,length] = createInfo(tracBackMatrix,sequence1,sequence2)
%Funkcja zwracaj¹ca statystyki dla dopasowania globalnego dwóch sekwencji
%oraz koñcowe sekwencje wynikaj¹ce z optymalnego dopasowania (po wstawieniu
%przerw)
%Argumenty wejœciowe:
%tracBackMatrix - macierz ze œcie¿k¹ optymalnego dopasowania
%sequence1,sequence2 - sekwencje porównywane
%Argumenty wyjœciowe:
%numberOfGaps - liczba przerw w obu porównywanych sekwencjach
%numberOfIdentity - liczba par analogicznych w porównywanych sekwencjach
%k - pierwsza sekwencja po uzupe³nieniu przerwami
%compares - linia tekstu pokazuj¹ca analogiczne pary "|" oraz
%nieanalogiczne "x"
%u - druga sekwencja po uzupe³nieniu przerwami
%gapsPercent - procent przerw w porównywanych sekwencjach
%identityPercent - procent par analogicznych w porównywanych sekwencjach
%length - d³ugoœæ sekwencji

numberOfGaps = 0;
numberOfIdentity = 0;
t = tracBackMatrix;
k = sequence1;
u = sequence2;

[n,m] = size(tracBackMatrix);

for i = 2:n
    for j = 2:m
        if(t(i,j) == 1 && t(i,j-1) == 1) 
            
            k = insertAfter(k,i-2,"-");
            numberOfGaps = numberOfGaps+1;     
       
         elseif(t(i,j) == 1 && t(i-1,j) == 1) 
            
            u = insertAfter(u,j-2,"-");
            numberOfGaps = numberOfGaps+1;
            
        end
    end
end


newString=join(k,1);
k=replace(newString,newline,"");
newString2=join(u,1);
u=replace(newString2,newline,"");
compares=k;
[a,b]=size(k);
for i=2:b
    if k(i) == u(i)
       compares(i) = "|";
       numberOfIdentity = numberOfIdentity+1;
    else
        compares(i) = " ";
    end
end
length = b-1;
gapsPercent = (numberOfGaps / length)*100;
identityPercent = (numberOfIdentity / length)*100;
end

