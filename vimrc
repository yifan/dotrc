set nocompatible
filetype off

if exists('$TMUX')
  set term=screen-256color
endif

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'tomtom/tcomment_vim'

Plugin 'kristijanhusak/vim-hybrid-material'

Plugin 'vim-scripts/a.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'terryma/vim-multiple-cursors'

Plugin 'Xuyuanp/nerdtree-git-plugin'

Plugin 'bronson/vim-trailing-whitespace'

Plugin 'junegunn/vim-emoji'
Plugin 'bling/vim-airline'

Plugin 'scrooloose/nerdtree'
map <D-\> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

Plugin 'scrooloose/nerdcommenter'

Plugin 'airblade/vim-gitgutter'

Plugin 'junegunn/rainbow_parentheses.vim'

Plugin 'easymotion/vim-easymotion'

Plugin 'helino/vim-json'

"Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'mxw/vim-jsx'
Plugin 'nathanaelkane/vim-indent-guides'

Plugin 'flazz/vim-colorschemes'

Plugin 'christoomey/vim-tmux-navigator'

call vundle#end()

set completefunc=emoji#complete
" In .vimrc
silent! if emoji#available()
  let g:gitgutter_sign_added = emoji#for('small_blue_diamond')
  let g:gitgutter_sign_modified = emoji#for('small_orange_diamond')
  let g:gitgutter_sign_removed = emoji#for('small_red_triangle')
  let g:gitgutter_sign_modified_removed = emoji#for('collision')
endif

set t_Co=256
syntax enable
colorscheme hybrid_material
set background=dark
set spell
set number
set guifont=Iosevka\ Light:h14

set laststatus=2
set statusline=%<%f\    " Filename
set statusline+=%w%h%m%r " Options
"set statusline+=%{fugitive#statusline()} "  Git Hotness
set statusline+=\ [%{&ff}/%Y]            " filetype
set statusline+=\ [%{getcwd()}]          " current dir
set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info

" try ESCAPE again
inoremap jk <ESC>

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

set backspace=indent,eol,start
set linespace=0
set showmatch
set wildmenu
set foldenable

set hlsearch
set incsearch
set ignorecase
set infercase
set ruler
set autoindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab
set nowrap

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright
