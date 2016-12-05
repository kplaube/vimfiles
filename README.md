vimfiles
========

Yes... this is small (or at least should be)! I just can't handle a lot of shortcuts and
functionalities, so I compiled the most common and easy to use plugins. Enjoy :)

## Getting started

### Install NeoVim

Vim by itself have some limitations that can lead you to some very frustrating experiences, as
*Derek Prior* wrote in his [My Life with NeoVim](https://robots.thoughtbot.com/my-life-with-neovim).

NeoVim is not perfect, but has some cool improvements (like asynchronous checkers) and an active
community around it. You should give it a try.

[Installing NeoVim](https://github.com/neovim/neovim/wiki/Installing-Neovim).

### Installing vim-plug

With [vim-plug](https://github.com/junegunn/vim-plug) you can easily install
add-ons to your `vim`:
       
    curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

See more details in [vim-plug repository](https://github.com/junegunn/vim-plug).

### Installing .vimrc

It's possible to install vimfiles using `Makefile`. It'll make
a symbolic link of the configuration file to `~/` path.

    $ make install

### Installing plugins

Open `nvim` and run `:PlugInstall`.

[Check out the plugin list](https://github.com/kplaube/vimfiles/blob/master/.vimrc#L10).

That's all!
