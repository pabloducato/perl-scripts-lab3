#!/usr/bin/perl
use strict;
use mod_b;
my $druczek = mod_a->new;
$druczek->value("Pierwsze wywołanie");
$druczek->print;  
my $komunikat = mod_a->new(value => "Drugie wywołanie");
$komunikat->print; 
$druczek->print;                # komunikat to inny obiekt

