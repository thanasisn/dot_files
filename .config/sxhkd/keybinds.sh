#!/usr/bin/env bash

sxhkdfile="/home/athan/.config/sxhkd/sxhkdrc"

awk '/^[a-z]/ && last {print "<small>",$0,"\t",last,"</small>"} {last=""} /^#/{last=$0}' "$sxhkdfile"  | column -t -s $'\t' 

grep "^bindsym" ~/.config/i3/config | sed 's/-\(-\w\+\)\+//g;s/$mod/Win/g;s/Mod1/Alt/g;s/exec //; s/bindsym //; s/^\s\+//;s/^\([^ ]\+\) \(.\+\)$/<small> \1: \2/<\/small>; s/^\s\+//'  | tr ":" "\t"

exit
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


