#!/bin/sh
VERSION="\n bootstrap v0.1.0\n"
USAGE="
Usage: bootstrap.sh [ -a | -debnvgto | -vh ] \n
\t -a | install all components
\t -d | apt-get install dependencies
\t -e | set up general environment
\t -b | set up bash
\t -n | set up neovim
\t -v | set up vim
\t -g | set up git
\t -t | set up tmux
\t -o | set up golang
\t -v | for version
\t -h | for help\n"

while getopts ":adebnvgtovh" opt; do
    case $opt in
       a)   ALL=true;;
       d)   DEPENDENCY=true;;
       e)   ENVIRO=true;;
       b)   BASH=true;;
       n)   NEOVIM=true;;
       v)   VIM=true;;
       g)   GIT=true;;
       t)   TMUX=true;;
       O)   GOLANG=true;;
       v)   echo "$VERSION"; exit 1;;
       h)   echo "$USAGE"; exit 1;;
    esac
done

if [ $DEPENDENCY ] || [ $ALL ]; then
    sudo apt-get install git python-dev python-pip python3-dev python3-pip htop
fi

if [ $ENVIRO ] || [ $ALL ]; then
    rm ~/.config/user-dirs.dirs
    rm ~/.config/user-dirs.locale
    ln -s ~/code/dot-files/config/user-dirs.dirs ~/.config/user-dirs.dirs
    ln -s ~/code/dot-files/config/user-dirs.locale ~/.config/user-dirs.locale
    cd ~/
    mkdir bin
    mkdir code
    mkdir desktop
    mkdir documents
    mkdir downloads
    ln -s ~/code/dot-files/fonts ~/.fonts
    fc-cache -vf ~/.fonts/
fi

if [ $BASH ] || [ $ALL ]; then
    rm ~/.bashrc
    ln -s ~/code/dot-files/bashrc ~/.bashrc
    pip install powerline-status
fi

if [ $NEOVIM ] || [ $ALL ]; then
    sudo apt-get install software-properties-common
    sudo add-apt-repository ppa:neovim-ppa/unstable
    sudo apt-get update
    sudo apt-get install neovim
    sudo pip3 install neovim
    sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
    #sudo update-alternatives --config vi
    sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
    #sudo update-alternatives --config vim
    sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
    #sudo update-alternatives --config editor
    mkdir ~/.config/nvim
    rm ~/.config/nvim/init.vim
    ln -s ~/code/dot-files/nvim/init.vim ~/.config/nvim/
fi

if [ $VIM ] || [ $ALL ]; then
    sudo apt-get install vim-nox
    rm ~/.vimrc
    ln -s ~/code/dot-files/vim/vimrc ~/.vimrc
    ln -s ~/code/dot-files/vim/vimrc.bundles ~/.vimrc.bundles
fi

if [ $TMUX ] || [ $ALL ]; then
    sudo apt-get install tmux
    ln -s ~/code/dot-files/tmux.conf ~/.tmux.conf
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    # install plugins on first launch of tmux --> <C-a> I
    echo "alias tmux='tmux -2'" >> ~/.bash_aliases
fi

if [ $GIT ] || [ $ALL ]; then
    sudo apt-get install git
    rm ~/.gitconfig
    rm ~/.gitignore
    ln -s ~/code/dot-files/gitconfig ~/.gitconfig
    ln -s ~/code/dot-files/gitignore ~/.gitignore
fi

if [ $GOLANG ] || [ $ALL ]; then
    # grab latest stable release
    wget https://storage.googleapis.com/golang/go1.5.2.linux-amd64.tar.gz /tmp/
    cd /tmp/
    tar xvzf go1.5.2.linux-amd64.tar.gz
    sudo mv go /usr/local/
    mkdir -p ~/code/go

    # add entries for go paths
    {
        echo "export GOPATH=$HOME/code/go/"
        echo "export PATH=$PATH:$GOPATH/bin"
        echo "export PATH=$PATH:/usr/local/go/bin"
    } >> ~/.profile

    # export to load into path without requiring reload of .profile
    export GOPATH=$HOME/code/go/
    export PATH=$PATH:$GOPATH/bin
    export PATH=$PATH:/usr/local/go/bin

    # grab common binaries
    go get -u github.com/golang/lint/golint
fi
