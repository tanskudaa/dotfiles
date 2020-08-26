#!/bin/sh

# Get absolute path
DIR=$(cd `dirname $0` && pwd)

# Link dotfiles
ln -sf $DIR/bashrc $HOME/.bashrc
ln -sf $DIR/bash_profile $HOME/.bash_profile
ln -sf $DIR/Xresources $HOME/.Xresources
ln -sf $DIR/inputrc $HOME/.inputrc

ln -sf $DIR/bin -T $HOME/bin

ln -sf $DIR/i3 $HOME/.config/i3/config
ln -sf $DIR/picom $HOME/.config/picom.conf

ln -sf $DIR/vim -T $HOME/.vim
ln -sf $DIR/vimrc $HOME/.vimrc
ln -sf $DIR/vscode/snippets -T $HOME/.config/'Code - OSS'/User/snippets
ln -sf $DIR/vscode/settings.json $HOME/.config/'Code - OSS'/User/settings.json
