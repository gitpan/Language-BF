#
# $Id: benchmark.pl,v 0.1 2006/06/27 08:37:44 dankogai Exp $
#
use strict;
use warnings;
use Language::BF;
use Benchmark ':all';

my $bf = Language::BF->new(<<EOC);
++++++++++[>+++++++>++++++++++>+++>+<<<<-]>++.>+.+++++++..+++.>++.<<
+++++++++++++++.>.+++.------.--------.>+.>.
EOC

cmpthese(
    timethese(
        0,
        {
            compiler    => sub { $bf->reset->run(0) },
            interpreter => sub { $bf->reset->run(1) },
        }
    )
);

