set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin()
"" IDE features
"
"
Plug 'scrooloose/nerdtree'
"Plug 'humiaozuzu/TabBar'
"Plug 'majutsushi/tagbar'
""Plug 'mileszs/ack.vim'
"Plug 'kien/ctrlp.vim'
"Plug 'tpope/vim-fugitive'
""Plug 'Lokaltog/vim-powerline'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'scrooloose/syntastic'
"Plug 'w0rp/ale'
""Plug 'bronson/vim-trailing-whitespace'
Plug 'altercation/vim-colors-solarized'
Plug 'crusoexia/vim-monokai'
Plug 'morhetz/gruvbox'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/Gundo'
Plug 'Raimondi/delimitMate'
Plug 'thinca/vim-quickrun'
Plug 'godlygeek/tabular'

" All of your Plugins must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"===============================
" Common Configuration for Vim
"================================
set encoding=utf-8      " utf-8 default  (others: big5, gbk, euc-jp)
set fencs=utf-8,big5    " fileencodings: utf-8 default (others:gbk,ucs-bom)
set showcmd
set noshowmode          " not show `Insert,Normal` at bottom left
set wildmenu
set number              " Show line number
set relativenumber      " Show relative line number
set cursorline          " Show underline in current cursor
set cursorcolumn        " Show highlight in current column
set nowrap              " not wrap the long line
set colorcolumn=80      " Display the limit of text width.
"set textwidth=79        " Restrict text width.

set mouse=a             " Enable mouse to use (all mode)
set scrolloff=2         " Keep space from top and bottom
set laststatus=2        " Alway show status bar at bottom

""" Tab setting
set tabstop=4           " Tab key indents X spaces at a time
set softtabstop=4       " makes the spaces feel like real tabs
set shiftwidth=4        " X spaces indents
set expandtab           " Use spaces when the <Tab> key is pressed"
" could use `:retab!` to reformat code to use tabs instead of space.

""" Folding Setting
set foldmethod=indent   " allow us fold on indent
set foldlevel=99        " don't fold by default.
"nnoremap <Space> za    " conflict with current map key.

""" Searching and Pattens
set hlsearch        " Highlight search by default.
set smarttab        " handle tab more intelligently.
set incsearch       " search pattern when still typing
nnoremap <Leader><CR> :noh<CR>


" don't backup
set nobackup
set nowb
set noswapfile

" don't redraw while executing macros (good performance config)
set lazyredraw

" System Clipboard
"set clipboard=unnamed

colorscheme monokai "atom-dark-256

""" Indentation for different file type
augroup indent_setting
    autocmd!
    autocmd FileType c,h,cpp,hpp
          \ setlocal tabstop=2 softtabstop=2 shiftwidth=2
    " For Front-end or full stack (Web)
    autocmd FileType javascript,html,css
          \ setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

" For Python (already as default)
"au BufNewFile,BufRead *.py
"    \ set tabstop=4
"    \ set softtabstop=4
"    \ set shiftwidth=4
"    \ set textwidth=79
"    \ set expandtab
"    \ set autoindent
"    \ set fileformat=unix

" For ROS cpp coding style
map \R <Esc>:set expandtab shiftwidth=2 tabstop=2 softtabstop=2<CR>
" use `:retab!` for reformatting

" configure tags - add additional tags
" source:  (will replaced by YCM later)
" http://vim.wikia.com/wiki/C%2B%2B_code_completion
set tags+=~/.vim/tags/cpp
"set tags+=~/.vim/tags/gl
"set tags+=~/.vim/tags/sdl
"set tags+=~/.vim/tags/qt4
" build tags of your own project with Ctrl-F12
map <C-F12> :!ctags -R --sort=yes --c++-kinds=+pl --fields=+iaS --extra=+q --exclude=.git .<CR>
" TODO: let F12 do ctags -R .   when filetype is not cpp

" Vimscript file settings -------------------- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType vim setlocal foldlevel=0
augroup END
" }}}
"
let g:termdebug_wide=1
