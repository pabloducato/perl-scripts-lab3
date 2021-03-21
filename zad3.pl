$filename = './passwd';
$sumGroup = 0;
open(FILE, $filename) or die "Nie mozna odczytac nastepujacego pliku: $filename";
while(<FILE>)
{
    chomp;
    ($username, $junk1, $userID, $junk3, $description, $home, $shell) = split(':', $_);

    if ($userID >= 30) {
        push(@array, ("$username\n"));
        $sumGroup = $sumGroup + $junk3;
    }
}

print ("Drukuj sumę group id dla tych użytkowników: \n", $sumGroup);
close FILE;