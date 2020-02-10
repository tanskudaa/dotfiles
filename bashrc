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
export CLASSPATH=/home/tansku/compiled/freecol/jars

# Aliases
alias ls='ls --color=auto'
alias feh='feh --scale-down --auto-zoom'

# ???
PS1='[\u@\h \W]\$ '

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
#(cat ~/.cache/wal/sequences &)
# To add support for TTYs this line can be optionally added.
#source ~/.cache/wal/colors-tty.sh

# Set mouse speed (this is currently done in i3 configs)
#xinput set-prop pointer:'Logitech MX Master' 296 -0.8
