function [] = figureFromMatrix(R,T,id1,id2,figureName)
%Funkcja za pomoc¹, której tworzony jest wykres macierzy punktów i
%optymalnej œcie¿ki dopasowania sekwencji
%Argumenty wejœciowe:
%R - macierz punktacji dla dwóch sekwencji
%T - macierz ze œcie¿k¹ optymalnego dopasowania
%id1,id2 - identyfikatory sekwencji
%figureName - nazwa pliku, do którego ma zostaæ zapisany wykres

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
title("Tablica punktacji wraz z optymaln¹ œcie¿k¹");
print(figureName,'-djpeg');
end

