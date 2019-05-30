% % %Przyk³adowe u¿ycie programu za pomoc¹ linii komend:
%pliki wczytane rêcznie
% MultipleSequencesAlignment(0,1,1,4,'MSAalignment.txt')
%pliki wczytane z bazy NCBI
MultipleSequencesAlignment(0,1,2,5,'MSAalignment.txt',...
    'X75583.1','X75589.1','X75586.1','X75581.1','X75584.1');
%pliki wczytane z plikow tekstowych (dla ulatwienia korzystania z
%programu wszystkie pliki znajduja sie w jednym folderze)
% MultipleSequencesAlignment(0,2,1,4,'MSAalignment.txt',...
%     'C:\Nauka\6\Wstêp do bioinformatyki\Lab\Pliki','sequence.fasta',...
%     'sequence2.fasta','sequence3.fasta','sequence4.fasta')

