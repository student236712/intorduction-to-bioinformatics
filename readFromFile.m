function [] = readFromFile(window,treshold,ilosc,path,filename,format,path1,name1,path2,name2)
%window - szerokosc okna filtracji
%treshold - prog bledu
%ilosc - ile wykresow chcemy otrzymac - 1) tylko odfiltrowany, 2) przed i
%po filtracji
%path - sciezka zapisu wykresu 
%filename - nazwa pliku z zapisanym wykresem
%format - rodzaj formatu pliku graficznego, do ktorego zapisany zostanie
%wykres
%path1 - sciezka pierwszego pliku fasta
%name 1 - nazwa pierwszego pliku fasta
%path2 - sciezka drugiego pliku fasta
%name 2 - nazwa drugiego pliku fasta
fastaFile1=fenchFasta(path1,name1);
fastaFile2=fenchFasta(path2,name2);
[dotMatrix,matrixAfterFiltring,label1,label2]=filtrMatrix(window,treshold,fastaFile1,fastaFile2);
saveFigure(ilosc,path,filename,format,dotMatrix,matrixAfterFiltring,label1,label2,window,treshold);
end

