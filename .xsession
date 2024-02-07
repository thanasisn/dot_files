#!/bin/bash

## Configured WM
# - i3
# - lxde 
# - xmonad
# - dwm 
# - bspwm
# - ANY VARIABLE

## set default session
session=${1:-i3}
# session=${1:-bspwm}
# session=${1:-xmonad}
# session=${1:-herbstluftwm}

set +e

## for a better date format in some programs
export LC_TIME="en_DK.UTF-8"

## Put these in the wm startup  
# "$HOME/CODE/session/session_startup.sh"  &
# "$HOME/CODE/session/session_settings.sh" &

#### Choose session to startx ####
case $session in 
    i3|i3wm )
        export WM_NAME="i3"
        exec i3 
        ;;
    lxde    )
        export WM_NAME="lxde"
        exec startlxde 
        ;;
    xmonad  )
        export WM_NAME="xmonad"
        exec xmonad
        ;;
    ## An older tiling manager used
    dwm     ) 
        export WM_NAME="dwm"
        ## status bar updater
        "$HOME/CODE/session/dwm_status_updater.sh" &
        exec "/home/athan/PROGRAMS/dwm/dwm-6.2_luke/dwm"
        ;;
    bspwm   )
        ## conky is the main problem
        export WM_NAME="bspwm"
        exec bspwm
        ;;
    herbstluftwm   )
        ## conky is the main problem
        export WM_NAME="herbstluftwm"
        # exec herbstluftwm --locked
        exec herbstluftwm 
        ;;
    ## Any other desktop available
    *       ) 
        export WM_NAME="$1"
        echo "This is not a predefined config"
        exec $1
        ;;
esac

# ###  dwm config  #####################################################
# # ## restart stalonetray
# # (
# #     sleep 10
# #     killall -9 stalonetray
# #     nohup /home/athan/BASH/deamonize.sh "stalonetray --geometry 4x1+650+0"  &
# # ) &
# ## test new dwm
# # exec "/home/athan/PROGRAMS/dwm/dwm-6.2_luke_new/dwm"
# ## other cases
# exec "/home/athan/PROGRAMS/dwm/dwm-6.2_luke/dwm"

