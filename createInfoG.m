function [keyDenotingConserved,totalCostOfAlignment,lengthOfSequences,sequencesStruct,gapsCounter]...
    = createInfoG(sequencesStruct,centralSequenceNumber,match,mismatch,gap)
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
alignmentsAmount = nchoosek(s,2);
v = 1:s;
alignmentsCombinations = nchoosek(v,2);
lengthOfSequences = length(sequencesStruct(centralSequenceNumber).sequence);
keyDenotingConserved = sequencesStruct(centralSequenceNumber).sequence;
compares = zeros(s,alignmentsAmount);
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
for y = 1:s
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
        substring = sequencesStruct(y).sequence(w:t);
        for i = 1:length(substring)
            if substring(i) == "-"
                numberOfGaps = numberOfGaps + 1;
            end
        end
        gapsCounter(y,j) = numberOfGaps;
    end
    
    for j = 1:alignmentsAmount
        for i = 1:lengthOfSequences
            if sequencesStruct((alignmentsCombinations(j,...
                    1))).sequence(i) == sequencesStruct(...
                    (alignmentsCombinations(j,2))).sequence(i)
                
                compares(j,i) = 1;
                costs(j,i) = match;
            else
                if (sequencesStruct((alignmentsCombinations(j,...
                        1))).sequence(i) == '-' && sequencesStruct(...
                        (alignmentsCombinations(j,2))).sequence(i)~='-') ||...
                        (sequencesStruct((alignmentsCombinations(j,...
                        2))).sequence(i) == '-' && sequencesStruct(...
                        (alignmentsCombinations(j,1))).sequence(i)~='-')
                    costs(j,i) = gap;
                else
                    costs(j,i) = mismatch;
                end
            end
        end
    end
end
alignmentCost = sum(costs,2);
distances = zeros(s);
for j = 1:alignmentsAmount
    q = alignmentsCombinations(j,1);
    y = alignmentsCombinations(j,2);
    distances(q,y) = alignmentCost(j,1);
    distances(y,q) = alignmentCost(j,1);
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

