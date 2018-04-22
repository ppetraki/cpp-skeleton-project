#!/bin/bash

install="cmake cmake-data build-essential gdb ctags cscope cppman ninja-build python2.7-dev"

ubuntu_rel=$(lsb_release -r | xargs | tr -d 'Release: ')

# for clang-format to work
if [ "${ubuntu_rel}" == "18.04" ]; then
    install+=" vim clang-format-6.0"
else
    install+=" vim-nox-py2 clang-format-3.8 "
fi

echo "installing packages - ${install}"
sudo apt-get update -qq
sudo apt-get install -qqy ${install}

#XXX update-alternatives for respective vim installation

echo "setup ~/.vimrc"
cp -f ~/.vimrc ~/.vimrc-orig_$(date +"%m.%d.%Y_%H.%M.%S")
cp -f resources/editor/vimrc ~/.vimrc

if [ "${ubuntu_rel}" == "18.04" ]; then
    sed -i 's/pyf/py3f/g' ~/.vimrc
    sed -i 's/clang-format-3.8/clang-format-6.0/g' ~/.vimrc
fi

echo "setup vundle"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "install vundle plugins"
vim +PluginInstall +qall

echo "setup theme"
mkdir -p ~/.vim/colors
cp -f  ~/.vim/bundle/vim-colorschemes/colors/256-jungle.vim ~/.vim/colors/256-jungle.vim
# uncomment theme setting
sed -i 's/^\"SNIP//g' ~/.vimrc

echo "compile YCM"
cd ~/.vim/bundle/YouCompleteMe && python install.py --clang-completer

echo "done!"
