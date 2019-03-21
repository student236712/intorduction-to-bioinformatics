function fastaContent = inputFasta 
%Funkcja bez parametru wejsciowego,
%wywoluje wpisywanie id i sekwencji w command window i przypisuje je do
%struktury
disp('Selected input mode');
fastaContent = struct('identifier', input('id ','s'),'sequence', input('sequence ','s')); 
isSeqenceCorrect(fastaContent.sequence)
end 
