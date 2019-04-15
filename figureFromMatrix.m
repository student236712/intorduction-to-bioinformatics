function [] = figureFromMatrix(R,id1,id2,figureName,data,countMax)
%Funkcja za pomoc�, kt�rej tworzony jest wykres macierzy punkt�w i
%optymalnej �cie�ki dopasowania sekwencji
%Argumenty wej�ciowe:
%R - macierz punktacji dla dw�ch sekwencji
%T - macierz ze �cie�k� optymalnego dopasowania
%id1,id2 - identyfikatory sekwencji
%figureName - nazwa pliku, do kt�rego ma zosta� zapisany wykres
%data - struktura macierzy optymalnych �cie�ek dopasowania
%countMax - ilo�� �cie�ek optymalnego dopasowania

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
title("Tablica punktacji wraz z optymalnymi �cie�kami");
hold off
print(figureName,'-djpeg');
end

