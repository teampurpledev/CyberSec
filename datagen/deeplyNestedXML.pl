#!/usr/bin/perl
## THIS IS DESIGNED BY/FOR WEB SECURITY TEST PURPOSES
## SCRIPT USED TO GENERATE BAD XML PAYLOADS

$DEPTH = 26; ## raise depth to create deeper nests
$TAGLEN = 8; ## raise tag length to create longer tags

sub randomTag {
    my $tag = "";
    for ( my $i = 0; $i < $TAGLEN; $i++ ) {
        my $char = chr(int(rand(26)) + ord("A"));
        $tag .= $char;
    }
    return $tag;
}

# Build opening tags
my @randomXML = ();
for ( my $i = 0; $i < $DEPTH; $i++ ) {
    $randomXML[$i] = randomTag();  # Generate random tag
    print " " x $i . "<" . $randomXML[$i] . ">\n";  # Print tag with indentation
}
print "deep!\n";

# Close all tags
for ( my $i = $DEPTH - 1; $i >= 0; $i-- ) {
    print " " x $i . "</" . $randomXML[$i] . ">\n";  # Print closing tags with correct indentation
}