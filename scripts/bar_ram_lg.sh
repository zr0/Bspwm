#!/bin/bash
source $(dirname $0)/config.sh

FREE=`free -m | awk 'NR == 2 {gsub(/%/,""); print $4}'`
MAX=`free -m | awk 'NR == 2 {gsub(/%/,""); print $2}'`
PERC=`echo $FREE*100/$MAX | bc`

ICON="mem.xbm"
if [[ $PERC -gt 75 ]]; then
	    PERCBAR=`echo -e "$PERC"\
		            | gdbar -bg $bar_bg -fg $warning -h 1 -w 180`
    else
	        PERCBAR=`echo -e "$PERC"\
			        | gdbar -bg $bar_bg -fg $bar_fg -h 1 -w 180`
	fi

	ICON='^i(/home/s3r0/.config/bspwm/scripts/dzen2/'"$ICON)"
	echo "^fg($highlight)$ICON^fg() FREE $PERCBAR ^fg($highlight)$PERC%"
