use warnings;

my (@data, @user);
my ($DATAFILEIN, $DATAFILEOUT);
use constant COLUMNS => 6;

sub main {
	setDataFileIn();
	setDataFileOut();
	readData();
	writeData();
deleteData();
printUser();
deleteUser();
printDataFileOut();
}

main();

sub setDataFileIn {
	$DATAFILEIN = $ARGV[0];
}

sub setDataFileOut {
	if (!($ARGV[1])) {
		$DATAFILEOUT = "./DATAX.ZIP";
	} else {
		$DATAFILEOUT = $ARGV[1];
	}
}

sub readData {
	my $IN;
	my $counter = 0;
	my @tempData = ();
	@data = ();
	open ($IN, '<', $DATAFILEIN);
	while (<$IN>) {
		@tempData = split(/,/);
		for (my $i = 0; $i < COLUMNS; $i++) {
			chomp ($data[$counter][$i] = $tempData[$i]);
		}
		$counter++;
	}
	close $IN;
}

sub writeData {
	my $OUT;
	my $size = @data;
	open ($OUT, '>', $DATAFILEOUT);
	for (my $i = 0; $i < $size; $i++) {
		for (my $j = 0; $j < COLUMNS; $j++) {
			if ($j == COLUMNS - 1) {
				print ($OUT "$data[$i][$j]");
			} else {
				print ($OUT "$data[$i][$j],");
			}
		}
		print ($OUT "\n");
	}
	close $OUT;
}

sub printDatafileout {
	my $size = @data;
	for (my $i = 0; $i < $size; $i++) {
		for (my $j = 0; $j < COLUMNS; $j++) {
			print "$Datafileout[$i][$j] ";
		}
		print "\n";
	}
}

