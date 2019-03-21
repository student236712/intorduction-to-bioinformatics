function fastaContent = fenchFasta (path,filename)
 

sciezkaOdczytu=path+"\"+filename;
text=fileread(sciezkaOdczytu);
rozdzielLinie=splitlines(text);
pierwszaLinia=rozdzielLinie{1,1};
[jeden,iloscZnakow]=size(pierwszaLinia);
rozdzielPierwszaLinie=split(pierwszaLinia);
id=rozdzielPierwszaLinie{1,1};
fastaContent = struct('identifier',id(2:end) ,'sequence',text(iloscZnakow+1:end)); 
isSeqenceCorrect(fastaContent.sequence);  

end

