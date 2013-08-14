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


### Installing plugins

Open VIM and run `:BundleInstall`.

That's all!

Plugins that `Vundle` will install are:

* [ctrlp.vim](https://github.com/kien/ctrlp.vim) - Find files in your projects
* [DfrankUtil](https://github.com/vim-scripts/DfrankUtil) - Just a library for some scripts
* [indexer.tar.gz](https://github.com/vim-scripts/indexer.tar.gz) - Indexing all files in project with ctags
* [nerdtree](https://github.com/scrooloose/nerdtree) - A tree explorer plugin
* [snipmate.vim](https://github.com/kplaube/snipmate.vim) - TextMate's snippets features in VIM
* [syntastic](https://github.com/scrooloose/syntastic) - Syntax checking for a lot of languages
* [tagbar](https://github.com/majutsushi/tagbar)  - Display tags in a window, ordered by class
* [vimprj](https://github.com/vim-scripts/vimprj) - Plugin for managing options for different projects
* [vim-coffee-script](https://github.com/kchmck/vim-coffee-script) - `CoffeeScript` support for VIM
* [vim-easymotion](https://github.com/Lokaltog/vim-easymotion) - Provides a much simpler way to use motions in VIM
* [vim-extradite](https://github.com/int3/vim-extradite) - A `Git` commit browser for VIM
* [vim-flake8](https://github.com/nvie/vim-flake8) - Syntax and style checker for `Python` source code
* [vim-fugitive](https://github.com/tpope/vim-fugitive) - A (awesome) `Git` wrapper
* [vim-gitgutter](https://github.com/airblade/vim-gitgutter) - A plugin which shows a git diff in the gutter (sign column)
* [vim-haml](https://github.com/tpope/vim-haml) - Syntax highlight for `SCSS` and `HAML`
* [vim-markdown](https://github.com/tpope/vim-markdown) - Syntax highlight for `Markdown`
* [vim-powerline](https://github.com/Lokaltog/vim-powerline) - Increases your VIM statusline
* [vim-surround](https://github.com/tpope/vim-surround) Provides mappings to easily delete, change and add surroundings
* [vim-virtualenv](https://github.com/jmcantrell/vim-virtualenv) - Works with `virtualenv` in VIM
* [Wombat](https://github.com/vim-scripts/Wombat) - Dark gray color scheme sharing some similarities with Desert
* [zencoding-vim](https://github.com/mattn/zencoding-vim) - High-speed `HTML`, `XML` and `XSL`


Strongly inspired in [Francisco Souza's vim files repository](https://github.com/fsouza/vimfiles).
