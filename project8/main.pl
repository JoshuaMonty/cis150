#!/usr/bin/perl
#usage:main.pl username filename.zip path
use warnings;
use String::Util 'trim';

my (@data, @user);
my ($username, $zipfile, $path, $files);
use constant COLUMNS => 6;

sub main {
	parseargs();
	findfiles();
	zipfiles();
}

main();

sub parseargs {
	$username = trim ($ARGV[0]?$ARGV[0]:`whoami`);
	$zipfile = $ARGV[1]?$ARGV[1]:"$username.tar.gz";
	$path = $ARGV[2]?$ARGV[2]:findpath();
	print "$username, $zipfile, $path";
}
sub findpath {
	my $passwd = trim (`grep "^$username" /etc/passwd`);
	my $hash = {
		username => 0,
		home => 5
	};
	if (!$passwd) {
		return "./";
	}
	$passwd = split (/:/,$passwd);
	return [$hash->{'home'}];
}
sub findfiles {
	$files = `find $path -user $username`;
	print "Archiving:\n$files\n";
}

sub zipfiles {
	$files =~ s/\n/ \\\n/g;
	my $cmd = "tar -czf $zipfile $files";
	#print $cmd;
	if (system ($cmd)==0)
	{
		print "Created $zipfile";
	}
	else
	{
		print "Something failed";
	}
}
