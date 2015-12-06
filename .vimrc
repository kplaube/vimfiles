" My Vimrc file
" Maintainer: www.klauslaube.com.br
" License: www.opensource.org/licenses/bsd-license.php
" ----------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')


" Let NeoBundle manage -------------------------------------------------------

Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'bling/vim-airline'
Plug 'bronson/vim-trailing-whitespace'
Plug 'editorconfig/editorconfig-vim'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'janko-m/vim-test'
Plug 'kien/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/syntastic'
Plug 'ternjs/tern_for_vim', {'do': 'npm install -g tern' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'vitaly/vim-gitignore'

call plug#end()


" General Settings ------------------------------------------------------------

colorscheme solarized

let mapleader=','
let g:mapleader=','

set background=dark
set hlsearch                            " highlight search result
set guioptions-=T                       " turn off GUI toolbar
set guioptions-=m                       " turn off GUI menu
set guioptions-=r                       " turn off GUI right scrollbar
set guioptions-=L                       " turn off GUI left scrollbar
set ignorecase                          " case insensitive search
set nobackup                            " no backups
set noerrorbells                        " no noise
set noswapfile                          " no swap files
set novisualbell                        " no blinking
set nowritebackup                       " write the buffer to the original file
set number                              " show line numbers
set pastetoggle=<F10>                   " toggle between paste and normal: for 'safer' pasting from keyboard
set splitbelow                          " :split opens below
set splitright                          " :vsplit opens right
set ttyfast                             " improves redrawing
set vb t_vb=                            " disable any beeps or flashes on erro

" Tab/indent
set expandtab                           " use spaces instead of tabs
set shiftwidth=4 tabstop=4 softtabstop=4


" Languages ------------------------------------------------------------------

" HTML
au BufNewFile,BufRead *.html.desktop    setlocal ft=jinja
au BufNewFile,BufRead *.html.tablet     setlocal ft=jinja
au BufNewFile,BufRead *.html.smart      setlocal ft=jinja


" Shortcuts ------------------------------------------------------------------

nmap <F2> :NERDTreeToggle<CR>
nmap <F7> :Errors<CR>
nmap <F8> :TagbarToggle<CR>
nmap <Leader>f :Ag<space>


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
let g:ctrlp_max_files=50000
let g:ctrlp_clear_cache_on_exit=1
let g:ctrlp_working_path_mode='r'

" Markdown Preview
let vim_markdown_preview_github=1
let vim_markdown_preview_hotkey='<C-m>'

" NERDTree
let g:nerdtree_tabs_open_on_gui_startup=1
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
    set guifont=Droid\ Sans\ Mono\ for\ Powerline:h14
    set transparency=4
endif
