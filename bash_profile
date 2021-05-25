# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
PATH=$PATH:$HOME/bin
export PATH

PATH=$PATH:$HOME/.local
export PATH

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
#fi
