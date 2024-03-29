set nocompatible              " be iMproved, required
filetype off                  " required

"Basic Settings
syntax on
set number
set encoding=UTF-8
set guifont=DroidSans\ Mono\ Nerd\ 12
set colorcolumn=80

"Dracula Theme
packadd! dracula
syntax enable
colorscheme dracula

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
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
Plugin 'ap/vim-css-color'
" Syntax highlightimg and autocomplete
Plugin 'sheerun/vim-polyglot'
Plugin 'dense-analysis/ale'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
"Plugin 'hdima/python-syntax'
"Plugin 'vim-python/python-syntax'
"let g:python_highlight_all = 1
" Nerdtree plugins
Plugin 'scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<CR>
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'ryanoasis/vim-devicons'
Plugin 'xuyuanp/nerdtree-git-plugin'
Plugin 'airblade/vim-gitgutter'
Plugin 'preservim/nerdcommenter' "<leader> + / to comment the block
filetype plugin on
Plugin 'vim-airline/vim-airline'
" vim airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
Plugin 'vim-airline/vim-airline-themes'
let g:airline_theme='deus'

Plugin 'kien/ctrlp.vim' "Fuzzy finder
Plugin 'mattn/emmet-vim' "Ctrl+y+, para expandir
Plugin 'prettier/prettier'
Plugin 'pedrohdz/vim-yaml-folds' "vim-yaml-folds

set foldlevelstart=20
Plugin 'adrienverge/yamllint' "yaml lint
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_text_changed = 'never'

Plugin 'myusuf3/numbers.vim' " Plugin para alternar de forma inteligente números das linhas

"Other settings
set mouse=a "habilita o mouse

" Tab settings
autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab number autoindent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab autoindent

"Fix spliting
set splitbelow splitright

"Remap splits navigation to just CTRL + hjkl (default CTRL+W SHIFT+R)
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

"Make adjusting split sizes a bot more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize +3<CR>

let g:NERDTree = ['^node_modules$']
