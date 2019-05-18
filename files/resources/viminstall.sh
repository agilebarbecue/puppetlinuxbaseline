#!/bin/bash
DEVUSERNAME=$1
mkdir -p /home/${DEVUSERNAME}/.vim/bundle
mkdir -p /home/${DEVUSERNAME}/.vim/after/ftplugin
cd /home/${DEVUSERNAME}/.vim/bundle
git clone https://github.com/ctrlpvim/ctrlp.vim.git
git clone https://github.com/Valloric/YouCompleteMe.git
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/sheerun/vim-polyglot.git
git clone https://github.com/vim-airline/vim-airline.git
git clone https://github.com/vim-airline/vim-airline-themes.git
git clone https://github.com/tpope/vim-sensible.git
git clone https://github.com/tpope/vim-eunuch.git
git clone https://github.com/tpope/vim-jdaddy.git
git clone https://github.com/Chiel92/vim-autoformat.git
git clone https://github.com/tell-k/vim-autopep8.git
git clone https://github.com/majutsushi/tagbar.git
git clone https://github.com/vim-syntastic/syntastic.git
git clone https://github.com/ryanoasis/vim-devicons.git
cd YouCompleteMe
git submodule update --init --recursive
python3 -m venv venv
. venv/bin/activate
./install.py
chown -R ${DEVUSERNAME} /home/${DEVUSERNAME}/.vim
