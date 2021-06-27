#!/bin/sh

#A dwm_bar function to display the currently playing song info

df_check_location='/home'

dwm_playerctl () {
	ARTIST=$(playerctl metadata artist)
	SONG=$(playerctl metadata title)
	#ALBUM=$(playerctl metadata album	#album is same as title in firefox?)
	STATUS=$(playerctl status)


	printf "%s" "$SEP1"
	if [ "$STATUS" = "Playing" ]; then
		if [ "$ARTIST" = "" ]; then
                        printf "Now Playing: %s" "$SONG"
                else
                        printf "Now Playing: %s - %s" "$SONG" "$ARTIST"
                fi
	else
		printf "Player paused"
	fi
	printf "%s\n" "$SEP2"
}

dwm_playerctl
