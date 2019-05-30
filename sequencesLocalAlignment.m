function [] = sequencesLocalAlignment(gap,textFileName,...
    figureName,substitutionMatrixPath,alignmentAmount,varargin)
%Funkcja pozawalaj¹ca na zbadanie lokalnego dopasowania dwóch sekwencji
%wraz ze statystykami dopasowania i prezentacj¹ graficzn¹
%Argumenty wejœciowe:
%gap - iloœæ punktów przyznawana za przerwê
%textFileName - nazwa pliku textowego, do którego maj¹ byæ zapisane informacje
%o dopasowaniu
%figureName - nazwa pliku, do którego ma zostaæ zapisany wykres
%substitutionMatrixPath - sciezka do pliku z macierz¹ substytucji w
%formacie .txt
%alignemntAmount - ilosc szukanych sciezek dopasowan. Po wpisaniu "all"
%szukane sa wszystkie mozliwe sciezki. Wpisanie liczby wiekszej 
%od faktycznej liczby znalezionych sciezek nie powoduje bledu 
%Sekwencje mog¹ zostaæ wczytane: rêcznie, z pliku tekstowego o formacie
%fasta lub z z bazy danych NCBI.
%Przy wczytywaniu:
%- rêcznym u¿ytkownik nie podaje w funkcji argumentów, tylko zostaje on
%  poproszony o ich podanie podczas wykonywania funcji
%- z pliku nale¿y podaæ (œcie¿kê pliku,nazwê pliku)
%- z bazy danych nale¿y podaæ identyfikator np. 'EU189380.1'
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
[R,sequence1,sequence2,id1,id2] = scoringMatrix(gap,seq1,seq2,substitutionMatrixPath);
[data,countMax] = tracBackMatrix(R,substitutionMatrixPath,gap,sequence1,sequence2,alignmentAmount);

score = max(max(R));
showAndSaveInfo(score,gap,sequence1,sequence2,textFileName,data,countMax,substitutionMatrixPath);
figureFromMatrix(R,id1,id2,figureName,data,countMax);
end

