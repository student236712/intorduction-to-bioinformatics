function [] = sequencesGlobalAlignment(match,mismatch,gap,mode,textFileName,figureName,seq1,seq2)
%Funkcja pozawalaj�ca na zbadanie globalnego dopasowania dw�ch sekwencji
%wraz ze statystykami dopasowania i prezentacj� graficzn�
%Argumenty wej�ciowe:
%match - ilo�� punkt�w przyznawana za zgodno�� pary
%mismatch - ilo�� punkt�w przyznawana za niezgodno�� pary
%gap - ilo�� punkt�w przyznawana za przerw�
%mode - tryb por�wnania sekwencji: D - distance, S - similarity
%fileName - nazwa pliku textowego, do kt�rego maj� by� zapisane informacje
%o dopasowaniu
%Sekwencje mog� zosta� wczytane: r�cznie, z pliku tekstowego o formacie
%fasta lub z z bazy danych NCBI.
%Przy wczytywaniu:
%- r�cznym u�ytkownik nie podaje w funkcji argument�w, tylko zostaje on
%  poproszony o ich podanie podczas wykonywania funcji
%- z pliku nale�y poda� (�cie�k� pliku,nazw� pliku)
%- z bazy danych nale�y poda� identyfikator np. 'EU189380.1'

[R,sequence1,sequence2,id1,id2] = scoringMatrix(match,mismatch,gap,mode,seq1,seq2);
T = tracBackMatrix(R,match,mismatch,gap,sequence1,sequence2);
showAndSaveInfoG(R,T,match,mismatch,gap,mode,sequence1,sequence2,id1,id2,textFileName);
figureFromMatrix(R,T,id1,id2,figureName);
end

