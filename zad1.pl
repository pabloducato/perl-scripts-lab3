$filename = './passwd';
open(FILE, $filename) or die "Nie mozna odczytac nastepujacego pliku: $filename";
while(<FILE>)
{
    chomp;
    ($username, $junk1, $userID, $junk3, $description, $home, $shell) = split(':', $_);
    my $a = 1;
    print "$username, $userID\n" if ($userID >= 30);
}
close FILE;