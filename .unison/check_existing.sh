#!/usr/bin/env bash
## created on 2024-02-08

#### Just get the non existing paths in unison config files

file="$1"
root="$HOME"

notexist="./Not_existing_paths_$file.temp"

## get include paths
echo "##  INCLUDED PATHS  ##" >  "$notexist"
echo "                      " >> "$notexist"

grep "^[# ]*path[ ]*=.*" "$file" |\
    cut -d'=' -f2-   |\
    sed 's/^[# ]*//' |\
    while read line; do
        if [ -e "$root/$line" ]; then
           echo "INCL EXIST: $line"
        else
           echo "INCL NOT EXISTING: $line"
           echo "$line" >> "$notexist"
        fi
    done

## get ignored paths
(
    echo "                      "
    echo "##  EXCLUDED PATHS  ##"
    echo "                      " ) >> "$notexist"

grep "^[# ]*ignore[ ]*=[ ]*[Pp]ath[ ]*" "$file" |\
    sed 's/^[^{]*{\([^{}]*\)}.*/\1/' |\
    while read line; do
        if [ -e "$root/$line" ]; then
           echo "EXCL EXIST: $line"
        else
           echo "EXCL NOT EXISTING: $line"
           echo "$line" >> "$notexist"
        fi
    done


echo ""
echo "NOT EXISTING PATHS"
echo "in: $file"
echo ""
cat "$notexist"


exit 0
