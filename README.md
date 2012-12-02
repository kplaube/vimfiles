vimfiles
========

Yes... this is small! I just can't handle a lot of shortcuts and
functionalities, so I compiled most common and easy to use plugins. Enjoy :)

Getting started
---------------

### Installing Vundle

With [Vundle](https://github.com/gmarik/vundle) you can easily install
add-ons to your VIM.

To install, clone (or download) the repository to your `$HOME/.vim/bundle` folder:

    $ git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

See more details in [Vundle repository](https://github.com/gmarik/vundle).

### Installing .vimrc

It's possible to install vimfiles using `Makefile`. It'll copy the
configuration file to `~/` and the scripts to `~/.vim/`:

    $ cd /tmp/
    $ git clone https://github.com/kplaube/vimfiles vimfiles
    $ cd vimfiles
    $ make install

Or you can do this manually. Simply copy the `.vimrc` file to your `$HOME` path.
It already contains the setup of Vundle:

    $ cd /tmp/
    $ git clone https://github.com/kplaube/vimfiles vimfiles
    $ cp vimfiles/.vimrc $HOME/.vimrc

To keep your ctags updated, copy the `update_ctags` script to `~/.vim/`:

    $ cp vimfiles/.vim/update_ctags $HOME/.vim/

### Installing plugins

Open VIM and run `:BundleInstall`.

That's all!

The plugins that `Vundle` will install are:

* [ctrlp.vim](https://github.com/kien/ctrlp.vim) - Find files in your projects
* [jslint.vim](https://github.com/hallettj/jslint.vim) - Spots errors and common mistakes in `Javascript` code (requires `Rhino` or `Spidermonkey`)
* [nerdtree](https://github.com/scrooloose/nerdtree) - A tree explorer plugin
* [tagbar](https://github.com/majutsushi/tagbar)  - Display tags in a window, ordered by class
* [vim-css-color](https://github.com/skammer/vim-css-color) - Highlight colors in `CSS` files
* [vim-flake8](https://github.com/nvie/vim-flake8) - Syntax and style checker for `Python` source code
* [vim-fugitive](https://github.com/tpope/vim-fugitive) - A (awesome) `Git` wrapper
* [vim-haml](https://github.com/tpope/vim-haml) - Syntax highlight to `SCSS` and `HAML`
* [vim-powerline](https://github.com/Lokaltog/vim-powerline) - Increase your VIM statusline
* [vim-railscasts-theme](https://github.com/gilsondev/vim-railscasts-theme) - A port of the Railscasts Textmate theme to Vim (GUI Only)
* [vim-virtualenv](https://github.com/jmcantrell/vim-virtualenv) - Work with `virtualenv` in VIM


Strongly inspired in [Francisco Souza's vim files repository](https://github.com/fsouza/vimfiles).
