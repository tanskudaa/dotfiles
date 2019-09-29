#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# ???
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Use Vim as editor everywhere
export EDITOR="vim"
export VISUAL=$EDITOR

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
#(cat ~/.cache/wal/sequences &)
# To add support for TTYs this line can be optionally added.
#source ~/.cache/wal/colors-tty.sh

# Set mouse speed (this is currently done in i3 configs)
#xinput set-prop pointer:'Logitech MX Master' 296 -0.8
