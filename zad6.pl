use strict;
use warnings FATAL => 'all';
use autodie qw(:all);
my $var = 0;
my $filename = './zamowienia.eml';
my $orderName;
open(my $fh, '<:encoding(UTF-8)', $filename)
    or die "Could not open file '$filename' $!";
my $str;
my $global_num = "";

while (my $row = <$fh>) {
    chomp $row;
    if ($row =~ m/ZAMOWIENIA HERBAPOL/) {
        $var = $var + 1;
        $orderName = './1/HERBAPOL_'.$var.'.csv';
        open my $fh, '>>', $orderName or die $!;
    } elsif ($row =~ m/Koniec zamowienia/ && $var != 12) {
        $str = $row;
        $str =~ s/[^0-9]//g;
        my $localOrderName = './1/HERBAPOL_'.$str.'.csv';
        rename "$orderName", "$localOrderName" or die "Cannot rename file: $!";
        $var = $var + 1;
        open my $fh, '>>', $orderName or die $!;
    } elsif ($row =~ m/Koniec zamowienia 3827462/) {
        $str = $row;
        $str =~ s/[^0-9]//g;
        my $localOrderName = './1/HERBAPOL_'.$str.'.csv';
        rename "$orderName", "$localOrderName" or die "Cannot rename file: $!";
        chomp $row;
    } else {
        if ($var == 0 || $var == 13) {
            chomp $row;
        } elsif ($row =~ m/------=_Part_10749_400571625.1252936448654--/) {
            chomp $row;
        } else {
            open my $fh, '>>', $orderName or die $!;
            print {$fh} $row . "\n";
        }
    }
}

close $fh;
unlink './1/HERBAPOL_1.csv';
print "done\n";