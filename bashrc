#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Use Vim as editor everywhere
export EDITOR="vim"
export VISUAL=$EDITOR

# Add ~/bin to PATH
export PATH=$PATH:/home/tansku/bin

# Aliases
alias ls='ls --color=auto'
alias feh='feh --scale-down --auto-zoom'

# Prompt
# What the fuck is happening here:
# \e to start color, m to end
# eg. \e[1;31m for bold (1) red (31) text
# \e[m to return to foreground color
PS1='[\e[1;31m\u\e[m@\e[1;36m\h \e[m\W]\$ '

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
(cat ~/.cache/wal/sequences &)
# To add support for TTYs this line can be optionally added.
source ~/.cache/wal/colors-tty.sh

# Set mouse speed (this is currently done in i3 configs)
#xinput set-prop pointer:'Logitech MX Master' 296 -0.8
