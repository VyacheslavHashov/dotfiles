" -------------------------------------
" Vundle configuration
" -------------------------------------
filetype off

if has('nvim')
    call plug#begin('~/.config/nvim/bundle')
else
    call plug#begin('~/.vim/bundle')
endif

Plug 'gmaric/Vundle.vim'
Plug 'hdima/python-syntax'
Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
Plug 'kien/ctrlp.vim'
Plug 'hynek/vim-python-pep8-indent'
Plug 'chase/vim-ansible-yaml'
Plug 'vyacheslavhashov/vim-kiwano-theme'
Plug 'ervandew/supertab'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-commentary'
Plug 'shougo/vimproc.vim', { 'do': 'make' }
Plug 'raichoo/purescript-vim'
Plug 'Shougo/neocomplete.vim'
Plug 'godlygeek/tabular'

Plug 'ernstwi/haskell-vim', { 'for': 'haskell' }
Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' }
Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }

call plug#end()
" -------------------------------------
"  Vim settings
"  ------------------------------------
" Disable vi compatibility
set nocompatible
" Switch on syntax highlighting
syntax on
" Sets how many lines of history VIM has to remember
set history=700
filetype plugin indent on
filetype on

" Set to auto read when a file is changed from the outside
set autoread

if ! exists("mapleader")
    let mapleader = ","
endif

if ! exists("g:mapleader")
    let g:mapleader = ","
endif

" Leader key timeout
set tm=2000

" Allow the normal use of "," by pressing it twice
noremap ,, ,

" Kill Ex mode
nnoremap Q <nop>

colorscheme kiwano
set t_Co=256

" Tabstops are 4 spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab

" Turn tabs into spaces
set expandtab

" Automaticaly indent
set smartindent
set autoindent

" Make the 'cw' and like commands put a $ at the end instead of just deleting
" the text and replacing it
set cpoptions=cesB$

" Show cursor all the time
set ruler

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Turn backup off
set nobackup
set nowb
set noswapfile

" Set the search scan so that it ignores case when the search is all lower
" case but recognize uppercase if it's specified
set ignorecase
set smartcase

" Fold info
set foldmethod=indent
set foldnestmax=5
set foldlevelstart=99
set foldcolumn=0

" Show matching brackets
set showmatch
set background=light
let python_highlight_all = 1
let g:python_highlight_file_headers_as_comments = 1

set visualbell t_vb=
set novisualbell
tab sball
set switchbuf=useopen

set enc=utf-8
set ls=2
" Incrementally match the search
set incsearch
set hlsearch
" Set relative line numbers
set rnu
set numberwidth=2 
set scrolloff=8
set colorcolumn=80

set hidden
set noshowmode

set completeopt=menuone,menu,longest

set wildignore+=*\\tmp\\*,*.swp,*.swo,*.zip,.git,.cabal-sandbox
set wildmode=longest,list,full
set wildmenu
" ---------------------------------------------------------
" Syntastic
" ---------------------------------------------------------

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatusLineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" ---------------------------------------------------------
"  ghc-mod
" ---------------------------------------------------------

map <Leader>tw :GhcModTypeInsert<CR>
map <Leader>ts :GhcModSplitFunCase<CR>
map <Leader>tq :GhcModType<CR>
map <Leader>te :GhcModTypeClear<CR>

" ---------------------------------------------------------
"  Supertab
" ---------------------------------------------------------
" let g:SuperTabDefaultCompletionType = '<c-x><c-o>'

" if has("gui_running")
"     imap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
" else "no gui
"     if has("unix")
"         inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x\<lt>c-o")<cr>
"     endif
" endif

"let g:haskellmode_completion_ghc = 1
"autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

"----------------------------------------------------------
" Tabular
" ---------------------------------------------------------
let g:haskell_tabular = 1

vmap a= :Tabularize /=<CR>
vmap a; :Tabularize /::<CR>
vmap a- :Tabularize /-><CR>

" ---------------------------------------------------------
" NERD Tree
"  --------------------------------------------------------
let NERDTreeIgnore=['\~$', '__pycache__', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$']

" ---------------------------------------------------------
"  Flake-8
"  --------------------------------------------------------
let g:flake8_show_quickfix=0
let g:flake8_show_in_gutter=1
autocmd BufWritePost *.py call Flake8()
highlight link Flake8_Error      ErrorMsg
highlight link Flake8_Warning    WarningMsg
highlight link Flake8_Complexity WarningMsg
highlight link Flake8_Naming     WarningMsg
highlight link Flake8_PyFlake    WarningMsg
" ---------------------------------------------------------- 
" Airline 
" ---------------------------------------------------------- 
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline_theme='sol_imp'

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
" ---------------------------------------------------------- 
" Mappings 
" ---------------------------------------------------------- 
" pressing ; will go into command mode
nnoremap ; :
map <F2> :NERDTreeToggle<CR>
" previous buffer
map <F4> :bp<cr>
imap <F4> <esc>:bp<cr>
  
" next buffer
map <F5> :bn<cr>
imap <F5> <esc>:bn<cr>

" delete current buffer
map <F10> :BD<cr>
imap <F10> <esc>:BD<cr>

" close current window
map <F9> :q<cr>
imap <F9> <esc>:q<cr>

" ---------------------------------------------------------

" Delete trailing white space on save
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc

augroup whitespace
    autocmd!
    autocmd BufWrite *.hs :call DeleteTrailingWS()
augroup END
