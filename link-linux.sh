#!/bin/sh
# Linux and macOS require separate link scripts due to GNU and BSD differences

PATH_ABSOLUTE=$(cd `dirname $0` && pwd)

ln -sf $PATH_ABSOLUTE/bashrc-linux $HOME/.bashrc
ln -sf $PATH_ABSOLUTE/bash_profile $HOME/.bash_profile
ln -sf $PATH_ABSOLUTE/bash_profile $HOME/.profile
ln -sf $PATH_ABSOLUTE/Xresources $HOME/.Xresources
ln -sf $PATH_ABSOLUTE/inputrc $HOME/.inputrc

mkdir -p $HOME/bin
ln -sf $PATH_ABSOLUTE/bin/* -t $HOME/bin

mkdir -p $HOME/.config
ln -sf $PATH_ABSOLUTE/picom $HOME/.config/picom.conf
mkdir -p $HOME/.config/fontconfig
ln -sf $PATH_ABSOLUTE/fontconfig $HOME/.config/fontconfig/fonts.conf
mkdir -p $HOME/.config/i3
ln -sf $PATH_ABSOLUTE/i3 $HOME/.config/i3/config

ln -sf $PATH_ABSOLUTE/vimrc $HOME/.vimrc
