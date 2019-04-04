function fastaContent = fetchFasta(identifier)
%Funkcja pozwala pobraæ plik tekstowy w formacie FASTA z bazy danych NCBI dla danego identyfikatora.
URL = 'https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi';
fastaContent = makeFastaContent(urlread(URL,'get',{'db','nucleotide','rettype','fasta','id',identifier}));
end