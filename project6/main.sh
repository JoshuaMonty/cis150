IFS=","

declare inFile="$1"
declare outFile="$2"
declare -a lastNames
declare -a firstNames
declare -a ages
declare -a people

main() {
    readFile
    altReadFile
    printLastNames
    printMdArray
    writeNewFile
    exit 0
}

readFile() {
    declare -i lineNumber=0
    while read lastName firstName age
    do
        lastNames[$lineNumber]=$lastName
        firstNames[$lineNumber]=$firstName
        ages[$lineNumber]=$age
        (( lineNumber++ ))
    done < $inFile
}

altReadFile() {
	declare -i lineNumber=0
	declare -ir ROWS=6
	declare -ir COLUMNS=3
	while read lastName firstName age
	do
		for (( i=0; i < ROWS; i++ )) {
			for (( j=0; j < COLUMNS; j++ )) {
				if [ $j -eq 0 ]
				then
					people[$i,$j]=$lastName
				elif [ $j -eq 1 ]
				then
					people[$i,$j]=$firstName
				else
					people[$i,$j]=$age
				fi
			}
		}
		(( lineNumber++ ))
	done < $inFile
}

printLastNames() {
    for (( i=0; i < ${#lastNames[@]}; i++ ))
    do
        echo -e "${lastNames[i]}\n"
    done
}

printMdArray() {
	declare -ir ROWS=6
	declare -ir COLUMNS=3
	for (( i=0; i < ROWS; i++ )) {
		for (( j=0; j < COLUMNS; j++ )) {
			echo "${people[$i,$j]}"
		}
	}
}

writeNewFile() {
     for (( i=0; i < ${#lastNames[@]}; i++ ))
     do
         echo ${lastNames[i]} >> $outFile
     done
}

main

