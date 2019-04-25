function [] = sequencesGlobalAlignment(match,mismatch,gap,mode,textFileName,figureName,varargin)
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
if length(varargin) == 0
    seq1 = inputFasta;
    seq2 = inputFasta;
elseif length(varargin) == 2 && contains(varargin{1,2},'.fasta')
    seq1 = inputFasta;
    seq2 = readFasta(varargin{1,1},varargin{1,2});
elseif length(varargin) == 4
    seq1 = readFasta(varargin{1,1},varargin{1,2});
    seq2 = readFasta(varargin{1,3},varargin{1,4});    
elseif length(varargin) == 2 && ~contains(varargin{1,2},'.fasta')
    seq1 = fetchFasta(varargin{1,1});
    seq2 = fetchFasta(varargin{1,2}); 
elseif length(varargin) == 1
    seq1 = fetchFasta(varargin{1,1});
    seq2 = inputFasta;    
elseif length(varargin) == 3
    if contains(varargin{1,3},'.fasta')
        seq1 = fetchFasta(varargin{1,1});
        seq2 = readFasta(varargin{1,2},varargin{1,3}); 
    else
        seq2 = fetchFasta(varargin{1,3});
        seq1 = readFasta(varargin{1,1},varargin{1,2}); 
    end
end
[R,sequence1,sequence2,id1,id2] = scoringMatrix(match,mismatch,gap,mode,seq1,seq2);
T = tracBackMatrix(R,match,mismatch,gap,sequence1,sequence2);
showAndSaveInfo(R,T,match,mismatch,gap,mode,sequence1,sequence2,id1,id2,textFileName);
figureFromMatrix(R,T,id1,id2,figureName);
end

