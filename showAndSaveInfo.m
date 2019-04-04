function [] = showAndSaveInfo(scorringMatrix,tracBackMatrix,match,mismatch,gap,mode,sequence1,sequence2,id1,id2,fileName)
%Funkcja pokazuj�ca informacje o dopasowaniu dw�ch sekwencji oraz
%zapisuj�ca te informacje w pliku tekstowym o podanej nazwie

%Argumenty wej�ciowe:
%scorringMatrix - macierz punktacji dla dw�ch sekwencji
%tracBackMatrix - macierz ze �cie�k� optymalnego dopasowania
%match - ilo�� punkt�w przyznawana za zgodno�� pary
%mismatch - ilo�� punkt�w przyznawana za niezgodno�� pary
%gap - ilo�� punkt�w przyznawana za przerw�
%mode - tryb por�wnania sekwencji: D - distance, S - similarity
%sequence1,sequence2 - sekwencje por�wnywane
%id1,id2 - identyfikatory sekwencji
%fileName - nazwa pliku textowego, do kt�rego maj� by� zapisane informacje
%o dopasowaniu

[numberOfGaps,numberOfIdentity,seq1,comp,seq2,gapsPercent,identityPercent,m] = createInfo(tracBackMatrix,sequence1,sequence2);
disp("#Sequence1: " + id1)
disp("#Sequence2: " + id2)
disp("#Match: " + match)
disp("#Mismatch: " + mismatch)
disp("#Gap " + gap)
if  mode == 'D'
    disp("Mode: distance")
    mode = "distance";
elseif mode == 'S'
    disp("#Mode: similarity")
    mode = "similarity";
end
disp("#Score: "+scorringMatrix(end))
disp("#Gaps: " +numberOfGaps + "/" + m + " ("+ gapsPercent+" %)")
disp("#Identity: "+numberOfIdentity+"/" + m + " ("+identityPercent+" %)")
disp(seq1(2:end))
disp(comp(2:end))
disp(seq2(2:end))


fid = fopen(fileName,'wt');
fprintf(fid, '%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s',...
    "#Sequence1: " + id1,"#Sequence2: " + id2, "#Match: " + match, "#Mismatch: " + mismatch,...
    "#Gap: " + gap,"#Mode: "+mode,"#Score: "+scorringMatrix(end),"#Length: " + m,...
    "#Gaps: " + numberOfGaps + "/" + m + " (" + gapsPercent + " %)",...
    "#Identity: " + numberOfIdentity + "/" + m + " ("+identityPercent+" %)",seq1(2:end),comp(2:end),seq2(2:end));
fclose(fid);
end

