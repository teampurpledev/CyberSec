#!/usr/bin/perl
# Usage: randomDataByFileSize [filename] [filesize in KB]
# Example: Create a 1MB file named potato.txt
# perl randomDataByFileSize.pl potato.txt 1024

if ( $#ARGV < 1  or $#ARGV > 2 ) {
    die "Script requires two arguments, filename and filesize (KB)";
}

$filename=$ARGV[0];
open OUTFILE, ">$filename" or
    die "Could not create $file for writing";

$filesize=$ARGV[1];
for( $i = 0; $i<$filesize; $i++ ) {
    my $char = int(rand(95));
    $char = chr($char+32);
    print OUTFILE $char x 1023 . "\n";
}

close OUTFILE;