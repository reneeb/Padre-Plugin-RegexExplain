use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'Padre::Plugin::RegexExplain',
    AUTHOR              => q{Renee Baecker <module@renee-baecker.de>},
    VERSION_FROM        => 'lib/Padre/Plugin/RegexExplain.pm',
    ABSTRACT_FROM       => 'lib/Padre/Plugin/RegexExplain.pm',
    ($ExtUtils::MakeMaker::VERSION >= 6.3002
      ? ('LICENSE'=> 'artistic')
      : ()),
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
        'YAPE::Regex::Explain' => 3.011,
        'Padre'                => 0.43,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Padre::Plugin::RegexExplain-*' },
);
