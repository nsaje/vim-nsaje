#!/bin/bash

command -v vim >/dev/null 2>&1 || { 
    echo >&2 "Vim not installed.  Aborting.";
    exit 1;
}

if [[ -e ~/.vimrc ]]; then
    echo "Backing up old .vimrc"
    cp ~/.vimrc ~/.vimrc.bak
fi

echo "Installing new .vimrc"
cp vimrc ~/.vimrc

echo "Cloning Vundle"
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

echo "Configuring Powerline fonts"
wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
mkdir ~/.fonts/
mv PowerlineSymbols.otf ~/.fonts/
fc-cache -vf ~/.fonts
mkdir -p ~/.config/fontconfig/conf.d/
mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/

echo "Adding 256 color terminal setting to bashrc"
echo "export TERM=xterm-256color" >> ~/.bashrc

echo "Installing Vundle bundles"
vim +BundleInstall +qall

echo "Installation complete".
