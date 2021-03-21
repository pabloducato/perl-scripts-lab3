#!/usr/bin/perl 
use strict;
sub my_args
{
  my $i;
  print "Moje argumenty:\n";
      for($i=0;$i<=$#_;$i++){
        print "Argument $i: $_[$i]\n";
        }
    print "\n";
}
              
my $name = "arg pierwszy";
my @names = ('to', 'jest', 'jakaś', 'tablica');
              
my_args($name);
my_args($name, 123);
my_args(123, 345, @names, $name);
              