#!/bin/sh
# Linux and macOS require separate link scripts due to GNU and BSD differences

# TODO
echo "refusing execution - would remove ~/bin"
echo "fix to be in line with link-linux.sh"
exit 1

PATH_ABSOLUTE=$(cd `dirname $0` && pwd)

# Remove existing to reduce headache
rm $HOME/.bashrc
rm $HOME/.bash_profile
rm $HOME/.profile
rm $HOME/.inputrc

# TODO No
rm -R $HOME/bin

rm $HOME/.vimrc

rm -R $HOME/Library/'Application Support'/Code/User/snippets
rm $HOME/Library/'Application Support'/Code/User/settings.json

ln -Fsf $PATH_ABSOLUTE/bashrc-mac $HOME/.bashrc
ln -Fsf $PATH_ABSOLUTE/bash_profile $HOME/.bash_profile
ln -Fsf $PATH_ABSOLUTE/bash_profile $HOME/.profile
ln -Fsf $PATH_ABSOLUTE/inputrc $HOME/.inputrc

# TODO Links bin or bin/* ?
ln -Fsf $PATH_ABSOLUTE/bin $HOME

ln -Fsf $PATH_ABSOLUTE/vimrc $HOME/.vimrc
