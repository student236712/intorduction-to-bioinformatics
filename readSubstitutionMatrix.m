function [substitutionPoints,rowsNames,columnsNames] = readSubstitutionMatrix(filePath)
%[substitutionPoints,rowsNames,columnsNames]
%Funkcja pozwalajaca na wczytanie macierzy substytucji z pliku tekstowego w
%formacie .txt
%Argumenty wejœciowe:
%filePath - sciezka pliku tekstowego z macierza substytucji
%Argumenty wyjsciowe:
%substitutionPoints - macierz z punktami (wartoœci liczbowe)
%rowsNames - identyfikatory wierszy
%columnsNames - identyfikatory kolumn


T = readtable(filePath,'ReadRowNames',true,'ReadVariableNames',true);
rowsNames = T.Properties.RowNames;
columnsNames = T.Properties.VariableNames;
substitutionPoints = table2array(T);
end

