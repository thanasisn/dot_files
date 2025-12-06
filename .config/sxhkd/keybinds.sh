#!/usr/bin/env bash

sxhkdfile="/home/athan/.config/sxhkd/sxhkdrc"

(
awk '/^[a-z]/ && last {print "<small>",$0,"\t",last,"</small>"} {last=""} /^#/{last=$0}' "$sxhkdfile" |
  tr "#" " " |
  tr -s ' '  |
  sort -V

grep "^bindsym" ~/.config/i3/config |
  sed 's/-\(-\w\+\)\+//g;s/$mod/mod4/g; s/Mod1/Alt/g; s/exec //; s/bindsym //; s/^\s\+//; s/^\([^ ]\+\) \(.\+\)$/<small> \1: \2<\/small>/; s/^\s\+//' |
  tr -s ' '  |
  tr ":" "\t"|
  sort -V
) | column -t -s $'\t'


if [[ -f "/home/athan/.config/rofi/config" ]]; then

  (
    awk '/^[a-z]/ && last {print "<small>",$0,"\t",last,"</small>"} {last=""} /^#/{last=$0}' "$sxhkdfile" |
      tr "#" " " |
      tr -s ' '  |
      sort -V

    grep "^bindsym" ~/.config/i3/config |
      sed 's/-\(-\w\+\)\+//g;s/$mod/mod4/g; s/Mod1/Alt/g; s/exec //; s/bindsym //; s/^\s\+//; s/^\([^ ]\+\) \(.\+\)$/<small> \1: \2<\/small>/; s/^\s\+//' |
      tr -s ' '  |
      tr ":" "\t"|
      sort -V
    ) | column -t -s $'\t' |
      rofi -config "/home/athan/.config/rofi/config"  -dmenu -i -markup-rows -no-show-icons -lines 20  -font "monospace 11"
  else

    (
      awk '/^[a-z]/ && last {print "<small>",$0,"\t",last,"</small>"} {last=""} /^#/{last=$0}' "$sxhkdfile" |
        tr "#" " " |
        tr -s ' '  |
        sort -V

      grep "^bindsym" ~/.config/i3/config |
        sed 's/-\(-\w\+\)\+//g;s/$mod/mod4/g; s/Mod1/Alt/g; s/exec //; s/bindsym //; s/^\s\+//; s/^\([^ ]\+\) \(.\+\)$/<small> \1: \2<\/small>/; s/^\s\+//' |
        tr -s ' '  |
        tr ":" "\t"|
        sort -V
      ) | column -t -s $'\t' |
        rofi -dmenu -i -markup-rows -no-show-icons -lines 20  -font "monospace 11"
fi

