" My Vimrc file
" Maintainer: www.klauslaube.com.br
" License: www.opensource.org/licenses/bsd-license.php
" ----------------------------------------------------------------------------

set nocompatible
call plug#begin('~/.vim/plugged')


" Let's Plug manage -----------------------------------------------------

" Common libs
Plug 'skywind3000/asyncrun.vim'
Plug 'tpope/vim-sensible'

" Code completion
Plug 'davidhalter/jedi-vim', { 'do': 'pip install jedi' }
Plug 'maralla/completor.vim'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install -g tern' }

" Code standards
Plug 'bronson/vim-trailing-whitespace'
Plug 'editorconfig/editorconfig-vim'
Plug 'w0rp/ale'

" Display
Plug 'glench/vim-jinja2-syntax'
Plug 'majutsushi/tagbar'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'sheerun/vim-polyglot'
Plug 'shime/vim-livedown', { 'do': 'npm install -g livedown' }
Plug 'tomasr/molokai'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" File explorer
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dkprice/vim-easygrep'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin' | Plug 'jistr/vim-nerdtree-tabs'

" Git integration
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

" Misc
Plug 'keith/investigate.vim'
Plug 'janko-m/vim-test'
Plug 'Valloric/ListToggle'
Plug 'terryma/vim-multiple-cursors'

call plug#end()


" General settings ------------------------------------------------------

let mapleader = ','

set exrc                                " alow per project settings
set guioptions-=r                       " disable scrollbars
set guioptions-=L                       " disable scrollbars
set ignorecase                          " case insensitive search
set linespace=1
set modeline
set modelines=5 nowrap
set nobackup                            " no backups
set noerrorbells                        " no noise
set noswapfile                          " no swap files
set nowritebackup                       " write the buffer to the original file
set number                              " show line numbers
set showmatch                           " set show matching parenthesis
set splitbelow                          " :split opens below
set splitright                          " :vsplit opens right
set vb t_vb =                           " disable any beeps or flashes on erro

" Tab/indent
set expandtab                           " use spaces instead of tabs
set shiftwidth=4 tabstop=4 softtabstop=4

" GUI
set background=dark
set guifont=Droid\ Sans\ Mono:h13
set termguicolors
colorscheme molokai

let g:rehash256 = 1


" Plugins settings ------------------------------------------------------

" Ag
let g:ag_highlight = 1
let g:ag_working_path_mode = 'r'

" Airline
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'
let g:airline_theme = 'molokai'

" Ale
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'

" Completor
let g:completor_python_binary = 'python'
let g:completor_node_binary = 'node'

" CtrlP
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:10,results:10'
let g:ctrlp_max_height = 20
let g:ctrlp_max_files = 5000
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_working_path_mode='r'

" Investigate
let g:investigate_use_dash = 1

" Jedi
let g:jedi#completions_enabled = 0
let g:jedi#use_tabs_not_buffers = 1

" ListToggle
let g:lt_location_list_toggle_map = '<F7>'

" NERDTree
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeIgnore = ['\.pyc$']
let g:NERDTreeRespectWildIgnore = 1
let g:NERDTreeWinSize = 30
let g:NERDTreeMinimalUI = 1

" Tern for Vim
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

" Test
let test#strategy = 'asyncrun'
let test#python#runner = 'pytest'
let test#python#pytest#executable = 'pytest'


" Key Mappings ----------------------------------------------------------

" Quickly edit/reload vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Performing searches with Ag
nmap <leader>f :Ag!<space>

" Search and replace
nmap <leader>sr :%s///gci<Left><Left><Left><Left><Left>

" Cleaning search highlights
nmap <silent> <leader>/ :nohlsearch<CR>

" Shows the current file on NERDTree
nmap <silent> <leader>v :NERDTreeFind<CR>

" Shows the documentation through investigate
nmap <leader>gk :call investigate#Investigate('n')<CR>

" Completion settings
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"

" Run tests
nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>t :TestLast<CR>
nmap <silent> <leader>tv :TestVisit<CR>

" Useful shortcuts
nmap <silent> <F2> :NERDTreeTabsToggle<CR>
nmap <silent> <F3> :<C-u>call TodoList()<CR>
nmap <silent> <F5> :LivedownToggle<CR>
nmap <silent> <F6> :ALELint<CR>
nmap <silent> <F8> :TagbarToggle<CR>


" Languages -------------------------------------------------------------

" Javascript
au BufReadPost *.js set syntax=javascript
au Filetype javascript nmap <leader>g :TernDefTab<CR>
au Filetype javascript nmap <leader>d :TernDefTab<CR>
au Filetype javascript nmap <leader>n :TernRefs<CR>
au Filetype javascript nmap <K> :TernDoc<CR>

" Python
au Filetype python nmap <leader>g :call jedi#goto()<CR>
au Filetype python nmap <leader>d :call jedi#goto_definitions()<CR>
au Filetype python nmap <leader>n :call jedi#usages()<CR>
au Filetype python nmap <K> :call jedi#show_documentation()<CR>


" Functions -------------------------------------------------------------

function! TodoList()
    let old_last_winnr = winnr('$')
    cclose
    if old_last_winnr == winnr('$')
        Ag! 'TODO|FIXME'
        copen
    endif
endfunction

set secure                              " make vim secure again
