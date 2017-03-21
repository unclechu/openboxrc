#!/usr/bin/env perl
use v5.10; use strict; use warnings; use autodie qw(:all);
die 'unexpected arguments count' if scalar(@ARGV) != 1;

if ($ARGV[0] eq 'generate') {

  die q{previously generated configs exist (run 'clean' task first)}
    if -e 'rc-termite-terminal.xml' || -e 'rc-konsole-terminal.xml';

  $_ = do {
    local $/ = undef;
    open my $fh, '<rc.xml';
    <$fh>;
  };

  do {
    local $_ = $_;
    my $pfx = '~/.config/termite/config-';
    s/terminator --profile (dark|light)/termite --config $pfx$1/g;
    open my $fh, '>rc-termite-terminal.xml';
    print $fh $_;
  };

  do {
    local $_ = $_;
    s/terminator(?= --profile )/konsole/g;
    open my $fh, '>rc-konsole-terminal.xml';
    print $fh $_;
  };

} elsif ($ARGV[0] eq 'clean') {

  my $rm = sub {unlink $_[0] if -f $_[0]};
  &$rm('rc-termite-terminal.xml');
  &$rm('rc-konsole-terminal.xml');

} else {
  die "unknown argument: '$ARGV[0]'";
}

# vim: et ts=2 sts=2 sw=2 cc=81 tw=80 :
