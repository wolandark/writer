function! VimplugInstaller()
    let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
    if empty(glob(data_dir . '/autoload/plug.vim'))
        silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
endfunction

function! SetupWim()
    call VimplugInstaller()
endfunction
call SetupWim()



"===[ Plugins ]==="
call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/seoul256.vim'
Plug 'rhysd/clever-f.vim'
Plug 'monkoose/vim9-stargate'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug '907th/vim-auto-save'
Plug 'fcpg/vim-farout'
Plug 'junegunn/vim-after-object'
call plug#end()

set nocompatible
set timeoutlen=150
set updatetime=50
"set notimeout
set emoji
set autochdir
set hidden
set modifiable
set conceallevel=0
set concealcursor=n
set scrolloff=50
set autoread
set cmdheight=1
" set foldenable
set foldmethod=manual
set foldlevel=0
set foldclose=all
set path+=**
set noswapfile
set autoindent
set ignorecase
set incsearch
set noerrorbells
set novisualbell
set t_vb=
set number
set hlsearch
set termbidi
set autowriteall
set laststatus=2
"set showtabline=2
set colorcolumn=80
set shiftwidth=4
set tabstop=4
set backspace=indent,eol,start
filetype plugin indent on

"===[ packadd ]==="
packadd comment
packadd justify
packadd matchit

"===[ Theme ]==="
set background=dark
set t_Co=256
"=== Seoul
let g:seoul256_background = 233

" Inspect $TERM instead of t_Co
if &term =~ '256color'
    " Enable true (24-bit) colors instead of (8-bit) 256 colors.
    if has('termguicolors')
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum" let &t_TI = "" let &t_TE = ""
        set termguicolors
        set mouse=a
        colorscheme seoul256
    endif
else
    let &t_TI = ""
    let &t_TE = ""
    colorscheme seoul256
endif

if has('gui_running')
    set mouse=a
    set guicursor+=a:blinkon0
    " set guifont=FiraCodeNerdFont\ 12
    set guifont=JetBrainsMono\ Nerd\ Font\ 12
    colorscheme retrobox
endif

"===[ Curosr Shape ]==="
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

"===[ Clipboard ]==="
set clipboard=unnamedplus,unnamed

"===[ Word Count ]==="
function! WordCount()
    let lines = getline(1, '$')
    let full_text = join(lines, " ")
    let words = split(full_text, '\W\+')
    let word_count = len(words)
    "echom word_count
    return "Words:" . word_count . ' '
endfunction

"===[ Mappings ]==="
let mapleader = " "

" Justify
map Q gq

inoremap <C-U> <C-G>u<C-U>

" Border Around
nnoremap <leader>\ :.!toilet -w 200 -f term -F border<CR>

" Adding empty line above and below cursor
nnoremap <leader>S :normal! O<ESC>jo<ESC>kzzk<CR>
nnoremap <leader>[ :normal! O<ESC>j
nnoremap <leader>] :normal! o<ESC>k

" Quick save and source
nnoremap <nowait><leader>w :w!<CR>
nnoremap <leader>so :w<CR>:source %<CR>

nmap <leader>k :m .-2<CR>
nmap <leader>j :m .+1<CR>
vnoremap K :m .-2<CR>gv=gv
vnoremap J :m .+1<CR>gv=gv

inoremap <nowait> jk <ESC>

" Split Navigation
set splitbelow splitright
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <C-LEFT> <C-w>h
nnoremap <C-DOWN> <C-w>j
nnoremap <C-UP> <C-w>k
nnoremap <C-RIGHT> <C-w>l


" Shift arrows to resize splits
nnoremap <s-Right> :vertical resize +5 <CR>
nnoremap <s-LEFT> :vertical resize -5 <CR>
nnoremap <s-UP> :resize +5 <CR>
nnoremap <s-DOWN> :resize -5 <CR>

nnoremap <silent><ESC> <ESC>:noh<CR><ESC>

"===[ Remember Cursor Position ]==="
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"===[ Minimal StatusLine ]==="
set statusline=%F\ %r%=%{WordCount()}


