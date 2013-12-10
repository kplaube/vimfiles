" My Vimrc file
" Maintainer: www.klauslaube.com.br/about/
" License: www.opensource.org/licenses/bsd-license.php

set nocompatible                        " disable compatible mode
filetype off                            " we are doing this for Vundle!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()                        " start Vundle

" Let Vundle manage!
Bundle 'gmarik/vundle'


" ### Bundles ###
" Libraries
Bundle 'tpope/vim-dispatch'

" Code quality checker
Bundle 'scrooloose/syntastic'

" Why use shell?
Bundle 'int3/vim-extradite'
Bundle 'tpope/vim-fugitive'
Bundle 'jmcantrell/vim-virtualenv'
Bundle 'airblade/vim-gitgutter'

" Organize project
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'majutsushi/tagbar'

" Other utilities
Bundle 'bling/vim-airline'
Bundle 'vim-scripts/Crunch'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'scrooloose/nerdcommenter'
Bundle 'mhinz/vim-startify'
Bundle 'tpope/vim-surround'

" Snippets
Bundle 'kplaube/snipmate.vim'

" Syntax Highlight
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'tpope/vim-haml'
Bundle 'Pychimp/vim-luna'
Bundle 'tpope/vim-markdown'

" Code complete
Bundle 'davidhalter/jedi-vim'
Bundle 'szw/vim-tags'


" ### Font & Color ###
set t_Co=256
colorscheme luna


" ### General settings ###
filetype plugin indent on               " indent files, ftplugins
syntax on                               " enable syntax highlighting

set encoding=utf8
set fileencoding=utf8

set nobackup                            " no backups
set nowritebackup                       " write the buffer to the original file
set noswapfile                          " no swap files
set backupdir=~/.vim
set directory=~/.vim

set number                              " show line numbers
set ruler                               " show line, col in status bar
set cursorline                          " highlight current line
set showcmd                             " show command/mode in at bottom
set showmatch                           " show match (), [] and {}

set visualbell                          " disable beeping
set modeline
set laststatus=2                        " last window always have a status line
set hidden                              " hide buffers with closed files

set incsearch                           " search as you type
set hlsearch                            " highlight search results
set ignorecase                          " case insensitive search
set smartcase                           " override ignorecase when using upper case

set nojoinspaces                        " don't add space when joining line
set textwidth=0 nowrap                  " infinite lines with no wrap
set backspace=indent,eol,start          " sane backspace
set nomousehide                         " don't hide the mouse cursor while typing

set ttyfast                             " improves redrawing
set guioptions-=T                       " turn off GUI toolbar
set guioptions-=m                       " turn off GUI menu
set guioptions-=r                       " turn off GUI right scrollbar
set guioptions-=L                       " turn off GUI left scrollbar

let mapleader=","


" ### Plugins settings ###
let g:airline_powerline_fonts=1
let g:airline_theme='dark'
let g:airline#extensions#tabline#enabled=1

let g:ctrlp_match_window='bottom,order:ttb,min:1,max:10,results:10'
let g:ctrlp_max_height=20
let g:ctrlp_max_files=100000
let g:ctrlp_clear_cache_on_exit=0
let g:ctrlp_working_path_mode='ra'

let g:gitgutter_realtime=0

let g:syntastic_check_on_open=1
let g:syntastic_enable_highlighting=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_php_checkers=['php', 'phpcs']
let g:syntastic_php_phpcs_args='--report=csv --standard=PSR2'
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args='--ignore=E501'

let g:tagbar_compact=1
let g:tagbar_sort=0


" ### Shortcuts ###
nmap <F2> :NERDTreeToggle<CR>
imap <F2> <Esc><F2><CR>
nmap <F6> :Extradite<CR>
imap <F6> <Esc><F6><CR>
nmap <F7> :Errors<CR>
imap <F7> <Esc><F7><CR>
nmap <F8> :TagbarToggle<CR>
imap <F8> <Esc><F8><CR>


" ### GUI settings ###
if has("gui_running")
    set guicursor=a:blinkoff0-blinkwait0
endif

" GVim
if has("gui_gtk2")
    set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 14
	set novisualbell
endif

" MacVim
if has("gui_macvim")
    let macvim_hig_shift_movement=1
    set guifont=Droid\ Sans\ Mono\ for\ Powerline:h16
endif


" ### Tab/Indent config ###
" 4 soft-space tabs for all kind of documents
set expandtab
set smarttab
set autoindent
set smartindent
set shiftwidth=4 tabstop=4 softtabstop=4


" ### Language settings ###
au FileType make        set noexpandtab

" Python
let python_highlight_all = 1
au FileType python set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
au FileType python setlocal completeopt-=preview

" PHP

" Javascript
au FileType javascript setlocal shiftwidth=2 tabstop=2

" HTML & CSS
au FileType html        setlocal shiftwidth=4 tabstop=4
au FileType htmldjango  setlocal ft=html
au FileType xml         setlocal shiftwidth=2 tabstop=2
au FileType scss        setlocal ft=css
au FileType css         setlocal shiftwidth=2 tabstop=2


" ### Useful settings ###
" Some useful abbreviations to common mistyped commands
cab W w
cab Q q
cab Wq wq
cab wQ wq
cab WQ wq

" Copy to clipboard made easy!
nnoremap <C-y> "+y
vnoremap <C-y> "+y

" Go to definition config
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

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
