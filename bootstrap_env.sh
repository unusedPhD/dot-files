sudo apt-get install git tmux vim-nox

rm ~/.bashrc
ln -s ~/code/dot-files/bashrc ~/.bashrc
rm ~/.vimrc
ln -s ~/code/dot-files/vim/vimrc ~/.vimrc
ln -s ~/code/dot-files/vim/vimrc.bundles ~/.vimrc.bundles
ln -s ~/code/dot-files/gitconfig ~/.gitconfig
ln -s ~/code/dot-files/gitignore ~/.gitignore
ln -s ~/code/dot-files/tmux.conf ~/.tmux.conf
rm ~/.config/user-dirs.dirs
rm ~/.config/user-dirs.locale
ln -s ~/code/dot-files/config/user-dirs.dirs ~/.config/user-dirs.dirs
ln -s ~/code/dot-files/config/user-dirs.locale ~/.config/user-dirs.locale

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm



