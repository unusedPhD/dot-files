#!/bin/sh
VERSION="\n bootstrap v0.2.0\n"
USAGE="
Usage: bootstrap.sh [ -a | -debnvgto | -vh ] \n
\t -a | install all components
\t -d | apt-get install dependencies
\t -e | set up general environment
\t -b | set up bash
\t -f | set up fish
\t -t | set up tmux
\t -n | set up neovim
\t -v | set up vim
\t -g | set up git
\t -v | for version
\t -h | for help\n"

while getopts ":adebftnvgvh" opt; do
    case $opt in
       a)   ALL=true;;
       d)   DEPENDENCY=true;;
       e)   ENVIRO=true;;
       b)   BASH=true;;
       f)   FISH=true;;
       t)   TMUX=true;;
       n)   NEOVIM=true;;
       v)   VIM=true;;
       g)   GIT=true;;
       v)   echo "$VERSION"; exit 1;;
       h)   echo "$USAGE"; exit 1;;
    esac
done

if [ $DEPENDENCY ] || [ $ALL ]; then

    sudo apt-get install \
        git \
        automake \
        cmake \
        bison \
        flex \
        libgeoip-dev \
        libssl-dev \
        g++ \
        swig2.0 \
        build-essential \
        python-dev \
        python-pip \
        python3-dev \
        python3-pip \
        exuberant-ctags \
        bison \
        shellcheck \
        tidy \
        httpie \
        htop

    # FZF
    mkdir -p "$HOME"/bin/src/
    cd "$HOME"/bin/src
    git clone --depth 1 https://github.com/junegunn/fzf.git
    cd fzf
    ./install

    # BRO
    cd "$HOME"/bin/src/
    wget https://www.bro.org/downloads/release/bro-2.4.1.tar.gz
    tar xvzf bro-2.4.1.tar.gz
    cd bro-2.4.1
    .configure --prefix="$HOME"/bin/bro
    make
    make install
    sudo setcap cap_net_raw,cap_net_admin=eip "$HOME"/bin/bro/bin/bro
    sudo setcap cap_net_raw,cap_net_admin=eip /usr/sbin/tcpdump

    # GO
    wget https://storage.googleapis.com/golang/go1.5.2.linux-amd64.tar.gz /tmp/
    cd /tmp/
    tar xvzf go1.5.2.linux-amd64.tar.gz
    sudo mv go /usr/local/
    mkdir -p ~/code/go

    # NODEJS
    cd "$HOME"/bin/src
    wget https://nodejs.org/dist/v4.2.4/node-v4.2.4-linux-x64.tar.gz
    tar xvzf node-v4.2.4-linux-x64.tar.gz
    mv node-v4.2.4-linux-x64 "$HOME"/bin/node

    # add custom dir to $PATH
    {
        echo "export GOPATH=\$HOME/code/go/"
        echo "export PATH=\$PATH:/usr/local/go/bin"
        echo "export PATH=\$PATH:\$GOPATH/bin"
        echo "export PATH=\$PATH:\$HOME/bin/bro/bin/"
        echo "export PATH=\$PATH:\$HOME/bin/node/bin/"
    } >> ~/.profile

    # export to load into path without requiring reload of .profile
    export GOPATH="$HOME"/code/go/
    export PATH=$PATH:"$GOPATH"/bin
    export PATH=$PATH:/usr/local/go/bin
    export PATH=$PATH:"HOME"/bin/node/bin/

    # linters
    go get -u github.com/golang/lint/golint
    npm install -g eslint
    sudo pip3 install vim-vint
fi

if [ $ENVIRO ] || [ $ALL ]; then
    # set all default folders to lowercase
    rm ~/.config/user-dirs.dirs
    rm ~/.config/user-dirs.locale
    ln -s ~/code/dot-files/env/user-dirs.dirs ~/.config/user-dirs.dirs
    ln -s ~/code/dot-files/env/user-dirs.locale ~/.config/user-dirs.locale
    cd ~/
    mkdir bin
    mkdir code
    rm -r Desktop
    mkdir desktop
    rm -r Documents
    mkdir documents
    rm -r Downloads
    mkdir downloads

    # add powerline patched fonts
    ln -s ~/code/dot-files/fonts ~/.fonts
    fc-cache -vf ~/.fonts/

    # set caps lock to escape
    echo "/usr/bin/setxkbmap -option 'caps:swapescape'" >> ~/.profile
fi

if [ $BASH ] || [ $ALL ]; then
    rm ~/.bashrc
    ln -s ~/code/dot-files/bashrc ~/.bashrc
    pip install powerline-status
fi

if [ $FISH ] || [ $ALL ]; then
    sudo apt-add-repository ppa:fish-shell/release-2
    sudo apt-get update
    sudo apt-get install fish
    ln -s ~/code/dot-files/fish/config.fish ~/.config/fish/
    ln -s ~/code/dot-files/fish/alias.fish ~/.config/fish/
    curl -L https://github.com/oh-my-fish/oh-my-fish/raw/master/bin/install | fish
    omf install bobthefish
    omf theme bobthefish
    omf install extract
    omf install weather
    omf install fzf
    wget https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64
    chmod +x jq-linux64
    sudo mv jq-linux64 /usr/local/bin/
    ln -s ~/code/dot-files/fish/init.fish ~/.config/omf/
    # change default shell to fish
    chsh -s /usr/bin/fish
fi

if [ $TMUX ] || [ $ALL ]; then
    sudo apt-get install tmux
    ln -s ~/code/dot-files/tmux.conf ~/.tmux.conf
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    # install plugins on first launch of tmux --> <C-a> I
    echo "alias tmux='tmux -2'" >> ~/.bash_aliases
    # add to local alias if using fish shell
    if [ -e ~/.config/fish/alias.fish ]; then
        echo "alias tmux 'tmux -2'" >> ~/.config/fish/alias_local.fish
    fi
fi

if [ $NEOVIM ] || [ $ALL ]; then
    sudo apt-get install software-properties-common
    sudo add-apt-repository ppa:neovim-ppa/unstable
    sudo apt-get update
    sudo apt-get install neovim
    sudo pip3 install neovim
    sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
    sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
    sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
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

if [ $GIT ] || [ $ALL ]; then
    sudo apt-get install git
    rm ~/.gitconfig
    rm ~/.gitignore
    ln -s ~/code/dot-files/gitconfig ~/.gitconfig
    ln -s ~/code/dot-files/gitignore ~/.gitignore
fi

# NOTES
# Terminal profile
#  font: DejaVu Sans Mono for Powerline Book
#  colours:
#    palette: Tango
