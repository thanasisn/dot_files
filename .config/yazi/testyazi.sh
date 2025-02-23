#!/usr/bin/env bash
## created on 2025-02-23

#### Test arguments passed to command

echo "$(date +'%F %T') :: $*" | tee -a "$HOME/.config/yazi/test.log"
# setsid kate "$*" &
# setsid meld "$*" &

exit 0 
