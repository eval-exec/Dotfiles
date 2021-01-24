# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
#
#
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export DISABLE_MAGIC_FUNCTIONS=true
export FONTCONFIG_PATH=/etc/fonts
export ZSH="/home/vory/.oh-my-zsh"
source ~/.oh-my-zsh/custom/plugins/gh.zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="random"
ZSH_THEME="powerlevel10k/powerlevel10k"
#ZSH_THEME="bullet-train"
#ZSH_THEME="agnosterzak"
#ZSH_THEME="lambda"
#ZSH_THEME="powerlevel9k/powerlevel9k"
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

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
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	cp
	git
	#github
	gitfast
	battery
       	zsh-autosuggestions
	zsh-syntax-highlighting
	colored-man-pages
    #vi-mode
	colorize
	docker
	zsh-256color
	docker-compose
	history-substring-search
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export GOBIN=/home/vory/go/bin
export GOPATH=/home/vory/go

export PATH=$PATH:~/go/bin
export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/.emacs.d/bin

# Enable the go modules feature
export GO111MODULE=auto
 export GIT_TERMINAL_PROMPT=1
 #source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme
 
 



alias proxyon="export HTTPS_PROXY=http://127.0.0.1:1081;export HTTP_PROXY=http://127.0.0.1:1081;"
alias proxyoff="export HTTPS_PROXY=;export HTTP_PROXY=;"

export GOPROXY=""
go env -w GOPROXY=https://goproxy.cn,direct
go env -w GOSUMDB=off

COWPATH="$COWPATH:$HOME/.cowsay"

alias yd="ydcv"
#source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme
#
#source zsh-syntax-highlighting.zsh
#source zsh-history-substring-search.zsh
#source zsh-history-substring-search.zsh

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh


# fzf finder color
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color=dark
--color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f
--color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7

 --layout=reverse  --preview "bat --style=numbers --color=always --line-range :500 {}"
'

#figlet -t -funivers "hello slarsar"|lolcat
# figlet -t  "hello hukary ! Let's Hack "|  lolcat 

# ### Added by Zinit's installer
# if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
#     print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma/zinit)…%f"
#     command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
#     command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
#         print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
#         print -P "%F{160}▓▒░ The clone has failed.%f%b"
# fi
# 
# source "$HOME/.zinit/bin/zinit.zsh"
# autoload -Uz _zinit
# (( ${+_comps} )) && _comps[zinit]=_zinit
# 
# # Load a few important annexes, without Turbo
# # (this is currently required for annexes)
# zinit light-mode for \
#     zinit-zsh/z-a-patch-dl \
#     zinit-zsh/z-a-as-monitor \
#     zinit-zsh/z-a-bin-gem-node
# 
# ### End of Zinit's installer chunk

alias ls='lsd'
# source /home/vory/.config/broot/launcher/bash/br


# cheat sheets (github.com/chubin/cheat.sh), find out how to use commands
# example 'cheat tar'
# for language specific question supply 2 args first for language, second as the question
# eample: cheat python3 execute external program
cheat() {
    if [ "$2" ]; then
         proxychains -q curl "http://cheat.sh/$1/$2+$3+$4+$5+$6+$7+$8+$9+$10"
    else
         proxychains -q curl "http://cheat.sh/$1"
    fi
}

# Matrix screen saver! will run if you have installed "cmatrix"
# TMOUT=900
# TRAPALRM() { if command -v cmatrix &> /dev/null; then cmatrix -sb; fi }

speedtest() {
    curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -
}

dadjoke() {
     curl https://icanhazdadjoke.com
}

dict() {
    if [ "$3" ]; then
         curl "dict://dict.org/d:$1 $2 $3"
    elif [ "$2" ]; then
         curl "dict://dict.org/d:$1 $2"
    else
         curl "dict://dict.org/d:$1"
    fi
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export RUST_BACKTRACE=full
alias emacs='emacs -nw'
alias vi='emacsclient -c -t  '
alias manz='LANG=zh_CN.UTF-8 man '

#toilet -t -f 3d  "NORTHWESTERN" | lolcat

source /home/vory/.config/broot/launcher/bash/br

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.


# Google Mock Doctor tools
# alias gmd='<path to googlemock>/scripts/gmock_doctor.py'

alias cat='/usr/bin/bat -p --paging=never'
alias bat='/usr/bin/cat'

# source ~/github/enhancd/enhancd.plugin.zsh
# export UPDATE_ZSH_DAYS=1
function help(){
        bash -c "help $@"
}


export KEYTIMEOUT=1


