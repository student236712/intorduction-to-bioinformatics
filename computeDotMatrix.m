function R = computeDotMatrix(x,y)

n = length(x);
m = length(y);

R=zeros(n,m); %tworzenie macierzy zer o wymiarach podanych sekwencji
for i=1:n     
    for j=1:m
        if x(i) == y(j)
            R(i,j)=1; %je¿eli element o i-tym indeksie z pierwszej sekwencji jest taki sam jak element o 
                      %tym samym indeksie w drugiej sekwencji, to w miejscu
                      %(i,j) macierzy wstawiana jest 1
        end
    end
end
end
