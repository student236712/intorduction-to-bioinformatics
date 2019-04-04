function [] = figureFromMatrix(R,T,id1,id2,figureName)
%Funkcja za pomoc�, kt�rej tworzony jest wykres macierzy punkt�w i
%optymalnej �cie�ki dopasowania sekwencji
%Argumenty wej�ciowe:
%R - macierz punktacji dla dw�ch sekwencji
%T - macierz ze �cie�k� optymalnego dopasowania
%id1,id2 - identyfikatory sekwencji
%figureName - nazwa pliku, do kt�rego ma zosta� zapisany wykres

close all
figure('Name','Globalne dopasowanie sekwencji'); 
hold on
colormap('summer');
imagesc(R);
spy(T,'k');
hold off
colorbar;
xlabel(id1);
ylabel(id2);
title("Tablica punktacji wraz z optymaln� �cie�k�");
print(figureName,'-djpeg');
end

