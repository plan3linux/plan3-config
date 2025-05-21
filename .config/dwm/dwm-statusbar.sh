#load colors
black=#222222
white=#bbbbbb
grey=#442222
red=#770000

#cpulast="N"
#memlast="N"
#clocklast="N"

os_tag(){
	p3_val=$(cat $HOME/.config/p3-version)

	printf "^c$red^ ^b$white^ Plan3"
	printf "^c$white^ ^b$grey^ $p3_val"
	printf "^c$white^ ^b$black^"
}

cpu() {
	cpu_val=$(grep -o "^[^ ]*" /proc/loadavg)
	
	#if [ $cpulast = $cpu_val ]; then
	printf "^c$white^ ^b$red^"
	#else
	#	printf "^c$red^ ^b$white^"
	#fi
	#cpulast="$cpu_val"
	printf " CPU"
	printf "^c$white^ ^b$grey^ $cpu_val"
	printf "^c$white^ ^b$black^"
}

mem(){
	mem_val="$(free -h | awk '/^Mem/ { print $3 }' | sed s/i//g)"

	printf "^c$white^ ^b$red^ RAM"
	printf "^c$white^ ^b$grey^ $mem_val"
	printf "^c$white^ ^b$black^"
}

clock() {
	clock_val=$(date '+%H:%M')

	printf "^c$white^ ^b$red^ $clock_val "
	#printf "^c$white^ ^b$black^"
}

while true; do
	xsetroot -name "$(os_tag) $(cpu) $(mem) $(clock)"
	sleep 2
done
