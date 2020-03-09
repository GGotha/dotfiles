set nocompatible              " be iMproved, required
set exrc
set noswapfile
set nobackup
set encoding=utf-8
set clipboard=unnamedplus
set incsearch
set noshowmode
set runtimepath^=~/.vim/bundle/ag.vim

filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Themes
Plugin 'bling/vim-airline'
Plugin 'valloric/YouCompleteMe.git'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'erickzanardo/vim-xclip'
Plugin 'ervandew/supertab'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'tpope/vim-pathogen'
Plugin 'tpope/vim-unimpaired'
Plugin 'isRuslan/vim-es6'
Plugin 'rking/ag.vim'

call plug#begin('~/.vim/plugged')
"Themes
Plug 'vim-airline/vim-airline-themes'
"Gruvbox theme
Plug 'morhetz/gruvbox'

Plug 'pangloss/vim-javascript'
Plug 'othree/yajs.vim', {'for': 'javascript'}
Plug 'othree/es.next.syntax.vim', {'for': 'javascript'}
Plug 'pearofducks/ansible-vim'
Plug 'HerringtonDarkholme/yats.vim'

Plug 'neoclide/coc.nvim', {'do': './install.sh nightly'}
Plug 'janko/vim-test'

"Syntax format for jsx
Plug 'maxmellon/vim-jsx-pretty'

"Syntax support for graphql
Plug 'jparise/vim-graphql'

"Change code on save
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

"Search
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

call plug#end()

" vim-test preserve output screen
let g:test#preserve_screen = 1

" Status bar plugin (vim-airline)
let g:airline_left_sep = ''
let g:airline_right_sep = ''
" neocomplcache
let g:neocomplcache_enable_at_startup = 1
" vim javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1

" ctrlp ignore folders
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" Prettier Configs
let g:prettier#exec_cmd_async = 1
let g:prettier#config#print_width = 'auto'
let g:prettier#config#tab_width = '2'
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

call vundle#end()            " required
filetype plugin indent on    " required

call pathogen#infect()

" Few configurations:
set hlsearch " Highlight search results
set encoding=utf8
set background=dark
set ffs=unix,dos,mac
set modeline
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set backspace=indent,eol,start
set laststatus=2
set cpoptions+=n
set number
set vb
set smartindent
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=235 gui=NONE guifg=NONE guibg=NONE
set clipboard=unnamed,unnamedplus

"set term=screen-256color
" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points
" ============ you complete me ==========
let g:ycm_autoclose_preview_window_after_completion=1

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Search ===========================

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" CtrlP to ignore
set wildignore+=*.swp,*.pyc
let g:ctrlp_show_hidden = 1
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ag_working_path_mode="r"

" NerdTree show hidden files
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.swp$', '\.pyc$']

" Short cuts:
let mapleader=","
map <C-p> :Files<CR>
map <C-]> :NERDTreeToggle<CR>
map <C-F> :NERDTreeFind<CR>         " Open NERDTree and focus on current file
nmap <C-d> mzyyp`z " Copy line
map <F5> :e!<CR>                    " force reload current file
map <F6> :CtrlPClearAllCaches<CR>   " clear all CtrlP cache
map <leader>W :w<CR>                " Prettier by default will run on auto save
map <leader>w :wincmd k<CR>        " go window up
map <leader>s :wincmd j<CR>        " go window down
map <leader>a :wincmd h<CR>        " go window left
map <leader>d :wincmd l<CR>        " go window right
nnoremap <Leader>b :NERDTreeToggle<Enter>
nnoremap <Leader>ft :NERDTreeFind<CR>
map <leader>k <UP><CR> " up
map <leader>r :redo<CR> " Redo like CTRL + Y
map <leader>v :vertical :new<CR>   " open new vertical window
map <leader>h :new<CR>             " open a new horizontal window
map <leader>q :q<CR>               " it quit current vim buffer
map <leader>n :tabnew<CR>          " create a new tab
map <leader>z :tabprevious<CR>     " move to previous tab
map <leader>x :tabnext<CR>         " move to next tab
map <leader>y :call system('xclip -selection clipboard', @0)<CR>  " move last yank selection to xclip
map <leader>t :CtrlPTag<cr>
map <leader>no :noh<cr> " remove highlight words
map <leader>c :t <tab> :set ruler<CR> " copy line and paste
map - <C-W>-
map + <C-W>+
"nmap <silent> k :call CocAction('doHover')<CR>
"autocmd CursorHold * silent call CocActionAsync('doHover')
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


nnoremap <silent> <Leader>gt:YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>

nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>
nnoremap <Leader>ps :Ag<SPACE>

autocmd BufNewFile,BufRead *.yaml.hbs   set syntax=ansible

"Gruvbox config
"let g:gruvbox_contrast_dark='soft'

syntax enable
set background=dark
" solarized options
"colorscheme solarized
colorscheme gruvbox
let g:airline_theme='bubblegum'
set runtimepath^=~/.vim/bundle/ag
