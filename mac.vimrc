" ******************** 全 局 设 置 ****************** “
set number		  " 显示行号
"set relativenumber       " 相对行号
set helplang=cn		  " 中文help
set cursorline            " 突出显示当前行
set mouse=a               " 支持鼠标
set cursorcolumn	  " 高亮显示当前列  
set ruler                 " 打开状态栏标尺
set nobackup              " 覆盖文件时不备份
set background=dark       " 背景色
set nocompatible	  " 关闭兼容模式  
set incsearch		  " 开启实时搜索功能  
set ignorecase		  " 搜索忽略大小写  
set wildmenu		  " vim命令自动补全  
set autoread		  " 文件自动更新  
set gcr=a:block-blinkon0  " 禁止光标闪烁  
set laststatus=2	  " 总是显示状态栏  
set hlsearch		  " 高亮显示搜索结果  
set nowrap		  " 禁止折行  
set backspace=2		  " 回退键生效  
set t_Co=256		  " 256色终端
set noswapfile            " 不产生swap文件

autocmd BufWritePost $MYVIMRC source $MYVIMRC

colorscheme solarized
"colorscheme molokai
let g:Powerline_colorscheme='solarized256' " 设置状态栏主题风格
let mapleader=";"     " 快捷键前缀; 右手小指处  

" ******************** 代 码 阅 读 ****************** “
filetype on	      " 开启文件类型检测 
filetype plugin on    " 根据侦测到的不同类型加载对应的插件
filetype indent on    " 自适应缩进
syntax enable	      " 语法高亮
syntax on	      " 允许用指定语法高亮配色方案替换默认方案

set expandtab         " 将制表符扩展为空格
set tabstop=8         " 设置编辑时制表符占用空格数
set shiftwidth=8      " 设置格式化时制表符占用空格数
set softtabstop=8     " 让 vim 把连续数量的空格视为一个制表符

"za，打开或关闭当前折叠；zM，关闭所有折叠；zR，打开所有折叠
"set foldmethod=indent " 基于缩进进行代码折叠
set foldmethod=syntax " 基于语法进行代码折叠
set nofoldenable      " 启动 vim 时关闭折叠代码

" ******************** 插件管理 ****************** “
filetype off	      " vundle 环境设置
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()   " vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'Lokaltog/vim-powerline'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/indexer.tar.gz'
Plugin 'vim-scripts/DfrankUtil'
Plugin 'vim-scripts/vimprj'
Plugin 'dyng/ctrlsf.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'vim-scripts/DrawIt'
Plugin 'scrooloose/nerdtree'
Plugin 'fholgado/minibufexpl.vim'
call vundle#end()     " 插件列表结束
filetype plugin indent on
filetype plugin on


" >>>>>>>>>>>>>>>>>>>> [ tagbar ]
" Ctrl+] 跳转到定义; Ctrl+t 跳回; Ctrl+w 切换窗口
let tagbar_left=1                           " 设置 tagbar 子窗口的位置出现在主编辑区的左边
nnoremap <Leader>tt :TagbarToggle<cr>      " 设置显示／隐藏标签列表子窗口的快捷键。速记：identifier list by tag
let tagbar_width=32                         " 设置标签子窗口的宽度
let g:tagbar_compact=1                      " tagbar 子窗口中不显示冗余帮助信息
" 设置 ctags 对哪些代码标识符生成标签
let g:tagbar_type_cpp = {
    \ 'kinds' : [
         \ 'c:classes:0:1',
         \ 'd:macros:0:1',
         \ 'e:enumerators:0:0',
         \ 'f:functions:0:1',
         \ 'g:enumeration:0:1',
         \ 'l:local:0:1',
         \ 'm:members:0:1',
         \ 'n:namespaces:0:1',
         \ 'p:functions_prototypes:0:1',
         \ 's:structs:0:1',
         \ 't:typedefs:0:1',
         \ 'u:unions:0:1',
         \ 'v:global:0:1',
         \ 'x:external:0:1'
     \ ],
     \ 'sro'        : '::',
     \ 'kind2scope' : {
         \ 'g' : 'enum',
         \ 'n' : 'namespace',
         \ 'c' : 'class',
         \ 's' : 'struct',
         \ 'u' : 'union'
     \ },
     \ 'scope2kind' : {
         \ 'enum'      : 'g',
         \ 'namespace' : 'n',
         \ 'class'     : 'c',
         \ 'struct'    : 's',
         \ 'union'     : 'u'
     \ }
     \ }

" 默认 --c++-kinds=+p+l，重新设置为 --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v
" 默认 --fields=+iaS 不满足 YCM 要求，需改为 --fields=+iaSl
let g:indexer_ctagsCommandLineOptions="--c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"


" >>>>>>>>>>>>>>>>>>>> [ ctags ]
nmap <Leader>tn :tnext<CR>        " 正向遍历同名标签
nmap <Leader>tp :tprevious<CR>    " 反向遍历同名标签

" >>>>>>>>>>>>>>>>>>> [ CtrlSF ]
" 使用 ctrlsf.vim 插件在工程内全局查找光标所在关键字，设置快捷键。快捷键速记法：search in project
nnoremap <Leader>sp :CtrlSF<CR>

" >>>>>>>>>>>>>>>>>>> [ vim-multiple-cursors ]
" Default mapping, v to begin, c to modify
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" >>>>>>>>>>>>>>>>>>> [ Drawit ]
" :DIstart 开始绘图  :DIstop 结束绘图
" ^    上箭头      v    下箭头     >   右箭头       <    左箭头
" PgUp 右上斜线    PgDn 右下斜线   End 左下斜线     Home 左上斜线
nnoremap <leader>Di :DIstart<CR>
nnoremap <leader>Ds :DIstop<CR>

" >>>>>>>>>>>>>>>>>> [ NERDTree ]
nmap <Leader>fl :NERDTreeToggle<CR>                                 " 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
let NERDTreeWinSize=32                                              " 设置NERDTree子窗口宽度
let NERDTreeWinPos="right"                                          " 设置NERDTree子窗口位置
let NERDTreeShowHidden=1                                            " 显示隐藏文件
let NERDTreeMinimalUI=1                                             " NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeAutoDeleteBuffer=1                                      " 删除文件时自动删除文件对应 buffer

" >>>>>>>>>>>>>>>>>> [ MiniBufExplorer ]
map <Leader>bl :MBEToggle<cr>                                       " 显示/隐藏 MiniBufExplorer 窗口
map <C-Tab> :MBEbn<cr>                                              " buffer 切换快捷键
map <C-S-Tab> :MBEbp<cr>
