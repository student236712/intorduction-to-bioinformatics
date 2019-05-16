function [] = showAndSaveInfo(match,mismatch,gap,centralSequenceNumber,sequencesStruct,fileName)
%Funkcja pokazuj¹ca informacje o dopasowaniu dwóch sekwencji oraz
%zapisuj¹ca te informacje w pliku tekstowym o podanej nazwie
%Argumenty wejsciowe
%match - iloœæ punktów przyznawana za zgodnoœæ pary
%mismatch - iloœæ punktów przyznawana za niezgodnoœæ pary
%gap - iloœæ punktów przyznawana za przerwê
%centralSequenceNumber - numer sekwencji centralnej
%sequencesStruct - tablica struktur porownywanych sekwencji

[~,s] = size(sequencesStruct);
[comp,totalCostOfAlignment,lengthOfSequences,sequencesStruct,gapsCounter] = createInfoG(sequencesStruct,centralSequenceNumber,match,mismatch,gap);

for g = 1:s
    ID(g,1) = " " + sequencesStruct(g).identifier;
end
ID(s+1) = "";
offsetIDs = pad(ID);
disp("#Match: " + match)
disp("#Mismatch: " + mismatch)
disp("#Gap: " + gap)
disp("#Length: " + lengthOfSequences)
disp("#Central sequence: " + sequencesStruct(centralSequenceNumber).identifier)
disp("#Alignment cost: " + totalCostOfAlignment);

fid = fopen(fileName,'wt');
fprintf(fid,'%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n',"#Match: " + match,...
    "#Mismatch: " + mismatch,"#Gap: "+gap,"#Length: " + lengthOfSequences,...
    "#Central sequence: " + sequencesStruct(centralSequenceNumber).identifier,...
    "#Alignment cost: " + totalCostOfAlignment);

remeinder = rem(lengthOfSequences,60);
k = floor(lengthOfSequences/60);
if k > 0
    constant = 60;
else
    constant = remeinder;
end
if remeinder > 0
   k = k + 1;
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
        t = lengthOfSequences;
    end
    
    for g = 1:s
        if j < k
            disp(offsetIDs(g) + " "+sequencesStruct(g).sequence(w:t)...
                + " " + ((j*constant) - gapsCounter(g,j)))
            fprintf(fid, '\n%s%s%s%s%s%s%s\n',offsetIDs(g) + " " + ...
                sequencesStruct(g).sequence(w:t) + " " + ....
                ((j*constant) - gapsCounter(g,j)));
        else
            disp(offsetIDs(g) + " " + sequencesStruct(g).sequence(w:t) +...
                " " +(lengthOfSequences-gapsCounter(g,j)))
            fprintf(fid, '\n%s%s%s%s%s%s%s%s%s\n',offsetIDs(g)+...
                " " + sequencesStruct(g).sequence(w:t) + " " +...
                (lengthOfSequences - gapsCounter(g,j)));
        end
    end
    disp(offsetIDs(g+1) + " " + comp(w:t))
    disp(newline)
    fprintf(fid, '\n%s%s%s\n',offsetIDs(s+1) + " " + comp(w:t));
end
fclose(fid);
end

