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
"" Modified: Wed Oct  8 1:47:32 PM CST 2014

"" Option values {{{
"" =================

set nocompatible

set encoding=utf-8 " Character encoding used in Vim: 'latin1', 'utf-8' 'euc-jp', 'big5', etc.
set fileencodings+=gbk " Automatically detected character encodings

" With a map leader it's possible to do extra key combinations
let mapleader='\'
let maplocalleader='\'

set nopaste " Paste mode, insert typed text literally
set pastetoggle=<Leader><F10> " Key sequence to toggle paste mode

if has('gui_running')
    " List of font names to be used in the GUI
    set guifont=Source\ Code\ Pro\ Medium\ 10
    " List of font names to be used for double-wide characters
    "set guifontwide=
    if has('mac') || has('macunix')
	set guifont+=Menlo:h12
    elseif has('unix')
	set guifont+=
    elseif has('dos16') || has('dos32') || has('win16') || has('win32') || has('win32unix')
	set guifont+=
    endif
endif

if has('gui_macvim')
    " Open MacVim in fullscreen mode
    set fuoptions=maxvert,maxhorz
    "au GUIEnter * set fullscreen
elseif has('gui_running')
    " Maximize gvim window (for an alternative on Windows, see simalt below).
    set columns=9999 " Width of the display
    set lines=999 " Number of lines in the display
else
    "if exists('+lines') | set lines=50 | endif
    "if exists('+columns') | set columns=100 | endif
endif

" List of flags that specify how the GUI works
if has('gui_running')
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

" Enable filetype plugins, indent and syntax highlighting
filetype plugin indent on
syntax on

if &t_Co > 1 || has('gui_running')
    set background=dark "'dark' or 'light', the background color brightness
    try | colorscheme solarized | catch | colorscheme default | endtry
endif

set whichwrap+=<,>,[,] " List of flags specifying which commands wrap to another line (local to window)
set nostartofline " Many jump commands move the cursor to the first non-blank character of a line

" List of directory names used for file searching (global or local to buffer)
"if has("mac") || has("macunix")
"elseif has("unix")
"    set path+=/usr/local/include
"endif

"set cdpath= " List of directory names used for :cd
set nowrapscan " Search commands do not wrap around the end of the buffer
set incsearch " Show match for partly typed search command
set ignorecase " Ignore case when using a search pattern
set smartcase " Override 'ignorecase' when pattern has upper case characters
set define=^\(\s*#\s*define\|[a-z]*\s*const\s*[a-z]*\) " Pattern for a macro definition line (global or local to buffer)
set include=^\s*#\s*include " Pattern for an include-file line (local to buffer)
"set includeexpr=substitute(v:fname,'\\.','/','g') " Expression used to transform an include line to a file name (local to buffer)

"set tags=./tags,./TAGS,tags,TAGS " List of file names to search for tags (global or local to buffer)
"set cscopequickfix=s-,c-,d-,i-,t-,e- " When to open a quickfix window for cscope

set scrolloff=3 " Number of screen lines to show around the cursor
set nowrap " Long lines wrap
set linebreak " Wrap long lines at a character in 'breakat' (local to window)
set breakat=\ ^I!@*-+;:,./? " Which characters might cause a line break
set showbreak=+++\  " String to put before wrapped screen lines
set sidescroll=2 " Minimal number of columns to scroll horizontally
set sidescrolloff=6 " Minimal number of columns to keep left and right of the cursor
set fillchars=stl:\ ,stlnc:*,vert:\|,fold:-,diff:- " Characters to use for the status line, folds and filler lines
set cmdheight=2 " Number of lines used for the command-line

set list " Show <Tab> as ^I and end-of-line as $ (local to window)
set listchars=tab:>-,trail:- " List of strings used for list mode
set number " Show the line number for each line (local to window)
set numberwidth=4 " Number of columns to use for the line number (local to window)

set hlsearch " Highlight all matches for the last used search pattern
map <Leader><F9> :nohlsearch<CR>
set cursorline " Highlight the screen line of the cursor (local to window)
set colorcolumn=+1,+2 " Columns to highlight (local to window)

set spell " Highlight spelling mistakes (local to window)
set spelllang=en_us " List of accepted languages (local to buffer)

set laststatus=2 " 0, 1 or 2; when to use a status line for the last window
" Alternate format to be used for a status line
"set statusline=%<%F%m%r%y%=%b\ 0x%B\ \ [l,c]%l,%c%V\ %p%%\ %{GitBranchInfoString()}
set statusline=%<%F%m%r%y%=0x%B\ \ %l,%c%V\ %p%%\ 
set hidden " Don't unload a buffer when no longer shown in a window
set switchbuf=useopen " 'useopen' and/or 'split'; which window to use when jumping to a buffer
set splitright " A new window is put right of the current one

set title " Show info in the window title
set mouse=a " List of flags for using the mouse

set showcmd " Show (partial) command keys in the status line
set showmode " Display the current mode in the status line
set ruler " Show cursor position below each window
set noerrorbells " Ring the bell for error messages
set novisualbell " Use a visual bell instead of beeping

set selectmode=mouse,key " 'mouse', 'key' and/or 'cmd'; when to start Select mode instead of Visual mode

set textwidth=90 " Line length above which to break a line (local to buffer)
set backspace=indent,eol,start " Specifies what <BS>, CTRL-W, etc. can do in Insert mode
"set comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:- " Definition of what comment lines look like (local to buffer)
"set formatoptions=tcq " List of flags that tell how automatic formatting works (local to buffer)
"set formatlistpat=^\s*\d\+[\]:.)}\t ]\s* " Pattern to recognize a numbered list (local to buffer)
"set formatexpr=mylang#Format() " Expression used for 'gq' to format lines (local to buffer)
"set complete=.,w,b,u,t,i " Specifies how Insert mode completion works for CTRL-N and CTRL-P (local to buffer)
set completeopt=menuone,preview " Whether to use a popup menu for Insert mode completion
"set pumheight=0 " Maximum height of the popup menu
"set completefunc= " User defined function for Insert mode completion (local to buffer)
"set omnifunc= " Function for filetype-specific Insert mode completion (local to buffer)
"set dictionary= " List of dictionary files for keyword completion (global or local to buffer)
"set thesaurus= " List of thesaurus files for keyword completion (global or local to buffer)
"set infercase " Adjust case of a keyword completion match (local to buffer)
"set digraph " Enable entering digraps with c1 <BS> c2
set tildeop " The '~' command behaves like an operator
"set operatorfunc= " Function called for the 'g@'  operator
set showmatch " When inserting a bracket, briefly jump to its match
set matchtime=2 " Tenth of a second to show a match for 'showmatch'

set tabstop=8 " Number of spaces a <Tab> in the text stands for (local to buffer)
set shiftwidth=4 " Number of spaces used for each step of (auto)indent (local to buffer)
set smarttab " A <Tab> in an indent inserts 'shiftwidth' spaces
set softtabstop=4 " If non-zero, number of spaces to insert for a <Tab> (local to buffer)
set shiftround " Round to 'shiftwidth' for "<<" and ">>"
"set expandtab " Expand <Tab> to spaces in Insert mode (local to buffer)
set autoindent " Automatically set the indent of a new line (local to buffer)
set smartindent " Do clever autoindenting (local to buffer)
set cindent " Enable specific indenting for C code (local to buffer)
"set cinoptions= " Options for C-indenting (local to buffer)

set foldenable " Set to display all folds open (local to window)
set foldlevel=1 " Folds with a level higher than this number will be closed (local to window)
"set foldlevelstart= " Value for 'foldlevel' when starting to edit a file
set foldcolumn=1 " Width of the column used to indicate folds (local to window)

set modeline " Enable using settings from modelines when reading a file (local to buffer)
"set modelines=10 " Number of lines to check for modelines
set fileformats=unix,dos,mac " List of file formats to look for when editing a file
set writebackup " Write a backup file before overwriting a file
set nobackup " Do not keep a backup after overwriting a file
"set backupskip=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/* " Patterns that specify for which files a backup is not made
"set backupcopy=yes " Whether to make the backup as a copy or rename the existing file
"set backupdir=~/tmp,$TEMP,$TMP,$TMPDIR " List of directories to put backup files in
"set backupext=~ " File name extension for the backup file
set autowrite " Automatically write a file when leaving a modified buffer
"set noautowriteall " As 'autowrite', but works with more commands
"set nowriteany " Always write without asking for confirmation
set autoread " Automatically read a file when it was modified outside of Vim (global or local to buffer)
"set patchmode= " Keep oldest version of a file; specifies file name extension
"set fsync " Forcibly sync the file to disk after writing it
"set noshortname " Use 8.3 file names (local to buffer)
"set cryptmethod=zip " Encryption method for file writing: zip or blowfish (local to buffer)

set directory-=. " List of directories for the swap file
"set swapfile " use a swap file for this buffer (local to buffer)
"set swapsync= " 'sync', 'fsync' or empty; how to flush a swap file to disk
"set updatecount=50 " Number of characters typed to cause a swap file update
"set updatetime=5000 " Time in msec after which the swap file will be updated
"set maxmem=half " Maximum amount of memory in Kbyte used for one buffer
"set maxmemtot=half " Maximum amount of memory in Kbyte used for all buffers

set history=700 " How many command lines are remembered
"set wildchar=<Tab> " Key that triggers command-line expansion
"set wildcharm=<C-Z> " Like 'wildchar' but can also be used in a mapping
"set wildmode=full " Specifies how command line completion works
"set suffixes+=.pyc " List of file name extensions that have a lower priority
"set suffixesadd+=.java " List of file name extensions added when searching for a file (local to buffer)
set wildignore+=*.o,*~,*.pyc,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store " List of patterns to ignore files for file name completion
"set fileignorecase " Ignore case when using file names
set wildignorecase " Ignore case when completing file names
set wildmenu " Command-line completion shows a list of matches
"set cedit=<C-F> " Key used to open the command-line window
"set cmdwinheight=7 " Height of the command-line window
"set undofile " Automatically save and restore undo history
"set undodir= " List of directories for undo files

" Program used for the ':grep' command (global or local to buffer)
if has('mac') || has('macunix')
    set grepprg=ack\ -k
else
    set grepprg=ack-grep\ -k
endif
" }}}

if has('mac') || has('macunix')
    nmap <D-j> <M-j>
    nmap <D-k> <M-k>
    vmap <D-j> <M-j>
    vmap <D-k> <M-k>
endif

" vim:fdm=marker:fdl=0:nowrap:ts=8:sts=4:sw=4:
