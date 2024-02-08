#!/usr/bin/env bash

configfile="$1"

if [[ $HOST == "tyler" ]]; then
    awk '/^[a-z]/ && last {print "<small>",$0,"\t",last,"</small>"} {last=""} /^#/{last=$0}' "$configfile" |
        column -t -s $'\t' |
        sort -V            |
        rofi -config "/home/athan/.config/rofi/config"  -dmenu -i -markup-rows -no-show-icons -lines 20  -font "monospace 11"
else
    awk '/^[a-z]/ && last {print "<small>",$0,"\t",last,"</small>"} {last=""} /^#/{last=$0}' "$configfile" |
        column -t -s $'\t' |
        sort -V            |
        rofi -dmenu -i -markup-rows -no-show-icons -lines 20  -font "monospace 11"
fi


