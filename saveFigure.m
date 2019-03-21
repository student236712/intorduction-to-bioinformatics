function [] = saveFigure (ilosc,path,filename,format,dotMatrix,matrixAfterFiltring,label1,label2,window,treshold)
close all

if ilosc==2
figure
subplot(1,2,1)
spy(matrixAfterFiltring);
chr="Dotplot after filtring for window = "+int2str(window)+" and threshold = "+int2str(treshold);
title(chr);
xlabel(label1);
ylabel(label2);
xlim([1 inf]);
ylim([1 inf]);
subplot(1,2,2)
spy(dotMatrix)
xlabel(label1);
ylabel(label2);
xlim([1 inf]);
ylim([1 inf]);
title("Dotplot before filtring")

else
    
figure
spy(matrixAfterFiltring);
chr="Dotplot after filtring for window = "+int2str(window)+" and threshold = "+int2str(treshold);
title(chr);
xlabel(label1);
ylabel(label2);
xlim([1 inf]);
ylim([1 inf]);

end
sciezkaZapisu=path+"\"+filename;
print(sciezkaZapisu,format);
end



