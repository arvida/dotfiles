" Not sure where this is from orginally..
" 
" Highlights
"
" ,n = toggle NERDTree off and on
" ,h = new horizontal window
" ,v = new vertical window
" ,i = toggle invisibles 
" return = clear highlights from search
" ,p = previous buffer
" ctrl-j/k = jump paragraph
"
set nocompatible

" Pathogenize it!
call pathogen#infect()

if has("gui_running")
  set shellcmdflag=-ic
  set guioptions=egmrt
  set shell=bash
  set guioptions-=r 
endif

set hidden
let mapleader = ","
set ttyfast
set encoding=utf-8

" Make clipboard work with MacOS
set clipboard=unnamed

autocmd FileType c,cpp,java,php,ruby,eruby,css,html,javascript autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

au BufRead,BufNewFile *.gotpl set filetype=gotpl 

" Do not append line break at eol for erb
autocmd FileType eruby,erb setlocal noeol
 
" Tabs ************************************************************************
set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab
set showtabline=2 " Always show tab bar

" Indenting *******************************************************************
set ai " Automatically set the indent of a new line (local to buffer)
set si " smartindent (local to buffer)

" Make sure the '<' and 'C' flags are not included in 'cpoptions', otherwise
" " <CR> would not be recognized.  See ":help 'cpoptions'".
let s:cpo_save = &cpo
set cpo&vim

" Scrollbars ******************************************************************
set sidescrolloff=2
set numberwidth=4

" Windows *********************************************************************
set equalalways " Multiple windows, when created, are equal in size
set splitbelow splitright

" Vertical and horizontal split then hop to a new buffer
:noremap <Leader>v :vsp^M^W^W<cr>
:noremap <Leader>h :split^M^W^W<cr>

" Searching *******************************************************************
set hlsearch  " highlight search
set incsearch  " Incremental search, search as you type
set ignorecase " Ignore case when searching 
set smartcase " Ignore case when searching lowercase

" Colors **********************************************************************
if has("gui_running")
  " colorscheme Tomorrow-Night-Eighties-My
else
  syntax on
  "  set background=light
  set t_Co=256 
  set term=xterm-256color
  let base16colorspace=256
  " colorscheme Tomorrow-Night-Bright
  colorscheme base16-default
endif

" Status Line *****************************************************************
set showcmd
set ruler 
set laststatus=2
"set statusline=%F\ %m\ %{fugitive#statusline()}\ %y%=%l,%c\ %P " show git branch
"let g:Powerline_symbols = 'fancy' " the statusline of power and awesomness

" Line Wrapping ***************************************************************
set nowrap
set linebreak  " Wrap at word
set colorcolumn=90

" Directories *****************************************************************
set backupdir=~/.vimfiles/backup
set directory=~/.vimfiles/swap

" File Stuff ******************************************************************
filetype plugin indent on
" To show current filetype use: set filetype
set ofu=syntaxcomplete#Complete

" Invisible characters *********************************************************
:noremap <Leader>i :set list!<CR> " Toggle invisible chars

" Mouse ***********************************************************************
set mouse=a " Enable the mouse
set mousemodel=extend

" Misc settings ***************************************************************
set number " Show line numbers
set vb t_vb= " Turn off bell, this could be more annoying, but I'm not sure how
set nofoldenable " Turn off folding 

" Key bindings ****************************************************************

" Make cursor move by visual lines instead of file lines (when wrapping)
map <up> gk
map k gk
imap <up> <C-o>gk
map <down> gj
map j gj
imap <down> <C-o>gj
map E ge

map <Leader>p <C-^>

" Jan 11 2012
" Use the damn hjkl keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" CtrlP for opening files fast
map q :CtrlPBuffer<CR>

" Jump one paragraph with ctrl-key and j/k
noremap <C-j> }
noremap <C-k> {

" From: https://github.com/garybernhardt/dotfiles/blob/master/.vimrc
:nnoremap <CR> :nohlsearch<CR><CR>

" https://github.com/henrik/dotfiles/commit/aaa45c1cc0f9a6195a9155223a7e904aa10b256f
command! -bar -range=% NotRocket execute '<line1>,<line2>s/:\(\w\+\)\s*=>/\1:/e' . (&gdefault ? '' : 'g')

command! Restart execute '!touch tmp/restart.txt'

" From: https://github.com/garybernhardt/dotfiles/blob/master/.vimrc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

" -----------------------------------------------------------------------------  
" |                              Plug-ins                                     |
" -----------------------------------------------------------------------------  
 
set completefunc=syntaxcomplete#Complete

" NERDTree ********************************************************************
:noremap <Leader>n :NERDTreeToggle<CR>
let NERDTreeHijackNetrw=1 " User instead of Netrw when doing an edit /foobar
let NERDTreeMouseMode=1 " Single click for everything

" fuzzyfinder ********************************************************
" I'm using CommandT for main searching, but it doesn't do buffers, so I'm
" using FuzzyFinder for that
" map <Leader>b :FufBuffer<CR>
let g:fuzzy_ignore = '.o;.obj;.bak;.exe;.pyc;.pyo;.DS_Store;.db;.log'
let g:fuzzy_enumerating_limit = 70
