function [] = sequencesLocalAlignment(gap,textFileName,figureName,substitutionMatrixPath,seq1,seq2)
%Funkcja pozawalaj�ca na zbadanie lokalnego dopasowania dw�ch sekwencji
%wraz ze statystykami dopasowania i prezentacj� graficzn�
%Argumenty wej�ciowe:
%gap - ilo�� punkt�w przyznawana za przerw�
%textFileName - nazwa pliku textowego, do kt�rego maj� by� zapisane informacje
%o dopasowaniu
%figureName - nazwa pliku, do kt�rego ma zosta� zapisany wykres
%substitutionMatrixPath - sciezka do pliku z macierz� substytucji w
%formacie .txt
%Sekwencje mog� zosta� wczytane: r�cznie, z pliku tekstowego o formacie
%fasta lub z z bazy danych NCBI.
%Przy wczytywaniu:
%- r�cznym u�ytkownik nie podaje w funkcji argument�w, tylko zostaje on
%  poproszony o ich podanie podczas wykonywania funcji
%- z pliku nale�y poda� (�cie�k� pliku,nazw� pliku)
%- z bazy danych nale�y poda� identyfikator np. 'EU189380.1'

[R,sequence1,sequence2,id1,id2] = scoringMatrixLocal(gap,seq1,seq2,substitutionMatrixPath);
[data,countMax] = tracBackMatrixLocal(R);
score = max(max(R));
showAndSaveInfoL(score,gap,sequence1,sequence2,textFileName,data,countMax,substitutionMatrixPath);
figureFromMatrixL(R,id1,id2,figureName,data,countMax);
end

