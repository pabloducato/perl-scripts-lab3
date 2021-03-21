package mod_a;
use strict;
#wersja w stylu obiektowym
#Ustawiamy wersjê naszego pakietu
our $VERSION = '1.00';

#A teraz tworzymy dokumentacjê modu³u w formacie POD 
#POD to prosty w u¿yciu znacznikowy jêzyk dokumnetacji dla Perla/modu³ów/programów

=head1 NAME
 
 mod_b - to æwiczebny modu³ w wersji obiektowej
 
=head1 SYNOPSIS

use mod_b;

my $ob_zmienna = mod_b->new();

$ob_zmienna->value("warto¶æ");

$ob_zmienna->print;


=head1 DESCRIPTION

To jest prymitywny modu³, który drukuje warto¶c zmiennej przekazanej modu³owi
Pokazuje jak tworzyæ klasy i metody

=head2 Metody
 
=head3 new
 
my $ob_name = mod_b->new();

my $ob_name = mod_b->new( value => $value );
 
Je¶li druga forma zostanie u¿yta zostanie przekazana do metody
$ob_name->value
 
=cut
 
# Konstruktor obiektu jest najczê¶ciej nazywany new() ale ma takiego obowi±zku!


sub new {
   my($class, %args) = @_;
#funkcja bless ma z zadanie oznaczyæ referowan± zmienn± jako obiekt; 
   my $self = bless({}, $class);
   my $value = exists $args{value} ? $args{value} : "brak zmiennej";
   $self->value($value);
   return $self;
  }

=head3 value
 
 my $value = $ob_name->value;
 $ob_name->value($value);
 
  Pobiera i ustawia $value.
 
=cut


sub value {
    my $self = shift;
    if( @_ ) {
        my $value = shift;
        $self->{value} = $value;
    }
 
    return $self->{value};
}

=head3 to_string
 
 my $komunikat = $ob_name->to_string;
 
 zwraca komunikat jako string
 
=cut

=head3 print
 
  $ob_name->print;
 
  drukuje komunikat do STDOUT
 
=cut


  sub to_string {
   my $self = shift;
   return "Przekaza³e¶ mi zmienn±:  $self->{value}";
  }

  sub print {
   my $self = shift;
   print $self->to_string(), "\n";
  }


=head1 AUTHOR
 
  Antoni Abacki <antek@prz.edu.pl>
 
=cut
1;