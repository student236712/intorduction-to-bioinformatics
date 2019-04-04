%Przyk�adowe u�ycie programu za pomoc� linii komend:
%oba pliki wczytane r�cznie
    sequencesGlobalAlignment(-1,1,2,'D','GlobalAlignment.txt','GlobalAlignmentPlot');
%oba pliki wczytane z bazy NCBI
    sequencesGlobalAlignment(1,-1,-2,'S','porownanie1.txt',...
    'GlobalAlignmentPlot','NM_001273580.1','NM_001164014.1')
%oba pliki wczytane z pliku tekstowego
    sequencesGlobalAlignment(1,-1,-2,'S','porownanieSekwencji.txt',...
    'GlobalAlignmentPlot','C:\Nauka\6\Wst�p do bioinformatyki\Lab\Lista_1\Pliki',...
    'sequence2.fasta','C:\Nauka\6\Wst�p do bioinformatyki\Lab\Lista_1\Pliki','sequence3.fasta')
%jeden plik wczytany z bazy NCBI, drugi r�cznie
    sequencesGlobalAlignment(1,-1,-2,'S','porownanieSekwencji.txt','GlobalAlignmentPlot','Z96057.1')
%jeden plik wczytany z bazy NCBI, drugi z pliku tesktowego bez r�nicy w
%kolejno�ci podawania argument�w wej�ciowych
    sequencesGlobalAlignment(1,-1,-2,'S','porownanieSekwencji.txt','GlobalAlignmentPlot',...
   'C:\Nauka\6\Wst�p do bioinformatyki\Lab\Lista_1\Pliki','sequence3.fasta','Z96057.1')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    sequencesGlobalAlignment(1,-1,-2,'S','porownanieSekwencji.txt','GlobalAlignmentPlot','Z96057.1',...
   'C:\Nauka\6\Wst�p do bioinformatyki\Lab\Lista_1\Pliki','sequence3.fasta')
%jeden plik wczytany r�cznie, drugi z pliku tesktowego
    sequencesGlobalAlignment(1,-1,-2,'S','porownanieSekwencji.txt','GlobalAlignmentPlot',...
   'C:\Nauka\6\Wst�p do bioinformatyki\Lab\Lista_1\Pliki','sequence3.fasta')


