# dot-files

    mkdir code
    cd code/
    git clone https://github.com:unusedPhD/dot-files.git
    cd dot-files
    git submodule update --init --recursive

setup various components with bootstrap.sh

    $ bootstrap.sh -h

    Usage: bootstrap.sh [ -a | -debnvgto | -vh ]

         -a | install all components
         -d | apt-get install dependencies
         -e | set up general environment
         -b | set up bash
         -f | set up fish
         -t | set up tmux
         -n | set up neovim
         -v | set up vim
         -g | set up git
         -v | for version
         -h | for help
