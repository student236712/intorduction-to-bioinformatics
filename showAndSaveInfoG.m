function [] = showAndSaveInfo(scoringMatrix,tracBackMatrix,match,mismatch,gap,mode,sequence1,sequence2,id1,id2,fileName)
%Funkcja pokazuj�ca informacje o dopasowaniu dw�ch sekwencji oraz
%zapisuj�ca te informacje w pliku tekstowym o podanej nazwie

%Argumenty wej�ciowe:
%scoringMatrix - macierz punktacji dla dw�ch sekwencji
%tracBackMatrix - macierz ze �cie�k� optymalnego dopasowania
%match - ilo�� punkt�w przyznawana za zgodno�� pary
%mismatch - ilo�� punkt�w przyznawana za niezgodno�� pary
%gap - ilo�� punkt�w przyznawana za przerw�
%mode - tryb por�wnania sekwencji: D - distance, S - similarity
%sequence1,sequence2 - sekwencje por�wnywane
%id1,id2 - identyfikatory sekwencji
%fileName - nazwa pliku textowego, do kt�rego maj� by� zapisane informacje
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
disp("#Length: "+m)
disp("#Score: "+scoringMatrix(end))
disp("#Gaps: " +numberOfGaps + "/" + m + " ("+ gapsPercent+" %)")
disp("#Identity: "+numberOfIdentity+"/" + m + " ("+identityPercent+" %)")
remeinder = rem(m,60);
k = floor(m/60);
if k > 0
    constant = 60;
else
    constant = remeinder;
end
if remeinder > 0
    k = k+1;
end

for j = 1:k
    
    if j == 1
        w = 1;
        t = constant;
    elseif j<k
        w = w + constant;
        t = t + constant;
    else
        w = w + constant;
        t = m;
    end
    if j<k
        disp(">seq1 "+seq1(w:t))
        disp(">seq2 "+seq2(w:t))
        disp("      "+comp(w:t))
        disp(newline)
    else
        disp(">seq1 "+seq1(w:t))
        disp(">seq2 "+seq2(w:t))
        disp("      "+comp(w:t))
        disp(newline)
    end
end
    
fid = fopen(fileName,'wt');
fprintf(fid, '%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s',...
    "#1: " + id1,"#2: " + id2,"#Mode: "+mode, "#Match: " + match, "#Mismatch: " + mismatch,...
    "#Gap: " + gap,"#Score: "+scoringMatrix(end),"#Length: " + m,...
    "#Gaps: " + numberOfGaps + "/" + m + " (" + gapsPercent + " %)",...
    "#Identity: " + numberOfIdentity + "/" + m + " ("+identityPercent+" %)",seq1,seq2);
fclose(fid);
end

