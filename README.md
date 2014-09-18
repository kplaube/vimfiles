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

Open VIM and run `:PluginInstall`.

That's all!

Strongly inspired in [Francisco Souza's vim files repository](https://github.com/fsouza/vimfiles).
