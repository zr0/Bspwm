#!/bin/bash
source $(dirname $0)/config.sh
#XPOS=$((1090 + $XOFFSET))
XPOS=$((1180 + $XOFFSET))
WIDTH="180"
LINES="9"

playing=$(mpc current)
artist=$(mpc current -f  %artist%)
album=$(mpc current -f  %album%)
track=$(mpc current -f  %title%)
date=$(mpc current -f  %date%)

#stats=$(mpc stats)
#playlistcurrent=$(mpc playlist | grep -n "$playing" | cut -d ":" -f 1 | head -n1)
#nextnum=$(( $playlistcurrent + 1 ))
#prevnum=$(( $playlistcurrent - 1 ))
#next=$(mpc playlist | sed -n ""$nextnum"p")
#prev=$(mpc playlist | sed -n ""$prevnum"p")
#art=$(ls ~/.config/bspwm/scripts/covers | grep SMALL | grep $album)
art="/home/s3r0/.config/bspwm/scripts/covers/$(ls ~/.config/bspwm/scripts/covers | grep -v SMALL | grep "$(mpc current -f %album% | sed 's/:/ /g')")"
perc=`mpc | awk 'NR == 2 {gsub(/[()%]/,""); print $4}'`
 
percbar=`echo -e "$perc" | gdbar -bg $bar_bg -fg $bar_fg -h 1 -w $(($WIDTH-20))`

#84x84
feh -x -B black -^ "" -g 108x108+$(($XPOS-108))+$(($YPOS+12)) -Z "$art" &
(echo "^fg($highlight)Music"; echo "       ";echo "^ca(1,/home/s3r0/.config/bspwm/scripts/dzen_lyrics.sh)  Track:  ^fg($highlight)$track^ca()"; echo "^ca(1,/home/s3r0/.config/bspwm/scripts/dzen_artistinfo.sh)^fg()  Artist: ^fg($highlight)$artist^ca()";echo "^ca(1,/home/s3r0/.config/bspwm/scripts/dzen_albuminfo.sh)^fg()  Album:  ^fg($highlight)$album^ca()"; echo "^ca(1,/home/s3r0/.config/bspwm/scripts/dzen_lyrics.sh)  Year:   ^fg($highlight)$date^ca()"; echo "  $percbar"; echo "      ^ca(1, mpc prev)  ^fg($foreground)^i(/home/s3r0/.config/bspwm/scripts/dzen2/prev.xbm) ^ca()  ^ca(1, mpc pause) ^i(/home/s3r0/.config/bspwm/scripts/dzen2/pause.xbm) ^ca()  ^ca(1, mpc play) ^i(/home/s3r0/.config/bspwm/scripts/dzen2/play.xbm) ^ca()   ^ca(1, mpc next) ^i(/home/s3r0/.config/bspwm/scripts/dzen2/next.xbm) ^ca()"; echo " "; sleep 5) | dzen2 -fg $foreground -bg $background -fn $FONT -x $XPOS -y $YPOS -w $WIDTH -l $LINES -e 'onstart=uncollapse,hide;button1=exit;button3=exit' & 
sleep 5
killall feh
