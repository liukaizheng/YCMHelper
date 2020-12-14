set nocompatible
set number
set hlsearch
set encoding=utf-8
set rtp+=~/vimfiles/autoload/
set rtp+=~/vimfiles/autoload/plug.vim
set expandtab
set tabstop=4
set shiftwidth=4 
set softtabstop=4 
set writebackup 
set foldmethod=indent
set nofoldenable
let mapleader=","

nnoremap <leader>sv :source $MYVIMRC<CR>
inoremap jk <esc>
nmap <Leader>n :NERDTreeToggle<CR>
nmap <Leader>vim :vsplit $HOME/_vimrc<CR>
nmap <Leader>m :!python3 %<CR>
filetype off
syntax enable
syntax on
filetype plugin indent on
set guifont=Fantasque_Sans_Mono:h12

"************youcompleteme set************************
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1
"let g:ycm_server_python_interpreter='/usr/bin/python3'
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
"**************************end ***********************

call plug#begin('~/vimfiles/autoload')
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'easymotion/vim-easymotion'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'dyng/ctrlsf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'Valloric/YouCompleteMe'
Plug 'rhysd/vim-clang-format'
Plug 'flazz/vim-colorschemes'
Plug 'rakr/vim-one'
Plug 'bfrg/vim-cpp-modern'
call plug#end()

"******************cpp-enhanced-highlight*****************
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight = 1
"*********************************************************

"****************LeaderF*****************************
noremap <leader>lb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>lf :<C-U><C-R>=printf("Leaderf file %s", "")<CR><CR>
"****************LeaderF*****************************

"******************air line**************************
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
" the separator used on the left side >
let g:airline_left_sep='>'

" the separator used on the right side >
let g:airline_right_sep='<'

" enable modified detection >
let g:airline_detect_modified=1

" enable paste detection >
let g:airline_detect_paste=1

" enable crypt detection >
let g:airline_detect_crypt=1

" enable spell detection >
let g:airline_detect_spell=1

" display spelling language when spell detection is enabled
"  (if enough space is available) >
let g:airline_detect_spelllang=1

" enable iminsert detection >
let g:airline_detect_iminsert=0

" determine whether inactive windows should have the left section collapsed to
" only the filename of that buffer.  >
let g:airline_inactive_collapse=1

" Use alternative seperators for the statusline of inactive windows >
let g:airline_inactive_alt_sep=1 

" themes are automatically selected based on the matching colorscheme. this
" can be overridden by defining a value. >
let g:airline_theme='one'
set background=dark
colorscheme one
"******************air line*************************

" 正向遍历同名标签
nmap <leader>bn :bnext<CR>
" 反向遍历同名标签
nmap <leader>bp :bprevious<CR>

" 设置插件 indexer 调用 ctags 的参数
" 默认 --c++-kinds=+p+l，重新设置为 --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v
" 默认 --fields=+iaS 不满足 YCM 要求，需改为 --fields=+iaSl
"let g:indexer_tags_command="gtags"
"let g:indexer_ctagsCommandLineOptions="--c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"
""去掉indexer警告
"let g:indexer_disableCtagsWarning=1


" 只能是 #include 或已打开的文件
nnoremap <leader>jc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
nnoremap <leader>ji :YcmCompleter GoToInclude<CR>
nnoremap <leader>gt :YcmCompleter GetType<CR>
nnoremap <leader>fi :YcmCompleter FixIt<CR>
" YCM 补全菜单配色
" 菜单
highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
" 选中项
highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900
" 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1
" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=0
" 开启 YCM 标签补全引擎
let g:ycm_collect_identifiers_from_tags_files=1
" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
inoremap <leader>; <C-x><C-o>
" 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview
" 从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=1
" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 语法关键字补全			
let g:ycm_seed_identifiers_with_syntax=1
" 开启 YCM 标签引擎
let g:ycm_collect_identifiers_from_tags_files=1



"*****************gutentags***************
" gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = []
if executable('ctags')
	let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
	let g:gutentags_modules += ['gtags_cscope']
endif

" 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let g:gutentags_cache_dir = expand('~/.cache/tags')

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazSl', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxl']
let g:gutentags_ctags_extra_args += ['--c-kinds=+pxl']

" 禁用 gutentags 自动加载 gtags 数据库的行为
let g:gutentags_auto_add_gtags_cscope = 0
"*****************gutentags***************



"**************CtrlSF**********************
nnoremap <leader>s :CtrlSF<cr>
"**************CtrlSF**********************

if has("gui_running")
    au GUIEnter * simalt ~x
    set guioptions -=m
    set guioptions -=T
    set guioptions -=L
    set guioptions -=0
endif
