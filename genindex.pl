#!/usr/bin/perl

print <<EOF;
<HTML>
<HEAD><TITLE> Using Perl and C </TITLE></HEAD>
<BODY BGCOLOR="#ffffff">
<H1> Using Perl and C </H1>
<H2> Tim Jenness and Simon Cozens </H2>

EOF
print "<A HREF=\"book.pdf\">The whole book as one big pdf file</A><BR>
And the <A HREF=\"book.sgml\">SGML driver</A> for the whole book.
(You'll need the individual SGML files as well.)<P>
NOT regularly updated, but here it is anyway, <A
HREF=\"book/book1.html\">the whole book as HTML</A>.
<HR>\n";

# Open the book, skip to the bit after the TOC.
open (BOOK, "book.sgml") or die $!;
while (<BOOK>) { push @chapters, $1 if /&(.+);/;}
$ch=0;
for (@chapters) {
    $head = `head $_.sgml`;
    $tail = `tail $_.log 2>/dev/null`; 
    ($title) = ($head =~ m|<title>(.*)</title>|);
    ($pages) = ($tail =~ m/(\d+)\s*pages?/);
    $pages ||= "unknown";
    $total += $pages;
    print "<H3>Chapter ",++$ch,": <A HREF=\"$_.pdf\">$title</A></H3>\n";
    print "$pages pages. Last updated: ".int(-M "$_.sgml")." days, ".(int(24 * -M "$_.sgml")%24)." hours ago\n";
    print "<BR><A HREF=\"$_.sgml\">SGML source</A> for this chapter\n";
}
print "<HR>Total of $total pages\n";
print "<P>Correct as of <I>".(scalar localtime)."</I>. (That's GMT!)\n";
print "</BODY></HTML>\n";
