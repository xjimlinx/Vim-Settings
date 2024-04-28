runtime! archlinux.vim
set encoding=utf-8
syntax on
syntax enable
set background=dark
filetype plugin indent on
filetype plugin on

set showmatch " Enable Brackets Match Hint
set ignorecase
set smartcase
set incsearch

set termguicolors
set hidden
setlocal noswapfile " 不要生成swap文件
set bufhidden=hide " 当buffer被丢弃的时候隐藏它
colorscheme catppuccin_mocha " 设定配色方案
let g:airline_theme = 'catppuccin_mocha' " 设定airline配色方案
let g:airline_powerline_fonts = 1
set number " 显示行号
set cursorline " 突出显示当前行
set ruler " 打开状态栏标尺
set shiftwidth=2 " 设定 << 和 >> 命令移动时的宽度为 2
set softtabstop=2 " 使得按退格键时可以一次删掉 2 个空格
set tabstop=2 " 设定 tab 长度为 2
set nobackup " 覆盖文件时不备份
set autochdir " 自动切换当前目录为当前文件所在的目录
set backupcopy=yes " 设置备份时的行为为覆盖
set hlsearch " 搜索时高亮显示被找到的文本
set noerrorbells " 关闭错误信息响铃
set novisualbell " 关闭使用可视响铃代替呼叫
set t_vb= " 置空错误铃声的终端代码
set matchtime=2 " 短暂跳转到匹配括号的时间
set magic " 设置魔术
"set mouse=a " 可以在buffer的任何地方使用鼠标
set mouse=r
set smartindent " 开启新行时使用智能自动缩进
set backspace=indent,eol,start " 不设定在插入状态无法用退格键和 Delete 键删除回车符
set cmdheight=1 " 设定命令行的行数为 1
set wildmenu " Showing path every time typing
set foldenable " 开始折叠
set foldmethod=syntax " 设置语法折叠
set foldcolumn=0 " 设置折叠区域的宽度
setlocal foldlevel=1 " 设置折叠层数为 1
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR> " 用空格键来开关折叠

" Plugins
call plug#begin()
"添加NerdTree插件
Plug 'preservim/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
"添加彩虹括号插件
Plug 'frazrepo/vim-rainbow'
"添加括号补全插件
Plug 'jiangmiao/auto-pairs'
"Catppuccin主题
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
"添加Snippet代码补全
Plug 'SirVer/ultisnips'
"Add snippets 'library'
Plug 'honza/vim-snippets'
"Add auto format plugin
Plug 'Chiel92/vim-autoformat'
"Add you-complete-me plugin
"Plug 'Valloric/YouCompleteMe'
"Add vim-devicons
Plug 'ryanoasis/vim-devicons'
"Add ctrlp
Plug 'ctrlpvim/ctrlp.vim'
"Add verilog_systemverilog.vim
Plug 'vhda/verilog_systemverilog.vim'
"Add indentline
Plug 'Yggdroot/indentline'
"Add airline
Plug 'vim-airline/vim-airline'
"Add nerdcommenter
Plug 'preservim/nerdcommenter'
call plug#end()

" Enable Rainbow brackets
let g:rainbow_active = 1

" Enable NERDTreeTabs
let g:nerdtree_tabs_open_on_console_startup = 0

" Keybindings for nerd-tree-tabs
let mapleader=','
let g:mapleader=','

" Keybindings for vim-autoformat
noremap <F2> :Autoformat<CR>
let g:autoformat_verbosemode=1
" Default Mapleader is '\'
nnoremap <F3> :NERDTreeToggle<CR>
nnoremap <leader>n :NERDTreeFocus<CR>

" For NerdComment
" 注释时添加空格
let g:NERDSpaceDelims=1

" 用于UltiSnips和YouCompleteMe的冲突解决
function! g:UltiSnips_Complete()
  call UltiSnips#ExpandSnippet()
  if g:ulti_expand_res == 0
    if pumvisible()
      return "\<C-n>"
    else
      call UltiSnips#JumpForwards()
      if g:ulti_jump_forwards_res == 0
        return "\<TAB>"
      endif
    endif
  endif
  return ""
endfunction

function! g:UltiSnips_Reverse()
  call UltiSnips#JumpBackwards()
  if g:ulti_jump_backwards_res == 0
    return "\<C-P>"
  endif

  return ""
endfunction


if !exists("g:UltiSnipsJumpForwardTrigger")
  let g:UltiSnipsJumpForwardTrigger = "<tab>"
endif
if !exists("g:UltiSnipsJumpBackwardTrigger")
  let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
endif

au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger     . " <C-R>=g:UltiSnips_Complete()<cr>"
au InsertEnter * exec "inoremap <silent> " .     g:UltiSnipsJumpBackwardTrigger . " <C-R>=g:UltiSnips_Reverse()<cr>"

