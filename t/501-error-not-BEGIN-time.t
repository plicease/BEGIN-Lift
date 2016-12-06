#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;

BEGIN {
    use_ok('BEGIN::KeywordLift');    
}

our $EXCEPTION;
eval {
    BEGIN::KeywordLift::install(
        ('main', 'foo') => sub { $_[0] * 2 }
    );
    1;
} or do {
    $EXCEPTION = "$@";
};
like(
    $EXCEPTION,
    qr/Lifted keywords must be created during BEGIN time\, not \(RUN\)/,
    '... got the error expected'
);

done_testing;

1;
