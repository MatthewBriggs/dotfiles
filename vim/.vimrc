set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'bling/vim-airline'

Plugin 'scrooloose/nerdtree.git'

Plugin 'tpope/vim-surround'
"http://vimawesome.com/plugin/vim-surround-forever-and-always

Plugin 'bash-support.vim'
"http://lug.fh-swf.de/vim/vim-bash/bash-hotkeys.pdf

Plugin 'terryma/vim-multiple-cursors'
"http://vimawesome.com/plugin/vim-multiple-cursors

Plugin 'tyru/open-browser.vim'
"http://vimawesome.com/plugin/open-browser-vim

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

set laststatus=2             " required for vim-airline

syntax enable


set background=dark

colorscheme predawn

set number
