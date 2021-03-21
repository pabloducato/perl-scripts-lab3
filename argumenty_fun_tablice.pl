#!/usr/bin/perl 
use strict;
#przypuśćmy, że z jakiegoś powodu musimy przekazać funkcji więcej niż jedną tablicę
#jak sobie można poradzić;
my $name = "arg pierwszy";
my @tab1 = ('to', 'jest', 'pierwsza', 'tablica');
my @tab2 = ('a', 'to', 'druga', 'tablica');              

&my_args_cos_nie_tak($name,@tab1,@tab2);
#poprawiamy
&my_args_pop($name,$#tab1,@tab1,@tab2);

sub my_args_cos_nie_tak
{
my ($scalar,@tabl1,@tabl2)=@_;
  my $i;
  print "Moje argumenty coś nie tak:\n";
  print "Skalar: $scalar\n";    
      for($i=0;$i<=$#tabl1;$i++){
        print "Elementy tablicy pierwszej $i: $tabl1[$i]\n";
        }
      for($i=0;$i<=$#tabl2;$i++){
        print "Elementy tablicy drugiej $i: $tabl2[$i]\n";
        }
    print "\n";
}

sub my_args_pop
{
my ($scalar,$end1,@tabl1)=@_;
  my $i;
  my @tabl2=@tabl1[$end1+1..$#tabl1];@tabl1=@tabl1[0..$end1];
  print "Moje argumenty poprawione:\n";
  print "Skalar: $scalar\n";    
      for($i=0;$i<=$#tabl1;$i++){
        print "Elementy tablicy pierwszej $i: $tabl1[$i]\n";
        }
      for($i=0;$i<=$#tabl2;$i++){
        print "Elementy tablicy drugiej $i: $tabl2[$i]\n";
        }
    print "\n";
}
              
              