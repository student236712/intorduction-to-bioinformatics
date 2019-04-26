function fastaContent  =  readFasta (path,filename)
%Funkcja pozwalaj�ca na wczytanie do struktury sekwencji z pliku w formacie
%fasta
%Argumenty wej�ciowe:
%path - �cie�ka do wczytywanego pliku
%filename - nazwa wczytywanego pliku

sciezkaOdczytu = path + "\" + filename;
text = fileread(sciezkaOdczytu);
fastaContent = makeFastaContent(text);
end

