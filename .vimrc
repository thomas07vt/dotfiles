" Use Vim settings, rather then Vi settings. This setting must be as early as
" possible, as it has side effects.
set nocompatible
set encoding=utf-8
scriptencoding utf-8

" VimPlug
" To install for the first time, run :PlugInstall
" To update your plugins, run :PlugUpdate
" To remove undeclared plugins run :PlugClean
call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'rust-lang/rust.vim'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'groenewege/vim-less'
Plug 'prettier/vim-prettier'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'thoughtbot/vim-rspec'
Plug 'jremmen/vim-ripgrep'
Plug 'slim-template/vim-slim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'kchmck/vim-coffee-script'
Plug 'tpope/vim-liquid'
Plug 'tpope/vim-surround'
Plug 'posva/vim-vue'
Plug 'sjl/gundo.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'yssl/QFEnter'
Plug 'jeetsukumaran/vim-buffergator'

call plug#end()

" Leader
let mapleader='\'

set backspace=2     " Backspace deletes like most programs in insert mode
set nobackup        " No backup files
set nowritebackup   " No write backup files
set noswapfile      " No swap files
set history=50      " How many commands to remember
set ruler           " Show the cursor position all the time
set incsearch       " do incremental searching
set hlsearch        " Highlight search terms
set laststatus=2    " Always display the status line
set autowrite       " Automatically :write before running commands
set tabstop=2       " Softtabs, 2 spaces
set shiftwidth=2    " Number of spaces to use for autoindenting
set shiftround      " Use multiple of shiftwidth when indenting with '<' and '>'
set colorcolumn=81  " Make it obvious where 80 characters is
set splitbelow      " Open new split panes to right and bottom, which feels more natural
set expandtab       " Expand tabs to spaces.
set background=dark " Set background to dark
set number          " Use line numbers
set numberwidth=4   " Width of gutter column
set splitright      " Open new split panes to right and bottom, which feels more natural
set scrolloff=5     " Add padding when scrolling to see what is around the cursor
set list listchars=tab:»·,trail:·,nbsp:· " Display extra whitespace

" FzF
set rtp+=/home/linuxbrew/.linuxbrew/opt/fzf
nnoremap <C-p> :Files<CR>

colorscheme monokai

syntax on " Syntax highlighting on
highlight NonText guibg=#060606
highlight Folded  guibg=#0A0A0A guifg=#9090D0

" Move cursor by display lines when wrapping
nnoremap j gj
nnoremap k gk

" Strip all trailing whitespace in the current file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Fold tag function
" Change
"   <div>
"   </div>
" To
"   +----- 2 lines: <div>-----------
"
" Use 'zo' to open, or just go into insert mode
" nnoremap <leader>ft Vatzf

" Edit .vimrc
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
" Source .vimrc
nnoremap <leader>sv :so $MYVIMRC<CR>

" Open a new vertical split
" nnoremap <leader>w <C-w>v<C-w>l
" I often hit q instead of w
nnoremap <leader>w :vnew<cr>
nnoremap <leader>q :vnew<cr>

" Open a new horizontal split
" nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>i :new<cr>

" ctrl-f now escaps from insert mode
" and all the others are just cause I always hit them :)
imap <C-f> <Esc>
nmap <C-f> <Esc>
nmap <S-f> <Esc>

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
" Insert tab in normal mode
nnoremap <Tab> A<c-r>="\<tab>"<cr>
" Show tab complete popup
inoremap <S-Tab> <c-normal>

inoremap <leader>erb <%= %><ESC>2h i
nnoremap <leader>erb i<%= %><ESC>2h i
inoremap <leader>div <div class=""></div><ESC>6h i
nnoremap <leader>div i<div class=""></div><ESC>6h i
inoremap <leader>span <span class=""></span><ESC>7h i
nnoremap <leader>span i<span class=""></span><ESC>7h i
inoremap <leader>p <p class=""></p><ESC>4h i
nnoremap <leader>p i<p class=""></p><ESC>4h i
inoremap <leader>section <section class=""></section><ESC>10h i
nnoremap <leader>section i<section class=""></section><ESC>10h i

nnoremap <leader>\ :Tabularize /

" vim-rspec mappings
nnoremap <Leader>t :call RunCurrentSpecFile()<CR>
nnoremap <Leader>s :call RunNearestSpec()<CR>
nnoremap <Leader>l :call RunLastSpec()<CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Move windows around
" nnoremap <C-w>j <C-w>J
" nnoremap <C-w>k <C-w>K
" nnoremap <C-w>h <C-w>H
" nnoremap <C-w>l <C-w>L

" Copy/Paste
vmap <C-c> "+y
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+
" copy word
nnoremap <leader>cw "+yiw
" copy page
nnoremap <leader>cp ggv<S-g><S-$>"+y

" Copy Whole Line in normal mode
" I still want to be able to get into visual block
nnoremap <S-v> <C-v>
nmap <C-c> "+yy
nmap <C-v> c<ESC>"+p

" I don't like to hit shift all the time so I am switching colon and semicolon
" I don’t remap : back to ; because it seems to break a bunch of plugins.
nmap ; :

" scroll by 10/30 at a time
map <S-j> 10j
map <S-k> 10k
map <S-h> 30h
map <S-l> 30l

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Exclude Javascript files in :Rtags via rails.vim due to warnings when parsing
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

" Set spellfile to location that is guaranteed to exist, can be symlinked to
" Dropbox or kept in Git and managed outside of thoughtbot/dotfiles using rcm.
set spellfile=$HOME/.vim-spell-en.utf-8.add

" Always use vertical diffs
set diffopt+=vertical

filetype plugin indent on

augroup vimrcEx
  autocmd!

  " Markdown
  " Recognize *.md as markdown files
  " .md is used for Modula 2 files, but I don't care about those
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile *.c set filetype=c

  " Enable spellchecking for Markdown
  autocmd FileType markdown setlocal spell

  autocmd FileType c setlocal noexpandtab

  " Gitcommit
  " Automatically wrap at 72 characters and spell check git commit messages
  autocmd FileType gitcommit setlocal textwidth=72
  autocmd FileType gitcommit setlocal spell
  autocmd FileType gitcommit setlocal colorcolumn=73

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Stylesheets
  " Allow stylesheets to autocomplete hyphenated words
  autocmd FileType css,scss,sass setlocal iskeyword+=-

  " Set .ejs syntax highlighting to match html
  autocmd BufNewFile,BufRead *.ejs set filetype=html
augroup END

" Template section
function! Vue()
    " ~/vim/templates/vue is the path to the .vue template file
    r~/.vim/templates/vue
endfunction
inoremap <leader>vue <ESC>:call Vue()<CR>i
nnoremap <leader>vue :call Vue()<CR>

function! Vuex()
    " ~/vim/templates/vue is the path to the .vue template file
    r~/.vim/templates/vuex
endfunction
inoremap <leader>vuex <ESC>:call Vuex()<CR>i
nnoremap <leader>vuex :call Vuex()<CR>

function! WhoisExpected()
    " ~/vim/templates/vue is the path to the .vue template file
    r~/.vim/templates/expected
endfunction
inoremap <leader>expected <ESC>:call WhoisExpected()<CR>i
nnoremap <leader>expected :call WhoisExpected()<CR>


" Vim rails helpers
inoremap <leader>av <ESC>:AV
nnoremap <leader>av :AV<CR>
inoremap <leader>rv <ESC>:RV
nnoremap <leader>rv :RV<CR>
inoremap <leader>ai <ESC>:AS
nnoremap <leader>ai :AS<CR>
inoremap <leader>ri <ESC>:RS
nnoremap <leader>ri :RS<CR>

" Rg helper
inoremap <leader>g <ESC>:Rg<Space>
nnoremap <leader>g :Rg<Space>

" NERDTree
map <C-n> :NERDTreeToggle<CR> " NERDTree shortcue
let g:NERDTreeShowHidden=1 " Show hidden files

" pry
nnoremap <leader>pry ibinding.pry

" move whole lines in visual mode
" move selected lines up one line
xnoremap <C-k>  :m-2<CR>gv=gv
" move selected lines down one line
xnoremap <C-j> :m'>+<CR>gv=gv

" don't run prettier on save, instead use <leader>f when neaded
let g:prettier#exec_cmd_path = "~/.config/yarn/global/node_modules/.bin/prettier"
let g:prettier#autoformat = 0
nmap <leader>f :Prettier<CR>

" Gundo
nnoremap <leader>u :GundoToggle<CR>

" SplitJoin
nnoremap gs :SplitjoinSplit<CR>
nnoremap gj :SplitjoinJoin<CR>

