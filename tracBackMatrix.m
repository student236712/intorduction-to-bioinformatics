function [aligmentMatrix] = tracBackMatrix(scorringMatrix,mode)
%Funkcja generuj¹ca macierz ze œcie¿k¹ optymalnego dopasowania (poruszanie
%siê po 1 odpowiada œcie¿ce)

%Argumenty wejœciowe:
%scorringMatrix - macierz punktacji dla dwóch sekwencji
%mode - tryb porównania sekwencji: D - distance, S - similarity

[n,m] =  size(scorringMatrix);
aligmentMatrix =  zeros(n,m);
aligmentMatrix(end) =  1;
  

while n >=  2 && m >= 2
        point =  scorringMatrix(n-1,m-1);
        i =  n-1;
        j =  m-1;
        if mode == 'D'
            if(point > scorringMatrix(n,m-1))
                i =  n;
                j =  m-1;
            end
            if(point > scorringMatrix(n-1,m))
                i =  n-1;
                j =  m;
            end
                       
        elseif mode == 'S'
            if(point < scorringMatrix(n,m-1))
                i =  n;
                j =  m-1;
            end
            if(point < scorringMatrix(n-1,m))
                i =  n-1;
                j =  m;
            end            
        end
         
    aligmentMatrix(i,j) = 1;
    n = i; 
    m = j;
end
end