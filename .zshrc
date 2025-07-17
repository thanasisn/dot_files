
## profiling
# zmodload zsh/zprof

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

HISTFILE=~/.hist_$(hostname)

## better theme for kde with qt5ct
export QT_QPA_PLATFORMTHEME=qt5ct

## for josm
export _JAVA_AWT_WM_NONREPARENTING=1

## nicer man with bat
# export MANPAGER="sh -c 'col -bx | batcat -l man -p'"
export MANPAGER='bat -pl man'

## fzf options
# map r push :rename<space>
export FZF_DEFAULT_OPTS=" --preview 'bat --color=always --style=plain,header --line-range=:50 {}' "

## disable clear screen with ctrl+l conflict with vim
bindkey -r "^L"

## define looks
case "$(hostname)" in

  crane)
    ZSH_THEME="tjkirch"
    printf '\033]11;#101003\007'
    ;;

  mumra)
    ZSH_THEME="candy"
    printf '\033]11;#0d021a\007'
    ;;

  sagan)
    ZSH_THEME="bureau"
    printf '\033]11;#001619\007'
    ;;

  tyler)
    ZSH_THEME="fox"
    printf '\033]11;#1b1b01\007'
    ;;

  virt)
    ZSH_THEME="tjkirch"
    printf '\033]11;#27081e\007'
    ;;

  *)
    ## default theme
    ZSH_THEME="tjkirch"
    ;;
esac

HISTSIZE=9999
SAVEHIST=9999
setopt autocd extendedglob
bindkey -v
zstyle :compinstall filename '/home/athan/.zshrc'

setopt histignorealldups sharehistory

# Remove superfluous blanks from each command line being added to the history list.
setopt HIST_REDUCE_BLANKS

# If a new command line being added to the history list duplicates an older one, the older
# command is removed from the list (even if it is not the previous event).
setopt HIST_IGNORE_ALL_DUPS

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)
plugins=(auto-notify $plugins)

source $ZSH/oh-my-zsh.sh


## use bash auto completion
autoload bashcompinit

## bind last command to F12
bindkey -s $terminfo[kf12] '\e0\e_ '


## ALIASES ##
# Unmount all encfs
alias ccc=' fusermount -uz  /home/athan/ZHOST/noble; fusermount -uz  /home/athan/Pictures/other; fusermount -uz /home/athan/Pictures/other2; fusermount -uz /home/athan/Pictures/other3; fusermount -uz /home/athan/Pictures/ns'

## Conditional aliases

# if [ "$(hostname)" = "tyler" ]; then
alias sskk='sudo encfs --public /home/folder/.KKK /mnt/con'
alias kkss='sudo fusermount -uz /mnt/con'

alias other='encfs --idle=180 /home/folder/CAMERATTA/OTHER   /home/athan/Pictures/other3'
alias ana='  encfs --idle=180 /home/athan/.ENC/.ana          /home/athan/Pictures/other2'
alias nsfw=' encfs --idle=380 /home/folder/CAMERATTA/.NSFW   /home/athan/Pictures/ns'
# fi

alias nnn=' encfs --idle=180 /home/folder/.TEMO              /home/athan/ZHOST/noble; cd /home/athan/ZHOST/noble'

# exit lf on current directory
LFCD="$HOME/.config/lf/lfcd.sh"
if [ -f "$LFCD" ]; then
  source "$LFCD"
fi

## disable bell
if [ -n "$DISPLAY" ]; then
  xset b off
fi

## load shell functions first
if [ -f $HOME/.shell_functions ]; then
  . $HOME/.shell_functions
fi

## load environment variables
if [ -f $HOME/.shell_variables ]; then
  . $HOME/.shell_variables
fi

## load telegram keys
if [ -f ~/.ssh/telegram/unikey_$(hostname) ]; then
  . ~/.ssh/telegram/unikey_$(hostname)
else
  . ~/.ssh/telegram/unikey_hosts
fi


## disable software flow control XOFF
## this usually freeze vim after ctrl+s you can continue with ctrl+q
stty stop ""

## visited directory stack
## this config may be unnecessary
setopt AUTO_PUSHD                  # pushes the old directory onto the stack
setopt PUSHD_MINUS                 # exchange the meanings of '+' and '-'
setopt CDABLE_VARS                 # expand the expression (allows 'cd -2/tmp')

zstyle ':completion:*:directory-stack' list-colors '=(#b) #([0-9]#)*( *)==95=38;5;12'

## ignore host file in autocomplete?
zstyle ':completion:*' hosts off

##  home-manager programs alias bellow this part
if [ -e /home/athan/.nix-profile/etc/profile.d/nix.sh ]; then 
  . /home/athan/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

## enable fzf
source "$HOME/.config/fzf/completion.zsh"
source "$HOME/.config/fzf/key-bindings.zsh"

## enable zoxide
(( $+commands[zoxide] )) && eval "$(zoxide init zsh)"

## load aliases
. ~/.shell_aliases


##  Path locations
# PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/share/fslint/fslint
# PATH=$PATH:$HOME/.local/bin
# [ -d $HOME/BASH/                    ] && PATH=$PATH$(find $HOME/BASH/                    -maxdepth 2 -type d -not -path '*/\.*' -printf ":%p")
# [ -d $HOME/CODE/conky               ] && PATH=$PATH$(find $HOME/CODE/conky               -maxdepth 1 -type d -not -path '*/\.*' -printf ":%p")
# [ -d $HOME/CODE/img_tools           ] && PATH=$PATH$(find $HOME/CODE/img_tools           -maxdepth 1 -type d -not -path '*/\.*' -printf ":%p")
# [ -d $HOME/CODE/nixos/scripts       ] && PATH=$PATH$(find $HOME/CODE/nixos/scripts       -maxdepth 1 -type d -not -path '*/\.*' -printf ":%p")
# [ -d $HOME/CODE/notes_tools         ] && PATH=$PATH$(find $HOME/CODE/notes_tools         -maxdepth 1 -type d -not -path '*/\.*' -printf ":%p")
# [ -d $HOME/CODE/pdf_tools           ] && PATH=$PATH$(find $HOME/CODE/pdf_tools           -maxdepth 1 -type d -not -path '*/\.*' -printf ":%p")
# [ -d $HOME/CODE/session             ] && PATH=$PATH$(find $HOME/CODE/session             -maxdepth 1 -type d -not -path '*/\.*' -printf ":%p")
# [ -d $HOME/CODE/system_backup_tools ] && PATH=$PATH$(find $HOME/CODE/system_backup_tools -maxdepth 1 -type d -not -path '*/\.*' -printf ":%p")
# [ -d $HOME/CODE/system_tools        ] && PATH=$PATH$(find $HOME/CODE/system_tools        -maxdepth 1 -type d -not -path '*/\.*' -printf ":%p")
# [ -d $HOME/CODE/training_analysis   ] && PATH=$PATH$(find $HOME/CODE/training_analysis   -maxdepth 1 -type d -not -path '*/\.*' -printf ":%p")
# [ -d $HOME/PROGRAMS/                ] && PATH=$PATH$(find $HOME/PROGRAMS/                -maxdepth 1 -type d -not -path '*/\.*' -printf ":%p")
# export PATH=$PATH
# Faster PATH additions (skip 'find' calls)
path=(
  $HOME/.local/bin
  $HOME/BASH
  $HOME/BASH/CRON
  $HOME/BASH/TOOLS
  $HOME/CODE/{conky,img_tools,nixos/scripts,notes_tools,pdf_tools,session,system_backup_tools,system_tools,training_analysis}
  $HOME/PROGRAMS
  /bin
  /usr/bin
  /usr/local/bin
  /usr/share/fslint/fslint
  ${(s/:/)PATH}
)
typeset -U path  # Remove duplicates
export PATH



## load pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv >/dev/null 2>&1; then
  eval "$(pyenv init - zsh)"
fi


## load autocompletions
# autoload -Uz compinit && compinit -i

# Faster compinit (lazy-load + cache)
autoload -Uz compinit
() {
  setopt local_options no_aliases
  local zcd=/dev/shm/zcompdump
  local zcdc="$zcd.zwc"

  # Only run compinit if dump is older than 20 hours
  if [[ -f "$zcd"(#qN.mh+20) ]]; then
    compinit -d "$zcd"
    { zcompile "$zcd" } &!
  elif [[ -f "$zcd" ]]; then
    compinit -C -d "$zcd"
  else
    compinit -i -d "$zcd"
  fi
}


## autoload project environment
eval "$(direnv hook zsh)"

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	/usr/bin/rm -f -- "$tmp"
}


# >>> conda initialize >>>
## # !! Contents within this block are managed by 'conda init' !!
## __conda_setup="$('/home/folder/miniconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
## if [ $? -eq 0 ]; then
##     eval "$__conda_setup"
## else
##     if [ -f "/home/folder/miniconda/etc/profile.d/conda.sh" ]; then
##         . "/home/folder/miniconda/etc/profile.d/conda.sh"
##     else
##         export PATH="/home/folder/miniconda/bin:$PATH"
##     fi
## fi
## unset __conda_setup
# <<< conda initialize <<<

# Lazy-load conda (only when 'conda' is first called)
conda() {
  unfunction conda
  # >>> Conda initialize >>>
  __conda_setup="$('/home/folder/miniconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
  eval "$__conda_setup"
  unset __conda_setup
  # <<< Conda initialize <<<
  conda "$@"
}


## profiling
# zprof
