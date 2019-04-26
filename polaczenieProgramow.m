function [] = polaczenieProgramow(window,treshold,gap,match,mismatch,mode,textFileName,substitutionMatrixPath,figureName,ilosc,path,filename,format,tryb,varargin)
%window - okno dotplot
%treshold - prog dotplot
%gap - ilosc punktow za przerwe
%match - ilosc punktow za zgodnosc
%mismatch - ilosc punktow za niezgodnosc
%mode - tryb dopasowania globalnego - similarity 'S', distance 'D'
%textFileName - nazwa pliku tekstowego
%substitutionMatrixPath - sciezka dostepu do macierzy substytucji
%figureName - nazwa wykresu
%ilosc - ile wykresow w dotplot
%Tryby:
%1 - sam dotplot
%2 - sam globalny
%3 - sam lokalny
%4 - globalny i lokalny
%5 - globalny i dotplot
%6 - dotplot i lokalny
%7 - wszystkie trzy
if length(varargin)  ==  0
    seq1 = inputFasta;
    seq2 = inputFasta;
elseif length(varargin)  ==  2 && contains(varargin{1,2},'.fasta')
    seq1 = inputFasta;
    seq2 = readFasta(varargin{1,1},varargin{1,2});
elseif length(varargin)  ==  3
    seq1 = readFasta(varargin{1,1},varargin{1,2});
    seq2 = readFasta(varargin{1,3},varargin{1,4});
elseif length(varargin)  ==  2 && ~contains(varargin{1,2},'.fasta')
    seq1 = fetchFasta(varargin{1,1});
    seq2 = fetchFasta(varargin{1,2});
elseif length(varargin)  ==  1
    seq1 = fetchFasta(varargin{1,1});
    seq2 = inputFasta;
elseif length(varargin)  ==  3
    if contains(varargin{1,3},'.fasta')
        seq1 = fetchFasta(varargin{1,3});
        seq2 = readFasta(varargin{1,2},varargin{1,3});
    else
        seq2 = fetchFasta(varargin{1,3});
        seq1 = readFasta(varargin{1,1},varargin{1,2});
    end
end
if (tryb  ==  1)
    makeDotPlot(window,treshold,ilosc,path,filename,format,seq1,seq2);
elseif(tryb  ==  2)
    sequencesGlobalAlignment(match,mismatch,gap,mode,textFileName,figureName,seq1,seq2);    
elseif (tryb  ==  3)
    sequencesLocalAlignment(gap,textFileName,figureName,substitutionMatrixPath,seq1,seq2);
elseif(tryb == 4)
    sequencesGlobalAlignment(match,mismatch,gap,mode,textFileName,figureName,seq1,seq2);
    sequencesLocalAlignment(gap,textFileName,figureName,substitutionMatrixPath,seq1,seq2);
elseif(tryb == 5)
    makeDotPlot(window,treshold,ilosc,path,filename,format,seq1,seq2);
    sequencesGlobalAlignment(match,mismatch,gap,mode,textFileName,figureName,seq1,seq2);
elseif(tryb == 6)
    makeDotPlot(window,treshold,ilosc,path,filename,format,seq1,seq2);
    sequencesLocalAlignment(gap,textFileName,figureName,substitutionMatrixPath,seq1,seq2);
elseif(tryb == 7)
    makeDotPlot(window,treshold,ilosc,path,filename,format,seq1,seq2);
    sequencesLocalAlignment(gap,textFileName,figureName,substitutionMatrixPath,seq1,seq2);
    sequencesGlobalAlignment(match,mismatch,gap,mode,textFileName,figureName,seq1,seq2);
end

