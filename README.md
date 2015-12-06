vimfiles
========

Yes... this is small! I just can't handle a lot of shortcuts and
functionalities, so I compiled most common and easy to use plugins. Enjoy :)

Getting started
---------------

### Installing vim-plug

With [vim-plug](https://github.com/junegunn/vim-plug) you can easily install
add-ons to your `vim`:

    $ make install

Or, you can download the extension and put it into your `autoload` path:

    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

See more details in [vim-plug repository](https://github.com/junegunn/vim-plug).

### Installing .vimrc

It's possible to install vimfiles using `Makefile`. It'll copy the
configuration file to `~/` and the scripts to `~/.vim/`:

    $ cd /tmp/
    $ git clone https://github.com/kplaube/vimfiles vimfiles
    $ cd vimfiles
    $ make install

Or you can do this manually. Simply copy the `.vimrc` file to your `$HOME` path.
It already contains the setup of `vim-plug`:

    $ cd /tmp/
    $ git clone https://github.com/kplaube/vimfiles vimfiles
    $ cp vimfiles/.vimrc $HOME/.vimrc


### Installing plugins

Open `vim` and run `:PlugInstall`.

[Check out the plugin list](https://github.com/kplaube/vimfiles/blob/master/.vimrc#L11).

That's all!

Strongly inspired in [Francisco Souza's vim files repository](https://github.com/fsouza/vimfiles).
