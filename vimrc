"===[ Automatic Plugin Installation ]==="
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

"===[ Encoding ]==="
set encoding=utf-8

"===[ Plugins ]==="
call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim', {'for':'text'}
Plug 'junegunn/limelight.vim', {'for':'text'}
Plug 'junegunn/seoul256.vim'
Plug 'rhysd/clever-f.vim'
Plug 'monkoose/vim9-stargate'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular', {'for':['text', 'markdown']}
Plug '907th/vim-auto-save'
Plug 'fcpg/vim-farout'
Plug 'wolandark/vimdict'
Plug 'wolandark/vim-ddgpb'
Plug 'ron89/thesaurus_query.vim', {'for':'text'}
Plug 'dpelle/vim-LanguageTool', {'for':['text', 'markdown']}
Plug 'https://github.com/sedm0784/vim-you-autocorrect.git', {'for':'text'}
Plug 'mbbill/undotree'
call plug#end()

"===[ Options ]==="
set nocompatible
set notimeout
" set timeoutlen=150
set updatetime=50
set emoji
set autochdir
set hidden
set modifiable
set conceallevel=0
set concealcursor=n
set scrolloff=50
set autoread
set cmdheight=1
set foldenable
set foldmethod=marker
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
set showtabline=2
set colorcolumn=80
set textwidth=80
set shiftwidth=4
set tabstop=4
set backspace=indent,eol,start
set nowrap
set list
set listchars=tab:▸\ ,trail:·
set wildmode=longest,list,full
filetype plugin indent on

"===[ Theme ]==="
set background=dark
set t_Co=256

"=== Seoul background contrast
let g:seoul256_background = 233

"=== Setting the theme with good colors
if &term =~ '256color'
	" Enable true (24-bit) colors instead of (8-bit) 256 colors.
	if has('termguicolors')
		let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
		let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
		let &t_TI = ""
		let &t_TE = ""
		set termguicolors
		set mouse=a
		colorscheme seoul256
	endif
else
	let &t_TI = ""
	let &t_TE = ""
	colorscheme seoul256
endif

"=== GUI settings
if has('gui_running')
    set mouse=a
    set guicursor+=a:blinkon0
    " set guifont=FiraCodeNerdFont\ 12
    set guifont=JetBrainsMono\ Nerd\ Font\ 12
    colorscheme seoul256
endif

"===[ Curosr Shape ]==="
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

"===[ Clipboard ]==="
set clipboard=unnamedplus,unnamed

"===[ NETRW ]==="
" Start with dotfiles hidden
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
" Usual things
let g:netrw_special_syntax = 3
let g:netrw_banner = 0
let g:netrw_keepdir=0

"===[ Word Count ]==="
let g:word_count = 0

function! UpdateWordCount()
    let lines = getline(1, '$')
    let full_text = join(lines, " ")
    let words = split(full_text, '\W\+')
    let g:word_count = len(words)
endfunction

augroup WordCount
    autocmd!
    autocmd BufReadPost,BufWritePost,TextChanged,TextChangedI * call UpdateWordCount()
augroup END

"===[ Minimal StatusLine ]==="
" set statusline=%F\ %r%=%{WordCount()}
highlight StatusLine guifg=#3f3f3f guibg=#ffffff
highlight StatusLineNC guifg=#3f3f3f guibg=#ffffff
set statusline=%F\ %r%=%{g:word_count}w\ %l/%L

"===[ UndoTree ]==="
if has("persistent_undo")
   let target_path = expand('~/.vim/undodir')

    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call mkdir(target_path, "p", 0700)
    endif

    let &undodir=target_path
    set undofile
endif
nnoremap <F5> :UndotreeToggle<CR>

"===[ Mappings ]==="
let mapleader = " "

"=== Auto Save
nnoremap <nowait>\a :call AutoSaveToggle()<CR>

"=== Justify
" format text
nnoremap Q mmgqG`m 
" yank to end of line
nnoremap Y y$
" yank whole file
nnoremap YA :%y

" Tab to complete
inoremap <Tab> <C-n>
"Shift Tab to complete in reverse
inoremap <S-Tab> <C-p>

"Undo
inoremap <C-U> <C-G>u<C-U>

"=== Border Around
nnoremap <leader>\ :.!toilet -w 200 -f term -F border<CR>

"=== Adding empty line above and below cursor
nnoremap <leader>S :normal! O<ESC>jo<ESC>kzzk<CR>
nnoremap <leader>[ :normal! O<ESC>j
nnoremap <leader>] :normal! o<ESC>k

"=== Quick save and source
nnoremap <nowait><leader>w :w!<CR>
nnoremap <leader>so :w<CR>:source %<CR>

nmap <leader>k :m .-2<CR>
nmap <leader>j :m .+1<CR>
vnoremap K :m .-2<CR>gv=gv
vnoremap J :m .+1<CR>gv=gv

inoremap <nowait> jj <ESC>

"=== Split Navigation
set splitbelow splitright
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <C-LEFT> <C-w>h
nnoremap <C-DOWN> <C-w>j
nnoremap <C-UP> <C-w>k
nnoremap <C-RIGHT> <C-w>l

"=== Shift arrows to resize splits
nnoremap <s-Right> :vertical resize +5 <CR>
nnoremap <s-LEFT> :vertical resize -5 <CR>
nnoremap <s-UP> :resize +5 <CR>
nnoremap <s-DOWN> :resize -5 <CR>

nnoremap <silent><ESC> <ESC>:noh<CR><ESC>

" Dictionary needs dictd 
nnoremap <F2> :Dict <CR>
" Search visuall selection in ddg
nnoremap <F3> :DDGV <CR>

"=== FZF
nnoremap \co :Colors<CR>
" nnoremap <nowait><leader>b :Buffers<CR>
" nnoremap <nowait><leader>ff :Files<CR>
" nnoremap <nowait><leader>W :Windows<CR>
" nnoremap <nowait><leader>h :History<CR>
" nnoremap <nowait><leader>hc :History:<CR>
" nnoremap <nowait><leader>rg :Rg <CR>
" nnoremap <nowait><leader>li :Lines <CR>
" nnoremap <nowait><leader>bli :BLines <CR>
" nnoremap <nowait><leader>ju :Jumps <CR>
" nnoremap <nowait><leader>ma :Marks <CR>
" nnoremap <nowait><leader>M :Maps <CR>
" nnoremap <nowait><leader>sn :Snippets <CR>
" nnoremap <nowait><leader>com :Commands <CR>
" nnoremap <nowait><leader>ag :Ag <CR>
" nnoremap <nowait><leader>tag :Tags <CR>

"===[ Remember Cursor Position ]==="
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"===[ Stargate ]==="
"=== For 1 character to search before showing hints
noremap \f <Cmd>call stargate#OKvim(1)<CR>

"=== For 2 consecutive characters to search
noremap \F <Cmd>call stargate#OKvim(2)<CR>

let g:stargate_name = 'Master of The Arcane Art of Vim, I Beg Thee'
" Instead of 1 or 2 you can use any higher number, but it isn't much practical
" and it is easier to use `/` or `?` for that

"===[ languagetool ]==="
let g:languagetool_jar='$HOME/.vim/languagetool/LanguageTool-5.2/languagetool-commandline.jar'

"===[ thesaurus ]==="
let g:tq_enabled_backends=["mthesaur_txt"]

"===[ Spell ]==="
function FixSpell()
	normal! 1z=
endfunction

command! FixSpell call FixSpell()
nnoremap gs :FixSpell<CR>

nnoremap <F6> :setlocal spell! spelllang=en_us<CR>

"Spell bad next
nnoremap ]g ]s
"Spell bad prev
nnoremap [g [s

"===[ packadd ]==="
packadd comment
packadd justify
packadd matchit

iabbrev hr ⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯
iabbrev hrd ══════════════════════════════════════════════════════════════════════════════

