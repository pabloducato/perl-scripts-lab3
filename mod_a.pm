package mod_a;
use strict;
#Ustawiamy wersję naszego pakietu

our $VERSION = '1.00';

use base 'Exporter';
#eksportujemy funkcję druk do przestrzeni nazw 

our @EXPORT = qw(druk);

#A teraz tworzymy dokumentację modułu w formacie POD 
#POD to prosty w użyciu znacznikowy język dokumnetacji dla Perla/modułów/programów

=head1 NAME
 
 mod_a - to ćwiczebny moduł
 
=head1 SYNOPSIS

use mod_a;
print druk("Jakaś zmienna");

=head1 DESCRIPTION

To jest prymitywny moduł, który drukuje wartośc zmiennej przekazanej modułowi

=head2 Functions
 
Te funkcje są domyślnie dostarczane przez moduł
 
=head3 druk
 
print druk($zmienna);

Zwraca napis: Przekazałeś mi zmienną: $zmienna
 
=cut

sub druk
{
my ($value)=@_;
return "Przekazałeś mi zmienną: $value\n";
}

=head1 AUTHOR
 
  Antoni Abacki <antek@prz.edu.pl>
 
=cut
1;