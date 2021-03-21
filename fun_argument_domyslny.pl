#!/usr/bin/perl 
use strict;
$_="globana domyslna";
a("a");
sub a
{
print "W \$_ mam: \"$_\", natomiast w \$_[0]: \"$_[0]\"\n";
}