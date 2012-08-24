vimfiles
========

Yes... this is small! I just can't handle a lot of shortcuts and
functionalities, so I compiled most common and easy to use plugins. Enjoy :)

Getting started
---------------

Installing Vundle
^^^^^^^^^^^^^^^^^

With `Vundle <https://github.com/gmarik/vundle>`_ you can easily install
add-ons to your VIM.

To install, clone (or download) the repository to your `$HOME/.vim/bundle` folder:

    $ git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

See more details in `Vundle repository <https://github.com/gmarik/vundle>`_.

Installing .vimrc
^^^^^^^^^^^^^^^^^

Simply copy the `.vimrc` file to your $HOME path. It already contains the
setup of Vundle:

    $ cd /tmp/
    $ git clone https://github.com/kplaube/vimfiles vimfiles
    $ cp vimfiles/.vimrc $HOME/.vimrc

Installing plugins
^^^^^^^^^^^^^^^^^^

Open VIM and run `:BundleInstall`.

That's all!

The plugins that `Vundle` will install are:

* `ctrlp.vim <https://github.com/kien/ctrlp.vim>`_ - Find files in your projects
* `jslint.vim <https://github.com/hallettj/jslint.vim>`_ - Spots errors and common mistakes in `Javascript` code (requires `Rhino` or `Spidermonkey`)
* `nerdtree <https://github.com/scrooloose/nerdtree>`_ - A tree explorer plugin
* `tagbar <https://github.com/majutsushi/tagbar>`_  - Display tags in a window, ordered by class
* `vim-css-color <https://github.com/skammer/vim-css-color>`_ - Highlight colors in `CSS` files
* `vim-flake8 <https://github.com/nvie/vim-flake8>`_ - Syntax and style checker for `Python` source code
* `vim-fugitive <https://github.com/tpope/vim-fugitive>`_ - A (awesome) `Git` wrapper
* `vim-haml <https://github.com/tpope/vim-haml>`_ - Syntax highlight to `SCSS` and `HAML`
* `vim-powerline <https://github.com/Lokaltog/vim-powerline>`_ - Increase your VIM statusline
* `vim-railscasts-theme <https://github.com/gilsondev/vim-railscasts-theme>`_ - A port of the Railscasts Textmate theme to Vim (GUI Only)
* `vim-virtualenv <https://github.com/jmcantrell/vim-virtualenv>`_ - Work with `virtualenv` in VIM


Strongly inspired in `Francisco Souza's vim files repository <https://github.com/fsouza/vimfiles>`_.
