$filename = './passwd';
open(FILE, $filename) or die "Nie mozna odczytac nastepujacego pliku: $filename";
while(<FILE>)
{
    chomp;
    ($username, $junk1, $userID, $junk3, $description, $home, $shell) = split(':', $_);

    if ($userID >= 30) {
        push(@array, ("$username\n"));
    }
}

print ("Jak poprzednio ale posortowane alfabetycznie po `username`: \n", sort(@array));
close FILE;