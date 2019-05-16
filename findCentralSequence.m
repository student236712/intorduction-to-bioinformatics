function [centralSequenceNumber] = findCentralSequence(match,mismatch,gap,seq)
%Funkcja znajdujaca numer sekwencji centralnej
%Argumenty wej�ciowe:
%match - ilo�� punkt�w przyznawana za zgodno�� pary
%mismatch - ilo�� punkt�w przyznawana za niezgodno�� pary
%gap - ilo�� punkt�w przyznawana za przerw�
%seq - talbica struktur sekwencji
%Argumenty wyj�ciowe:
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
    [alignment(i).aligmentMatrix,alignment(i).koszt] = ...
        tracBackMatrix(alignment(i).scoringMatrix,match,mismatch,gap,...
        alignment(i).seq1,alignment(i).seq2);
    alignment(i).nrSeq1 = alignmentsCombinations(i,1);
    alignment(i).nrSeq2 = alignmentsCombinations(i,2);
end
for  i = 1:alignmentsAmount
    f = alignment(i).nrSeq1;
    g = alignment(i).nrSeq2;
    distances(f,g) = alignment(i).koszt;
    distances(g,f) = alignment(i).koszt;
end
sumsOfDistances = sum(distances,2);
centralSequenceNumber = find(sumsOfDistances == min(sumsOfDistances),1,'first'); %numer sekwencji centralnej
end

