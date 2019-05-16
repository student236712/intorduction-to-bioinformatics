function [keyDenotingConserved,totalCostOfAlignment,lengthOfSequences,sequencesStruct,gapsCounter] = createInfoG(sequencesStruct,centralSequenceNumber,match,mismatch,gap)
%Funkcja tworzaca statystyki i informacje o dopasowaniu
%Argumenty wejsciowe:
%sequencesStruct - tablica struktur sekwencji
%centralSequenceNumber - numer sekencji centralnej
%match - iloœæ punktów przyznawana za zgodnoœæ pary
%mismatch - iloœæ punktów przyznawana za niezgodnoœæ pary
%gap - iloœæ punktów przyznawana za przerwê
%Argumenty wyjœciowe:
%keyDenotingConserved - ³añcuch znaków, który odwzorowuje konserwacjê
%kolumny poprzez znak "*"
%totalCostOfAlignment -  ca³kowity koszt dopasowania
%lengthOfSequences - d³ugoœæ sekwencji po dopasowaniu
%sequencesStruct - tablica struktur sekwencji
[~,s] = size(sequencesStruct);
lengthOfSequences = length(sequencesStruct(centralSequenceNumber).sequence);
keyDenotingConserved = sequencesStruct(centralSequenceNumber).sequence;
compares = zeros(s,lengthOfSequences);
costs = zeros(s,lengthOfSequences);
remainder = rem(lengthOfSequences,60);
k = floor(lengthOfSequences/60);
if k > 0
    constant = 60;
else
    constant = remainder;
end
if remainder > 0
   k = k + 1;
end
gapsCounter = zeros(s,k);
for g = 1:s
    numberOfGaps = 0;
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
    substring = sequencesStruct(g).sequence(w:t);
    for i = 1:length(substring) 
        if substring(i) == "-" 
            numberOfGaps = numberOfGaps + 1;
        end
    end
    gapsCounter(g,j) = numberOfGaps;
end

for j = 1:s
    for i = 1:lengthOfSequences
        if sequencesStruct(j).sequence(i) == "-" 
            costs(j,i) = gap;
        elseif sequencesStruct(j).sequence(i) == sequencesStruct(centralSequenceNumber).sequence(i)
            compares(j,i) = 1;
            costs(j,i) = match;
        elseif sequencesStruct(j).sequence(i) ~= "-" &&  sequencesStruct(centralSequenceNumber).sequence(i) ~= "-"
            costs(j,i) = mismatch;
        end
    end
end
totalCostOfAlignment = sum(sum(costs));
logicalAND = all(compares);
[i,j] = size(logicalAND);
for x = 1:i
    for y = 1:j
        if logicalAND(x,y) == 1
            keyDenotingConserved(x,y) = "*";
        else
            keyDenotingConserved(x,y) = " ";
        end
    end
end
end

