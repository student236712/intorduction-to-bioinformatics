function fastaContent = makeFastaContent(text)
%Funkcja pozwalaj¹ca na utworzenie struktury sekwencji z otrzymanego pliku
%tekstowego
rozdzielLinie = splitlines(text);
pierwszaLinia = rozdzielLinie{1,1};
[jeden,iloscZnakow] = size(pierwszaLinia);
rozdzielPierwszaLinie = split(pierwszaLinia);
id = rozdzielPierwszaLinie{1,1};
fastaContent = struct('identifier',id(2:end) ,'sequence',text(iloscZnakow+1:end)); 
end

