set nocompatible

if exists('$TMUX')
  set term=screen-256color
endif

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-repeat'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'vim-scripts/a.vim'
Plug 'vim-scripts/keepcase.vim'
Plug 'tpope/vim-fugitive'
Plug 'terryma/vim-multiple-cursors'
Plug 'Xuyuanp/nerdtree-git-Plugin'
Plug 'bronson/vim-trailing-whitespace'
Plug 'machakann/vim-sandwich'
Plug 'junegunn/vim-emoji'
Plug 'bling/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'easymotion/vim-easymotion'
Plug 'jelera/vim-javascript-syntax'
Plug 'mxw/vim-jsx'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jdhao/better-escape.vim'
"Plug 'SirVer/ultisnips'
Plug 'arcticicestudio/nord-vim'
"Plug 'flazz/vim-colorschemes'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'NLKNguyen/papercolor-theme'
"Plug 'jacoborus/tender.vim'
"Plug 'gryf/wombat256grf'

call plug#end()

" set time interval to 200 ms
let g:better_escape_interval = 200
let g:better_escape_shortcut = ['jk', 'kj']

map <D-\> :NERDTreeToggle<CR>
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden=1

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }


map <leader>f :GFiles<CR>
map <leader>b :Buffers<CR>
nnoremap <leader>g :Rg<CR>
nnoremap <leader>t :Tags<CR>
nnoremap <leader>m :Marks<CR>

" Border color
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND="rg --files --hidden"

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"Get Files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

set completefunc=emoji#complete
" In .vimrc
silent! if emoji#available()
  let g:gitgutter_sign_added = emoji#for('small_blue_diamond')
  let g:gitgutter_sign_modified = emoji#for('small_orange_diamond')
  let g:gitgutter_sign_removed = emoji#for('small_red_triangle')
  let g:gitgutter_sign_modified_removed = emoji#for('collision')
endif

silent! if emoji#available()
  let s:ft_emoji = map({
      \ 'c':          'baby_chick',
      \ 'clojure':    'lollipop',
      \ 'coffee':     'coffee',
      \ 'cpp':        'chicken',
      \ 'css':        'art',
      \ 'eruby':      'ring',
      \ 'gitcommit':  'soon',
      \ 'haml':       'hammer',
      \ 'help':       'angel',
      \ 'html':       'herb',
      \ 'java':       'older_man',
      \ 'javascript': 'monkey',
      \ 'make':       'seedling',
      \ 'markdown':   'book',
      \ 'perl':       'camel',
      \ 'python':     'snake',
      \ 'ruby':       'gem',
      \ 'scala':      'barber',
      \ 'sh':         'shell',
      \ 'slim':       'dancer',
      \ 'text':       'books',
      \ 'vim':        'poop',
      \ 'vim-plug':   'electric_plug',
      \ 'yaml':       'yum',
      \ 'yaml.jinja': 'yum'
        \ }, 'emoji#for(v:val)')

  function! S_filetype()
    if empty(&filetype)
      return emoji#for('grey_question')
    else
      return get(s:ft_emoji, &filetype, '['.&filetype.']')
    endif
  endfunction

  function! S_modified()
    if &modified
      return emoji#for('kiss').' '
    elseif !&modifiable
      return emoji#for('construction').' '
    else
      return ''
    endif
  endfunction

  function! S_fugitive()
    if !exists('g:loaded_fugitive')
      return ''
    endif
    let head = fugitive#head()
    if empty(head)
      return ''
    else
      return head == 'master' ? emoji#for('crown') : emoji#for('dango').'='.head
    endif
  endfunction

  let s:moons = map(
      \ ['new_moon', 'waxing_crescent_moon', 'first_quarter_moon',
      \  'waxing_gibbous_moon', 'full_moon', 'waning_gibbous_moon',
      \  'last_quarter_moon', 'waning_crescent_moon', 'new_moon'], 'emoji#for(v:val)')

  function! Moonbar()
    let width = len(s:moons)
    let [cur, max] = [line('.'), line('$')]
    let pos   = min([width * (cur - 1) / max([1, max - 1]), width - 1])
    let icon  = s:moons[pos]
    return repeat(' ', pos) . icon . repeat(' ', width - pos - 1)
  endfunction

  hi def link User1 TablineFill
  let s:cherry = emoji#for('cherry_blossom')
  function! MyStatusLine()
    let mod = '%{S_modified()}'
    let ro  = "%{&readonly ? emoji#for('lock') . ' ' : ''}"
    let ft  = '%{S_filetype()}'
    let fug = ' %{S_fugitive()}'
    let sep = ' %= '
    let pos = ' %l,%c%V '
    let pct = ' %P '

    return s:cherry.' [%n] %F %<'.mod.ro.ft.fug.sep.pos.
      \ '%1*%{Moonbar()}%*'.pct.s:cherry
  endfunction

  " Note that the "%!" expression is evaluated in the context of the
  " current window and buffer, while %{} items are evaluated in the
  " context of the window that the statusline belongs to.
  set statusline=%!MyStatusLine()
endif

" Open NERDTree when open vim with directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" set airline theme
let g:airline_theme='onehalfdark'

syntax enable
set t_Co=256
set cursorline
colorscheme nord
set background=dark
set spell
set number
"set relativenumber
set ruler
set guifont=Iosevka\ ExtraLight:h18

set laststatus=2
set statusline=%<%f\    " Filename
set statusline+=%w%h%m%r " Options
"set statusline+=%{fugitive#statusline()} "  Git Hotness
set statusline+=\ [%{&ff}/%Y]            " filetype
set statusline+=\ [%{getcwd()}]          " current dir
set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info

set backspace=indent,eol,start
set linespace=0
set showmatch
set wildmenu
set foldenable

set hlsearch
set incsearch
set ruler
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set nowrap
set linespace=5

let mapleader=","

nnoremap ; :
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

map <space> /
map <C-space> ?

map <leader>tn :tabnew<cr>
"map <leader>to :tabonly<cr>
"map <leader>tc :tabclose<cr>
"map <leader>tm :tabmove 

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/

map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark
map <leader>nf :NERDTreeFind<cr>

map <leader>o :BufExplorer<cr>


"set splitbelow
set splitright

filetype on
filetype plugin on
filetype indent on

au BufNewFile, BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

au BufNewFile, BufRead *.js, *.html, *.css, *.scss, *.jsx
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

au BufNewFile, BufRead Makefile
    \ set noexpandtab
    \ set softtabstop=0
    \ set shiftwidth=4

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let macvim_skip_colorscheme=1

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:UltiSnipsSnippetDirectories=["code"]

let g:indent_guides_enable_on_vim_startup = 1
