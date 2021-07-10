#!/bin/sh

# A dwm_bar function to display information regarding system memory, CPU temperature, and storage
# Joe Standring <git@joestandring.com>
# GNU GPLv3

df_check_location='/home'

dwm_resources () {
	# get all the infos first to avoid high resources usage
	free_output=$(free -h | grep Speicher) #standart Mem instead of Speicher
	df_output=$(df -h $df_check_location | tail -n 1)
	# Used and total memory
	MEMUSED=$(echo $free_output | awk '{print $3}')
	MEMTOT=$(echo $free_output | awk '{print $2}')
	# CPU temperature
	#CPU=$(top -bn1 | grep CPU | awk '{print $2}')%
	CPU=$(top -bn1 | grep 'CPU(s)' | awk '{print $2}')%
	#CPU=$(sysctl -n hw.sensors.cpu0.temp0 | cut -d. -f1)
	# Used and total storage in /home (rounded to 1024B)
	#STOUSED=$(echo $df_output | awk '{print $3}')
	#STOTOT=$(echo $df_output | awk '{print $2}')
	STOPER=$(echo $df_output | awk '{print $5}')

	#printf "%s" "$SEP1"
	if [ "$IDENTIFIER" = "unicode" ]; then
		printf "  ^c#a484e9^  %s/%s   ^c#ffaf68^  %s   ^c#f4889a^  %s   " "$MEMUSED" "$MEMTOT" "$CPU" "$STOPER"
	else
		printf "RAM: %s/%s | CPU %s | Storage-used: %s" "$MEMUSED" "$MEMTOT" "$CPU" "$STOPER"
	fi
	#printf "%s\n" "$SEP2"
}

dwm_resources
