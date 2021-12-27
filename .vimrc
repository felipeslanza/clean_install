" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
" This happens after /etc/vim/vimrc(.local) are loaded, so it will override
" any settings in these files.
" If you don't want that to happen, uncomment the below line to prevent
" defaults.vim from being loaded.
" let g:skip_defaults_vim = 1

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" ==============================================================
" Colors and Themes
" ==============================================================
set background=dark
colorscheme iceberg
" colorscheme solarized
" colorscheme gruvbox
" colorscheme onedark


" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
" ==============================================================
" General Settings
" ==============================================================
" Recommended default
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set hlsearch
set autowrite		" Automatically save before commands like :next and :make
set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)
set clipboard=unnamed
set so=999

" Misc
set ruler
set encoding=utf-8
set ttyfast
set laststatus=2
set showmode
set showcmd

" turn hybrid line numbers on
set number relativenumber
set nu rnu

" ESC delay
set ttimeoutlen=5

setlocal foldmethod=indent
set nofoldenable

" ==============================================================
" Bindings
" ==============================================================
let mapleader = ","
"
" Toggle background dark/light
map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>

" Buffers
noremap <leader>l :ls<CR>:b<space>
nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt

" Folding
inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf

" move vertically by visual line
nnoremap j gj
nnoremap k gk
"
" Delete sending to null register
nnoremap <leader>d "_d

nnoremap / /\v
vnoremap / /\v
nmap <S-J> ddp
nmap <S-K> ddkP
nmap <S-H> ^
nmap <S-L> $
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Plugins mapping
nmap <C-n> :NERDTreeToggle<CR>
nnoremap <F9> :Black<CR>
nnoremap <leader>t :CtrlPBufTag<CR>

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" Vundle settings
" ---------------
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ==============================================================
" Plugings
" ==============================================================
Plugin 'gmarik/Vundle.vim'

" General
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-syntastic/syntastic'
Plugin 'Yggdroot/indentLine'
Plugin 'preservim/nerdcommenter'

" Python
Plugin 'nvie/vim-flake8'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'psf/black'

" JavaScript
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/0.x'
  \ }

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" AutoCommands
" ============
" Disable comments on new lines
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

" Python
" ------
au BufNewFile,BufRead *.py
    \ set tabstop=4        |
    \ set softtabstop=4    |
    \ set shiftwidth=4     |
    \ set textwidth=90     |
    \ set expandtab        |
    \ set autoindent       |
    \ set fileformat=unix  |

" Auto format on save
autocmd BufWritePre *.py execute ':Black'

" JavaScript
" ----------
" Disable quote concealing in JSON files

au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2     |
    \ set softtabstop=2 |
    \ set shiftwidth=2  |

autocmd Filetype json
  \ au! |
  \ let g:indentLine_setConceal = 0 |
  \ let g:vim_json_syntax_conceal = 0

let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args="--max-line-length=90 --ignore=F403,F405,F821,E203,W503"
let python_highlight_all=1
syntax on

" NERDCommenter
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_python = 1  " Defaults to "# "

" Allows alt-commenting in React
let g:NERDCustomDelimiters={
	\ 'javascript': { 'left': '//', 'right': '', 'leftAlt': '{/*', 'rightAlt': '*/}' },
\}

" Black (Python)
let g:black_linelength = 90

" NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$', '__pycache__$'] "ignore files in NERDTree

set wildignore+=*/venv/*,*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*     " MacOSX/Linux
set clipboard=unnamedplus

" ==============================================================
" CtrlP
" (!) Must "sudo apt install ctags" and have "buffertag" enabled to work properly
" ==============================================================

" Custom handler for JS (broken JSCTAGS)
let g:ctrlp_buftag_types = { 'javascript': '--language-force=javascript --javascript-types=fcmv' }
let g:ctrlp_extensions = ['tag', 'buffertag']
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

augroup python
    autocmd!
    autocmd FileType python
                \   syn match pythonAttrs /\.\zs[a-zA-Z_]*/
                \ | highlight def link pythonAttrs Underlined
augroup end
