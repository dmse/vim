# vim

my vim set up.

---
**installation:**

    git clone https://github.com/dmse/vim.git ~/.vim

---
### the vundle way

1. git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
2. Launch `vim` and run `:PluginInstall`
3. To install from command line: `vim +PluginInstall +qall`
4. Create a symlink of .vimrc to vimrc in .vim

**symlinks:**

create:

    ln -s ~/.vim/vimrc ~/.vimrc

remove:

    unlink ~/.vimrc

---
### the pathogen way (removed)

**fetch submodules:**

    cd ~/.vim/bundle
    git submodule init
    git submodule update

or roll into one when installing on a different machine:

    git submodule update --init

upgrading all bundle plugins:

    git submodule foreach git pull origin master
