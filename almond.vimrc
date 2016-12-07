" ******************** 全 局 设 置 ****************** “
set number			  " 显示行号
"set relativenumber    " 相对行号
set helplang=cn		  " 中文help
set cursorline        " 突出显示当前行
set mouse=a           " 支持鼠标
set cursorcolumn	  " 高亮显示当前列  
set ruler             " 打开状态栏标尺
set nobackup          " 覆盖文件时不备份
set background=dark   " 背景色
set nocompatible	  " 关闭兼容模式  
set incsearch		  " 开启实时搜索功能  
set ignorecase		  " 搜索忽略大小写  
set wildmenu		  " vim命令自动补全  
set autoread		  " 文件自动更新  
set gcr=a:block-blinkon0 "禁止光标闪烁  
set laststatus=2	  " 总是显示状态栏  
set hlsearch		  " 高亮显示搜索结果  
set nowrap			  " 禁止折行  
set backspace=2		  " 回退键生效  
set t_Co=256		  " 256色终端

autocmd BufWritePost $MYVIMRC source $MYVIMRC

colorscheme solarized
let g:Powerline_colorscheme='solarized256' " 设置状态栏主题风格
let mapleader=";"     " 快捷键前缀; 右手小指处  

" ******************** 代 码 阅 读 ****************** “
filetype on			  " 开启文件类型检测 
filetype plugin on    " 根据侦测到的不同类型加载对应的插件
filetype indent on	  " 自适应缩进
syntax enable		  " 语法高亮
syntax on			  " 允许用指定语法高亮配色方案替换默认方案

set expandtab         " 将制表符扩展为空格
set tabstop=4         " 设置编辑时制表符占用空格数
set shiftwidth=4      " 设置格式化时制表符占用空格数
set softtabstop=4     " 让 vim 把连续数量的空格视为一个制表符

"za，打开或关闭当前折叠；zM，关闭所有折叠；zR，打开所有折叠
"set foldmethod=indent " 基于缩进进行代码折叠
set foldmethod=syntax " 基于语法进行代码折叠
set nofoldenable      " 启动 vim 时关闭折叠代码

" ******************** 插件管理 ****************** “
filetype off		  " vundle 环境设置
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()   " vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
"Plugin 'tomasr/molokai'
"Plugin 'vim-scripts/phd'
Plugin 'Lokaltog/vim-powerline' 
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/indexer.tar.gz'
Plugin 'vim-scripts/DfrankUtil'
Plugin 'vim-scripts/vimprj'
Plugin 'vim-scripts/DoxygenToolkit.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'dyng/ctrlsf.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/DrawIt'
Plugin 'SirVer/ultisnips'
call vundle#end()     " 插件列表结束
filetype plugin indent on
filetype plugin on


" >>>>>>>>>>>>>>>>>>>> [ vim-indent-guides ]
let g:indent_guides_enable_on_vim_startup=1 " 随 vim 自启动
let g:indent_guides_start_level=2           " 从第二层开始可视化显示缩进
let g:indent_guides_guide_size=1            " 色块宽度

" >>>>>>>>>>>>>>>>>>>> [ vim-fswitch ]
nmap <silent> <Leader>sw :FSHere<cr>        " *.cpp 和 *.h 间切换

" >>>>>>>>>>>>>>>>>>>> [ ctags ]
set tags+=~/.vim/systags
set tags=tags;
set autochdir

" >>>>>>>>>>>>>>>>>>>> [ tagbar ]
" Ctrl+] 跳转到定义; Ctrl+t 跳回; Ctrl+w 切换窗口
let tagbar_left=1                           " 设置 tagbar 子窗口的位置出现在主编辑区的左边 
nnoremap <Leader>ils :TagbarToggle<cr>      " 设置显示／隐藏标签列表子窗口的快捷键。速记：identifier list by tag
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

" >>>>>>>>>>>>>>>>>>> [ DoxygenToolkit ]
" 文件首行，输入:DoxAuthor将插入文件头注释骨架
" 数据结构声明或函数声明的第一行，运行:Dox，将生成数据结构或函数的注释骨架
let g:DoxygenToolkit_authorName="dupengair@163.net" 

" >>>>>>>>>>>>>>>>>>> [ man.vim ]
" 添加man窗口
:source $VIMRUNTIME/ftplugin/man.vim

" >>>>>>>>>>>>>>>>>>> [ YCM ] 
nnoremap <leader>jc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>jd :YcmCompleter GoToDefinition<CR> " 只能是 #include 或已打开的文件

" >>>>>>>>>>>>>>>>>>> [ CtrlSF ]
" 使用 ctrlsf.vim 插件在工程内全局查找光标所在关键字，设置快捷键。快捷键速记法：search in project
nnoremap <Leader>sp :CtrlSF<CR>

" >>>>>>>>>>>>>>>>>>> [ vim-multiple-cursors ]
" Default mapping, v to begin, c to modify
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" >>>>>>>>>>>>>>>>>>> [ NERD Commenter ]
" <leader>cc: 添加注释, <leader>cu: 取消注释

" >>>>>>>>>>>>>>>>>>> [ Drawit ]
" :DIstart 开始绘图  :DIstop 结束绘图
" ^    上箭头      v    下箭头     >   右箭头       <    左箭头
" PgUp 右上斜线    PgDn 右下斜线   End 左下斜线     Home 左上斜线
nnoremap <leader>Di :DIstart<CR>
nnoremap <leader>Ds :DIstop<CR>

" >>>>>>>>>>>>>>>>>>> [ UltiSnips ]
let g:UltiSnipsSnippetDirectories=["dupsnippets"]
" UltiSnips 的 tab 键与 YCM 冲突，重新设定
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"
