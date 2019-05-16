function fastaContent = makeFastaContent(text)
%Funkcja pozwalaj¹ca na utworzenie struktury sekwencji z otrzymanego pliku
%tekstowego
rozdzielLinie = splitlines(text);
pierwszaLinia = rozdzielLinie{1,1};
[~,iloscZnakow] = size(pierwszaLinia);
rozdzielPierwszaLinie = split(pierwszaLinia);
id = rozdzielPierwszaLinie{1,1};

newString = join(text(iloscZnakow+1:end),1);
sequence = replace(newString,newline,"");
fastaContent = struct('identifier',id(2:end) ,'sequence',sequence); 
end

