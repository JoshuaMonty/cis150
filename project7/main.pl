#!/usr/bin/perl
use 5.14.2;
use warnings;

my ($LastName, $FirstName, $MiddleName, $DOB, $Insurance, $Ailment);
my ($age, $PIN, $continue, $counter);

sub main {
	# system ("clear");
	setLastName();
	setFirstName();
	setMiddleName();
	setDOB();
	setInsurance();
	setAilment();
	setAge();
	setPIN();
}

main();

sub setCounter {
	if (defined $counter) {
		$counter++;
	} else {
		$counter = 0;
	}
}

sub setContinue {
     if (defined $continue) {
		$continue = -1;
		while ($continue !~ /[0-9]/ || $continue > 1 || $continue < 0) {
			say "Do you want to continue (0=no, 1=yes)?";
			chomp ($continue = <STDIN>);
			if ($continue !~ /[0-9]/ || $continue > 1 || $continue < 0) {
				say "Incorrect input. Please try again";
				sleep 1;
				system ("cls");
			}
		}
     } else {
          $continue = 1;
     }
}

sub setLastName {
	if (!(defined $LastName)) {
		$LastName = 1;
	}
	while ($LastName !~ /^[a-zA-Z]{2,20}$/x) {
		say "What is your last name?";
		chomp ($LastName = <STDIN>);
		if ($LastName !~ /^[a-zA-Z]{2,20}$/x) {
			say "Incorrect input. Please try again";
			sleep 1;
			system ("cls");
		}
	}
}

sub setFirstName {
	if (!(defined $FirstName)) {
		$FirstName = 1;
	}
	while ($FirstName !~ /^[a-zA-Z]{2,20}$/x) {
		say "What is your first name?";
		chomp ($FirstName = <STDIN>);
		if ($FirstName !~ /^[a-zA-Z]{2,20}$/x) {
			say "Incorrect input. Please try again";
			sleep 1;
			system ("cls");
		}
	}
}

sub setMiddleName {
	if (!(defined $MiddleName)) {
		$MiddleName = 1;
	}
	while ($MiddleName !~ /^[a-zA-Z]{2,20}$/x) {
		say "What is your middle name?";
		chomp ($MiddleName = <STDIN>);
		if ($MiddleName !~ /^[a-zA-Z]{2,20}$/x) {
			say "Incorrect input. Please try again";
			sleep 1;
			system ("cls");
		}
	}
}

sub setDOB {
	if (!(defined $DOB)) {
		$DOB = 1;
	}
	my ($pattern) = /^[01]?\d\/[0-3]?\d\/\d{4}\$/;
	while ($DOB !~ $pattern) {
		say "What is your DOB? (MM/DD/YYYY)";
		chomp ($DOB = <STDIN>);
		if ($DOB !~ $pattern) {
			say "Incorrect input. Please try again";
			sleep 1;
			system ("cls");
		}
	}
}

sub setInsurance {
	if (!(defined $Insurance)) {
		$Insurance = 1;
	}
	while ($Insurance !~ /^[a-zA-Z]{2,20}$/x) {
		say "What is your Insurance Plan?";
		chomp ($Insurance = <STDIN>);
		if ($Insurance !~ /^[a-zA-Z]{2,20}$/x) {
			say "Incorrect input. Please try again";
			sleep 1;
			system ("cls");
		}
	}
}

sub setAilment {
	if (!(defined $Ailment)) {
		$Ailment = 1;
	}
	while ($Ailment !~ /^[a-zA-Z]{2,20}$/x) {
		say "What is your Ailment?";
		chomp ($Ailment = <STDIN>);
		if ($Ailment !~ /^[a-zA-Z]{2,20}$/x) {
			say "Incorrect input. Please try again";
			sleep 1;
			system ("cls");
		}
	}
}

sub age {
    my ($birth_day, $birth_month, $birth_year) = @_;


    my ($day, $month, $year) = (localtime)[3..5];
    $year += 1900;


    my $age = $year - $DOB;
    $age-- unless sprintf("%02d%02d", $month, $day)
               >= sprintf("%02d%02d", $birth_month, $birth_day);
    return $age;
}

if ($Insurance = undef) {
	print_variable ($LastName);
	print_variable ($FirstName);
	print_variable ($MiddleName);
	print_variable ($DOB);
	print_variable ($Ailment);
}

