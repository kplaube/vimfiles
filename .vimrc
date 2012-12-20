set nocompatible                        " disable compatible mode
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()                        " start vundle


" Let Vundle manage!
Bundle 'gmarik/vundle'

" Bundles
" Libraries
Bundle 'vim-scripts/DfrankUtil'
" Code quality checker
Bundle 'nvie/vim-flake8'
Bundle 'hallettj/jslint.vim'
" Why use shell?
Bundle 'tpope/vim-fugitive'
Bundle 'jmcantrell/vim-virtualenv'
" Organize project
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'majutsushi/tagbar'
Bundle 'vim-scripts/vimprj'
" Other utilities
Bundle 'Lokaltog/vim-powerline'
Bundle 'tpope/vim-surround'
Bundle 'mattn/zencoding-vim'
" Syntax Highlight
Bundle 'skammer/vim-css-color'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'
Bundle 'jonathanfilip/vim-lucius'
Bundle 'vim-scripts/xoria256.vim'
" Code complete
Bundle 'mbbill/code_complete'
Bundle 'teramako/jscomplete-vim'
Bundle 'vim-scripts/indexer.tar.gz'
Bundle 'vim-scripts/pythoncomplete'
"Bundle 'shawncplus/phpcomplete'


" Font & Color
set t_Co=256
set gfn=Monaco:h14
colorscheme xoria256


" General settings
filetype plugin indent on               " indent files, ftplugins
syntax on

set nobackup                            " no backups
set nowritebackup                       " write the buffer to the original file
set noswapfile                          " no swap files
set number                              " show line numbers
set modeline
set modelines=5
set laststatus=2
set ruler                               " show line, col in status bar
set hidden                              " hide buffers with closed files
set incsearch                           " use incremental search
set autowrite                           " auto save file before some commands
set showcmd                             " show command/mode in at bottom
set showmatch                           " show match (), [] and {}
set hlsearch                            " highlight search results
set ignorecase                          " case insensitive search
set nojoinspaces                        " don't add space when joining line
set textwidth=0 nowrap                  " infinite lines with no wrap
set writeany                            " Allow writing readonly files
let mapleader=","


" Plugins settings
nmap <F2> :NERDTree<CR>
nmap <F3> :Project<CR>
nmap <F8> :TagbarToggle<CR>
nmap <F6> :cl<CR>
let g:ctrlp_working_path_mode = 0


" Autocomplete settings
set completeopt=menu,preview                    " configure drop-down menu when completing with ctrl-n
set wildmode=list:longest                       " bash like command line tab completion
set wildignore=*.o,*.obj,*~,*.swp,*.pyc         " ignore when tab completing:
let g:indexer_disableCtagsWarning=1
inoremap <C-space> <C-x><C-o>


" Go to definition config
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>


" Tab/Indent config
" 4 soft-space tabs for all kind of documents
set expandtab
set smarttab
set autoindent
set smartindent
set shiftwidth=4 tabstop=4 softtabstop=4
set visualbell


" Some useful abbreviations to common mistyped commands
cab W w | cab Q q | cab Wq wq | cab wQ wq | cab WQ wq


" Comment/Uncomment for different languages
au FileType haskell,vhdl,ada            let comment = '-- '
au FileType sh,make,python,ruby         let comment = '# '
au FileType c,cpp,java,javascript,scss  let comment = '// '
au FileType tex                         let comment = '% '
au FileType vim                         let comment = '" '


" Comment Blocks
" ,c -> comment selected
" ,u -> uncomment selected
noremap <silent> ,c :s,^,<C-R>=comment<CR>,<CR>:noh<CR>
noremap <silent> ,u :s,^\V<C-R>=comment<CR>,,e<CR>:noh<CR>


" Highlight trailing whitespaces
highlight WhitespaceEOL ctermbg=red guibg=red
au ColorScheme * highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/


" Simple recursive grep
command! -nargs=1 RecurGrep lvimgrep /<args>/gj ./**/*.* | lopen | set nowrap
command! -nargs=1 RecurGrepFast silent exec 'lgrep! <q-args> ./**/*.*' | lopen
nmap ,R :RecurGrep
nmap ,r :RecurGrepFast
nmap ,wR :RecurGrep <cword><CR>
nmap ,wr :RecurGrepFast <cword><CR>


" Terminal.app keyboard settings
map <Esc>[H <Home>
imap <Esc>[H <Home>
map <Esc>[F <End>
imap <Esc>[F <End>
map <Esc>[5~ <PageUp>
imap <Esc>[5~ <PageUp>
map <Esc>[6~ <PageDown>
imap <Esc>[6~ <PageDown>


" Language settings
au FileType make   set noexpandtab
au FileType c set omnifunc=ccomplete#Complete
au FileType ruby,eruby set omnifunc=rubycomplete#Complete

" Python
let python_highlight_all = 1
au FileType python set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
au FileType python set omnifunc=pythoncomplete#Complete

" PHP
au FileType php set noexpandtab shiftwidth=4 tabstop=4
au FileType php set omnifunc=phpcomplete#CompletePHP

" Javascript
au FileType javascript setlocal shiftwidth=2 tabstop=2
au FileType javascript set omnifunc=javascriptcomplete#CompleteJS

" HTML & CSS
au FileType html setlocal shiftwidth=2 tabstop=2
au FileType htmldjango setlocal shiftwidth=4 tabstop=4
au FileType html set omnifunc=htmlcomplete#CompleteTags
au FileType xml setlocal shiftwidth=2 tabstop=2
au FileType xml set omnifunc=xmlcomplete#CompleteTags
au FileType css,scss setlocal shiftwidth=2 tabstop=2
au FileType css,scss set omnifunc=csscomplete#CompleteCSS


" Moving .swp files away
set backupdir=~/.vim
set directory=~/.vim


" MacVim
if has("gui_macvim")
    let g:lucius_style = 'dark'
    colorscheme lucius

    let macvim_hig_shift_movement = 1
    set colorcolumn=80
    set guioptions-=T
    set guicursor=a:blinkoff0-blinkwait0
endif
