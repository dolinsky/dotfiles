set nocompatible
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" vim-plug
call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-syntastic/syntastic'
Plug 'stephpy/vim-yaml'
Plug 'majutsushi/tagbar'
" Plug 'vim/killersheep'
call plug#end()
filetype off

" Pathogen {{{
" TODO: Move the list of disabled bundles to an external file that is easily
" manipulated via terminal/QS
" List of disabled plygins
let g:pathogen_disabled = ['supertab']

" }}}

" execute pathogen#infect()
filetype plugin indent on

" Basic options --- {{{
set encoding=utf-8
set relativenumber
set noshowmode
set showcmd
set cursorline
set ruler
set history=1000
set shell=/usr/local/bin/bash
set matchtime=3
set laststatus=2
set ttimeout
set title
set linebreak
set notimeout
set nottimeout
set autowrite
" added autoread while removing the BufEnter+redraw
set autoread
set shiftround
set backspace=indent,eol,start
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Don't add empty new lines at end of files
set binary
set noeol
" ----------- }}}

" Managing Splits --- {{{
set splitbelow
set splitright
nnoremap <silent> <leader>s :split<cr>
nnoremap <silent> <leader>v :vsplit<cr>
nnoremap <silent> <leader>q :close<cr>
" open file under cursor in a new vert split
nnoremap gf :vertical wincmd f<cr>
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
" use :dig to display usable digraphs, Ctrl-k + combo to insert
set list listchars=tab:>-,trail:…,nbsp:,extends:≫
" }}}

" Leader {{{

let mapleader = "\<Space>"
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

noremap <silent> <leader><space> :noh<cr>

nnoremap H ^
nnoremap L $
" With wrap on, handle moving along wrapped lines
noremap j gj
noremap k gk

" Keep search matches in the middle of the window and pulse the line when moving
" to them.
nnoremap n nzzzv
nnoremap N Nzzzv

" have Y act like D,C
noremap Y y$
" }}}

" Only show trailing whitespace when not in insert mode {{{
augroup trailing
    au!
    au InsertEnter * :set listchars-=trail:…
    au InsertLeave * :set listchars+=trail:…
augroup END

" }}}

" Buffers 'n saving {{{
nnoremap <Leader>w :w<cr>
set switchbuf=usetab
set wildchar=<Tab> wildmenu wildmode=list:longest,full
"set wildcharm=<c-z>
"nnoremap <leader>b :b <c-z>
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

autocmd! BufWritePost ~/.vimrc nested source %
autocmd! BufWritePost ~/.gvimrc nested source %

" save when ya need sudo perms
cnoremap <leader>ws w !sudo tee % >/dev/null

" }}}

" NERD Tree {{{
" replacing w/ netrw
nnoremap <leader>ne :Explore<cr>

let NERDTreeIgnore=['.*.pid']
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" }}}

" Command-T {{{

"nnoremap <leader>t :CommandT<cr>
"nnoremap <leader>tb :CommandTBuffer<cr>
"noremap <leader>tf :CommandTFlush<cr>
"let g:CommandTMaxHeight=30
"let g:CommandTMatchWindowReverse=1

" }}}

" CTags + TagBar + TagList {{{
" depends on `brew install ctags` already being present

" work up from current directory to find tags file to load
set tags=tags;$HOME/.vim/tags
" an alternate version of this is to create a tags folder in ~/.vim/ and then
" place generated tag files inside that ~/.vim/tags/ folder (python.ctags)

" TagBar
nnoremap <leader>tb :TagbarToggle<cr>
let g:tagbar_left = 1
noremap <C-\> :tab split<cr>:exec("tag ".expand("<cword>"))<cr>
noremap <A-]> :vsp <cr>:exec("tag ".expand("<cwords>"))<cr>

" nnoremap <leader>tl :TlistToggle<cr>

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
    "" moving filetype-specifics to .vim/ftplugin/ per http://vim.wikia.com/wiki/Keep_your_vimrc_file_clean
    "" removing json-specific in favor of https://github.com/elzr/vim-json
    "" autocmd FileType json setlocal autoindent
    "" autocmd FileType json setlocal formatoptions=tcq2l
    "" autocmd FileType json setlocal expandtab
    "" autocmd FileType json setlocal foldmethod=syntax
    " highlight chars past 120
    "" moved python to ftplugin/python.vim
    "" autocmd FileType python setlocal foldmethod=indent
    "" autocmd FileType python highlight Excess ctermbg=Grey guibg=Black
    "" autocmd FileType python match Excess /\%120v.*/
    "" autocmd FileType python set nowrap autoindent smartindent
    "" autocmd FileType conf setlocal expandtab shiftwidth=4 tabstop=4
    let g:xml_syntax_folding=1
    au FileType xml setlocal foldmethod=syntax
    " yaml indentation
    au BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
    au FileType yaml setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
augroup END

" Powerline {{{
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
" this tagbar disable doesn't work yet when lazyloading tagbar in vim-plug
" let g:powerline#extensions#tagbar#enabled = 0
" }}}

" Syntastic {{{
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatusLineFlag()}
"set statusline+=%*
"
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
let g:syntastic_debug = 0
" }}}

" CTRLP {{{
let g:ctrlp#extensions#tagbar#enabled = 0
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_show_hidden = 1
" possible extensions:
"   tag,buffertag,quickfix,dir,rtscript,undo,line,changes,mixed,bookmarkdir
let g:ctrlp_extensions = ['quickfix', 'dir', 'line', 'mixed']
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -l --hidden --vimgrep --nocolor --ignore .git -g ""'
    let g:ctrlp_use_caching = 0
    nnoremap K :grep! "\b<C-R><C-W>\b"<cr>:cw<cr>
else
    "let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard']
    let g:ctrlp_user_command = ['find %s -type f']
    let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<space>','<cr>','<2-LeftMouse'],
    \ }
endif
" }}}

" Ultisnips {{{
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<C-f>"
let g:UltiSnipsJumpBackwardTrigger="<C-b>"
" }}}