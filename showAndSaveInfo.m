function [] = showAndSaveInfo(score,gap,sequence1,sequence2,fileName,data,countMax,substitutionMatrixPath)
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
    rowsNames{2,1} + " ",rowsNames{3,1} + " ",rowsNames{4,1} + " ",...
    columnsNames{1,1} + " ",substitutionPoints(1,:)...
    ,columnsNames{1,2} + " ",substitutionPoints(2,:),...
    columnsNames{1,3} + " ",substitutionPoints(3,:),columnsNames{1,4} + ...
    " ",substitutionPoints(4,:));
disp("Ilosc znalezionych sciezek: " + countMax);
fprintf(fid,'%s\n',"Ilosc znalezionych sciezek: " + countMax);
for i = 1:countMax
    [numberOfGaps,numberOfIdentity,seq1,comp,seq2,gapsPercent,identityPercent,sequenceLength]...
        = createInfo(data(i).aligmentMatrix,sequence1,...
        sequence2,data(i).startSeq1,data(i).startSeq2,data(i).endSeq1,data(i).endSeq2);

    disp(">seq1 " + (data(i).endSeq1-1) + "-" + (data(i).startSeq1-1));
    disp(">seq2 " + (data(i).endSeq2-1) + "-" + (data(i).startSeq2-1));
    disp("#Gap " + gap);
    disp("#Score: " + score);
    disp("#Length: " + sequenceLength);
    disp("#Gaps: " + numberOfGaps + "/" +sequenceLength+ " ("+ gapsPercent+" %)");
    disp("#Identity: " + numberOfIdentity + "/" +sequenceLength+ " ("+identityPercent+" %)");
    remainder = rem(sequenceLength,60);
    dividend = floor(sequenceLength/60);
    if dividend > 0
        constant = 60;
    else
        constant = remainder;
    end
    if remainder > 0
        dividend = dividend+1;
    end
    
    for j = 1:dividend
        if j == 1
            partStart = 1;
            partEnd = constant;
        elseif j < dividend
            partStart = partStart + constant;
            partEnd = partEnd + constant;
        else
            partStart = partStart + constant;
            partEnd = sequenceLength;
        end
        disp("#seq1 "+seq1(partStart:partEnd))
        disp("#seq2 "+seq2(partStart:partEnd))
        disp("      "+comp(partStart:partEnd))
        disp(newline)
        
    end
    
    fprintf(fid, '%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s',...
        ">seq1 "+(data(i).endSeq1-1)+"-"+(data(i).startSeq2-1),">seq2 "+(data(i).endSeq2-1)+"-"+(data(i).startSeq1-1),...
        "#Gap: " + gap,"#Length: " + sequenceLength,...
        "Score: " + score,"#Gaps: " + numberOfGaps + "/" + sequenceLength + " (" + gapsPercent + " %)",...
        "#Identity: " + numberOfIdentity + "/" + sequenceLength + " ("+identityPercent+" %)",seq1,seq2,comp);
end
fclose(fid);
end

