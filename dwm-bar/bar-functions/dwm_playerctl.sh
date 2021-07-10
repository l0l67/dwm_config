#!/bin/sh

#A dwm_bar function to display the currently playing song info 

df_check_location='/home'

dwm_playerctl () {
	ARTIST=$(playerctl metadata artist)
	SONG=$(playerctl metadata title)
	#ALBUM=$(playerctl metadata album	#album is same as title in firefox?)
	STATUS=$(playerctl status)

	#printf "%s" "$SEP1"
	printf "^c#31bff3^" #set color
	if [ "$STATUS" = "Playing" ]; then
		if [ "$ARTIST" = "" ]; then
			printf "  %s  " "$SONG"
		else
			printf "  %s - %s  " "$SONG" "$ARTIST"
		fi
	elif [ "$STATUS" = "Stopped" ]; then
		printf "  Nothing Playing...  "
	else
		printf "  Nothing Playing...  "
	fi
	#printf "%s\n" "$SEP2"
}

dwm_playerctl
