" THIS IS FABIAN'S .vimrc FILE
" IF YOU WANT TO USE THIS JUST PUT IT
" IN YOUR USER DIRECTORY AND SAVE IT AS WINDOWS=_vimrc
" AND LINUX=.vimrc. RESTART YOUR VIM AND HAVE FUN!!!
syntax on
let mapleader = " "

set clipboard=unnamed
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smartindent
set nu
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set expandtab
set nobackup
set undodir=$HOME/.vim/undodir
set undofile
set incsearch
set scrolloff=10
set signcolumn=yes
set linespace=2
set t_ut=""

" OS specific guifont
if has("gui_running")
    au GUIEnter * simalt ~x
    if has("gui_gtk2")
        set guifont=Inconsolata\ 12
    elseif has("gui_macvim")
        set guifont=Menlo\ Regular:h14
    elseif has("gui_win32")
        set guifont=Consolas:h11:cANSI
    endif
endif

" disable arrow keys and space and backspace
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <space> <Nop>
noremap <backspace> <Nop>

" plugins
call plug#begin('~/.vim/plugged')
Plug 'gorodinskiy/vim-coloresque'
Plug 'joshdick/onedark.vim'
Plug 'tomasiser/vim-code-dark'
Plug 'arcticicestudio/nord-vim'
Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'https://git::@github.com/preservim/nerdcommenter.git'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
call plug#end()

" scheme
set laststatus=2
let g:airline_theme= 'codedark'
colorscheme codedark

" plugin related configs
source $HOME/.vim/plug-config/coc.vim
let g:ctrlp_user_command = ['.git\', 'git --git-dir=%s\.git ls-files -oc --exclude-standard']
let g:NERDSpaceDelims = 1

" remaps
nnoremap <leader>o o<esc>
nmap <leader>l :PlugInstall<CR>
nmap <leader><F1> :NERDTreeToggle<CR>
nmap <leader>b :term<CR>
" Tab config
nmap <leader>1 1gt
nmap <leader>2 2gt
nmap <leader>3 3gt
nmap <leader>4 4gt
nmap <leader>5 5gt
nmap <leader>6 6gt
nmap <leader>7 7gt
nmap <leader>8 8gt
nmap <leader>9 9gt
nmap <leader>t :tabedit<space>
nmap <leader>tc :tabclose<CR>
" buffer hotkeys
nmap <leader>n :bNext<CR>
nmap <leader>p :bprevious<CR>
" Fugitive
nnoremap <leader>gs :G<cr>
nmap <leader>gc :Git commit<cr>
nmap <leader>gp :Git push<cr>
nmap <leader>gpu :Git pull<cr>
" splits
nmap <leader>sh :sp<cr>
nmap <leader>sv :vsp<cr>

" Mapping to reload conf
nmap <leader>so :source $HOME/.vimrc<CR>

" Mapping to open vimrc file
nmap <leader>rc :e $HOME/.vimrc<CR>

" Mapping to quicksafe
nmap <silent><F1> :w<CR>

" autocommands
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup pers_autocmd
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
    autocmd VimEnter * NERDTree
    autocmd VimEnter * wincmd w
augroup END
