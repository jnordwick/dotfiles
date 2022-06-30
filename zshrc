# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

path=(~/bin /usr/local/bin $path)

setopt extendedglob
setopt rcexpandparam
setopt nocheckjobs
setopt numericglobsort
setopt appendhistory
setopt histignorealldups
setopt inc_append_history
setopt histignorespace
setopt ignore_eof

plugins=(
  dircycle
	branch
	colored-man-pages
	copybuffer
	copyfile  
	copypath
	colorize
	dirhistory
	fd
	git
	git-prompt 
	rust
#  zsh-autocomplete  # breaks displaying the copletion interface
	zsh-autosuggestions
	zsh-syntax-highlighting
)

export XDG_CONFIG_HOME="$HOME/.config"
export ARCHFLAGS="-arch x86_64"
export ZSH_THEME="powerlevel10k/powerlevel10k"
export ZSH="$HOME/.oh-my-zsh"

export EDITOR=nvim
export VISUAL=nvim

export LESS='-RFX'
export PAGER=less

COMPLETION_WAITING_DOTS="%F{red}...%f"
WORDCHARS=${WORDCHARS//\/[&.;]}          # Don't consider certain characters part of the word
HIST_STAMPS="yyyy-mm-dd"
HISTFILE=~/.zhistory
HISTSIZE=10000
SAVEHIST=10000

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zstyle :package:function:completercommand:argument:tag: variable value

export CASE_SENSITIVE="false"
setopt MENU_COMPLETE
setopt no_list_ambiguous
autoload -Uz compinit
compinit

zstyle ':completion:*' menu yes select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'   # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"     # Colored completion
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

zstyle ':omz:update' frequency 7

##
## Working zsh help system
##
unalias run-help > /dev/null
#HELPDIR=/usr/share/zsh/5.9/help # only neede if help dir in strange location

autoload -U run-help
autoload run-help-git
autoload run-help-svn
autoload run-help-svk
alias help=run-help

bcp() { echo "copying $1 to $1-bak"; cp -r "$1" "${1}-bak"; }

##
## displaycolors for 256- and ascii-color modes
##
colorwall() {
  for i in {0..255}; do
    print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'};
  done
}

source $ZSH/oh-my-zsh.sh

##
## dirs stuff
##
#alias p=pushd
#alias o=popd
#alias x=pushd

## dircycle keys C-left and C-right
bindkey '^[[1;5D' insert-cycledleft
bindkey '^[[1;5C' insert-cycledright

# somne in zsh these are getting overwriten so have to come after
alias vi=nvim
alias ll='exa -l --git --color=always'
alias la='exa -a -l --icons --git --color=always'
alias kk='kde-open'

