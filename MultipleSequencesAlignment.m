function [] = MultipleSequencesAlignment(match,mismatch,gap,sequencesAmount,textFileName,varargin)
%Funkcja pozawalaj�ca na zbadanie dopasowania wielu sekwencji za pomoc�
%metody "na gwiazd�". Tworzony i prezentuje statystyki dopasowania oraz
%dopasowane sekwencje
%Argumenty wej�ciowe:
%match - ilo�� punkt�w przyznawana za zgodno�� pary
%mismatch - ilo�� punkt�w przyznawana za niezgodno�� pary
%gap - ilo�� punkt�w przyznawana za przerw�
%sequencesAmount - ilo�� sekwencji do dopasowania
%textFileName - nazwa pliku textowego, do kt�rego maj� by� zapisane informacje
%o dopasowaniu w formacie .txt
%Sekwencje mog� zosta� wczytane: r�cznie, z pliku tekstowego o formacie
%fasta lub z z bazy danych NCBI.
%Przy wczytywaniu:
%- r�cznym u�ytkownik nie podaje w funkcji argument�w, tylko zostaje on
%  poproszony o ich podanie podczas wykonywania funcji
%- z pliku nale�y poda� (�cie�k� pliku,nazw� pliku)
%- z bazy danych nale�y poda� identyfikator np. 'EU189380.1'

if length(varargin) == 0
    for i = 1:sequencesAmount
        seq(i) = inputFasta;
    end
elseif contains(varargin{1,2},'.fasta')
    j = 2:sequencesAmount+1;
        for i = 1:sequencesAmount
            
            seq(i) = readFasta(varargin{1,1},varargin{1,j(i)});
        end
    
else
    for i = 1:sequencesAmount
        seq(i) = fetchFasta(varargin{1,i});
    end
end
[sequencesStruct,centralSequenceNumber] = alignAll(match,mismatch,gap,seq);
showAndSaveInfoG(match,mismatch,gap,centralSequenceNumber,sequencesStruct,textFileName);
end

