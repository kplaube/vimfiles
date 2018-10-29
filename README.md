vimfiles
========

![screen shot 2018-10-29 at 15 00 28](https://user-images.githubusercontent.com/477202/47654630-89954b80-db8b-11e8-825d-cbe0026f57fc.png)


Yes... this is small (or at least it should be)! I just can't handle a lot of shortcuts and
functionalities, so I compiled the most common and easy to use plugins.

Currently, I'm working with:

* Javascript (*1)
* Markdown
* Python (*2)

Enjoy! :)

(*1) `make install` will create a `.tern-project` inside your `$HOME`. If you
want a customized configuration per project, just create a Tern file inside the
project root folder. Oh... make sure to install `tern` globally.

(*2) You should install `jedi` inside every `virtualenv` you are working on. At least for now
I'm not picking a "global" binary for jedi.

## Getting started

[Vim 8](https://github.com/vim/vim/blob/master/runtime/doc/version8.txt) FTW \o/.

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

Open `vim` and run `:PlugInstall`.

[Check out the plugin list](https://github.com/kplaube/vimfiles/blob/master/.vimrc#L8).

### Fonts

In order to use `vim-airline` and `nerdtree` without any kind of problem regarding fonts,
it's recommended to install and use the
[Droid Sans Mono for Powerline.otf](https://github.com/kplaube/vimfiles/blob/master/fonts/Droid%20Sans%20Mono%20for%20Powerline.otf)
font file.

## Shortcuts

Below is a list of the most common shortcuts:

- `F1`: Vim help
- `F2`: Show/hide NERDTree (file explorer)
- `F3`: Show/hide TODO/FIXME list
- `F5`: Run/Preview/Test
- `F6`: Run the syntatic check (toggle loclist)
- `F7`: Run syntatic fixers
- `F9`: Show/hide tag bar
- `CTRL + n (CTRL + n, CTRL + p, CTRL + x)`: Multiple cursos selection
- `CTRL + p`: File finder
- `,/`: Clear search highlights
- `,ev`: Edit `.vimrc`
- `,f`: Perform searches using Ag
- `,ig`: Show/hide indent guides
- `,sr`: Search and replace
- `,sv`: Source `.vimrc`
- `,v`: Show the current file in NERDTree
- `,,b`: Easy motion through words (backward)
- `,,f`: Easy motion to a specific character (forward)
- `,,s`: Easy motion to a specific character (all)
- `,,w`: Easy motion through words (forward)
- Common language shortcuts:
    - `K`: Show documentation
    - `,d`: Go to definition
    - `,g`: Go to declaration
    - `,gk`: Show documentation through [vim-investigate](https://github.com/keith/investigate.vim)/[Dash](https://kapeli.com/dash)
    - `,n`: Show function usages
- Specific Javascript shortcuts:
    - `,i`: Sort imports
- Running tests:
    - `,t`: Test the last test file
    - `,tf`: Test the current test file
    - `,tn`: Test the nearest test file
    - `,ts`: Test the whole test suite
    - `,tt`: Test file using `basic` strategy (good for pdb)
    - `,tv`: Visits the last test file

## References

* [Use Tern with VIM for Node.js development](https://gist.github.com/nisaacson/9234157)

That's all!
