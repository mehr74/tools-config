set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')
" The following are examples of different formats supported.
" Keep Plug commands between vundle#begin/end.
" plugin on GitHub repo
"
"" IDE features
"
"
"
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', {'do': { -> fzf#install()}}
Plug 'junegunn/fzf.vim'
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
Plug 'tanvirtin/monokai.nvim'
Plug 'morhetz/gruvbox'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/Gundo'
Plug 'Raimondi/delimitMate'
Plug 'thinca/vim-quickrun'
Plug 'godlygeek/tabular'
Plug 'puremourning/vimspector'


Plug 'tpope/vim-obsession'
Plug 'dhruvasagar/vim-prosession'

" All of your Plug must be added before the following line
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
set relativenumber      " Show relative line number
set cursorline          " Show underline in current cursor
set cursorcolumn        " Show highlight in current column
set nowrap              " not wrap the long line
set colorcolumn=80      " Display the limit of text width.
"set textwidth=79        " Restrict text width.

set mouse=r             " Enable mouse to use (all mode)
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

let g:termdebug_wide=1

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

map gw <C-w> 

nnoremap <C-p> :GFiles<CR>

source $HOME/.config/nvim/vimspector.vim

