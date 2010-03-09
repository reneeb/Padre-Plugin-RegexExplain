#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok( 'Padre::Plugin::RegexExplain' ) || print "Bail out!
";
}

diag( "Testing Padre::Plugin::RegexExplain $Padre::Plugin::RegexExplain::VERSION, Perl $], $^X" );
