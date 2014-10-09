"" VIM main configurations
"" Copyright (C) 2014  Zheng Chi <chee.z@foxmail.com>
""
"" This program is free software: you can redistribute it and/or modify
"" it under the terms of the GNU General Public License as published by
"" the Free Software Foundation, either version 3 of the License, or
"" (at your option) any later version.
""
"" This program is distributed in the hope that it will be useful,
"" but WITHOUT ANY WARRANTY; without even the implied warranty of
"" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
"" GNU General Public License for more details.
""
"" You should have received a copy of the GNU General Public License
"" along with this program.  If not, see <http://www.gnu.org/licenses/>.
""
"" Created:  Fri Jul 12 9:18:14 AM CST 2013
"" Modified: Thu Oct  9 18:25:22 CST 2014

"" General {{{
"" ===========
set nocompatible

scriptencoding utf-8 " UTF-8 all the way
set encoding=utf-8 " Character encoding used in Vim
set fileencodings+=gbk " Automatically detected character encodings
set fileformats=unix,dos,mac " List of file formats to look for when editing a file

" With a map leader it's possible to do extra key combinations
"let mapleader=','
"let maplocalleader='<Tab>'

set history=256 " How many command lines are remembered
set timeoutlen=250 " Time to wait after ESC (default causes an annoying delay)

set clipboard+=unnamed " Yanks go on clipboard instead.

set nopaste " Paste mode, insert typed text literally
set pastetoggle=<Leader><F11> " Toggle between paste and normal: for 'safer' pasting from keyboard

set shiftround " Round indent to multiple of 'shiftwidth' for '<<' and '>>'

" Consider the repo tags first, then walk directory tree upto $HOME looking for tags
" NOTE ';' sets the stop folder. :h file-search
set tags=.git/tags;$HOME " List of file names to search for tags (global or local to buffer)

set modeline " Enable using settings from modelines when reading a file (local to buffer)
set modelines=5 " Number of lines to check for modelines

set autowrite " Automatically write a file when leaving a modified buffer
set autoread " Automatically read a file when it was modified outside of Vim (global or local to buffer)

set nobackup " Do not keep a backup after overwriting a file
set writebackup " Write a backup file before overwriting a file

" List of directories for the swap file
" prepend(^=) $HOME/.tmp/ to default path; use full path as backup filename(//)
set directory=/tmp//
"set noswapfile " Do not use a swap file for this buffer (local to buffer)

" Don't unload a buffer when no longer shown in a window
" The current buffer can be put to the background without writing to disk
set hidden

set hlsearch " Highlight all matches for the last used search pattern
set ignorecase " Ignore case when using a search pattern
set smartcase " Override 'ignorecase' when pattern has upper case characters
set incsearch " Show match for partly typed search command
set nowrapscan " Search commands do not wrap around the end of the buffer
map <Leader><F9> :nohlsearch<CR>

let g:is_posix = 1 " Vim's default is archaic bourne shell, bring it up to the 90s
let g:netrw_banner = 0 " Do not show Netrw help banner

" List of directory names used for file searching (global or local to buffer)
"if has('mac') || has('macunix')
"elseif has('unix')
"    set path+=/usr/local/include
"endif

"set cdpath= " List of directory names used for :cd
set define=^\(\s*#\s*define\|[a-z]*\s*const\s*[a-z]*\) " Pattern for a macro definition line (global or local to buffer)
set include=^\s*#\s*include " Pattern for an include-file line (local to buffer)
"set includeexpr=substitute(v:fname,'\\.','/','g') " Expression used to transform an include line to a file name (local to buffer)

"set cscopequickfix=s-,c-,d-,i-,t-,e- " When to open a quickfix window for cscope

"set spell " Highlight spelling mistakes (local to window)
set spelllang=en_us " List of accepted languages (local to buffer)

set switchbuf=useopen " 'useopen' and/or 'split'; which window to use when jumping to a buffer

set tildeop " The '~' command behaves like an operator
"" }}}

"" Formatting {{{
"" ==============
" List of flags that tell how automatic formatting works (local to buffer)
set formatoptions+=o " Automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode.
set formatoptions-=r " Do not automatically insert a comment leader after an enter
set formatoptions-=t " Do no auto-wrap text using 'textwidth' (does not apply to comments)

set linebreak " Wrap long lines at a character in 'breakat' (local to window)
set breakat=\ ^I!@*-+;:,./? " Which characters might cause a line break
set showbreak=+++\  " String to put before wrapped screen lines

set nowrap " Long lines wrap
set textwidth=90 " Line length above which to break a line (local to buffer)
set tabstop=2 " 2 spaces a <Tab> in the text stands for (local to buffer)
set softtabstop=2 " 2 spaces to insert for a <Tab> (local to buffer)
set shiftwidth=2 " 2 spaces used for each step of (auto)indent (local to buffer)
set expandtab " Expand <Tab> to spaces with 'tabstop' in Insert mode (local to buffer)
set smarttab " A <Tab> in an indent inserts 'shiftwidth' spaces

set whichwrap+=<,>,[,] " List of flags specifying which commands wrap to another line (local to window)
set nostartofline " Many jump commands move the cursor to the first non-blank character of a line

set scrolloff=3 " Number of screen lines to show around the cursor
set sidescroll=2 " Minimal number of columns to scroll horizontally
set sidescrolloff=6 " Minimal number of columns to keep left and right of the cursor

set backspace=indent,eol,start " Specifies what <BS>, CTRL-W, etc. can do in Insert mode
set smartindent " Do clever autoindenting (local to buffer)
set autoindent " Automatically set the indent of a new line (local to buffer)
set cindent " Enable specific indenting for C code (local to buffer)
" Keys that trigger indenting with 'indentexpr' in Insert mode
" Do not break indent on #
set indentkeys-=0#
" Keys that trigger C-indenting in Insert mode
" Do not trigger on #
set cinkeys-=0#
set cinoptions=:s,ps,ts,cs " Options for C-indenting (local to buffer)
set cinwords=if,else,while,do,for,switch,case " List of words that cause more C-indent
"" }}}

"" Visual {{{
"" ===========
syntax on " Enable syntax
"set synmaxcol=256 " Maximum column to look for syntax items

set mouse=a " Enable mouse
set mousehide " Hide the mouse pointer while typing
set selectmode=mouse,key " 'mouse', 'key' and/or 'cmd'; when to start Select mode instead of Visual mode

set number " Show the line number for each line (local to window)
set numberwidth=4 " Number of columns to use for the line number (local to window)

set showmatch " When inserting a bracket, briefly jump to its match
set matchtime=2 " Tenth of a second to show a match for 'showmatch'

set cursorline " Highlight the screen line of the cursor (local to window)
set colorcolumn=+1,+2 " Columns to highlight (local to window)

" Specifies how command line completion works
" At command line, complete longest common string, then list alternatives
set wildmode=longest,list
set completeopt+=preview " Whether to use a popup menu for Insert mode completion
set wildignorecase " Ignore case when completing file names
set wildmenu " Command-line completion shows a list of matches

set wildignore+=*.o,*~,*.pyc,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store " List of patterns to ignore files for file name completion
set fileignorecase " Ignore case when using file names

set novisualbell " Do not use a visual bell instead of beeping
set noerrorbells " Do not ring the bell for error messages
"set vb t_vb= " Disable any beeps or flashes on error

set title " Show info in the window title
set showmode " Display the current mode in the status line
set ruler " Show cursor position below each window

set cmdheight=2 " Number of lines used for the command-line
set laststatus=2 " Always show status line
set shortmess=atI " List of flags to make messages shorter
set showcmd " Show (partial) command keys in the status line
" Alternate format to be used for a status line
set statusline=%<\ *No.%n*\ %f\ [%{&ff}]%y%m%r\ %{fugitive#statusline()}%=\ <Val:0x%B>\ <L%l,C%c%V>\ <%P>\ 
set fillchars=stl:\ ,stlnc:*,vert:\|,fold:-,diff:- " Characters to use for the status line, folds and filler lines

set foldenable " Set to display all folds open (local to window)
set foldmethod=marker " Folding type: "manual", "indent", "expr", "marker" or "syntax"
" Folds with a level higher than this number will be closed (local to window)
set foldlevel=100 " Do not auto fold anything (but I can still fold manual)
set foldopen=block,hor,tag,percent,mark,quickfix " Specifies for which commands a fold will be opened
"set foldlevelstart= " Value for 'foldlevel' when starting to edit a file
set foldcolumn=2 " Width of the column used to indicate folds (local to window)

set virtualedit=block " When to use virtual editing: "block", "insert" and/or "all"

set splitbelow " A new window is put below the current one
set splitright " A new window is put right of the current one

set list " Show <Tab> as ^I and end-of-line as $ (local to window)
set listchars=tab:\ .,eol:¬,trail:·,extends:»,precedes:« " List of strings used for list mode

" List of flags that specify how the GUI works
if has('gui_running')
    set guioptions+=c " Use console dialogs instead of popup dialogs for simple choices
    set guioptions+=M " The system menu $VIMRUNTIME/menu.vim is not sourced
    set guioptions-=m " Menu bar is not present
    set guioptions-=T " Do not include toolbar
    set guioptions-=r " Right-hand scrollbar is not always present
    set guioptions-=R " Right-hand scrollbar is not present when there is a vertically split window
    set guioptions-=l " Left-hand scrollbar is not always present
    set guioptions-=L " Left-hand scrollbar is present when there is not a vertically split window
    set guioptions-=b " Bottom (horizontal) scrollbar is not present
    if has('gui_motif')
        set guioptions+=F " Add a footer
    endif
endif

if has('gui_running')
    " List of font names to be used in the GUI
    set guifont=Source\ Code\ Pro\ Medium\ 10
    " List of font names to be used for double-wide characters
    "set guifontwide=
    if has('mac') || has('macunix')
        set guifont+=Menlo:h12
    elseif has('unix')
        set guifont+=Terminus:h16
    elseif has('dos16') || has('dos32') || has('win16') || has('win32') || has('win32unix')
        set guifont+=
    endif
endif

if has('gui_macvim')
    " Open MacVim in fullscreen mode
    set noantialias
    set fuoptions=maxvert,maxhorz
    "au GUIEnter * set fullscreen
elseif has('gui_running')
    " Maximize gvim window (for an alternative on Windows, see simalt below).
    "set columns=9999 " Width of the display
    "set lines=999 " Number of lines in the display
else
    "if exists('+lines') | set lines=50 | endif
    "if exists('+columns') | set columns=100 | endif
endif
"" }}}

"" Key mappings {{{
"" ================
if has('mac') || has('macunix')
    nmap <D-j> <M-j>
    nmap <D-k> <M-k>
    vmap <D-j> <M-j>
    vmap <D-k> <M-k>
endif

nnoremap <Leader>y mz"dyy"dp`z
vnoremap <Leader>y "dymz"dP`z
"nnoremap <leader>rs :source ~/.vimrc<CR>
"nnoremap <leader>rt :tabnew ~/.vim/vimrc<CR>
"nnoremap <leader>re :e ~/.vim/vimrc<CR>
"nnoremap <leader>rd :e ~/.vim/ <CR>
"nnoremap <leader>rc :silent ! cd ~/.vim/ && git commit ~/.vim/vimrc -v <CR>

"nnoremap <M-h> :tabprev<CR>
"nnoremap <M-l> :tabnext<CR>

"nnoremap <localleader>- :bd<CR>
"nnoremap <localleader>-- :bd!<CR>

nnoremap <C-J> gEa<CR><ESC>ew

"map <silent> <C-W>v :vnew<CR>
"map <silent> <C-W>s :snew<CR>

"map <silent> <leader>. :let @+=expand('%:p').':'.line('.')<CR>
"map <silent> <leader>/ :let @+=expand('%:p:h')<CR>

"map <S-CR> A<CR><ESC>

"map <leader>E :Explore<CR>
"map <leader>EE :Vexplore!<CR><C-W>=

"nmap <silent> <C-k> <C-W><C-k>
"nmap <silent> <C-j> <C-W><C-j>
"nmap <silent> <C-h> <C-W><C-h>
"nmap <silent> <C-l> <C-W><C-l>

"nmap <C-K> {
"nmap <C-J> }

"nnoremap <leader>v :exec ':vnew \| CommandT'<CR>
"nnoremap <leader>V :vnew<CR>

"xnoremap p pgvy
"" }}}

"" AutoCommands {{{
"" ================
" au BufRead,BufNewFile {*.go} setl ft=go tabstop=2 softtabstop=2 noexpandtab smarttab " autocmd FileType go compiler go
" au BufRead,BufNewFile {Gemfile,Rakefile,Capfile,*.rake,config.ru} setl ft=ruby tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab
" au BufRead,BufNewFile {*.local} setl ft=sh
" au BufRead,BufNewFile {*.md,*.mkd,*.markdown} setl ft=markdown
" au BufRead,BufNewFile {*.scala} setl ft=scala
" au! BufReadPost       {COMMIT_EDITMSG,*/COMMIT_EDITMSG} setl ft=gitcommit noml list norm 1G
" au! BufWritePost      {*.snippet,*.snippets} call ReloadAllSnippets()

" open help in vertical split
" au BufWinEnter *.txt if &ft == 'help' | wincmd H | nmap q :q<CR> | endif
"" }}}

"" Scripts and Plugins {{{
"" =======================
filetype off
runtime macros/matchit.vim

" List of directories used for runtime files and plugins
set runtimepath+=~/.vim/bundle/Vundle.vim

" Keep Plugin commands between vundle#begin/end

call vundle#begin()
" Alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

Plugin 'gmarik/Vundle.vim' " Let Vundle manage itself
Plugin 'altercation/vim-colors-solarized' " Colorscheme
"Plugin 'tpope/vim-git'
Plugin 'tpope/vim-fugitive' " Git plugin
"Plugin 'L9' " Plugin from http://vim-scripts.org/vim/scripts.html
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

call vundle#end()

" Enable filetype plugins, indent and syntax highlighting
filetype plugin indent on
"" }}}

"" Post misc {{{
"" =============
if &t_Co > 1 || has('gui_running')
    set background=dark "'dark' or 'light', the background color brightness
    try | colorscheme solarized | catch | colorscheme default | endtry

    " For solarized colorscheme plugin
    if exists('g:solarized_menu') | let g:solarized_menu = 0 | endif
endif

" Program used for the ':grep' command (global or local to buffer)
if has('mac') || has('macunix')
    set grepprg=ack\ -k
else
    set grepprg=ack-grep\ -k
endif
"" }}}

" vim:fdm=marker:fdl=0:nowrap:ts=8:sts=4:sw=4:
