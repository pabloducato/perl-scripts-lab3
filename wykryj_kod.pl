#!/usr/bin/perl 
use strict;
$_=<>;
my ($kod)=m/.*(\d{2}\-\d{3})/;
if ($kod){print "$kod\n";}else{print "napisz coś z kodem pocztowym";}
print "-" x 20 . "\n";

