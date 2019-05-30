function [centralSequenceNumber] = findCentralSequence(match,mismatch,gap,seq)
%Funkcja znajdujaca numer sekwencji centralnej
%Argumenty wejœciowe:
%match - iloœæ punktów przyznawana za zgodnoœæ pary
%mismatch - iloœæ punktów przyznawana za niezgodnoœæ pary
%gap - iloœæ punktów przyznawana za przerwê
%seq - talbica struktur sekwencji
%Argumenty wyjœciowe:
%centralSequenceNumber - numer sekwencji centralnej
[~,x] = size(seq);
alignmentsAmount = nchoosek(x,2);
v = 1:x;
alignmentsCombinations = nchoosek(v,2);
distances = zeros(x);
for i = 1:alignmentsAmount
    [alignment(i).scoringMatrix,alignment(i).seq1,alignment(i).seq2] =...
        scoringMatrix(match,mismatch,gap,seq(alignmentsCombinations(i,1)),...
        seq(alignmentsCombinations(i,2)));
    [alignment(i).aligmentMatrix,alignment(i).cost] = ...
        tracBackMatrix(alignment(i).scoringMatrix,match,mismatch,gap,...
        alignment(i).seq1,alignment(i).seq2);
    alignment(i).nrSeq1 = alignmentsCombinations(i,1);
    alignment(i).nrSeq2 = alignmentsCombinations(i,2);
end
for i = 1:alignmentsAmount
    f = alignment(i).nrSeq1;
    g = alignment(i).nrSeq2;
    distances(f,g) = alignment(i).cost;
    distances(g,f) = alignment(i).cost;
end
sumsOfDistances = sum(distances,2);
centralSequenceNumber = find(sumsOfDistances == min(sumsOfDistances),1,'first'); %numer sekwencji centralnej
end

