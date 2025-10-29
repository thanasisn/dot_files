# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

## use GTK thme for qt5 applications
## needs qt5-style-plugins
# test this
# export QT_QPA_PLATFORMTHEME=gtk2

# if running bash
if [ -n "$BASH_VERSION" ]; then
  # include .bashrc if it exists
  if [ -f "$HOME/.bashrc" ]; then
	  . "$HOME/.bashrc"
  fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
  PATH="$HOME/.local/bin:$PATH"
fi

## add desktop application path for nix
if [ -e /home/athan/.nix-profile/etc/profile.d/nix.sh ]; then
  . /home/athan/.nix-profile/etc/profile.d/nix.sh;
  export XDG_DATA_DIRS=$HOME/.nix-profile/share/aplications:"${XDG_DATA_DIRS:-/usr/local/share/:/usr/share/}"
fi # added by Nix installer


## add python pyenv
if [ -d "$HOME/.pyenv" ] ; then
  export PYENV_ROOT="$HOME/.pyenv"
  [ -d $PYENV_ROOT/bin ] && export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"  
fi

## load telegram keys
if [ -f ~/.ssh/telegram/unikey_$(hostname) ]; then
  . ~/.ssh/telegram/unikey_$(hostname)
else
  . ~/.ssh/telegram/unikey_hosts
fi

## set settings last
"$HOME/CODE/session/session_settings.sh"  > /dev/null 2>&1

