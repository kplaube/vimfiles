" My Vimrc file
" Maintainer: www.klauslaube.com.br
" License: www.opensource.org/licenses/bsd-license.php


set nocompatible                        " disable compatible mode
filetype off                            " we are doing this for Vundle!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()                     " start Vundle

" Let Vundle manage!
Plugin 'gmarik/vundle'

" Bundles
Plugin 'vim-scripts/DfrankUtil'         " library for some scripts
Plugin 'vim-scripts/vimprj'             " managing options for different proj

Plugin 'kien/ctrlp.vim'                 " fuzzy file finder
Plugin 'editorconfig/editorconfig-vim'  " editorconfig plugin
Plugin 'vim-scripts/indexer.tar.gz'     " indexing all files in project with ctags
Plugin 'tomasr/molokai'                 " color scheme
Plugin 'scrooloose/nerdcommenter'       " commenting
Plugin 'scrooloose/nerdtree'            " tree explorer
Plugin 'scrooloose/syntastic'           " syntax checking
Plugin 'majutsushi/tagbar'              " tags in a window
Plugin 'bling/vim-airline'              " status/tabline
Plugin 'tpope/vim-fugitive'             " a git wrapper
Plugin 'airblade/vim-gitgutter'         " git diff in the sign column
Plugin 'fatih/vim-go'                   " go development plugin
Plugin 'tpope/vim-haml'                 " runtime files for Haml, Sass and SCSS
Plugin 'noahfrederick/vim-hemisu'       " color scheme
Plugin 'tpope/vim-markdown'             " markdown runtime files
Plugin 'jistr/vim-nerdtree-tabs'        " NerdTree and tabs, together

call vundle#end()


" Shortcuts
nmap <F2> :NERDTreeToggle<CR>
imap <F2> <Esc><F2><CR>
nmap <F6> :Extradite<CR>
imap <F6> <Esc><F6><CR>
nmap <F7> :Errors<CR>
imap <F7> <Esc><F7><CR>
nmap <F8> :TagbarToggle<CR>
imap <F8> <Esc><F8><CR>


" General settings
filetype plugin indent on               " required
syntax on                               " enable syntax highlighting
set t_Co=256
colorscheme molokai

let mapleader=","

set encoding=utf8
set fileencoding=utf8

set hidden                              " hide buffers with closed files
set nobackup                            " no backups
set nowritebackup                       " write the buffer to the original file
set noswapfile                          " no swap files
set backupdir=/tmp/
set directory=/tmp/

set clipboard+=unnamed                  " yanks go on clipboard instead.
set pastetoggle=<F10>                   " toggle between paste and normal: for 'safer' pasting from keyboard

set modeline
set modelines=5                         " default numbers of lines to read for modeline instructions

set incsearch                           " search as you type
set hlsearch                            " highlight search results
set ignorecase                          " case insensitive search
set smartcase                           " override ignorecase when using upper case

set wildmenu                            " more useful command-line completion
set wildmode=list:longest               " auto-completion menu

set nojoinspaces                        " don't add space when joining line
set textwidth=0 nowrap                  " infinite lines with no wrap
set backspace=indent,eol,start          " sane backspace


" Visual settings
set number                              " show line numbers
set ruler                               " show line, col in status bar
set cursorline                          " highlight current line
set showcmd                             " show command/mode in at bottom
set showmatch                           " show match (), [] and {}
set laststatus=2                        " last window always have a status line
set nomousehide                         " don't hide the mouse cursor while typing

set novisualbell                        " no blinking
set noerrorbells                        " no noise
set vb t_vb=                            " disable any beeps or flashes on erro

set splitbelow                          " :split opens below
set splitright                          " :vsplit opens right

set ttyfast                             " improves redrawing
set guioptions-=T                       " turn off GUI toolbar
set guioptions-=m                       " turn off GUI menu
set guioptions-=r                       " turn off GUI right scrollbar
set guioptions-=L                       " turn off GUI left scrollbar


" GUI settings
if has("gui_running")
    set guicursor=a:blinkoff0-blinkwait0
endif

" GVim
if has("gui_gtk2")
    set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 14
endif

" MacVim
if has("gui_macvim")
    let macvim_hig_shift_movement=1
    set guifont=Droid\ Sans\ Mono\ for\ Powerline:h16
    set transparency=8
endif


" Tab/indent config
" 4 soft-space tabs for all kind of documents
set expandtab
set smarttab
set autoindent
set smartindent
set shiftwidth=4 tabstop=4 softtabstop=4

" Make
au FileType make        set noexpandtab

" Python
au FileType python      set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with

" Perl
au FileType perl        setlocal shiftwidth=2 tabstop=2 softtabstop=2

" Javascript
au FileType javascript setlocal shiftwidth=4 tabstop=4

" HTML & CSS
au FileType html        setlocal shiftwidth=4 tabstop=4
au FileType htmldjango  setlocal ft=html
au FileType xml         setlocal shiftwidth=2 tabstop=2
au FileType scss        setlocal ft=css
au FileType css         setlocal shiftwidth=2 tabstop=2


" Useful settings
" Some useful abbreviations to common mistyped commands
cab W w
cab Q q
cab Wq wq
cab wQ wq
cab WQ wq

" Simple recursive grep
command! -nargs=1 RecurGrep lvimgrep /<args>/gj ./**/*.* | lopen | set nowrap
command! -nargs=1 RecurGrepFast silent exec 'lgrep! <q-args> ./**/*.*' | lopen
nmap <Leader>R :RecurGrep
nmap <Leader>r :RecurGrepFast
nmap <Leader>wR :RecurGrep <cword><CR>
nmap <Leader>wr :RecurGrepFast <cword><CR>

" Highlight trailing whitespaces
highlight WhitespaceEOL ctermbg=red guibg=red
au ColorScheme * highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

" Highlight 80th and 120th columns
if exists('+colorcolumn')
    highlight ColorColumn guibg=#2d2d2d ctermbg=236
    let &colorcolumn="80,".join(range(120,320),",")
endif

" Switch buffers with tab
nnoremap <S-Tab> :bprevious<CR>
nnoremap <Tab> :bnext<CR>

" Go to definition config
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>


" Plugins settings
let g:airline_powerline_fonts=1
let g:airline_theme='dark'

let g:ctrlp_match_window='bottom,order:ttb,min:1,max:10,results:10'
let g:ctrlp_max_height=20
let g:ctrlp_max_files=100000
let g:ctrlp_clear_cache_on_exit=0
let g:ctrlp_working_path_mode='r'

let g:gitgutter_realtime=0

let g:indexer_disableCtagsWarning=1

let g:nerdtree_tabs_open_on_new_tab=0
let g:nerdtree_tabs_autoclose=0

let g:syntastic_check_on_open=1
let g:syntastic_enable_highlighting=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_php_checkers=['php', 'phpcs']
let g:syntastic_php_phpcs_args='--report=csv --standard=PSR2'
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args='--ignore=E501'

let g:tagbar_compact=1
