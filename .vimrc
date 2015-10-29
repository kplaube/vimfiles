" My Vimrc file
" Maintainer: www.klauslaube.com.br
" License: www.opensource.org/licenses/bsd-license.php
" ----------------------------------------------------------------------------

if 0 | endif

if has('vim_starting')
    if &compatible
        set nocompatible  " be iMproved
    endif

    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))  " let bundle begins!

" Let NeoBundle manage -------------------------------------------------------
"
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'airblade/vim-gitgutter'              " shows a git diff in the gutter
NeoBundle 'bling/vim-airline'                   " lean & mean status/tabline
NeoBundle 'bronson/vim-trailing-whitespace'     " highlights trailing whitespace
NeoBundle 'davidhalter/jedi-vim'                " jedi autocompletion
NeoBundle 'easymotion/vim-easymotion'           " vim motions on speed
NeoBundle 'editorconfig/editorconfig-vim'       " editorconfig plugin
NeoBundle 'elzr/vim-json'                       " a better json for vim
NeoBundle 'fatih/vim-go'                        " go development plugin
NeoBundle 'fatih/molokai'                       " color scheme
NeoBundle 'Glench/Vim-Jinja2-Syntax'            " jinja2 syntax file
NeoBundle 'janko-m/vim-test'                    " run your tests at the speed of thought
NeoBundle 'jistr/vim-nerdtree-tabs'             " NERDTree and tabs together
NeoBundle 'kennethzfeng/vim-raml'               " raml plugin
NeoBundle 'kien/ctrlp.vim'                      " fuzzy file, buffer, mru, tag, finder
NeoBundle 'majutsushi/tagbar'                   " displays tags ordered by scope
\ 'build': {
\       'mac': 'npm install -g tern'
\     }
\ }
NeoBundle 'nathanaelkane/vim-indent-guides'	    " displaying indent levels in code
NeoBundle 'mustache/vim-mustache-handlebars'    " mustache and handlebars mode
NeoBundle 'raimondi/delimitmate'                " auto-completion for quotes, parens, brackets
NeoBundle 'rking/ag.vim'                        " the silver searcher
NeoBundle 'scrooloose/nerdcommenter'            " orgasmic commenting
NeoBundle 'scrooloose/nerdtree'                 " tree explorer
NeoBundle 'scrooloose/syntastic'                " syntax checking
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }
NeoBundle 'ternjs/tern_for_vim'                 " tern plugin
NeoBundle 'terryma/vim-multiple-cursors'        " Sublime Text multiple selections
NeoBundle 'tpope/vim-fugitive'                  " a git wrapper
NeoBundle 'tpope/vim-sensible'                  " a universal set of defaults
NeoBundle 'Valloric/YouCompleteMe', {
\ 'build'      : {
    \ 'mac'     : './install.py --clang-completer --gocode-completer',
    \ 'unix'    : './install.py',
    \ 'windows' : 'install.py',
    \ 'cygwin'  : './install.py'
    \ }
\ }
NeoBundle 'vitaly/vim-gitignore'                " make vim respect .gitignore
NeoBundle 'Xuyuanp/nerdtree-git-plugin'         " a NERDTree plugin that shows git status

call neobundle#end()

" General Settings ------------------------------------------------------------

filetype plugin indent on  " we are doing this for NeoBundle!
set encoding=utf8
colorscheme molokai

let mapleader=','

set t_Co=256
set background=dark
set completeopt-=preview
set cursorline                          " highlight current line
set guioptions-=T                       " turn off GUI toolbar
set guioptions-=m                       " turn off GUI menu
set guioptions-=r                       " turn off GUI right scrollbar
set guioptions-=L                       " turn off GUI left scrollbar
set hidden                              " hide buffers with closed files
set hlsearch                            " highlight search result
set ignorecase                          " case insensitive search
set laststatus=2                        " last window always have a status line
set modeline
set modelines=5 nowrap
set nobackup                            " no backups
set noerrorbells                        " no noise
set noswapfile                          " no swap files
set novisualbell                        " no blinking
set nowritebackup                       " write the buffer to the original file
set number                              " show line numbers
set pastetoggle=<F10>                   " toggle between paste and normal: for 'safer' pasting from keyboard
set ruler                               " show line, col in status bar
set smartcase                           " override ignorecase when using upper case
set splitbelow                          " :split opens below
set splitright                          " :vsplit opens right
set switchbuf+=usetab,newtab
set ttyfast                             " improves redrawing
set vb t_vb=                            " disable any beeps or flashes on erro
set wildmenu                            " more useful command-line completion
set wildmode=list:longest               " auto-completion menu

" Tab/indent
set expandtab
set smarttab
set autoindent
set smartindent
set shiftwidth=4 tabstop=4 softtabstop=4

" Languages ------------------------------------------------------------------

" Javascript
au FileType javascript setlocal shiftwidth=4 tabstop=4 omnifunc=tern#Complete

" HTML
au FileType html                        setlocal shiftwidth=4 tabstop=4
au BufNewFile,BufRead *.html.desktop    setlocal ft=jinja
au BufNewFile,BufRead *.html.tablet     setlocal ft=jinja
au BufNewFile,BufRead *.html.smart      setlocal ft=jinja

" Shortcuts ------------------------------------------------------------------

nmap <F2> :NERDTreeMirrorToggle<CR>
nmap <F7> :Errors<CR>
nmap <F8> :TagbarToggle<CR>
nmap <Leader>f :Ag<space>
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Plugin Settings ------------------------------------------------------------

" Ag
let g:ag_highlight=1
let g:ag_working_path_mode='r'

" Airline
let g:airline_powerline_fonts=1
let g:airline_theme='dark'

" CtrlP
let g:ctrlp_match_window='bottom,order:ttb,min:1,max:10,results:10'
let g:ctrlp_max_height=20
let g:ctrlp_max_files=100000
let g:ctrlp_clear_cache_on_exit=1
let g:ctrlp_working_path_mode='r'

" Jedi-vim
let g:jedi#show_call_signatures=0
let g:jedi#use_tabs_not_buffers=1

" JSON
let g:vim_json_syntax_conceal=0

" NERDTree
let g:nerdtree_tabs_autoclose=0
let g:nerdtree_tabs_open_on_gui_startup=0
let g:nerdtree_tabs_open_on_new_tab=0
let NERDTreeIgnore=['\~$', '__pycache__', '\.pyc$']

" Syntastic
let g:syntastic_check_on_open=1
let g:syntastic_enable_highlighting=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'

let g:syntastic_javascript_checkers=['jshint']
let g:syntastic_json_checkers=['jsonlint']
let g:syntastic_lua_checkers=['luacheck']
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args='--ignore=E501'

" Test
let test#python#nose#options='--logging-clear-handlers'

" YCM
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_min_num_of_chars_for_completion=2

" GUI Settings ---------------------------------------------------------------

if has("gui_running")
    set guicursor=a:blinkoff0-blinkwait0
endif

" GVim
if has("gui_gtk2")
    set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 14
endif

" MacVim
if has("gui_macvim") || has("gui_vimr")
    let macvim_hig_shift_movement=1
    set guifont=Droid\ Sans\ Mono\ for\ Powerline:h15
    set transparency=2
endif

" ----------------------------------------------------------------------------

NeoBundleCheck  " check uninstalled bundles
