function [sequencesStruct,centralSequenceNumber] = alignAll(match,mismatch,gap,seq)
%Funkcja dopasywuj¹ca globalnie wszystkie sekwencje podane jako tablica
%struktur
%Argumenty wejsciowe:
%match - iloœæ punktów przyznawana za zgodnoœæ pary
%mismatch - iloœæ punktów przyznawana za niezgodnoœæ pary
%gap - iloœæ punktów przyznawana za przerwê
%seq - talbica struktur sekwencji
%Argumenty wyjœciowe:
%sequencesStruct - tablica struktur sekwencji
%centralSequenceNumber - numer sekwencji centralnej
centralSequenceNumber = findCentralSequence(match,mismatch,gap,seq);
[~,x] = size(seq);
if centralSequenceNumber == 1
    a = 2;
else
    a = 1;
end
for i = 1:x
    if i == a
        [sequencesStruct(centralSequenceNumber),sequencesStruct(i)] = ...
            alignTwoSequences(match,mismatch,gap,seq(centralSequenceNumber),seq(i));
    end
    if i ~= centralSequenceNumber && i ~= a
        [sequencesStruct(centralSequenceNumber),sequencesStruct(i)] = ...
            alignTwoSequences(match,mismatch,gap,sequencesStruct(centralSequenceNumber),seq(i));
        
        if i == x
            for j = 1:i-1
                if j ~= centralSequenceNumber
                    [sequencesStruct(centralSequenceNumber),sequencesStruct(j)] = ...
                        alignTwoSequences(match,mismatch,gap,sequencesStruct(centralSequenceNumber),seq(j));
                end
            end
        end
    end
end
end

