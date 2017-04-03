#!/bin/bash
# List of Unix system commands made by Joshua Montgomery
PS3='Please make a selection: '
main() {
	tput reset
	options=("Editing Commands" "Games" "User Administration" "Process Commands" "System Commands" "Network Commands" "Exit")
	select opt in "${options[@]}"
	do
    	case $opt in
        "${options[0]}")
		editingcmds
            	;;
        "${options[1]}")
		games
            	;;
        "${options[2]}")
            	;;
        "${options[3]}")
            	processcmds
            	;;
        "${options[4]}")
		systemcommands
		;;
        "${options[5]}")
		networkcommands
		;;
	"${options[6]}")
		exit 0
		;;
        *) echo invalid option;;
    	esac
	done
}

editingcmds() {
	echo "edit FILENAME"

}
games() {
	echo "Chess or Checkers?"

}
useradmin() {
	echo ""
}
processcmds() {
	options=("List User Prox" "List All Prox" "Kill Prox" "Return to Main")
	select opt in "${options[@]}"
	do
	case $opt in
	"${options[0]}")
		ps ux | more
		processcmds
		;;
	"${options[1]}")
		ps aux | more
		processcmds
		;;
	"${options[2]}")
		read -p "pid: " pid
# Pipes pid into grep the flag P enables PCRE which stands for Perl Compatible Regular Expression
# /d represent 0-9 and won't accept any other characters. The plus sign allows more tha one digit to be entered
# The carret and dollar sign make it so the input is strictly numbers.
		if [ "`echo $pid | grep -P -e "^\d+$" -c`" == "0" ]; then
		echo "Invalid pid"
		fi
		kill $pid
		;;
	"${options[3]}")
		main
		;;
	*) echo invalid option;;
	esac
	done
}
systemcommands() {
	options=("Shutdown" "Restart" "Return to Main")
	select opt in "${options[@]}"
	do
	case $opt in
	"${options[0]}")
		shutdown -h 0
		systemcommands
		;;
	"${options[1]}")
		shutdown -r 0
		systemcommands
		;;
	"${options[2]}")
		main
		;;
	*) echo invalid option;;
	esac
	done
}
networkcommands() {
	options=("IP Configuration" "Return to Main")
	select opt in "${options[@]}"
	do
	case $opt in
	"${options[0]}")
		ifconfig
		networkcommands
		;;
	"${options[1]}")
		main
		;;
	*) echo invalid option;;
	esac
	done
}
main
