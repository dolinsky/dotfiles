set nocompatible
filetype off

" Pathogen {{{
" TODO: Move the list of disabled bundles to an external file that is easily
" manipulated via terminal/QS
" List of disabled plygins
let g:pathogen_disabled = ['supertab']

" }}}

execute pathogen#infect()
filetype plugin indent on

" Basic options --- {{{
set encoding=utf-8
set relativenumber
set showmode
set showcmd
set cursorline
set ruler
set history=1000
set shell=/bin/bash
set matchtime=3
set laststatus=2
set ttimeout
set title
set linebreak
set notimeout
set nottimeout
set autowrite
set shiftround
" ----------- }}}

" Managing Splits --- {{{
set splitbelow
set splitright
" Navigating between splits
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
" Resize split on window resize
au VimResized * exe "normal! \<c-w>="
" Swap positions of two windows 
" http://stackoverflow.com/questions/2586984/how-can-i-swap-positions-of-two-open-files-in-splits-in-vim
" ----------- }}}

" tab, space ' wrap {{{
set autoindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set wrap
set textwidth=80
set formatoptions=qrn1w "see :help fo-table
                 "|||||_ a line that ends in a non-wc ends a par
                 "||||_ break a line before (if possible) a 1-letter word
                 "|||_ recognize num lists - see :help formatlistpat
                 "||_ auto-insert of comment leader
                 "|_ allow formatting of comments w/ "gq"
set colorcolumn=+1,+10
set lcs=tab:>-,eol:<,trail:…

" Leader {{{

let mapleader = ","
let maplocalleader = "\\"

" }}}

" Search 'n movement {{{

nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
set gdefault

noremap <silent> <leader><space> :noh<cr>

" With wrap on, handle moving along wrapped lines
noremap j gj
noremap k gk

" Keep search matches in the middle of the window and pulse the line when moving
" to them.
nnoremap n nzzzv
nnoremap N Nzzzv

" }}}

" Only show trailing whitespace when not in insert mode
augroup trailing
    au!
    au InsertEnter * :set listchars-=trail:…
    au InsertLeave * :set listchars+=trail:…
augroup END

" }}}

" Buffers 'n saving {{{
set switchbuf=usetab
set wildchar=<Tab> wildmenu wildmode=list:longest,full
"set wildcharm=<c-z>
"nnoremap <leader>b :b <c-z>

au FocusLost * :wa " autosave on lost focus
" }}}


" Color scheme {{{

syntax on
set background=dark
colorscheme solarized

" }}}

" map window cd to same as file
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>
nnoremap <leader>cl :lcd %:p:h<cr>:pwd<cr>

" Toggling Hidden Chars
nnoremap <leader>sl :set list!<cr>

" Window resizing
nnoremap <c-left> 5<c-w>>
nnoremap <c-right> 5<c-w><

" General shortcuts 'n swaps

noremap ; :
noremap : ;
inoremap fj <esc>
" strip all trailing whitespace in the current file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<cr>

" General Commands {{{

command! EV :edit ~/.vimrc
command! EG :edit ~/.gvimrc
command! EB :edit ~/.bashrc

autocmd! BufWritePost .vimrc source %
autocmd! BufWritePost .gvimrc source %

" save when ya need sudo perms
cmap w!! w !sudo tee % >/dev/null

" }}}

" NERD Tree {{{

noremap <leader>ne :NERDTree<cr>
noremap <leader>nt :NERDTreeToggle<cr>

let NERDTreeIgnore=['.*.pid']
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" }}}

" Command-T {{{

call pathogen#helptags()

noremap <leader>t :CommandT<cr>
noremap <leader>tb :CommandTBuffer<cr>
noremap <leader>tf :CommandTFlush<cr>
let g:CommandTMaxHeight=30
let g:CommandTMatchWindowReverse=1

" }}}

" CTags + TagList {{{
" depends on `brew install ctags` already being present

" work up from current directory to find tags file to load
set tags=./tags;
" an alternate version of this is to create a tags folder in ~/.vim/ and then
" place generated tag files inside that ~/.vim/tags/ folder (python.ctags)

map <C-\> :tab split<cr>:exec("tag ".expand("<cword>"))<cr>
map <A-]> :vsp <cr>:exec("tag ".expand("<cwords>"))<cr>

noremap <leader>tl :TlistToggle<cr>

" }}}

" ZoomWin {{{

"noremap <leader><leader> :ZoomWin<cr>

" }}}

" filetype highlighting {{{
augroup vagrant
    au!
    au BufRead,BufNewFile Vagrantfile set ft=ruby
augroup END
" }}}

augroup autocmds
    au!
    " highlight chars past 120
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%120v.*/
    autocmd FileType python set nowrap
augroup END

" Powerline {{{
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
" }}}
