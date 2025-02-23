#!/usr/bin/env bash
## created on 2025-02-23

#### ..enter description here..

## start coding
TIC=$(date +"%s")


sleep 1




##  END  ##
TAC=$(date +"%s"); dura="$( echo "scale=6; ($TAC-$TIC)/60" | bc)"
printf "%s %-10s %-10s %-50s %f\n" "$(date +"%F %H:%M:%S")" "$HOSTNAME" "$USER" "$(basename $0)" "$dura"
exit 0 
