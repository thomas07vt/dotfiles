" Use Vim settings, rather then Vi settings. This setting must be as early as
" possible, as it has side effects.
set nocompatible

" Running Pathogen
execute pathogen#infect()

" Leader
let mapleader='\'

set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
" set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set tabstop=2     " Softtabs, 2 spaces
set shiftwidth=2
set shiftround
set expandtab
set background=dark
set number
set numberwidth=5
set list listchars=tab:»·,trail:·,nbsp:· " Display extra whitespace
set hlsearch                             " Highlight search terms
set colorcolumn=81                       " Make it obvious where 80 characters is
set number
set numberwidth=5
set splitbelow " Open new split panes to right and bottom, which feels more natural
set splitright " Open new split panes to right and bottom, which feels more natural
colorscheme monokai

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
nnoremap <leader>ft Vatzf

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
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

" Insert tab in normal mode
nnoremap <Tab> A<c-r>="\<tab>"<cr>

" Index ctags from any project, including those outside Rails
" TODO: What does this do? Do I need this?
map <Leader>ct :!ctags -R .<CR>

inoremap <leader>erb <%= %><ESC>2h i
nnoremap <leader>erb i<%= %><ESC>2h i
inoremap <leader>div <div></div><ESC>6h i
nnoremap <leader>div i<div></div><ESC>6h i
inoremap <leader>span <span></span><ESC>7h i
nnoremap <leader>span i<span></span><ESC>7h i
inoremap <leader>p <p></p><ESC>4h i
nnoremap <leader>p i<p></p><ESC>4h i

nnoremap <leader>\ :Tabularize /

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" vim-rspec mappings
nnoremap <Leader>t :call RunCurrentSpecFile()<CR>
nnoremap <Leader>s :call RunNearestSpec()<CR>
nnoremap <Leader>l :call RunLastSpec()<CR>

" Run commands that require an interactive shell
nnoremap <Leader>r :RunInInteractiveShell<space>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

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

" Add padding when scrolling to see what is below or above cursor
set scrolloff=5

" scroll by 10 at a time
map <S-j> 10j
map <S-k> 10k
map <S-h> 30h
map <S-l> 30l

" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Exclude Javascript files in :Rtags via rails.vim due to warnings when parsing
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

" Set spellfile to location that is guaranteed to exist, can be symlinked to
" Dropbox or kept in Git and managed outside of thoughtbot/dotfiles using rcm.
set spellfile=$HOME/.vim-spell-en.utf-8.add

" Always use vertical diffs
set diffopt+=vertical

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

filetype plugin indent on

augroup vimrcEx
  autocmd!

  " Markdown
  " Recognize *.md as markdown files
  " .md is used for Modula 2 files, but I don't care about those
  autocmd BufRead,BufNewFile *.md set filetype=markdown

  " Enable spellchecking for Markdown
  autocmd FileType markdown setlocal spell

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

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif

" TODO: Do I need this?
" This will indent and set the cursor for html tags
function! Expander()
  let line   = getline(".")
  let col    = col(".")
  let first  = line[col-2]
  let second = line[col-1]
  let third  = line[col]

  if first ==# ">"
    if second ==# "<" && third ==# "/"
      return "\<CR>\<C-o>==\<C-o>O"
    else
      return "\<CR>"
    endif
  else
    return "\<CR>"
  endif
endfunction
inoremap <expr> <CR> Expander()

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


" NERD
"""""""""""""""
" NERDTree shortcue
map <C-n> :NERDTreeToggle<CR>
" Show hidden files
let g:NERDTreeShowHidden=1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'javascript': { 'left': '//', 'leftAlt': '//', 'rightAlt': '' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" pry
nnoremap <leader>pry ibinding.pry

" move whole lines in visual mode
" move selected lines up one line
xnoremap <C-k>  :m-2<CR>gv=gv
" move selected lines down one line
xnoremap <C-j> :m'>+<CR>gv=gv
