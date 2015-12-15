# env
rm ~/.config/user-dirs.dirs
rm ~/.config/user-dirs.locale
ln -s ~/code/dot-files/config/user-dirs.dirs ~/.config/user-dirs.dirs
ln -s ~/code/dot-files/config/user-dirs.locale ~/.config/user-dirs.locale

# bash
rm ~/.bashrc
ln -s ~/code/dot-files/bashrc ~/.bashrc

# neovim
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim python-dev python-pip python3-dev python3-pip
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --config editor
mkdir ~/.config/nvim
rm ~/.config/nvim/init.vim
ln -s ~/code/dot-files/nvim/init.vim ~/.config/nvim/

# vim
sudo apt-get install vim-nox
rm ~/.vimrc
ln -s ~/code/dot-files/vim/vimrc ~/.vimrc
ln -s ~/code/dot-files/vim/vimrc.bundles ~/.vimrc.bundles

# git
sudo apt-get install git
ln -s ~/code/dot-files/gitconfig ~/.gitconfig
ln -s ~/code/dot-files/gitignore ~/.gitignore

# tmux
sudo apt-get install tmux
ln -s ~/code/dot-files/tmux.conf ~/.tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# install plugins on first launch of tmux --> <C-a> I

#git clone https://git::@github.com/tmux-plugins/tmux-sensible.git ~/.tmux/plugins/tmux-sensible
#git clone https://git::@github.com/jimeh/tmux-themepack.git ~/.tmux/plugins/tmux-themepack
