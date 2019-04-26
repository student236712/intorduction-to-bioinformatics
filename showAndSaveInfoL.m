function [] = showAndSaveInfoL(score,gap,sequence1,sequence2,fileName,data,countMax,substitutionMatrixPath)
%Funkcja pokazuj¹ca informacje o dopasowaniu dwóch sekwencji oraz
%zapisuj¹ca te informacje w pliku tekstowym o podanej nazwie
%Argumenty wejœciowe:
%score - iloœæ punktów uzyskanych dla optymalnej œcie¿ki dopasowania
%gap - iloœæ punktów przyznawana za przerwê
%sequence1,sequence2 - sekwencje porównywane
%id1,id2 - identyfikatory sekwencji
%fileName - nazwa pliku textowego, do którego maj¹ byæ zapisane informacje
%o dopasowaniu
%data - struktura macierzy optymalnych œcie¿ek dopasowania
%substitutionMatrixPath - sciezka pliku tekstowego z macierza substytucji
fid = fopen(fileName,'wt');
[substitutionPoints,rowsNames,columnsNames] = ...
    readSubstitutionMatrix(substitutionMatrixPath);
fprintf(fid,'%s\n',"# Substitution matrix:");
fprintf(fid,'%s%s%s%s%s\n%s%1.f%1.f%1.f%1.f\n%s%1.f%1.f%1.f%1.f\n%s%1.f%1.f%1.f%1.f\n%s%1.f%1.f%1.f%1.f\n',"#",rowsNames{1,1}+" ",...
    rowsNames{2,1}+" ",rowsNames{3,1}+" ",rowsNames{4,1}+" ",columnsNames{1,1}+" ",substitutionPoints(1,:)...
    ,columnsNames{1,2}+" ",substitutionPoints(2,:),columnsNames{1,3}+" ",substitutionPoints(3,:),columnsNames{1,4}+" ",substitutionPoints(4,:));
for i = 1:countMax
[numberOfGaps,numberOfIdentity,seq1,comp,seq2,gapsPercent,identityPercent,m]...
    = createInfoL(data(i).aligmentMatrix,sequence1,sequence2,data(i).wiersz,data(i).kolumna,data(i).koniec1,data(i).koniec2);
disp(">seq1 "+(data(i).koniec1)+"-"+(data(i).wiersz-1))
disp(">seq2 "+(data(i).koniec2)+"-"+(data(i).kolumna-1))
disp("#Gap " + gap)
disp("#Score: "+score);
disp("#Gaps: " +numberOfGaps + "/" + m + " ("+ gapsPercent+" %)")
disp("#Identity: "+numberOfIdentity+"/" + m + " ("+identityPercent+" %)")
disp(seq1)
disp(comp)
disp(seq2)

fprintf(fid, '%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s',...
    ">seq1 "+(data(i).koniec1)+"-"+(data(i).wiersz-1),">seq2 "+(data(i).koniec2)+"-"+(data(i).kolumna-1),...
    "#Gap: " + gap,"#Length: " + m,...
    "Score: " + score,"#Gaps: " + numberOfGaps + "/" + m + " (" + gapsPercent + " %)",...
    "#Identity: " + numberOfIdentity + "/" + m + " ("+identityPercent+" %)",seq1,comp,seq2);
end
fclose(fid);
end

