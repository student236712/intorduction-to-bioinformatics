function fastaContent  =  readFasta (path,filename)
%Funkcja pozwalaj¹ca na wczytanie do struktury sekwencji z pliku w formacie
%fasta
%Argumenty wejœciowe:
%path - œcie¿ka do wczytywanego pliku
%filename - nazwa wczytywanego pliku

sciezkaOdczytu = path + "\" + filename;
text = fileread(sciezkaOdczytu);
fastaContent = makeFastaContent(text);
end

