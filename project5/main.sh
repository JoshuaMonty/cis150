#!/bin/bash
PS3='Please make a selection:'
main() {
	options=("Editing Commands" "Games" “Chess” “Checkers” "User Administration" "Process Commands" "System Commands" "Network Commands")
	select opt in "${options[@]}"
	do
    	case $opt in
        "Editing Commands")
            echo "edit FILENAME"
            ;;
        "Games")
            echo "Chess or Checkers?"
            ;;
        "User Administration")
            ;;
        "Process Commands")
            echo "ps -a, kill"
            ;;
        "System Commands")
            ;;
        "Network Commands")
            ;;
        *) echo invalid option;;
    	esac
	done
}
main
