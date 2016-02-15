" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Dec 17
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" ------------------------------------ START OF COMYS EDITS ---------------------------------- "
" everything above this line came from the /usr/share/vim/vim73/vimrc_example.vim file
"
" Notes:
" vert belowright sb - opens a window on the right with the next file in the
" buffer

set number
set expandtab
set smarttab
set shiftwidth=2
set softtabstop=2
set foldmethod=syntax
set foldlevelstart=1
set shiftround          " use multiple of shiftwidth when indenting with '<' and '>'
set ignorecase          " ignores case when searching
set nowrap


set foldenable         " enable folding
set foldlevelstart=10  " open some folds by default
set foldnestmax=10     " nested fold max
set foldmethod=indent  " fold on indent
"nnoremap <space> za    " open/close folds

" beginning/end of line
noremap B ^
noremap E $

hi Search ctermfg=black ctermbg=yellow
hi Pmenu  ctermfg=yellow ctermbg=blue
hi PmenuSel  ctermfg=black ctermbg=yellow
hi PmenuSbar ctermfg=blue ctermbg=blue
hi PmenuThumb ctermfg=blue ctermbg=blue

filetype plugin on

let g:syntastic_check_on_open = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_c_checkers = ['cppcheck']
let g:syntastic_cpp_checkers = ['cppcheck']
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_javascript_checkers = ['eslint']

" Height of the command bar
set cmdheight=2

"set noswapfile " add if you want, just putting here as a note

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ";"
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Add a bit extra margin to the left
"set foldcolumn=1

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Always show the status line
set laststatus=2
" Format the status line
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l
"set statusline

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>tf :tabfirst<cr>
map <leader>tt :tabnext<cr>

map <leader>bd :bd<cr>
map <leader>bn :bn<cr>
map <leader>e  :e

map <leader>l :NERDTreeToggle
let NERDTreeShowHidden=1

nmap ! :!<Space>
