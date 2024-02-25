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
export FZF_DEFAULT_OPTS=" --preview 'batcat --color=always --style=plain,header  --line-range=:50 {}' "

## default theme
ZSH_THEME="tjkirch"

## dissable clear screan with ctrl+l conflict with vim
bindkey -r "^L"

## color terminal emulators
if [ "$(hostname)" = "tyler" ]; then
    ZSH_THEME="tjkirch"
    # printf '\033]11;#000f00\007'
fi

if [ "$(hostname)" = "kostas" ]; then
    ZSH_THEME="tjkirch"
#    printf '\033]11;#0f0e00\007'
fi

if [ "$(hostname)" = "sagan" ]; then
    # ZSH_THEME="bureau"
    ZSH_THEME="tjkirch"
fi

if [ "$(hostname)" = "blue" ]; then
    # ZSH_THEME="jtriley"
    ZSH_THEME="tjkirch"
#    printf '\033]11;#000117\007'
fi

if [ "$(hostname)" = "crane" ]; then
    # ZSH_THEME="ys"
    ZSH_THEME="tjkirch"
    # ZSH_THEME="candy"
#    printf '\033]11;#0f0f0f\007'
fi

HISTSIZE=9999
SAVEHIST=9999
setopt autocd extendedglob
bindkey -v
zstyle :compinstall filename '/home/athan/.zshrc'

autoload -Uz compinit
compinit

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
# plugins=(git)
plugins=()

source $ZSH/oh-my-zsh.sh



## use bash auto completion
autoload bashcompinit
bashcompinit

## bind last command to F12
bindkey -s $terminfo[kf12] '\e0\e_ '


## ALIASES

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi



# Unmount all encfs
alias ccc=' fusermount -uz  /home/athan/ZHOST/noble; fusermount -uz  /home/athan/Pictures/other; fusermount -uz /home/athan/Pictures/other2; fusermount -uz /home/athan/Pictures/other3; fusermount -uz /home/athan/Pictures/ns'


## Conditional aliases

## TYLER
if [ "$(hostname)" = "tyler" ]; then
    alias sskk='sudo encfs --public /home/folder/.KKK /mnt/con'
    alias kkss='sudo fusermount -uz /mnt/con'

    alias other='encfs --idle=180 /home/folder/CAMERATTA/OTHER   /home/athan/Pictures/other3'
    alias ana='  encfs --idle=180 /home/athan/.ENC/.ana          /home/athan/Pictures/other2'
    alias nsfw=' encfs --idle=380 /home/folder/CAMERATTA/.NSFW   /home/athan/Pictures/ns'
fi

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

## load aliases
. ~/.shell_aliases


## load environment variables
if [ -f $HOME/.shell_variables ]; then
    . $HOME/.shell_variables
fi

## load shell functions
if [ -f $HOME/.shell_functions ]; then
    . $HOME/.shell_functions
fi


if [ -f ~/.ssh/telegram/unikey_$(hostname) ]; then
    . ~/.ssh/telegram/unikey_$(hostname)
  else
    . ~/.ssh/telegram/unikey_hosts
fi


## disable software flow control XOFF
## this usually freeze vim after ctrl+s you can continue with ctrl+q
stty stop ""


## fzf
source "$HOME/.config/fzf/completion.zsh"
source "$HOME/.config/fzf/key-bindings.zsh"


##  Path locations
PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/share/fslint/fslint
PATH=$PATH:$HOME/.local/bin
[ -d $HOME/BASH/      ] && PATH=$PATH$(find $HOME/BASH/      -maxdepth 2 -type d -not -path '*/\.*' -printf ":%p")
[ -d $HOME/PROGRAMS/  ] && PATH=$PATH$(find $HOME/PROGRAMS/  -maxdepth 1 -type d -not -path '*/\.*' -printf ":%p")
[ -d $HOME/CODE/      ] && PATH=$PATH$(find $HOME/CODE/      -maxdepth 1 -type d -not -path '*/\.*' -printf ":%p")
[ -d $HOME/CODE/conky ] && PATH=$PATH$(find $HOME/CODE/conky -maxdepth 1 -type d -not -path '*/\.*' -printf ":%p")
[ -d /snap/bin        ] && PATH=$PATH:/snap/bin
export PATH=$PATH

PATH="/home/athan/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/athan/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/athan/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/athan/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/athan/perl5";       export PERL_MM_OPT;

# if [[ $(hostname) == "sagan" ]]; then
#     neofetch --size 400px --chafa "$HOME/MISC/Media/LOGO/LAP3_t_bg_full.png"
# fi
# 
# if [[ $(hostname) == "tyler" ]]; then
#     neofetch --size 300px --chafa "$HOME/MISC/Media/tyler/tyler_cs.jpg"
# fi
# 
# if [[ $(hostname) == "sagan" ]]; then
#     neofetch --size 300px --chafa "$HOME/MISC/Media/sagan/Burns-Carl-Sagan-sc.jpg"
# fi

## visited directory stack
## this config may be unnecessary
setopt AUTO_PUSHD                  # pushes the old directory onto the stack
setopt PUSHD_MINUS                 # exchange the meanings of '+' and '-'
setopt CDABLE_VARS                 # expand the expression (allows 'cd -2/tmp')
autoload -U compinit && compinit   # load + start completion
zstyle ':completion:*:directory-stack' list-colors '=(#b) #([0-9]#)*( *)==95=38;5;12'

# ## configure autojump for zsh
# . ~/.nix-profile/share/autojump/autojump.zsh

## configure zoxide
eval "$(~/.nix-profile/bin/zoxide init zsh)"



## ignore host file in autocomplete?
# zstyle -e ':completion:*:hosts' hosts 'reply=(
#   ${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) 2>/dev/null)"}%%[#| ]*}//,/ }
#   ${=${${${${(@M)${(f)"$(cat ~/.ssh/config 2>/dev/null)"}:#Host *}#Host }:#*\**}:#*\?*}}
# )'
zstyle ':completion:*' hosts off


if [ -e /home/athan/.nix-profile/etc/profile.d/nix.sh ]; then . /home/athan/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer


## load pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
   eval "$(pyenv init --path)"
fi
eval "$(pyenv virtualenv-init -)"

## completions for nb
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i

## set settings
"$HOME/CODE/session/session_settings.sh" > /dev/null

# Created by `pipx` on 2024-02-13 18:39:21
export PATH="$PATH:/home/athan/.local/bin"
