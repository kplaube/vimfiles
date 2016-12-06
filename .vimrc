" My Vimrc file
" Maintainer: www.klauslaube.com.br
" License: www.opensource.org/licenses/bsd-license.php
" ----------------------------------------------------------------------------

set nocompatible
call plug#begin('~/.vim/plugged')


" Let's Plug manage -----------------------------------------------------

" Code completion
Plug 'davidhalter/jedi-vim'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install -g tern' }

" Code standards
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/syntastic'

" Display
Plug 'bronson/vim-trailing-whitespace'
Plug 'glench/vim-jinja2-syntax'
Plug 'majutsushi/tagbar'
Plug 'morhetz/gruvbox'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'

" File explorer
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dkprice/vim-easygrep'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin' | Plug 'jistr/vim-nerdtree-tabs'

" Git integration
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Misc
Plug 'janko-m/vim-test'

if has('nvim')
    " Code completion
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'carlitux/deoplete-ternjs'
    Plug 'zchee/deoplete-jedi'
else
    " Libs
    Plug 'tpope/vim-sensible'
endif

call plug#end()


" General settings ------------------------------------------------------

let mapleader=','

set clipboard=unnamed
set completeopt-=preview
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
set vb t_vb=                            " disable any beeps or flashes on erro

" Tab/indent
set expandtab                           " use spaces instead of tabs
set shiftwidth=4 tabstop=4 softtabstop=4

" GUI
set background=dark
colorscheme gruvbox


" Neovim specific settings ----------------------------------------------

let g:python_host_prog='/Users/klaus/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog='/Users/klaus/.pyenv/versions/neovim3/bin/python'


" VIM specific settings -------------------------------------------------

if !has('nvim')
    set ttymouse=xterm2
endif


" Plugins settings ------------------------------------------------------

" Ag
let g:ag_highlight=1
let g:ag_working_path_mode='r'

" Airline
let g:airline#extensions#tabline#enabled=2
let g:airline#extensions#tabline#fnamemod=':t'
let g:airline#extensions#tabline#left_sep=' '
let g:airline#extensions#tabline#left_alt_sep='|'
let g:airline#extensions#tabline#right_sep=' '
let g:airline#extensions#tabline#right_alt_sep='|'
let g:airline_left_sep=' '
let g:airline_left_alt_sep='|'
let g:airline_right_sep=' '
let g:airline_right_alt_sep='|'
let g:airline_theme='gruvbox'

" CtrlP
let g:ctrlp_clear_cache_on_exit=1
let g:ctrlp_match_window='bottom,order:ttb,min:1,max:10,results:10'
let g:ctrlp_max_height=20
let g:ctrlp_max_files=5000
let g:ctrlp_user_command=['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_working_path_mode='r'

" Deoplete
let g:deoplete#enable_at_startup=1

" Deoplete-tern
let g:tern_request_timeout=1
let g:tern_show_signature_in_pum='0'

" GitGutter
let g:gitgutter_max_signs=1000

" Jedi
let g:jedi#completions_enabled=0
let g:jedi#use_tabs_not_buffers=1

" NERDTree
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeDirArrows=1
let g:NERDTreeRespectWildIgnore=1
let g:NERDTreeWinSize=30
let g:NERDTreeMinimalUI=1
let g:nerdtree_tabs_open_on_gui_startup=1
let g:nerdtree_tabs_open_on_new_tab=0
let g:nerdtree_tabs_autoclose=1

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list=0
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_highlighting=1
let g:syntastic_error_symbol='✗'
let g:syntastic_mode_map={'passive_filetypes': ['sass', 'scss', 'scala']}
let g:syntastic_warning_symbol='⚠'

let g:syntastic_javascript_checkers=['jshint']
let g:syntastic_json_checkers=['jsonlint']
let g:syntastic_lua_checkers=['luacheck']
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args='--ignore=E501'
let g:syntastic_scss_checkers = ['scss_lint']

" Tern for Vim
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

" Test
let test#python#nose#options='--logging-clear-handlers'


" Key Mappings ----------------------------------------------------------

" Quickly edit/reload vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Performing searches with Ag
nmap <leader>f :Ag!<space>

" Cleaning search highlights
nmap <silent> <leader>/ :nohlsearch<CR>

" Show the current file on NERDTree
nmap <silent> <leader>v :NERDTreeFind<CR>

" Useful shortcuts
nmap <silent> <F2> :NERDTreeTabsToggle<CR>
nmap <silent> <F6> :SyntasticCheck<CR>
nmap <silent> <F7> :<C-u>call ToggleErrors()<CR>
nmap <silent> <F8> :TagbarToggle<CR>


" Languages -------------------------------------------------------------

" Javascript
au FileType javascript let g:syntastic_javascript_checkers = findfile('.eslintrc', '.;') != '' ? ['eslint'] : ['standard']
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

function! ToggleErrors()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
        " Nothing was closed, open syntastic error location panel
        SyntasticCheck
        Errors
    endif
endfunction
