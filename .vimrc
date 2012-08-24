set nocompatible                        " disable compatible mode
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()


" Let Vundle manage!
Bundle 'gmarik/vundle'

" Bundles
" Code quality checker
Bundle 'nvie/vim-flake8'
Bundle 'hallettj/jslint.vim'
" Why use shell?
Bundle 'tpope/vim-fugitive'
Bundle 'jmcantrell/vim-virtualenv'
Bundle 'kien/ctrlp.vim'
" Other utilities
Bundle 'Lokaltog/vim-powerline'
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/nerdtree'
" Syntax Highlight
Bundle 'tpope/vim-haml'
Bundle 'skammer/vim-css-color'
Bundle 'gilsondev/vim-railscasts-theme'


" Color
set background=dark
colorscheme railscasts


" General settings
filetype plugin indent on               " indent files, ftplugins

set nobackup
set nowritebackup
set noswapfile
set number
set modeline
set modelines=5
set laststatus=2
set ruler                               " show line,col in status bar
set hidden                              " hide buffers with closed files
set incsearch                           " use incremental search
set autowrite                           " auto save file before some commands
set showcmd                             " show command/mode in at bottom
set showmatch                           " show match (), [] and {}
set nohlsearch                          " no highlight search results
set noignorecase                        " case sensitive search
set nojoinspaces                        " don't add space when joining line
set nobackup                            " no backups
set textwidth=0 nowrap                  " infinite lines with no wrap
set completeopt=menu,preview            " configure drop-down menu when completing with ctrl-n
set wildmode=list:longest               " bash like command line tab completion
set wildignore=*.o,*.obj,*~,*.swp,*.pyc " ignore when tab completing:
set writeany                            " Allow writing readonly files


" Tab/Indent config
" 4 soft-space tabs for all kind of documents
set expandtab
set smarttab
set autoindent
set smartindent
set shiftwidth=4 tabstop=4 softtabstop=4
set visualbell
let mapleader=","


" Doh... you know what this does... ;-)
syntax on


" Some useful abbreviations to common mistyped commands
cab W w | cab Q q | cab Wq wq | cab wQ wq | cab WQ wq


" Comment/Uncomment for different languages
au FileType haskell,vhdl,ada            let comment = '-- '
au FileType sh,make,python,ruby         let comment = '# '
au FileType c,cpp,java,javascript       let comment = '// '
au FileType tex                         let comment = '% '
au FileType vim                         let comment = '" '

" Highlight trailing whitespaces
highlight WhitespaceEOL ctermbg=red guibg=red
au ColorScheme * highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

" ,a -> clean all trailing spaces
noremap <silent> ,a :%s,\s\+$,,<CR>


" Comment Blocks
" ,c -> comment selected
" ,u -> uncomment selected
noremap <silent> ,c :s,^,<C-R>=comment<CR>,<CR>:noh<CR>
noremap <silent> ,u :s,^\V<C-R>=comment<CR>,,e<CR>:noh<CR>


" Plugins settings
nmap <F2> :NERDTree<CR>
nmap <F8> :TagbarToggle<CR>
nmap <F6> :cl<CR>


" Language specifics
let python_highlight_all = 1
au FileType make   set noexpandtab
au FileType python set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
au FileType python set omnifunc=pythoncomplete#Complete
au FileType javascript set omnifunc=javascriptcomplete#CompleteJS
au FileType html set omnifunc=htmlcomplete#CompleteTags
au FileType css,scss set omnifunc=csscomplete#CompleteCSS
au FileType xml set omnifunc=xmlcomplete#CompleteTags
au FileType php set omnifunc=phpcomplete#CompletePHP
au FileType c set omnifunc=ccomplete#Complete
au FileType ruby,eruby set omnifunc=rubycomplete#Complete


" Terminal.app keyboard settings
map <Esc>[H <Home>
imap <Esc>[H <Home>
map <Esc>[F <End>
imap <Esc>[F <End>
map <Esc>[5~ <PageUp>
imap <Esc>[5~ <PageUp>
map <Esc>[6~ <PageDown>
imap <Esc>[6~ <PageDown>


" Moving .swp files away
set backupdir=~/.vim
set directory=~/.vim


" MacVim
if has("gui_macvim")
    let macvim_hig_shift_movement = 1
    set guioptions-=T
    colorscheme railscasts
    set bg=dark
    "set guifont=Meslo\ LG\ S\ DZ:h18
    set guifont=Consolas:h18
    set guicursor=a:blinkoff0-blinkwait0
    set colorcolumn=80
endif
