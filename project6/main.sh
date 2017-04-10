# Usage: ./main.sh 65 <employees.csv
IFS=","

declare -A people

main() {
    readin
    writeout $1
    exit 0
}

readin() {
	declare -i i=0
	while read lastName firstName age
	do
		people[$i,0]=$lastName
		people[$i,1]=$firstName
		people[$i,2]=$age	
		(( i++ ))
	done
}

writeout() {
	declare -i i=0
	while [ ${people[$i,0]+isset} ]
	do
		if [ $(expr ${people[$i,2]} - $1) -gt 0 ]; then

			echo "${people[$i,0]}"
		fi
		(( i++ ))
	done
}

main $1

