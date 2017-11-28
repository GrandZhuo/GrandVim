"**********************************************************************
"                               Vundle                                *
"**********************************************************************
" Vundle BRGING>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
" 关闭兼容模式
set nocompatible              " be iMproved, required
filetype off                  " required

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
Plugin 'tpope/vim-fugitive' "集成Git
Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator' " 生成.ycm_extra_conf.py
Plugin 'wesleyche/SrcExpl'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'octol/vim-cpp-enhanced-highlight' " 增强C++语法高亮
" vim-cpp-enhanced-highlight 主要通过 .vim/bundle/vim-cpp-enhanced-highlight/after/syntax/cpp.vim 控制高亮关键字及规则,若某个 STL 容器类型未高亮，将该类型追加进 cpp.vim 即可。如，initializer_list 默认并不会高亮，需要添加 syntax keyword cppSTLtype initializer_list
Plugin 'derekwyatt/vim-fswitch' " 在接口文件和实现文件间切换，protodef依赖
Plugin 'vim-signature' "显示书签 
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/indexer.tar.gz' " 自动生成tags
Plugin 'vim-scripts/DfrankUtil' " indexer依赖
Plugin 'vim-scripts/vimprj' " indexer依赖
Plugin 'scrooloose/nerdcommenter' " 注释
Plugin 'SirVer/ultisnips' " 模板补全
Plugin 'derekwyatt/vim-protodef' " 由接口生成定义，鸡肋！！！
Plugin 'scrooloose/nerdtree' " 工程文件管理
Plugin 'fholgado/minibufexpl.vim' " 显示buffer
Plugin 'gcmt/wildfire.vim' " 选中结对符中的内容
Plugin 'Lokaltog/vim-easymotion' " 快速移动
Plugin 'jiangmiao/auto-pairs' " 括号补全
Plugin 'davidhalter/jedi-vim' " Pythony语法提示
Plugin 'vim-syntastic/syntastic' " 语法检
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
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
" Vundle END <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<


"**********************************************************************
"                               一般配置                              *
"**********************************************************************
" 让配置变更立即生效 " 会导致函数重定义
" autocmd BufWritePost $MYVIMRC source $MYVIMRC

" 主题
colorscheme solarized
"colorscheme molokai
" set background=dark

" 禁止代码折行
"set nowrap

" 设置leader键
let mapleader=","

" 语法高亮
syntax enable

" 允许用指定语法高亮配色方案替换默认方案
syntax on

" 设置可加载插件
set nocompatible

" 开启文件类型侦测
filetype on

" 根据侦测到不同类型的文件加载对应的插件
filetype plugin on

" 修复backspace问题
set backspace=indent,eol,start

" 设置自动缩进
set autoindent 

" C风格缩进
set cindent

" 自适应不同语言的智能缩进
filetype indent on

" 将制表符扩展为空格
"set expandtab

" 设置编辑时制表符占用空格数
set tabstop=4

" 设置格式化时制表符占用空格数
set shiftwidth=4

" 让vim 把连续数量的空格视为一个制表符
set softtabstop=4

" 设置public不缩进
set cinoptions=g0

" 总是显示状态栏
"set laststatus=2  "主题对状态栏无效，使用插件https://github.com/Lokaltog/vim-powerline

" 显示光标当前位置
set ruler

" 高亮显示当前行/列
"set cursorline
"set cursorcolumn

" 设置默认显示行号
set nu
" set nonu

" 设置历史记录保存数量
set history=200

" 设置默认高亮查找匹配"
set hlsearch

" 激活增量查找
set incsearch

" 搜索大小写不敏感
set ic " ignorecase
" set noic " 大小写敏感

" 基于缩进或语法进行代码折叠
" set foldmethod=indent
set foldmethod=syntax

" 启动 vim 时关闭折叠代码
set nofoldenable

" 加载matchit插件
runtime macros/matchit.vim

" 创建快捷键关闭高亮功能"
"nnoremap <silent> <C-l>	:<C-u>nohlsearch<CR><C-l>
nnoremap <leader>ff :nohlsearch<CR>

" 每次保存文件时调用ctags
"autocmd BufWritePost * call system("ctags -R")

" 创建快捷键建立tags
nnoremap <leader>tg :!ctags -R<CR>
nnoremap <leader>ctg :!ctags -R --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+liaS --extra=+q --language-force=c++<CR>
 
" 设置当前目录找不到tags文件到上层目录查找
set tags=tags;/

" <F12>切换paste模式
set pastetoggle=<F12>

" 设置normal模式开启鼠标支持
"set mouse=n

" 设置path
"set path+=../**

" vim自身命令行模式智能补全
set wildmenu

" sudo权限写文件
cmap w!! w !sudo tee % > /dev/null


"**********************************************************************
"                             vim-fswitch                             *
"**********************************************************************
" *.cpp 和 *.h 间切换
nnoremap <silent> <leader>di :FSHere<CR>


"**********************************************************************
"                              protodef                               *
"**********************************************************************
" 设置 pullproto.pl 脚本路径
let g:protodefprotogetter='~/.vim/bundle/vim-protodef/pullproto.pl'
" 成员函数的实现顺序与声明顺序一致
let g:disable_protodef_sorting=1


"**********************************************************************
"                               Tagbar                                *
"**********************************************************************
" 设置 tagbar 子窗口的位置出现在主编辑区的左边 
let tagbar_left=1 

" 设置显示／隐藏标签列表子窗口的快捷键。
nnoremap <leader>tb :TagbarToggle<CR>

" 打开tagbar和nerdtree
nnoremap <leader>wm :NERDTreeToggle<CR>:TagbarToggle<CR>:wincmd h<CR>

" 设置标签子窗口的宽度 
let tagbar_width=32 

" tagbar 子窗口中不显示冗余帮助信息 
let g:tagbar_compact=1

" 设置 ctags 对哪些代码标识符生成标签
let g:tagbar_type_cpp = {
    \ 'kinds' : [
         \ 'c:classes:0:1',
         \ 'd:macros:0:1',
         \ 'e:enumerators:0:0', 
         \ 'f:functions:0:1',
         \ 'g:enumeration:0:1',
         \ 'l:local:1:0',
         \ 'm:members:0:1',
         \ 'n:namespaces:0:1',
         \ 'p:functions_prototypes:1:1',
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

" 格式：{short}:{long}[:{fold}[:{stl}]]
" short 将作为 ctags 的 --c++-kinds 命令行选项的参数，类似：--c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v
" long 将作为 short 的简要描述展示在 vim 的 tagbar 子窗口中；
" fold 表示这种类型的标识符是否折叠显示；
" stl 指定是否在 vim 状态栏中显示附加信息。

" 正向遍历同名标签
nnoremap <leader>tn :tnext<CR>

" 反向遍历同名标签
nnoremap <leader>tp :tprevious<CR>


"**********************************************************************
"                               indexer                               *
"**********************************************************************
" 设置插件 indexer 调用 ctags 的参数
" 默认 --c++-kinds=+p+l，重新设置为 --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v
" 默认 --fields=+iaS 不满足 YCM 要求，需改为 --fields=+iaSl
let g:indexer_ctagsCommandLineOptions="--c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"
" 打开工程文件时不更新tags
let g:indexer_dontUpdateTagsIfFileExists=1


"**********************************************************************
"                            NERDComComment                           *
"**********************************************************************
map <leader>mm <plug>NERDCommenterToggle

"[count]|<Leader>|cm |NERDComMinimalComment|
"Comments the given lines using only one set of multipart delimiters.

"[count]|<Leader>|cs |NERDComSexyComment|
"Comments out the selected lines ``sexily''

"|<Leader>|cA |NERDComAppendComment|
"Adds comment delimiters to the end of line and goes into insert mode between
"them.

"|<Leader>|ca |NERDComAltDelim|
"Switches to the alternative set of delimiters.

"**********************************************************************
"                               NERDtree                              *
"**********************************************************************
" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <leader>fl :NERDTreeToggle<CR>

" 设置NERDTree子窗口宽度
let NERDTreeWinSize=32

" 设置NERDTree子窗口位置
let NERDTreeWinPos="right"

" 显示隐藏文件
let NERDTreeShowHidden=1

" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1

" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1


"**********************************************************************
"                           MiniBufExplorer                           *
"**********************************************************************
" 显示/隐藏 MiniBufExplorer 窗口
nnoremap <leader>bf :MBEToggle<CR>

" buffer 切换快捷键
"nnoremap <C-TAB> :MBEbn<CR>
"nnoremap <C-S-Tab> :MBEbp<CR>

" 打开vim后自动开启
let g:miniBufExplorerAutoStart = 1

"**********************************************************************
"                             UltiSnips                               *
"**********************************************************************
let g:UltiSnipsSnippetDirectories=["mysnippets"]
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"


"**********************************************************************
"                              Signature                              *
"**********************************************************************
nnoremap <S-M> `

"let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "m-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "mda",
        \ 'PurgeMarkers'       :  "m<BS>",
        \ 'GotoNextLineAlpha'  :  "']",
        \ 'GotoPrevLineAlpha'  :  "'[",
        \ 'GotoNextSpotAlpha'  :  "`]",
        \ 'GotoPrevSpotAlpha'  :  "`[",
        \ 'GotoNextLineByPos'  :  "]'",
        \ 'GotoPrevLineByPos'  :  "['",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "[+",
        \ 'GotoPrevMarker'     :  "[-",
        \ 'GotoNextMarkerAny'  :  "]=",
        \ 'GotoPrevMarkerAny'  :  "[=",
        \ 'ListLocalMarks'     :  "ms",
        \ 'ListLocalMarkers'   :  "m?"
        \ }
"let g:SignatureMap = {
      \ 'Leader'             :  "m",
      \ 'PlaceNextMark'      :  ",",
      \ 'PurgeMarks'         :  "<Space>",
      \ 'PurgeMarkers'       :  "<BS>",
      \ 'GotoNextLineAlpha'  :  "']",
      \ 'GotoPrevLineAlpha'  :  "'[",
      \ 'GotoNextSpotAlpha'  :  "`]",
      \ 'GotoPrevSpotAlpha'  :  "`[",
      \ 'GotoNextLineByPos'  :  "]'",
      \ 'GotoPrevLineByPos'  :  "['",
      \ 'GotoNextSpotByPos'  :  "]`",
      \ 'GotoPrevSpotByPos'  :  "[`",
      \ 'GotoNextMarker'     :  "]-",
      \ 'GotoPrevMarker'     :  "[-",
      \ 'GotoNextMarkerAny'  :  "]=",
      \ 'GotoPrevMarkerAny'  :  "[=",
      \ }

"**********************************************************************
"                               SrcExpl                               *
"**********************************************************************
" The switch of the Source Explorer 
nnoremap <leader>se :SrcExplToggle<CR>

" Set the height of Source Explorer window 
let g:SrcExpl_winHeight = 6 

" Set 100 ms for refreshing the Source Explorer 
let g:SrcExpl_refreshTime = 100 

" Set "Enter" key to jump into the exact definition context 
let g:SrcExpl_jumpKey = "<ENTER>" 

" Set "Space" key for back from the definition context 
let g:SrcExpl_gobackKey = "<SPACE>" 

" In order to avoid conflicts, the Source Explorer should know what plugins
" except itself are using buffers. And you need add their buffer names into
" below listaccording to the command ":buffers!"
let g:SrcExpl_pluginList = [ 
        \ "__Tag_List__", 
		\ "[File List]",
        \ "netrw", 
        \ "Source_Explorer", 
    \ ] 


" Enable/Disable the local definition searching, and note that this is not 
" guaranteed to work, the Source Explorer doesn't check the syntax for now. 
" It only searches for a match with the keyword according to command 'gd' 
let g:SrcExpl_searchLocalDef = 1 

" Do not let the Source Explorer update the tags file when opening 
let g:SrcExpl_isUpdateTags = 0 

" Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files' to 
" create/update the tags file 
let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ." 

" Set key for updating the tags file artificially 
"let g:SrcExpl_updateTagsKey = "<F8>" 

" Set key for displaying the previous definition in the jump list 
let g:SrcExpl_prevDefKey = "<leader>dp" 

" Set key for displaying the next definition in the jump list 
let g:SrcExpl_nextDefKey = "<leader>dn" 


"**********************************************************************
"                           设置保存环境                              *
"**********************************************************************
" 设置环境保存项
set sessionoptions="blank,buffers,folds,globals,localoptions,tabpages,sesdir,folds,help,options,resize,winpos,winsize"

" 保存 undo 历史
set undodir=~/.undo_history/
set undofile

" 保存快捷键
nnoremap <leader>ss :mksession! .my.vim<CR> :wviminfo! .my.viminfo<CR>

" 恢复快捷键
nnoremap <leader>rs :source .my.vim<CR> :rviminfo .my.viminfo<CR>


"**********************************************************************
"                              wildfire                               *
"**********************************************************************
" 快捷键
map <leader>v <Plug>(wildfire-fuel)
vmap <leader>V <Plug>(wildfire-water)
" 适用于哪些结对符
let g:wildfire_objects = ["i'", 'i"', "i)", "i]", "i}", "i>", "ip"]


"**********************************************************************
"                           syntasticM配置                            *
"**********************************************************************
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" 错误警告标记
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"

"**********************************************************************
"                               YCM配置                               *
"**********************************************************************
" 配置默认的ycm_extra_conf.py
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py' 
"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py' 

" 配置python版本
let g:ycm_python_binary_path = '/usr/local/bin/python3'
"关闭加载.ycm_extra_conf.py提示
let g:ycm_confirm_extra_conf=0

"跳转，只能是 #include 或已打开的文件
nnoremap <leader>gd :YcmCompleter GoToDefinitionElseDeclaration<CR>   
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>	" 跳转到定义
nnoremap <leader>gl :YcmCompleter goToDeclaration<CR>	" 跳转到申明

" 打开vim时不再询问是否加载ycm_extra_conf.py配置
let g:ycm_confirm_extra_conf=0   

"使用ctags生成的tags文件
let g:ycm_collect_identifiers_from_tag_files = 1 

" YCM查错
nnoremap <leader>f4 :YcmDiags<CR>

" 自动补全配置
" 让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
set completeopt=longest,menu

" 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview

" 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1

" 开启 YCM 基于标签引擎
let g:ycm_collect_identifiers_from_tags_files=1

" 从第2个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=2

" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc=0

" 调用语义补全
let g:ycm_key_invoke_completion = '<C-J>'

" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1

" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
inoremap <leader>, <C-x><C-o>

"离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"回车即选中当前项
"inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"

"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

"youcompleteme  默认tab  s-tab 和自动补全冲突
"let g:ycm_key_list_select_completion=['<c-n>']
"let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion=['<c-p>']
"let g:ycm_key_list_previous_completion = ['<Up>']

nnoremap <leader>f5 :YcmForceCompileAndDiagnostics<CR>	"force recomile with syntastic
"
"nnoremap <leader>lo :lopen<CR>	"open locationlist
"nnoremap <leader>lc :lclose<CR>	"close locationlist

"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1

" 设置错误和警告提示
let g:ycm_error_symbol = '✗'
let g:ycm_warning_symbol = '⚠'

" 设置颜色
"highlight YcmErrorSign                      error标记颜色
"highlight YcmWarningSign ctermbg=none       warning标记颜色
"highlight YcmErrorSection                   代码中出错字段颜色
"highlight YcmWarningSection ctermbg=none
"highlight YcmErrorLine                      出错行颜色
"highlight YcmWarningLine

" YCM 补全菜单配色
" 菜单
"highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
" 选中项
"highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900

" 引入 C++ 标准库tags
"set tags+=/data/misc/software/misc./vim/stdcpp.tags


"**********************************************************************
"                           jedi-vim 配置                             *
"**********************************************************************
let g:jedi#completions_command = "<C-K>"

"**********************************************************************
"                               ici词典                               *
"**********************************************************************
nmap <Leader>y :!echo "                  --==  <C-R><C-w>  ==-- ";ici <C-R><C-W><CR>


"**********************************************************************
"                        Makefile F2 F3                               *
"**********************************************************************
" <F2>保存文件并make
nnoremap <F2> :wa<CR>:make<CR>

" <F3>保存文件并make clean;make
nnoremap <F3> :wa<CR>:make clean;make<CR>


"**********************************************************************
"               C，C++, Java, shell, Python F10编译运行                        *
"**********************************************************************
map <F10> :call CompileRun()<CR>
func! CompileRun()
    exec "w"
    if &filetype == 'c'
        exec "!gcc % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "!time  ./%<"
    elseif &filetype == 'java' 
        exec "!javac %" 
        exec "!time java %<"
    elseif &filetype == 'sh'
        exec "!time sh ./%"
    elseif &filetype == 'python'
        exec "!time python3 %"
    endif
endfunc


"**********************************************************************
"                 C,C++ gdb调试 Python pdb F11                        *
"**********************************************************************
map <F11> :call Rungdb()<CR>
func! Rungdb()
	exec "w"
	if &filetype == 'c'
		exec "!gcc % -g -o %<"
		exec "!gdb ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ % -g -o %<"
		exec "!gdb ./%<"
	elseif &filetype == 'python'
		exec '!python3 -m pdb %'
	endif
endfunc


"**********************************************************************
"                             键盘命令                                *
"**********************************************************************
" 保存文件
nnoremap <leader>w :w<CR>
nnoremap <leader>x :x<CR>

" 关闭文件
nnoremap <leader>q :q<CR>

" 查找文件
nnoremap <leader>fd :find 

" 切换窗口
noremap <C-J>     <C-W>j
noremap <C-K>     <C-W>k
noremap <C-H>     <C-W>h
noremap <C-L>     <C-W>l

" 切换缓冲区
nnoremap <leader>bn :bNext<CR>
nnoremap <leader>bp :bprevious<CR>

" 映射全选+复制 ctrl+a
"map <C-A> ggVGY
"map! <C-A> <Esc>ggVGY

" 选中状态下 Ctrl+c 复制
"vmap <C-c> "+y

" 打开quickfix列表
nnoremap <leader>co :copen<CR>

" 关闭quickfix列表
nnoremap <leader>ccl :cclose<CR>

" 关闭窗口
"nnoremap <leader>cl :close<CR> " 被NERDcomment占用，使用<leader>q即可

"**********************************************************************
"                               文件命令                              *
"**********************************************************************
"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
func SetTitle() 
    "如果文件类型为.sh文件 
    if &filetype == 'sh' 
        call setline(1,"\#!/bin/sh") 
        call append(line("."), "") 
    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"# coding=utf-8")
        call append(line(".")+1, "") 

    elseif &filetype == 'ruby'
        call setline(1,"#!/usr/bin/env ruby")
        call append(line("."),"# encoding: utf-8")
        call append(line(".")+1, "")
    else 
        call setline(1, "/*************************************************************************") 
        call append(line("."),   "  > File Name   : ".expand("%")) 
        call append(line(".")+1, "  > Author      : GrandZhuo") 
        call append(line(".")+2, "  > Mail        : lizhuo93@foxmail.com") 
        call append(line(".")+3, "  > Created Time: ".strftime("%c")) 
        call append(line(".")+4, " ************************************************************************/") 
        call append(line(".")+5, "")
    endif
    if expand("%:e") == 'cpp'
        call append(line(".")+6, "#include <iostream>")
        call append(line(".")+7, "")
        call append(line(".")+8, "using namespace std;")
        call append(line(".")+9, "")
    endif
    if &filetype == 'c'
        call append(line(".")+6, "#include <stdio.h>")
        call append(line(".")+7, "")
    endif
    if expand("%:e") == 'h'
        call append(line(".")+6, "#ifndef _".toupper(expand("%:r"))."_H")
        call append(line(".")+7, "#define _".toupper(expand("%:r"))."_H")
        call append(line(".")+8, "#endif")
    endif
    if &filetype == 'java'
        call append(line(".")+6,"public class ".expand("%:r"))
        call append(line(".")+7,"")
    endif
    "新建文件后，自动定位到文件末尾
endfunc 
autocmd BufNewFile * normal G
