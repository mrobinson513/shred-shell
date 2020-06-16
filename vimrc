set nocompatible 	" required
filetype off 		" required
set nu 			" line numbers
set encoding=utf-8
set clipboard=unnamed	" use system clipboard

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" Designiate the direction of layout splits
set splitbelow
set splitright

" Navigate split layouts with CTRL+direction

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding / collapsing
set foldmethod=indent
set foldlevel=99

" Plugin that makes folding better
Plugin 'tmhedberg/SimpylFold'

" PEP8 indentation standard
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

" Plugin to handle auto-indenting better
Plugin 'vim-scripts/indentpython.vim'

" Mark bad whitespace
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Handle virtualenv (Python3 edition)

"python with virtualenv support
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF


" Robust auto-complete plugin
" NOTE: See dependency installation instructions at:
" https://github.com/ycm-core/YouCompleteMe#linux-64-bit

Bundle 'Valloric/YouCompleteMe'
let g:ycm_autoclose_preview_window_after_completion=1

" Support for python VirtualEnv

"Syntax check
Plugin 'vim-syntastic/syntastic'

" Pretty-ass colours
let python_highlight_all=1
syntax on
Plugin 'jnurmine/Zenburn'

colorscheme zenburn

" File browsing
Plugin 'preservim/nerdtree'
" Ignore .pyc files
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" Searching
Plugin 'kien/ctrlp.vim'

" git integration
Plugin 'tpope/vim-fugitive'

" status bar
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
