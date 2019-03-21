function [] = readManually(window,treshold,ilosc,path,filename,format)
%window - szerokosc okna filtracji
%treshold - prog bledu
%ilosc - ile wykresow chcemy otrzymac - 1) tylko odfiltrowany, 2) przed i
%po filtracji
%path - sciezka zapisu wykresu 
%filename - nazwa pliku z zapisanym wykresem
%format - rodzaj formatu pliku graficznego, do ktorego zapisany zostanie

fastaFile1=inputFasta;
fastaFile2=inputFasta;
[dotMatrix,matrixAfterFiltring,label1,label2]=filtrMatrix(window,treshold,fastaFile1,fastaFile2);
saveFigure(ilosc,path,filename,format,dotMatrix,matrixAfterFiltring,label1,label2,window,treshold);
end

