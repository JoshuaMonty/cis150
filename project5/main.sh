#!/bin/bash
PS3='Please make a selection:'
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
		;;
        "${options[5]}")
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
		;;
	"${options[3]}")
		main
		;;
	*) echo invalid option;;
	esac
	done
}
systemcommands() {
	echo ""
}
networkcommands() {
	echo ""
}
main
