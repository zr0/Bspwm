#!/bin/bash
#bspc config focused_border_color "#504339"

background="#08090a"
foreground="#45282a"
highlight="#606c78"

#XPOS=$(xdotool getmouselocation | awk -F " " '{print $1}' | cut -d ":" -f 2)
YPOS="12"
HEIGHT="12"
XOFFSET=554
if [[ -z `xrandr | grep " connected" | grep 'VGA'` ]]; then
		XOFFSET="0"
	fi

	#FONT="-artwiz-lime-medium-r-normal-*-10-110-75-75-m-50-iso8859-*"
	FONT="-vc-neoxis-medium-r-normal--10-100-75-75-c-60-iso8859-1"
	#FONT="-artwiz-limey-medium-r-normal-*-10-110-75-75-m-50-iso8859-*"
	#FONT="-*-tamsyn-medium-r-normal-*-10-110-75-75-m-50-iso8859-*"
	#FONT='-*-lemon-*-*-*-*-*-*-75-75-*-*-*-*'
	#FONT="-*-tewi-medium-*-normal-*-*-*-*-*-*-*-*-*"
	white0="#775759"

	bar_bg="#45282a"
	bar_fg="#606c78"
	notify="#d17b49"
	warning="#d17b49"
