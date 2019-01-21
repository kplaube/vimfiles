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

(*2) You should install `jedi` inside every `virtualenv` you are working on. This
will help you deal with multiple versions of *Python*.

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

### Common

- `F1`: Vim help
- `F2`: Show/hide TODO/FIXME list
- `F5`: Run/Preview/Test
- `F8`: Show/hide tag bar
- `CTRL + \`: Show/hide NERDTree (file explorer)
- `CTRL + k`: Apply snippet
- `,\`: Show the current file in NERDTree
- `,ev`: Edit `.vimrc`
- `,ig`: Show/hide indent guides
- `,sv`: Source `.vimrc`

### Comments

- `gcc`: Comment out line
- `gc`: Comment out the target of a motion

### Language shortcuts

- `K`: Show documentation
- `,d`: Go to definition
- `,g`: Go to declaration
- `,gk`: Show documentation through [vim-investigate](https://github.com/keith/investigate.vim)/[Dash](https://kapeli.com/dash)
- `,n`: Show function usages

#### Javascript shortcuts:

- `,i`: Sort imports

### Lint

- `F6`: Run the syntatic check (toggle loclist)
- `F7`: Run syntatic fixers
- `CTRL + k`: Previous lint error
- `CTRL + j`: Next lint error

### Movement
- `CTRL + n (CTRL + n, CTRL + p, CTRL + x)`: Multiple cursos selection
- `,,b`: Easy motion through words (backward)
- `,,f`: Easy motion to a specific character (forward)
- `,,s`: Easy motion to a specific character (all)
- `,,w`: Easy motion through words (forward)

### Running tests
- `,t`: Test the last test file
- `,tf`: Test the current test file
- `,tn`: Test the nearest test file
- `,ts`: Test the whole test suite
- `,tt`: Test file using `basic` strategy (good for pdb)
- `,tv`: Visits the last test file

### Search
- `CTRL + p`: File finder
- `,/`: Clear search highlights
- `,f`: Perform searches using Ag
- `,sr`: Search and replace

## References

* [Use Tern with VIM for Node.js development](https://gist.github.com/nisaacson/9234157)

That's all!
