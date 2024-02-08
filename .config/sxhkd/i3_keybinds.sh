#!/usr/bin/env bash
## created on 2023-04-18

#### Display keybinds


configfile="$HOME/.config/i3/config"

#./i3_keybinds.sh | grep "^[ ]*bindsym\|bindcode"
awk '/^[a-z]/ && last {print "<small>",$0,"\t",last,"</small>"} {last=""} /^#/{last=$0}' "$configfile" |\
    grep "bindsym\|bindcode" |
    sed 's/bindsym[ ]*//'    |
    sed 's/bindcode[ ]*//'   |
    column -t -s $'\t'




## end coding
exit 0 
