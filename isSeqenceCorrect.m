function[] = isSeqenceCorrect(sequence)
%sprawdzenie, czy w sekwencji nie znajduja sie nieporzadane znaki, jesli
%tak wykonywanie programu zostaje zatrzymane, a uzytkownik otrzymuje
%informacje z pierwszym nieporzadanym znakiem i jego miejscem w sekwencji


for i=1:length(sequence)
   if sequence(i)~='A'&&sequence(i)~="C"&&...
          sequence(i)~="T"&&sequence(i)~="G"&&sequence(i)~="U"...
          &&sequence(i)~=newline&&sequence(i)~=""
     error("Niedozwolony znak "+sequence(i)+" we wczytanej sekwencji znajduje si� na " +i+" miejscu sekwencji");
  
    end
end
