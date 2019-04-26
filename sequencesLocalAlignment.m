function [] = sequencesLocalAlignment(gap,textFileName,figureName,substitutionMatrixPath,seq1,seq2)
%Funkcja pozawalaj¹ca na zbadanie lokalnego dopasowania dwóch sekwencji
%wraz ze statystykami dopasowania i prezentacj¹ graficzn¹
%Argumenty wejœciowe:
%gap - iloœæ punktów przyznawana za przerwê
%textFileName - nazwa pliku textowego, do którego maj¹ byæ zapisane informacje
%o dopasowaniu
%figureName - nazwa pliku, do którego ma zostaæ zapisany wykres
%substitutionMatrixPath - sciezka do pliku z macierz¹ substytucji w
%formacie .txt
%Sekwencje mog¹ zostaæ wczytane: rêcznie, z pliku tekstowego o formacie
%fasta lub z z bazy danych NCBI.
%Przy wczytywaniu:
%- rêcznym u¿ytkownik nie podaje w funkcji argumentów, tylko zostaje on
%  poproszony o ich podanie podczas wykonywania funcji
%- z pliku nale¿y podaæ (œcie¿kê pliku,nazwê pliku)
%- z bazy danych nale¿y podaæ identyfikator np. 'EU189380.1'

[R,sequence1,sequence2,id1,id2] = scoringMatrixLocal(gap,seq1,seq2,substitutionMatrixPath);
[data,countMax] = tracBackMatrixLocal(R);
score = max(max(R));
showAndSaveInfoL(score,gap,sequence1,sequence2,textFileName,data,countMax,substitutionMatrixPath);
figureFromMatrixL(R,id1,id2,figureName,data,countMax);
end

