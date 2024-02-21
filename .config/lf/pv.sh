#!/bin/sh

case "$1" in
    *.tar*)               tar     tf "$1" ;;
    *.zip)                unzip  -l  "$1" ;;
    *.rar)                unrar   l  "$1" ;;
    *.7z)                 7z      l  "$1" ;;
    *.pdf)                pdftotext -l 5 -nopgbrk -q "$1" -;;
    *.docx)               docx2txt   "$1" -;;
    *.doc)                catdoc     "$1" ;;
    *.odt|*,odp|*.ods)    odt2txt    "$1" ;;
    *.htm|*.html|*.xhtml) lynx -dump "$1" ;;
    *)                    batcat --color=always --style=numbers --line-range=:99 "$1";;
    # *)      highlight -O ansi "$1";;
esac


exit

## make extensions lower case always
extension="$(echo "$extension" | tr '[:upper:]' '[:lower:]')"

case "$extension" in
    # Archive extensions:
    7z|a|ace|alz|arc|arj|bz|bz2|cab|cpio|deb|gz|jar|lha|lz|lzh|lzma|lzo|\
    rpm|rz|t7z|tar|tbz|tbz2|tgz|tlz|txz|tZ|tzo|war|xpi|xz|Z|zip)
        try als "$path" && { dump | trim; exit 0; }
        try acat "$path" && { dump | trim; exit 3; }
        try bsdtar -lf "$path" && { dump | trim; exit 0; }
        exit 1;;
    rar)
        try unrar -p- lt "$path" && { dump | trim; exit 0; } || exit 1;;
    # PDF documents:
    pdf)
        try pdftotext -l 10 -nopgbrk -q "$path" - && \
            { dump | trim | fmt -s -w $width; exit 0; } || exit 1;;
    # BitTorrent Files
    torrent)
        try transmission-show "$path" && { dump | trim; exit 5; } || exit 1;;
    # HTML Pages:
    htm|html|xhtml)
        try w3m    -dump "$path" && { dump | trim | fmt -s -w $width; exit 4; }
        try lynx   -dump "$path" && { dump | trim | fmt -s -w $width; exit 4; }
        try elinks -dump "$path" && { dump | trim | fmt -s -w $width; exit 4; }
        ;; # fall back to highlight/cat if the text browsers fail
    doc)
        try antiword "$path" && { dump | trim; exit 0; }
        try catdoc   "$path" && { dump | trim; exit 0; }
        ;;
    docx)
        try docx2txt "$path" - && { dump | trim; exit 0; }
        ;;
    odt|odp|ods)
        odt2txt "$path" && fmt -s -w $width; exit 0;
        ;;
esac


