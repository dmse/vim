vim
===

my vim set up

---
**installation:**

* git clone https://github.com/dmse/vim.git


---
**create symlinks:**

* ln -s ~/.vim/vimrc ~/.vimrc


---
**remove symlinks:**

* unlink ~/.vimrc


---
**fetch submodules:**

* cd ~/.vim/bundle

* git submodule init

* git submodule update

or roll into one when installing on a different machine

* git submodule update --init

upgrading all bundle plugins

* git submodule foreach git pull origin master
