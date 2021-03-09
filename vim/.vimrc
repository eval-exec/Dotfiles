set nocompatible  
set encoding=UTF-8
set shortmess=I
set clipboard=unnamed
set guioptions+=a
set showcmd
set foldmethod=syntax
set nofoldenable

let mapleader = ","


source ~/.vimrc.plugin

set number relativenumber
set nu rnu
syntax on
filetype on  
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
set pastetoggle=<F2>
set showmode

" set shiftwidth=4
set autoindent
set smartindent
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

set timeoutlen=1000 ttimeoutlen=0

set wildmenu
set wildmode=longest:full,full

set ignorecase

let g:AutoPairsFlyMode = 0
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle


set so=7

syntax enable
" set t_Co=256
" colorscheme primary
"colorscheme gruvbox-material
"colorscheme challenger_deep
"colorscheme gruvbox
colorscheme vividchalk
"colorscheme abstract
" let g:tokyonight_style = 'night' " available: night, storm
" let g:tokyonight_enable_italic = 1
" colorscheme tokyonight
" colorscheme ayu
" colorscheme PaperColor
" colorscheme gruvbox8_hard
"

if has('termguicolors')
  set termguicolors
endif
" 
" let g:material_terminal_italics = 1
" let g:material_theme_style = 'darker'
" colorscheme material
set background=dark
" highlight Normal guibg=black guifg=white
" 
" "highlight LineNr term=bold cterm=NONE ctermfg=White ctermbg=Black gui=NONE guifg=White guibg=NONE
" 
" set cursorline
" " hi cursorline cterm=none term=none
" autocmd WinEnter * setlocal cursorline
" autocmd WinLeave * setlocal nocursorline
" highlight CursorLine guibg=#000000 ctermbg=000

let g:indentLine_char = '▏'
let g:indentLine_conceallevel = 1
let g:indentLine_char_list = ['|', '¦', '┆', '┊']


let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1


"auto complete

set conceallevel=2
set concealcursor=vin
let g:clang_snippets=1
let g:clang_conceal_snippets=1
let g:clang_snippets_engine='clang_complete'

" Complete options (disable preview scratch window, longest removed to aways show menu)
set completeopt=menu,menuone

" Limit popup menu height
set pumheight=20

" SuperTab completion fall-back 
let g:SuperTabDefaultCompletionType='<c-x><c-u><c-p>'

let g:ale_sign_column_always = 1

let g:airline_powerline_fonts = 1

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |  quit | endif


" airline
let g:airline#extensions#tabline#enabled = 1

let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_theme='molokai'

let g:sneak#label = 1
" Mapping selecting mappings

" Insert mode completion
inoremap <expr> <c-x><c-f> fzf#vim#complete#path('rg --files')

let g:fzf_preview_window = []
let g:fzf_buffers_jump = 1
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

nmap <Leader>f :GFiles<CR>
nmap <Leader>F :Files<CR>

nmap <Leader>b :Buffers<CR>
nmap <Leader>h :History<CR>

nmap <Leader>t :BTags<CR>
nmap <Leader>T :Tags<CR>

nmap <Leader>l :BLines<CR>
nmap <Leader>L :Lines<CR>
nmap <Leader>' :Marks<CR>'

nmap <Leader>H :Helptags!<CR>

nmap <Leader>C :Commands<CR>

nmap <Leader>: :History:<CR>

nmap <Leader>M :Maps<CR>
nmap <Leader>s :Filetypes<CR>
nmap <Leader>m :FZFMru<CR>

" snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
