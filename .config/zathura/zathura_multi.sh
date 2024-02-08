#!/usr/bin/env bash
## created on 2019-03-08

#### Actions for zathura
## p:   previous file
## n:   next file
## del: remove file
## o:   open whith okular
## # h:   history not used

FILE="$1"
WHICH="$1"
FILE="$2"

EXTENSION="${FILE##*.}"
BASEDIR="$(dirname "$FILE")"

AROUND=1

ere_quote() {
    sed 's/[]\.|$(){}?+*^]/\\&/g' <<< "$*"
}

echo
echo "GOT  $FILE"
echo "EXT  $EXTENSION"
echo "DIR  $BASEDIR"
echo

## open with okular
if [[ $WHICH == "o" ]]; then
    (nohup okular --unique  "$FILE" >/dev/null 2>&1 & )
    exit
fi

## open next file
if [[ $WHICH == "n" ]]; then
    echo "GET NEXT"
    newfile="$(find "$BASEDIR" -maxdepth 1 -iname "*.$EXTENSION" |\
        sort            |\
        grep -B $AROUND -A $AROUND "$FILE" | tail -n1 )"
fi

## open previous file
if [[ $WHICH == "p" ]]; then
    echo "GET PREVIOUS"
    newfile="$(find "$BASEDIR" -maxdepth 1 -iname "*.$EXTENSION" |\
        sort            |\
        grep -B $AROUND -A $AROUND "$FILE" | head -n1)"
fi

## put file in the trash
if [[ $WHICH == "del" ]]; then
    echo "TRASH CURRENT"
    newfile="$(find "$BASEDIR" -maxdepth 1 -iname "*.$EXTENSION" |\
        sort            |\
        grep -B $AROUND -A $AROUND "$FILE" | tail -n1)"
    echo "next file $newfile"

    ## kill previous file and open new one
    pkill -9 -f "zathura .*$(ere_quote "$name")"
    nohup zathura "$newfile" >/dev/null 2>&1 
    ## trash the old file
    trash "$FILE"
    exit 0
fi

## history may moved to dmenu
# if [[ $WHICH == "h" ]]; then
#     echo "GET PREVIOUS"
#     cat ~/.local/share/zathura/history | grep -Po '\[\K[^\]]*'
# fi

echo
echo "LOAD:: $newfile"

## got only file name so just open the files
name="$(basename "$FILE")"

if [[ "$newfile" == "$FILE" ]]; then
    echo "SAME FILE"
    echo "..ignore.."
    exit 0
fi

## keep this to execute last command
## kill previous file and open new one
echo "pkill:  zathura .*$(ere_quote "$name")"
( pkill -9 -f "zathura .*$(ere_quote "$name")" &
  nohup zathura "$newfile" >/dev/null 2>&1     & )


exit 0
