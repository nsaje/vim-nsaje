"" Python settings
"set tabstop=4
"set shiftwidth=4
"set expandtab
"set autoindent
"set smartindent
"syntax on
"
"" Pathogen plugin manager
"execute pathogen#infect()
"filetype plugin indent on
"

set scrolloff=5

set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'scrooloose/nerdtree'
Bundle 'klen/python-mode'
"fuzzy search
Bundle 'kien/ctrlp.vim' 
"git wrapper
Bundle 'tpope/vim-fugitive' 
Bundle 'ivanov/vim-ipython'
Bundle 'davidhalter/jedi-vim'
" Snippets manager (SnipMate), dependencies, and snippets repo
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'honza/vim-snippets'
Bundle 'garbas/vim-snipmate'
" colorscheme
Bundle 'Wombat'
" syntax check
Bundle 'scrooloose/syntastic'

filetype plugin indent on     " required!

" highlight excess line length (79)
augroup vimrc_autocmds
    autocmd!
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%79v.*/
    autocmd FileType python set nowrap
augroup END

" Powerline setup
" set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
set laststatus=2

" NerdTree binding
map <F2> :NERDTreeToggle<CR>

" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 0

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0
" end python-mode config

" automatically change window's cwd to file's dir
set autochdir

" indentation settings
set tabstop=4
set shiftwidth=4
set expandtab

"" Natural splitting
set splitbelow
set splitright

" tab navigation
map tn :tabn<CR>
map tp :tabp<CR>
map tm :tabm
map tt :tabnew
map ts :tab split<CR>
map <C-S-Right> :tabn<CR>
imap <C-S-Right> <ESC>:tabn<CR>
map <C-S-Left> :tabp<CR>
imap <C-S-Left> <ESC>:tabp<CR>

" ipython
map lpi :source ~/.vim/bundle/vim-ipython/ftplugin/python/ipy.vim<CR>

syntax on

" local vimrc
if filereadable(glob("~/.vimrc.local")) 
    source ~/.vimrc.local
endif
