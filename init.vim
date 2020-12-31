call plug#begin('~/.vim/plugged')
    if has('nvim')
      Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    else
      Plug 'Shougo/deoplete.nvim'
      Plug 'roxma/nvim-yarp'
      Plug 'roxma/vim-hug-neovim-rpc'
    endif
    Plug 'autozimu/LanguageClient-neovim', {
        \ 'branch': 'next',
        \ 'do': 'bash install.sh',
        \ }
    Plug 'bfrg/vim-cpp-modern'
    Plug 'flazz/vim-colorschemes'
    Plug 'scrooloose/nerdcommenter'
    Plug 'vim-airline/vim-airline'
    Plug 'easymotion/vim-easymotion'
    Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
call plug#end()

let g:deoplete#enable_at_startup = 1
let g:python3_host_prog = "C:/Python38/python.exe"
let g:LanguageClient_serverCommands = {
    \ 'cpp': ['clangd'],
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rust-analyzer'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ }

set nocompatible
set number
set hlsearch
set encoding=utf-8
set expandtab
set tabstop=4
set shiftwidth=4 
set softtabstop=4 
set writebackup 
set foldmethod=indent
set nofoldenable
let mapleader=","


inoremap jk <esc>
filetype off
syntax enable
syntax on
filetype plugin indent on

nmap <leader>m <Plug>(lcn-menu)
nmap K <Plug>(lcn-hover)
nmap gd <Plug>(lcn-definition)
nmap gt <Plug>(lcn-type-definition)
nmap gr <Plug>(lcn-references)
nmap gi <Plug>(lcn-implementation)
nmap ga <Plug>(lcn-code-action)
nmap gn <Plug>(lcn-rename)
nmap gf <Plug>(lcn-format)
nmap gs :call LanguageClient_textDocument_switchSourceHeader()<CR>

" use tab to forward cycle
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" use tab to backward cycle
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

"****************LeaderF*****************************
noremap <leader>lb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>lf :<C-U><C-R>=printf("Leaderf file %s", "")<CR><CR>
"****************LeaderF*****************************

let g:airline#extensions#tabline#enabled = 1

au VimEnter * GuiPopupmenu 0

colorscheme material
set guifont=Hack:h10
