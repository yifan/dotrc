set nocompatible

" Two semicolons are easy to type.
imap ;; <Esc>

set backspace=indent,eol,start
set showmatch

set number

syntax on
set shortmess+=r
set wildmode=list:longest,full
set showmode
set showcmd
set hlsearch
set shiftwidth=2
set tabstop=2
set expandtab
set autoindent
set smartindent

filetype on

set ignorecase
set smartcase

set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2

" Store swap files in fixed location, not current directory.
set dir=~/.vimswap//,/var/tmp//,/tmp//,.

map <F5> <ESC>:make<CR>
map <F6> <ESC>:cp<CR>
map <F7> <ESC>:cn<CR>

set background=dark

command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis

colorscheme murphy
set gfn=SourceCode\ Pro\ Light\ 12
set diffopt+=iwhite

command HexMode <ESC>:%!xxd<CR>
command RHexMode <ESC>:%!xxd -r<CR>


autocmd FileType python set complete+=k~/.vim/syntax/python.vim isk+=.,(

set cursorline
set cursorcolumn


nnoremap <silent> <F8> :TlistToggle<CR>
let Tlist_Exit_OnlyWindow = 1     " exit if taglist is last window open
let Tlist_Show_One_File = 1       " Only show tags for current buffer
let Tlist_Enable_Fold_Column = 0  " no fold column (only showing one file)
let tlist_sql_settings = 'sql;P:package;t:table'
let tlist_ant_settings = 'ant;p:Project;r:Property;t:Target'

