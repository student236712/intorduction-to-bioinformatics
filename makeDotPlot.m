function [] = makeDotPlot(window,treshold,ilosc,path,filename,format,seq1,seq2)
[dotMatrix,matrixAfterFiltring,label1,label2] = filtrMatrix(window,treshold,seq1,seq2);
saveFigure (ilosc,path,filename,format,dotMatrix,matrixAfterFiltring,label1,label2,window,treshold);
end