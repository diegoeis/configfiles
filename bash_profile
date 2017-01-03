export PGHOST=localhost
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export GREP_OPTIONS="--color=auto"
export GREP_COLOR="4;33"
export CLICOLOR="auto"

alias ls="ls -G"
alias mvim="/Applications/MacVim.app/contents/MacOS/MacVim"

# System-wide .bashrc file for interactive bash(1) shells.
if [ -z "$PS1" ]; then
  return
fi

function parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
NO_COLOUR="\[\033[0m\]"

PS1="$GREEN\u$RED:\W$YELLOW\$(parse_git_branch)$NO_COLOUR $ "

#PS1="\\[$(tput setaf 2)\\]~ [\\u] \w \$(parse_git_branch) 14$ \\[$(tput sgr0)\\]"
#PS1='\h:\W \u\$ '

# Tell the terminal about the working directory at each prompt.
if [ "$TERM_PROGRAM" == "Apple_Terminal" ] && [ -z "$INSIDE_EMACS" ]; then
  update_terminal_cwd() {
    # Identify the directory using a "file:" scheme URL,
    # including the host name to disambiguate local vs.
    # remote connections. Percent-escape spaces.
    local SEARCH=' '
    local REPLACE='%20'
    local PWD_URL="file://$HOSTNAME${PWD//$SEARCH/$REPLACE}"
    printf '\e]7;%s\a' "$PWD_URL"
  }
  PROMPT_COMMAND="update_terminal_cwd; $PROMPT_COMMAND"
fi
export PATH="/usr/local/sbin:$PATH"
export PATH="$(brew --prefix homebrew/php/php55)/bin:$PATH"
export PATH=/usr/local/mysql/bin:$PATH
