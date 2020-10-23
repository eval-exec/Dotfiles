syntax on
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'easymotion/vim-easymotion'
Plug 'ryanoasis/vim-devicons'

Plug 'chuling/ci_dark'

Plug 'ianding1/leetcode.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'powerline/powerline'
Plug 'ctrlpvim/ctrlp.vim'

" optional
Plug 'luochen1990/rainbow'

" Initialize plugin system
call plug#end()



"set background=dark
set shortmess=I " Read :help shortmess for everything else.
set relativenumber
set number
set number relativenumber
set timeoutlen=1000 ttimeoutlen=0
set showcmd

set clipboard=unnamed
" fold
set foldmethod=syntax
set nofoldenable

"color scheme

colorscheme ir_black

if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
else
    let &t_SI = "\e[5 q"
    let &t_EI = "\e[2 q"
endif


