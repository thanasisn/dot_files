#!/usr/bin/env bash
## created on 2024-02-08

#### Just get the non existing paths in unison config files

file="$1"
root="$HOME"

notexist="Not_existing_paths_$file"
echo "" > "$notexist"

grep "^[ ]*path[ ]*=.*" "$file" |\
    cut -d'=' -f2-  |\
    sed 's/^[ ]*//' |\
    while read line; do

        if [ -e "$root/$line" ]; then
           echo "EXIST: $line"
        else
           echo "NOT EXISTING: $line"
           echo "$line" >> "$notexist"
        fi
    done

echo ""
echo "NOT EXISTING PATHS"
echo "in: $file"
echo ""
cat "$notexist"


exit 0
