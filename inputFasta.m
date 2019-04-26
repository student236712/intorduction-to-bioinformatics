function fastaContent = inputFasta 
%Funkcja bez parametru wejsciowego,
%wywoluje wpisywanie id i sekwencji w command window i przypisuje je do
%struktury
disp('Please insert your sequence');
fastaContent = struct('identifier', input('id ','s'),'sequence', input('sequence ','s')); 
end 
