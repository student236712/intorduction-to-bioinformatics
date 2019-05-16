function [] = MultipleSequencesAlignment(match,mismatch,gap,sequencesAmount,textFileName,varargin)
%Funkcja pozawalaj¹ca na zbadanie dopasowania wielu sekwencji za pomoc¹
%metody "na gwiazdê". Tworzony i prezentuje statystyki dopasowania oraz
%dopasowane sekwencje
%Argumenty wejœciowe:
%match - iloœæ punktów przyznawana za zgodnoœæ pary
%mismatch - iloœæ punktów przyznawana za niezgodnoœæ pary
%gap - iloœæ punktów przyznawana za przerwê
%sequencesAmount - iloœæ sekwencji do dopasowania
%textFileName - nazwa pliku textowego, do którego maj¹ byæ zapisane informacje
%o dopasowaniu w formacie .txt
%Sekwencje mog¹ zostaæ wczytane: rêcznie, z pliku tekstowego o formacie
%fasta lub z z bazy danych NCBI.
%Przy wczytywaniu:
%- rêcznym u¿ytkownik nie podaje w funkcji argumentów, tylko zostaje on
%  poproszony o ich podanie podczas wykonywania funcji
%- z pliku nale¿y podaæ (œcie¿kê pliku,nazwê pliku)
%- z bazy danych nale¿y podaæ identyfikator np. 'EU189380.1'

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

