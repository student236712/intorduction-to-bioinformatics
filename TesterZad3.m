%Przyk�adowe u�ycie programu za pomoc� linii komend:
%oba pliki wczytane r�cznie
    sequencesLocalAlignment(-2,'LocalAlignment.txt','LocalAlignmentPlot',...
        'C:\Users\tadga\OneDrive\Pulpit\matrix.txt');
%oba pliki wczytane z bazy NCBI
    sequencesLocalAlignment(-2,'LocalAlignment.txt','LocalAlignmentPlot',...
        'C:\Users\tadga\OneDrive\Pulpit\matrix.txt','NM_001273580.1','NM_001164014.1')
%oba pliki wczytane z pliku tekstowego
      sequencesLocalAlignment(-2,'LocalAlignment.txt','LocalAlignmentPlot',...
    'C:\Users\tadga\OneDrive\Pulpit\matrix.txt','C:\Nauka\6\Wst�p do bioinformatyki\Lab\Lista_1\Pliki',...
    'sequence2.fasta','C:\Nauka\6\Wst�p do bioinformatyki\Lab\Lista_1\Pliki','sequence3.fasta')
%jeden plik wczytany z bazy NCBI, drugi r�cznie
      sequencesLocalAlignment(-2,'LocalAlignment.txt','LocalAlignmentPlot','C:\Users\tadga\OneDrive\Pulpit\matrix.txt','Z96057.1')
%jeden plik wczytany z bazy NCBI, drugi z pliku tesktowego bez r�nicy w
%kolejno�ci podawania argument�w wej�ciowych
      sequencesLocalAlignment(-2,'LocalAlignment.txt','LocalAlignmentPlot','C:\Users\tadga\OneDrive\Pulpit\matrix.txt',...
   'C:\Nauka\6\Wst�p do bioinformatyki\Lab\Lista_1\Pliki','sequence3.fasta','Z96057.1')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
      sequencesLocalAlignment(-2,'LocalAlignment.txt','LocalAlignmentPlot','C:\Users\tadga\OneDrive\Pulpit\matrix.txt'...
        ,'Z96057.1','C:\Nauka\6\Wst�p do bioinformatyki\Lab\Lista_1\Pliki','sequence3.fasta')
%jeden plik wczytany r�cznie, drugi z pliku tesktowego
    sequencesLocalAlignment(-2,'LocalAlignment.txt','LocalAlignmentPlot','C:\Users\tadga\OneDrive\Pulpit\matrix.txt'...
   ,'C:\Nauka\6\Wst�p do bioinformatyki\Lab\Lista_1\Pliki','sequence3.fasta')


