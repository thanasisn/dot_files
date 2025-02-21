#!/bin/sh

set +e
sleep 1

## for a better date format in some programs
# export LC_TIME="en_DK.UTF-8"

## programs and stuff for desktop
# "$HOME/CODE/session/session_startup.sh" &

## set session settings
"$HOME/CODE/session/session_settings.sh" &


###  bspwm config  #####################################################

# if [[ $(hostname) == "sagan" ]]; then
#     exec bspwm
#     exit 0
# fi



# ###  dwm config  #####################################################
# # ## restart stalonetray
# # (
# #     sleep 10
# #     killall -9 stalonetray
# #     nohup /home/athan/BASH/deamonize.sh "stalonetray --geometry 4x1+650+0"  &
# # ) &
# 
# ## status bar updater
# "$HOME/CODE/session/dwm_status_updater.sh" &
# 
# ## test new dwm
# # exec "/home/athan/PROGRAMS/dwm/dwm-6.2_luke_new/dwm"
# 
# ## other cases
# exec "/home/athan/PROGRAMS/dwm/dwm-6.2_luke/dwm"


