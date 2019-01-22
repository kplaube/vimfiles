" My Vimrc file
" Maintainer: www.klauslaube.com.br
" License: www.opensource.org/licenses/bsd-license.php
" -----------------------------------------------------------------------

call plug#begin('~/.vim/plugged')

" Let's Plug manage -----------------------------------------------------

Plug 'tpope/vim-sensible'               " a set of defaults

" Code standard
Plug 'w0rp/ale', { 'do': 'npm install -g eslint prettier && pip install black flake8 isort yapf' }
Plug 'editorconfig/editorconfig-vim'
Plug 'ruanyl/vim-sort-imports', { 'do': 'npm install -g import-sort-cli import-sort-parser-babylon import-sort-parser-typescript import-sort-style-module import-sort-style-renke import-sort-style-eslint' }

" Completion
Plug 'slashmili/alchemist.vim'
Plug 'maralla/completor.vim'
Plug 'davidhalter/jedi-vim', { 'do': 'pip install jedi' }
Plug 'ternjs/tern_for_vim', { 'do': 'npm install -g tern' }

" Colorschemes
Plug 'vim-airline/vim-airline-themes'
Plug 'dracula/vim'

" Display
Plug 'Valloric/ListToggle'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'shime/vim-livedown', { 'do': 'npm install -g livedown' }
Plug 'sheerun/vim-polyglot'
Plug 'mhinz/vim-startify'

" File explorer
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin' | Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Git
Plug 'tpope/vim-fugitive' | Plug 'tpope/vim-rhubarb'
Plug 'mhinz/vim-signify'

" Misc
Plug 'keith/investigate.vim'
Plug 'Shougo/neosnippet.vim' |  Plug 'maralla/completor-neosnippet' 
Plug 'Shougo/neosnippet-snippets'| Plug 'honza/vim-snippets'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'               " run jobs async
Plug 'benmills/vimux'                   " tmux support

" Movement
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'

" Tests
Plug 'janko-m/vim-test'

call plug#end()

" General settings ------------------------------------------------------

let mapleader = ','

set cmdheight=2                         " height of the command bar
set completeopt=menuone,noselect
set hlsearch                            " highlight all search matches
set ignorecase                          " case insensitive search
set laststatus=2                        " always show the status bar
set mouse=a                             " active mouse
set nobackup                            " no backups
set noswapfile                          " no swap files
set nowrap                              " stop line breaking
set nowritebackup                       " write the buffer to the original file
set number                              " show line numbers
set showmatch                           " set show matching parenthesis
set splitbelow                          " :split opens below
set splitright                          " :vsplit opens right

" Error handling
set noerrorbells                        " no noise
set vb t_vb=                            " disable any beeps or flashes on error

" Tab/indent
set expandtab                           " use spaces instead of tabs
set shiftwidth=4 tabstop=4 softtabstop=4

" Display settings ------------------------------------------------------

set t_ut=                               " fix 256 colors in tmux http://sunaku.github.io/vim-256color-bce.html

set background=dark
set foldmethod=indent                   " enable folding
set foldlevel=99
set guifont=Droid\ Sans\ Mono\ for\ Powerline:h14
set guioptions-=r                       " disable scrollbars
set guioptions-=L                       " disable scrollbars
set guioptions-=e                       " disable graphic tabs
set linespace=2                         " pixel lines between chars

" Colors
colorscheme dracula

if has('termguicolor')
    set termguicolors
endif

hi LineNr ctermbg=NONE guibg=NONE

" Plugins settings ------------------------------------------------------

" Ack.vim
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'dracula'
let g:airline#extensions#ale#enabled = 1

" Ale
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'python': ['flake8']
\}
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   'elixir': ['mix_format'],
\   'javascript': ['eslint', 'prettier'],
\   'python': ['isort', 'black']
\}

" Jedi
let g:jedi#completions_enabled = 1
let g:jedi#force_py_version = 3
let g:jedi#popup_on_dot = 0
let g:jedi#use_tabs_not_buffers = 1

if has('python')
    let g:jedi#force_py_version = 2
elseif has('python3')
    let g:jedi#force_py_version = 3
endif

" ListToggle
let g:lt_height = 10

" Neosnippet
let g:neosnippet#snippets_directory='~/.vim/plugged/vim-snippets/snippets'

" NERDTree
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeIgnore = ['\.pyc$']
let g:NERDTreeRespectWildIgnore = 1
let g:NERDTreeWinSize = 45
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1
let g:NERDTreeHighlightFoldersFullName = 1

" Tern
let g:tern#arguments = ["--persistent"]
let g:tern#command = ["tern"]

" Test
let test#strategy = 'dispatch'
let test#python#runner = 'pytest'
let test#python#pytest#executable = 'pytest'

" Key Mappings ----------------------------------------------------------

nmap <silent> <F2> :call TodoList()<CR>
nmap <silent> <F6> :LToggle<CR>:ALELint<CR>
nmap <silent> <F7> :ALEFix<CR>
nmap <silent> <F8> :TagbarToggle<CR>

" Quickly edit/reload vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Disable 'Ex' mode
nnoremap Q <nop>

" Cleaning search highlights
nmap <silent> <leader>/ :nohlsearch<CR>

" Shows the current file on NERDTree
nmap <silent> <leader>\ :NERDTreeFind<CR>

" Show NERDTree 
nmap <silent> <C-\> :NERDTreeToggle<CR>

" Shows the documentation through investigate
nmap <leader>gk :call investigate#Investigate('n')<CR>

" File finder
nmap <C-p> :Files<CR>

" Search
nmap <leader>f :LAck!<space>

" Search and replace
nmap <leader>sr :%s///gci<Left><Left><Left><Left><Left>

" Select snippet
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" Performing copy/paste from clipboard
vmap <C-c> "+y
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

" Move between errors
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Run tests
nmap <leader>t :TestLast<CR>
nmap <leader>tf :TestFile<CR>
nmap <leader>tn :TestNearest<CR>
nmap <leader>ts :TestSuite<CR>
nmap <leader>tt :TestFile<CR>
nmap <leader>tv :TestVisit<CR>

if exists("$TMUX")
    nmap <leader>tt :TestFile -strategy=vimux<CR>
endif

" File type specific ----------------------------------------------------

" Javascript
au Filetype javascript nmap <leader>g :TernDefTab<CR>
au Filetype javascript nmap <leader>d :TernDefTab<CR>
au Filetype javascript nmap <leader>n :TernRefs<CR>
au Filetype javascript nmap <F5> :TestSuite<CR>
au Filetype javascript nmap <K> :TernDoc<CR>
au Filetype javascript nmap <leader>i :SortImport<CR>

" Markdown
au Filetype markdown nmap <F5> :LivedownToggle<CR>

" Python
au Filetype python nmap <leader>g :call jedi#goto()<CR>
au Filetype python nmap <leader>d :call jedi#goto_definitions()<CR>
au Filetype python nmap <leader>n :call jedi#usages()<CR>
au Filetype python nmap <leader>r :call jedi#rename<CR>
au Filetype python nmap <K> :call jedi#show_documentation()<CR>
au Filetype python nmap <F5> :TestSuite<CR>

" Functions -------------------------------------------------------------

function! TodoList()
    let old_last_winnr = winnr('$')
    cclose
    if old_last_winnr == winnr('$')
        Ack! 'TODO|FIXME'
        copen
    endif
endfunction

function! ReadLocalVimrc()
    if filereadable(".vim/config.vim")
        source .vim/config.vim
    endif
endfunction

" That's all folks ------------------------------------------------------
:call ReadLocalVimrc()
