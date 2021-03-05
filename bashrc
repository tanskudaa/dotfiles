#
# ~/.bashrc
#

# If not running interactively, don't do anything
# [[ $- != *i* ]] && return

# Use Vim as editor everywhere
export EDITOR="vim"
export VISUAL=$EDITOR

# npm
export NPM_PACKAGES="$HOME/.npm-packages"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"

# Add ~/bin to PATH
export PATH="$PATH:$HOME/bin:$NPM_PACKAGES/bin"

# Aliases
alias ls='ls --color=auto'
alias feh='feh --scale-down --auto-zoom'

alias pac='sudo pacman'
alias pacs='sudo pacman -S'
alias pacsuy='sudo pacman -Suy'
alias pacss='pacman -Ss'

alias gcc-ansi='gcc -ansi -pedantic-errors -Wall'

# Prompt
# What in the ---- is happening here:
# \e to start color, m to end
# eg. \e[1;31m for bold (1) red (31) text
# \e[m to return to foreground color
# Escape sequences (eg. color information) has to be encolsed in \[ \] too to avoid
# the CLI from spassing out on long lines
PS1='[\[\e[1;31m\]\u\[\e[m\]@\[\e[1;36m\]\h\[\e[m\] \W]\$ '

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
# (cat ~/.cache/wal/sequences &)
# To add support for TTYs this line can be optionally added.
# source ~/.cache/wal/colors-tty.sh

# Set mouse speed (this is currently done in i3 configs)
# xinput set-prop pointer:'Logitech MX Master' 296 -0.8

