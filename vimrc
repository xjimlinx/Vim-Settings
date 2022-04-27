set encoding=utf-8	"使用utf-8编码
set number
set showcmd
"set clipboard=unnamed,unnamedplus	"可以从vim复制到剪贴板中
set mouse=a		"可以在buffer的任何地方使用鼠标
set cursorline		"显示当前行
set hlsearch		"显示高亮搜索
"set incsearch
set history=40		"默认指令记录是20
set ruler		"显示行号和列号
set pastetoggle=F3	"F3快捷键于paste模式与否之间转化，防止自动缩进
"set helplang=cn	"设置为中文帮助文档，需下载并配置之后生效

"===============文本格式排版====================
set tabstop=4
set shiftwidth=4	"设置自动对齐的缩进级别
set autoindent		"配合下面一条命令根据不同语言类型进行不同的缩进操作
filetype plugin indent on
"set cindent		"以c语言风格自动缩进
"set smartindent	"自动识别以#开头的注释，不进行换行


"===========================选择solarized的模式========================== 
syntax enable  
syntax on 
"solarzed的深色模式  
"set background=dark 
"solarized的浅色模式 
"set background=light 
"colorscheme solarized        "开启背景颜色模式 
 
"===========================选择molokai的模式============================ 
"let g:rehash256 = 1 
let g:molokai_original = 1    "相较于上一个模式，个人比较喜欢此种模式 
highlight NonText guibg=#060606 
highlight Folded  guibg=#0A0A0A guifg=#9090D0 
"set t_Co=256 
"set background=dark 
colorscheme  molokai

"===========================Vundle环境设置=================================
set nocompatible	"vim比vi支持更多功能，如showcmd，避免冲突和副作用
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/plugin/clang_complete.vim
"vundle管理的插件列表必须位于vundle#begin()和vundle#end()之间
call vundle#begin()

"避免PluginClean把自己卸载了
Plugin 'VundleVim/Vundle.vim'
"添加ycm插件
Plugin 'ycm-core/YouCompleteMe'
"添加彩虹括号插件
Bundle 'luochen1990/rainbow'
"添加括号补全插件
Plugin 'jiangmiao/auto-pairs'
"添加NerdTree插件
Bundle 'jistr/vim-nerdtree-tabs'
"添加auatopep8插件//python格式化代码
Plugin 'tell-k/vim-autopep8'

"Plugin 'rip-rip/clang_complete'




let g:clang_complete_copen=1
let g:clang_periodic_quickfix=1
let g:clang_snippets=1
let g:clang_user_options='-std=c99 -stdlib=libc++ -std=c++11 -IIncludePath'
let g:clang_auto_select=1
let g:clang_close_preview=1
let g:clang_complete_macros=1
let g:clang_use_library=1
let g:clang_library_path="/usr/lib/llvm/"
let g:neocomplcache_enable_at_startup=1
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0
let g:ycm_server_python_interpreter = '/usr/bin/python'
let g:ycm_error_symbol = '✗'
let g:ycm_warning_symbol = '✹'
let g:ycm_seed_identifiers_with_syntax = 1
let g:rainbow_active = 1

"插件列表结束
call vundle#end()
filetype plugin indent on
"安装插件，先找到其在github的地址，再将配置信息加入.vimrc中的call
"vundle#begin()和call vundle#end()之间，最后进入vim执行
":PluginInstall 便可自动安装
"要卸载插件，先在.vimrc中注释或删除对应插件配置信息，然后在vim中执行
":PluginClean便可卸载对应插件
"批量更新，只需执行:PluginUpdate
