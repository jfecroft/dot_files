# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ -f /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -f /usr/local/homebrew/bin/brew ]; then
  eval "$(/usr/local/homebrew/bin/brew shellenv)"
  echo "here"
fi
## User specific environment and startup programs
#PATH=$PATH:$HOME/bin
#export PATH

#PATH=$PATH:$HOME/.local
#export PATH

# Setting the path for updated vim 7.4
## The original is in /usr/bin/vim
#PATH="/opt/local/bin:${PATH}"
#export PATH
#PATH="${PATH}:~/bin"
#export PATH
#PATH="/Library/TeX/Root/bin/x86_64-darwin:${PATH}"
#export PATH

#  homebrew bash-completion
#  https://docs.brew.sh/Shell-Completion
if type brew &>/dev/null; then
  HOMEBREW_PREFIX="$(brew --prefix)"
  if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  else
    for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*; do
      [[ -r "$COMPLETION" ]] && source "$COMPLETION"
    done
  fi
fi

## aws completion
#complete -C '/usr/local/bin/aws_completer ' aws
#export PATH=/usr/local/aws/bin:$PATH

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
export PATH="/usr/local/bin:$PATH"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
##export PATH="${HOME}/Library/Python/2.7/bin:$PATH"
#if command -v pyenv 1>/dev/null 2>&1; then
#  eval "$(pyenv init -)"
#

# User specific aliases and functions
stty -ixon #allows ctrl-s to forward search  rather than crtl-s to send pause

# merge multiple pdfs into one
alias merge='gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=merged.pdf '
#list all duplicate files
alias find_dups='ind -not -empty -type f -printf "%s\n" | sort -rn | uniq -d | xargs -I{} -n1 find -type f -size {}c -print0 | xargs -0 md5sum | sort | uniq -w32 --all-repeated=separate'

cpom(){
# as cp but one to many rather than many to one
src=$1
shift
for target in $@; do cp -v $src "$target"; done
}
# powerline
# source /usr/local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
#if [ -e /Library/Python/2.7/site-packages/powerline/bindings/bash/powerline.sh ]; then
#    source /Library/Python/2.7/site-packages/powerline/bindings/bash/powerline.sh
#fi
#if [ -f ~/.bash-git-prompt/gitprompt.sh ]; then
#   # doesnt work right now on ccreek
#   #GIT_PROMPT_ONLY_IN_REPO=1
#   GIT_PROMPT_FETCH_REMOTE_STATUS=0
#   GIT_PROMPT_THEME=Single_line_Solarized
#   GIT_PROMPT_STATUS_COMMAND=gitstatus_pre-1.7.10.sh
#   source ~/.bash-git-prompt/gitprompt.sh
#elif [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
#   GIT_PROMPT_FETCH_REMOTE_STATUS=0
#   GIT_PROMPT_THEME=Single_line_Solarized
#   __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
#   source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
#fi

PYTHONPATH=~/.local
export PYTHONPATH

alias vi=vim
alias todo=todo.sh


##eval "$(pyenv init -)"

#-------------------
# Bash History
#-------------------

export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it
# Save and reload the history after each command finishes
#export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

#============================================================
#
#  ALIASES AND FUNCTIONS
#
#  Arguably, some functions defined here are quite big.
#  If you want to make this file smaller, these functions can
#+ be converted into scripts and removed from here.
#
#============================================================

#-------------------
# Personnal Aliases
#-------------------

#alias cd="pushd"
#alias bd="popd"
alias cd..="cd .."
alias cd...="cd ../.."
alias cd....="cd ../.."
alias cd.....="cd ../../.."
alias cd......="cd ../../../.."

if [[ "$OSTYPE" == "linux-gnu" ]]; then
# -> Prevents accidentally clobbering files.
    alias rm='rm -I'
else
    alias rm='rm -i'
fi
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'

alias h='history'
alias j='jobs -l'
alias which='type -a'
alias ..='cd ..'

# Pretty-print of some PATH variables:
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'


alias du='du -kh'    # Makes a more readable output.
alias df='df -kTh'

#-------------------------------------------------------------
# The 'ls' family (this assumes you use a recent GNU ls).
#-------------------------------------------------------------
# Add colors for filetype and  human-readable sizes by default on 'ls':
alias ls='ls -hF'
alias lx='ls -lXB'         #  Sort by extension.
alias lk='ls -lSr'         #  Sort by size, biggest last.
alias lt='ls -ltr'         #  Sort by date, most recent last.
alias lc='ls -ltcr'        #  Sort by/show change time,most recent last.
alias lu='ls -ltur'        #  Sort by/show access time,most recent last.

# The ubiquitous 'll': directories first, with alphanumeric sorting:
alias ll="ls -lG"
alias lm='ll |more'        #  Pipe through 'more'
alias lr='ll -R'           #  Recursive ls.
alias la='ll -A'           #  Show hidden files.
alias tree='tree -Csuh'    #  Nice alternative to 'recursive ls' ...

#-------------------------------------------------------------
# File & strings related functions:
#-------------------------------------------------------------


# Find a file with a pattern in name:
function ff() { find . -type f -iname '*'"$*"'*' -ls ; }

# Find a file with pattern $1 in name and Execute $2 on it:
function fe() { find . -type f -iname '*'"${1:-}"'*' \
-exec ${2:-file} {} \;  ; }

# Find a files which match pattern $1 and append $2 
function fa() {
suffix=$1
shift
for f in $@; do mv -v -- "$f" "$f.$suffix"; done
}

#  Find a pattern in a set of files and highlight them:
#+ (needs a recent version of egrep).
function fstr()
{
    OPTIND=1
    local mycase=""
    local usage="fstr: find string in files.
Usage: fstr [-i] \"pattern\" [\"filename pattern\"] "
    while getopts :it opt
    do
        case "$opt" in
           i) mycase="-i " ;;
           *) echo "$usage"; return ;;
        esac
    done
    shift $(( $OPTIND - 1 ))
    if [ "$#" -lt 1 ]; then
        echo "$usage"
        return;
    fi
    find . -type f -name "${2:-*}" -print0 | \
xargs -0 egrep --color=always -sn ${case} "$1" 2>&- | more

}


function swap()
{ # Swap 2 filenames around, if they exist (from Uzi's bashrc).
    local TMPFILE=tmp.$$

    [ $# -ne 2 ] && echo "swap: 2 arguments needed" && return 1
    [ ! -e $1 ] && echo "swap: $1 does not exist" && return 1
    [ ! -e $2 ] && echo "swap: $2 does not exist" && return 1

    mv "$1" $TMPFILE
    mv "$2" "$1"
    mv $TMPFILE "$2"
}

function extract()      # Handy Extract Program
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1     ;;
            *.tar.gz)    tar xvzf $1     ;;
            *.bz2)       bunzip2 $1      ;;
            *.rar)       unrar x $1      ;;
            *.gz)        gunzip $1       ;;
            *.tar)       tar xvf $1      ;;
            *.tbz2)      tar xvjf $1     ;;
            *.tgz)       tar xvzf $1     ;;
            *.zip)       unzip $1        ;;
            *.Z)         uncompress $1   ;;
            *.7z)        7z x $1         ;;
            *)           echo "'$1' cannot be extracted via >extract<" ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}

# Creates an archive (*.tar.gz) from given directory.
function maketar() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }

# Create a ZIP archive of a file or folder.
function makezip() { zip -r "${1%%/}.zip" "$1" ; }

# Make your directories and files access rights sane.
function sanitize() { chmod -R u=rwX,g=rX,o= "$@" ;}

# bash autocompletion
#source ~/.git-completion.bash
# brew autocompletion
#type brew &> /dev/null
#if [ $? == 0 ] && [ -f $(brew --prefix)/etc/bash_completion ]; then
#    . $(brew --prefix)/etc/bash_completion
#fi
#. /usr/local/etc/profile.d/z.sh

# if `homebrew` is installed use rupas z - https://github.com/rupa/z
if command -v brew >/dev/null 2>&1; then
	# Load rupa's z if installed
	[ -f $(brew --prefix)/etc/profile.d/z.sh ] && source $(brew --prefix)/etc/profile.d/z.sh
fi

unalias z 2> /dev/null
z() {
  [ $# -gt 0 ] && _z "$*" && return
  cd "$(_z -l 2>&1 | fzf --height 40% --nth 2.. --reverse --inline-info +s --tac --query "${*##-* }" | sed 's/^[0-9,.]* *//')"
}
export FZF_DEFAULT_OPTS="--layout=reverse"

# use starship prompt-https://starship.rs
eval "$(starship init bash)"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
