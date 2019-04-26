function [] = showAndSaveInfoG(scoringMatrix,tracBackMatrix,match,mismatch,gap,mode,sequence1,sequence2,id1,id2,fileName)
%Funkcja pokazuj¹ca informacje o dopasowaniu dwóch sekwencji oraz
%zapisuj¹ca te informacje w pliku tekstowym o podanej nazwie

%Argumenty wejœciowe:
%scoringMatrix - macierz punktacji dla dwóch sekwencji
%tracBackMatrix - macierz ze œcie¿k¹ optymalnego dopasowania
%match - iloœæ punktów przyznawana za zgodnoœæ pary
%mismatch - iloœæ punktów przyznawana za niezgodnoœæ pary
%gap - iloœæ punktów przyznawana za przerwê
%mode - tryb porównania sekwencji: D - distance, S - similarity
%sequence1,sequence2 - sekwencje porównywane
%id1,id2 - identyfikatory sekwencji
%fileName - nazwa pliku textowego, do którego maj¹ byæ zapisane informacje
%o dopasowaniu

[numberOfGaps,numberOfIdentity,seq1,comp,seq2,gapsPercent,identityPercent,m] = createInfoG(tracBackMatrix,sequence1,sequence2);
disp("#1: " + id1)
disp("#2: " + id2)
if  mode == 'D'
    disp("Mode: distance")
    mode = "distance";
elseif mode == 'S'
    disp("#Mode: similarity")
    mode = "similarity";
end
disp("#Match: " + match)
disp("#Mismatch: " + mismatch)
disp("#Gap: "+gap)
disp("#Score: "+scoringMatrix(end))
disp("#Gaps: " +numberOfGaps + "/" + m + " ("+ gapsPercent+" %)")
disp("#Identity: "+numberOfIdentity+"/" + m + " ("+identityPercent+" %)")
disp(seq1(2:end))
disp(comp(2:end))
disp(seq2(2:end))


fid = fopen(fileName,'wt');
fprintf(fid, '%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s',...
    "#1: " + id1,"#2: " + id2,"#Mode: "+mode, "#Match: " + match, "#Mismatch: " + mismatch,...
    "#Gap: " + gap,"#Score: "+scoringMatrix(end),"#Length: " + m,...
    "#Gaps: " + numberOfGaps + "/" + m + " (" + gapsPercent + " %)",...
    "#Identity: " + numberOfIdentity + "/" + m + " ("+identityPercent+" %)",seq1(2:end),comp(2:end),seq2(2:end));
fclose(fid);
end

