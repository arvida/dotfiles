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

set hidden
set nocompatible
let mapleader = ","
map q :CommandT<CR>
set ttyfast

" Make clipbaord work with MacOS
set clipboard=unnamed

autocmd FileType c,cpp,java,php,ruby,eruby autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
 
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
set t_Co=256 
syntax on 
set background=dark
colorscheme Tomorrow-Night-Eighties

" Status Line *****************************************************************
set showcmd
set ruler 
set laststatus=2
set statusline=%F\ %m\ %{fugitive#statusline()}\ %y%=%l,%c\ %P " show git branch

" Line Wrapping ***************************************************************
set nowrap
set linebreak  " Wrap at word
set colorcolumn=100

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
set term=xterm-256color

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

map <D-1> :bprev<CR>
map <D-2> :bnext<CR>
map <D-3> :BD<CR>

map <Leader>1 :bprev<CR>
map <Leader>2 :bnext<CR>
map <Leader>3 :BD<CR>
map <Leader>p <C-^>

" Jan 11 2012
" Use the damn hjkl keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Map tab for indenting (alt-key, like in textmate)
nmap <A-S-Tab> <<
nmap <A-Tab> >>
vmap <A-S-Tab> <gv
vmap <A-Tab> >gv

" Jump one paragraph with ctrl-key and j/k
noremap <C-j> }
noremap <C-k> {

" Write to disk
noremap ö :w<CR>

" single character insert
nmap <Space> i_<Esc>r

" From: https://github.com/garybernhardt/dotfiles/blob/master/.vimrc
:nnoremap <CR> :nohlsearch<CR><CR>

" https://github.com/henrik/dotfiles/commit/aaa45c1cc0f9a6195a9155223a7e904aa10b256f
command! -bar -range=% NotRocket execute '<line1>,<line2>s/:\(\w\+\)\s*=>/\1:/e' . (&gdefault ? '' : 'g')

" Omni Completion *************************************************************
autocmd FileType html :set omnifunc=htmlcomplete#CompleteTags
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
" May require ruby compiled in
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete 
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

" -----------------------------------------------------------------------------  
" |                              Plug-ins                                     |
" -----------------------------------------------------------------------------  

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

" autocomplpop ***************************************************************
" complete option
"set complete=.,w,b,u,t,k
"let g:AutoComplPop_CompleteOption = '.,w,b,u,t,k'
"set complete=.
"let g:AutoComplPop_IgnoreCaseOption = 0
"let g:acp_behaviorKeywordLength = 5
"let g:acp_behaviorRubyOmniMethodLength = 5
"let g:acp_behaviorRubyOmniSymbolLength = 5
"let g:acp_behaviorHtmlOmniLength = 5
"let g:acp_behaviorCssOmniPropertyLength = 5
"let g:acp_mappingDriven=1
"
" railsvim ***************************************************************
map <Leader>ra :AS<CR>
map <Leader>rs :RS<CR>
