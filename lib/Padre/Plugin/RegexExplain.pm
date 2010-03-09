package Padre::Plugin::RegexExplain;

use 5.008;

use strict;
use warnings;

use YAPE::Regex::Explain;
use Padre::Constant ();
use Padre::Plugin   ();
use Padre::Wx       ();
use Wx::Perl::Dialog;

our $VERSION = '0.01';

sub plugin_name { return 'RegexExplain' }

sub padre_interface { 'Padre::Plugin' => 0.43 }

sub menu_plugins_simple {
    my $self = shift;

    return $self->plugin_name => [
        'Explain' => sub { $self->explain },
    ]
}

sub explain {
    my $self = shift;

    my $editor = $self->current->editor;
    my $regex  = $editor->GetSelectedText || '';

    my $expl   = YAPE::Regex::Explain->new( $regex )->explain;

    my $layout = [
        [
            [ 'Wx::TextCtrl', 'regex_explain', $expl  ],
        ],
        [
            [ 'Wx::Button',   'ok',            Wx::wxID_OK     ],
        ],
    ];

    my $dialog = Wx::Perl::Dialog->new(
        parent => $self->current,
        title  => 'Regex',
        layout => $layout,
        width  => [200, 250],
    );

    return if not $dialog->show_modal;
}



=head1 NAME

Padre::Plugin::RegexExplain - The great new Padre::Plugin::RegexExplain!

=head1 VERSION

Version 0.01

=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use Padre::Plugin::RegexExplain;

    my $foo = Padre::Plugin::RegexExplain->new();
    ...

=head1 AUTHOR

Renee Baecker, C<< <module at renee-baecker.de> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-padre::plugin::regexexplain at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Padre::Plugin::RegexExplain>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.


=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Padre::Plugin::RegexExplain


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Padre::Plugin::RegexExplain>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Padre::Plugin::RegexExplain>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Padre::Plugin::RegexExplain>

=item * Search CPAN

L<http://search.cpan.org/dist/Padre::Plugin::RegexExplain/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2010 Renee Baecker.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut

1; # End of Padre::Plugin::RegexExplain
