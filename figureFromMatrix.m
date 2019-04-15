function [] = figureFromMatrix(R,id1,id2,figureName,data,countMax)
%Funkcja za pomoc¹, której tworzony jest wykres macierzy punktów i
%optymalnej œcie¿ki dopasowania sekwencji
%Argumenty wejœciowe:
%R - macierz punktacji dla dwóch sekwencji
%T - macierz ze œcie¿k¹ optymalnego dopasowania
%id1,id2 - identyfikatory sekwencji
%figureName - nazwa pliku, do którego ma zostaæ zapisany wykres
%data - struktura macierzy optymalnych œcie¿ek dopasowania
%countMax - iloœæ œcie¿ek optymalnego dopasowania

close all
figure('Name','Lokalne dopasowanie sekwencji');
hold on
colours = ['b','k','r','g','y','c','m','w'];
colormap('summer');
imagesc(R);
for i = 1:countMax
    hold on
    spy(data(i).wholeAligmentMatrix,colours(i));
end
colorbar;
xlabel(id1);
ylabel(id2);
title("Tablica punktacji wraz z optymalnymi œcie¿kami");
hold off
print(figureName,'-djpeg');
end

