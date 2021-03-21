#!/usr/bin/perl
use strict;
if ($ARGV[0] eq ""){print "Uruchom z parametrem wskazującym jakiś plik.\n";exit;}
if (! -r $ARGV[0]){print "Nie mogę czytać z pliku $ARGV[0].\n";exit;}
open MOJPLIK,"<$ARGV[0]";
#można użyć tablicy do pobrania wszystkich linii
#my @linie=<MOJPLIK>;
#print @linie;
#ale zazwyczaj to nie jest potrzebne;
#jeśli odznaczyłeś powyższy zapis do tablicy bierzącą pozycją w pliku jest jego koniec
#możesz użyć polecenia seek do ustawienia pozycji poniższe polecenie ustawi na poczatku pliku 
#seek MOJPLIK,0,0;

while (<MOJPLIK>)
{
# w tym obrębie wiesz pliku znajduje się w zmiennej $_ a więc takie proste wyrażenie 
s/\:/;/g;
# wymienia wszystkie dwukropki na średniki
print;
}

close MOJPLIK;

#można też użyć polecenia systemowego np tak:

my $text=`cat $ARGV[0]`;
#print $text;
#jak chcesz mieć osobno wiersze
my @linie=split /\n/,$text;
print "Plik ma ".($#linie + 1)." linii\n"; #można tak sprawdz czy to prawda dla pliku pustego 
print "Plik ma ".scalar(@linie)." linii\n";#albo tak (przypomnij sobie ze przypisanie skalarowi tablicy daje liczbe elementow tablicy $lelem=@linie)

#JESZCZE ZAPIS DO PLIKU taki znak w poleceniu open: > powoduje przepisanie pliku a taki >> dołączenie na końcu

if ($text ne "")
    {
	#TO SAMO 5 metodami przeanalizuj - to ważne
	my ($nazwa_pliku)=(("/".$ARGV[0])=~m/.*\/(.+)$/);#nazwa pliku z pełnej ścieżki
	$nazwa_pliku=$ARGV[0];$nazwa_pliku=~s/.*\///; #można to samo co wyżej np tak albo jakkolwiek inaczej byle dobrze (a może użyć pop)
	$nazwa_pliku=pop @{[split(/\//,$ARGV[0])]};# zobacz znaczenie nawiasów - take coś pop split(/\//,$ARGV[0]) byłoby błedem!
	$nazwa_pliku=(split(/\//,$ARGV[0]))[-1]; # a może takie cuś do tego samego problemu :)
	($nazwa_pliku)=reverse(split(/\//,$ARGV[0])); #albo tak ...

	open MOJWYNIK,">$nazwa_pliku\_kopia" || die "Nie mogę utworzyć pliku $nazwa_pliku\_kopia\n";#zobacz, ze || może byc zastapione or
	foreach (@linie){s/\:/;/g;print MOJWYNIK $_."\n";}
	close MOJWYNIK; 
	print "Zapisałem plik kopii $nazwa_pliku\_kopia\n";
    }

#ZADANIE DLA CIEBIE:

#zmodyfikuj linie: print "Zapisałem plik kopii $nazwa_pliku\_kopia\n"; 
#do postaci: print "Zapisałem kopie $nazwa_pliku\_kopia pliku z katalogu $directory\n";
#Uwaga jeśli parametr pliku nie zawierał w swojej części definicji katalogu zmienna $directory powinna mieć wartość "./"
   