# vim

my vim set up.

---
**installation:**

    git clone https://github.com/dmse/vim.git ~/.vim

---
### the plug way
run this command:

For Vim8:

**Unix**

    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

**Windows**

Place `plug.vim` in `C:\Users\<user>\vimfiles\autoload\` and install **gitforwindows** for **Plug** to function properly.

For NeoVim:

**Unix**

    curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

or this if we want to follow the official guide:
    
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

create `./config/nvim/init.vim` and put the following inside if it is neovim:

    set runtimepath^=~/.vim runtimepath+=~/.vim/after
    let &packpath = &runtimepath
    source ~/.vimrc


---
### the vundle way (removed)

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
