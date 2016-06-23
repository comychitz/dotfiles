  
set nocompatible        " use vim settings
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set nobackup            " no backups
set history=100
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set noincsearch		" turn off incremental searching
set number              " turn on line numbers
set expandtab           " tabs to spaces
set smarttab
set shiftwidth=2        " because i write a lot of c
set softtabstop=2
set autoindent		" always set autoindenting on
set smartindent         " indenting, the smart way
set foldenable          " enable folding
set foldnestmax=10      " nested fold max
set foldmethod=syntax   " folding based on syntax highlighting
set foldlevelstart=10   " gold 10 of them already for us
set shiftround          " use multiple of shiftwidth when indenting with '<' and '>'
set ignorecase          " ignores case when searching
set nowrap
set hlsearch
set scrolloff=7        " start scrolling when cursor is 7 lines from top/bottom
set cmdheight=2        " Height of the command bar
set laststatus=2       " show the status line
set wildmenu	       " shows command completions in the status bar
set cino=(0	       " turns on multiline indentation (for long functions, etc.)
set tw=80              " set text width to be 80

" Format the status line
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ l:%l\ c:%v
hi statusline ctermfg=cyan ctermbg=black

syntax on              " turn on syntax highlighting
colorscheme default    " i like the default colorscheme

" highlights
hi Search ctermfg=black ctermbg=yellow
hi Pmenu  ctermfg=yellow ctermbg=blue
hi PmenuSel  ctermfg=black ctermbg=yellow
hi PmenuSbar ctermfg=blue ctermbg=blue
hi PmenuThumb ctermfg=blue ctermbg=blue

" vimdiff highlight colors
hi DiffAdd        ctermfg=black ctermbg=green
hi DiffChange     ctermfg=black ctermbg=yellow
hi DiffText       ctermfg=blue ctermbg=yellow
hi DiffDelete     ctermfg=black ctermbg=red

"mappings 
let mapleader = ";"
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>
" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
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
map <leader>nt :NERDTreeToggle
map <leader>tl :TlistToggle
" run a shell command easier
nmap ! :!<Space>
" beginning/end of line
noremap B ^
noremap E $
" format indent on space
noremap p p='[
" create newline without entering insert mode
map <leader>o o<esc>
" create a space without entering insert mode
map <leader><space> i<space><esc>
" split line at cursor without entering insert mode
map <leader><enter> i<enter><esc>
" shortcuts for line number setting
map <leader>rn :set relativenumber<cr>
map <leader>ln :set number<cr>
map <leader>nn :set nonumber<cr>
" shortcut to search the word the cursor is currently under
map <leader>s *

" because you hold shift too long
command! Q q
command! W w

" syntastic stuff
let g:syntastic_check_on_open = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_c_checkers = ['cppcheck']
let g:syntastic_cpp_checkers = ['cppcheck']
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_javascript_checkers = ['eslint']

" nerdtree stuff
let NERDTreeShowHidden=1

" cscove (cscope) stuff
nnoremap <leader>fa :call CscopeFindInteractive(expand('<cword>'))<CR>
nnoremap <leader>c :call ToggleLocationList()<CR>

if has('mouse')
  set mouse=a
endif

" beginning of autocmd stuff. assuming you have it installed
if has("autocmd")
  filetype plugin indent on
  filetype plugin on
  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!
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
endif " end autocmd stuff

" see diff between the file now and when you opened it first
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif
