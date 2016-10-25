" My Vimrc file
" Maintainer: www.klauslaube.com.br
" License: www.opensource.org/licenses/bsd-license.php
" ----------------------------------------------------------------------------

set nocompatible
call plug#begin('~/.vim/plugged')

" Let Plug manage -------------------------------------------------------

" Libs
Plug 'tpope/vim-sensible'

" Code standards and completion
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/syntastic'
Plug 'ternjs/tern_for_vim', {'do': 'npm install tern', 'for': 'javascript'}
Plug 'fisadev/vim-isort', {'do': 'pip install isort', 'for': ['python', 'python3']}
Plug 'tpope/vim-rails', {'for': 'ruby'}
Plug 'Valloric/YouCompleteMe'
Plug 'vim-ruby/vim-ruby', {'for': 'ruby'}

" Display
Plug 'bronson/vim-trailing-whitespace'
Plug 'glench/vim-jinja2-syntax'
Plug 'IN3D/vim-raml'
Plug 'majutsushi/tagbar'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nathanaelkane/vim-indent-guides'

" File explorer
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dkprice/vim-easygrep'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin' | Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-abolish'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Misc
Plug 'easymotion/vim-easymotion'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'janko-m/vim-test'
Plug 'jmcantrell/vim-virtualenv'
Plug 'scrooloose/nerdcommenter'

call plug#end()

" General Settings -----------------------------------------------------------

let mapleader=','
let g:mapleader=','

set clipboard=unnamed
set completeopt-=preview
set copyindent                          " copy the previous indentation on autoindenting
set hlsearch                            " highlight search result
set guioptions-=T                       " turn off GUI toolbar
set guioptions-=m                       " turn off GUI menu
set guioptions-=r                       " turn off GUI right scrollbar
set guioptions-=L                       " turn off GUI left scrollbar
set guioptions-=e                       " turn off GUI tabs
set guioptions-=b
set ignorecase                          " case insensitive search
set linespace=1
set modeline
set modelines=5 nowrap
set nobackup                            " no backups
set noerrorbells                        " no noise
set noswapfile                          " no swap files
set nowritebackup                       " write the buffer to the original file
set number                              " show line numbers
set pastetoggle=<F10>                   " toggle between paste and normal: for 'safer' pasting from keyboard
set showmatch                           " set show matching parenthesis
set splitbelow                          " :split opens below
set splitright                          " :vsplit opens right
set vb t_vb=                            " disable any beeps or flashes on erro


" Tab/indent
set expandtab                           " use spaces instead of tabs
set shiftwidth=4 tabstop=4 softtabstop=4

" Plugin Settings ------------------------------------------------------------

" Ag
let g:ag_highlight=1
let g:ag_working_path_mode='r'

" Airline
let g:airline_powerline_fonts=1
let g:airline_theme='gruvbox'

" CtrlP
let g:ctrlp_clear_cache_on_exit=1
let g:ctrlp_match_window='bottom,order:ttb,min:1,max:10,results:10'
let g:ctrlp_max_height=20
let g:ctrlp_max_files=5000
let g:ctrlp_user_command=['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_working_path_mode='r'

" Markdown
let vim_markdown_preview_github=1
let vim_markdown_preview_hotkey='<C-m>'

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
let g:syntastic_mode_map={'passive_filetypes': ['sass', 'scss']}
let g:syntastic_warning_symbol='⚠'

let g:syntastic_javascript_checkers=['jshint']
let g:syntastic_json_checkers=['jsonlint']
let g:syntastic_lua_checkers=['luacheck']
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args='--ignore=E501'
let g:syntastic_scss_checkers = ['scss_lint']

" Test
let test#python#nose#options='--logging-clear-handlers'

" Languages ------------------------------------------------------------------

" HTML/Jinja
au BufNewFile,BufRead *.html.desktop    setlocal ft=jinja
au BufNewFile,BufRead *.html.tablet     setlocal ft=jinja
au BufNewFile,BufRead *.html.smart      setlocal ft=jinja
au FileType jinja setlocal omnifunc=htmlcomplete#CompleteTags

" Javascript
"au FileType javascript setlocal omnifunc=tern#Complete
au FileType javascript let g:syntastic_javascript_checkers = findfile('.eslintrc', '.;') != '' ? ['eslint'] : ['standard']

" Markdown

" GUI Settings ---------------------------------------------------------------

set background=dark
colorscheme gruvbox

if has("gui_running")
    set guicursor=a:blinkoff0-blinkwait0
endif

if has("gui_macvim")
    set guifont=Droid\ Sans\ Mono\ for\ Powerline:h15
endif

" Key Mappings ---------------------------------------------------------------

" Quickly edit/reload vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Performing searches with Ag
nmap <leader>f :Ag!<space>
nmap <leader>f, :Ag! <cword><CR>

" Cleaning search highlights
nmap <silent> <leader>/ :nohlsearch<CR>

" Show the current file on NERDTree
nmap <silent> <leader>v :NERDTreeFind<CR>

" Useful shortcuts
nmap <silent> <F2> :NERDTreeTabsToggle<CR>
nmap <silent> <F6> :SyntasticCheck<CR>
nmap <silent> <F7> :<C-u>call ToggleErrors()<CR>
nmap <silent> <F8> :TagbarToggle<CR>

" Functions ------------------------------------------------------------------

function! ToggleErrors()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
        " Nothing was closed, open syntastic error location panel
        SyntasticCheck
        Errors
    endif
endfunction
