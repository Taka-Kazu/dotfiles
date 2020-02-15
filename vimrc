"
"参考
"https://qiita.com/mfujimori/items/9fd41bcd8d1ce9170301
"https://qiita.com/iwaseasahi/items/0b2da68269397906c14c
"https://qiita.com/KeitaNakamura/items/a289822827c8655b2dcd
"https://qiita.com/delphinus/items/00ff2c0ba972c6e41542
"

" dein
augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END

if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim
"call dein#add('Shougo/dein.vim')
"call dein#add('tomtom/t_comment_vim')
"call dein#add('tomasr/molokai')
"call map(dein#check_clean(), "delete(v:val, 'rf')")
"call dein#recache_runtimepath()

if dein#load_state(expand('~/.vim/dein'))
    call dein#begin(expand('~/.vim/dein'))

    let g:dein_dir = expand('~/dotfiles')
    let s:toml = g:dein_dir . '/dein.toml'
    let s:lazy_toml = g:dein_dir . '/dein_lazy.toml'

    " TOMLファイルにpluginを記述
    call dein#load_toml(s:toml, {'lazy': 0})
    call dein#load_toml(s:lazy_toml, {'lazy': 1})

    call dein#end()
    call dein#save_state()
endif

" 未インストールを確認
if dein#check_install()
    call dein#install()
endif

filetype plugin indent on


" 基本設定系
"文字コードをUFT-8に設定
set encoding=utf-8
set fenc=utf-8
scriptencoding
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd
" ファイルを上書きする前にバックアップを作ることを無効化
set nowritebackup
" マウス操作有効化
"set mouse=a

" 操作系
" insertモードでjjをESCとして扱う
inoremap jj <Esc>
" 行をまたいで移動
set whichwrap=b,s,h,l,<,>,[,],~
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk
" 行をまたいだbackspace
set backspace=indent,eol,start

" ウィンドウ分割
nnoremap vs vsplit
" nnoremap wl <C-w>l
" nnoremap wh <C-w>h
" nnoremap wk <C-w>k
" nnoremap wj <C-w>j

" 編集系
" ヤンクでクリップボードにコピー
set clipboard=unnamed,autoselect
" 常にglobal
set gdefault
" 保存時に行末の空白を削除する
autocmd BufWritePre * :%s/\s\+$//ge

" 表示系
" カラースキーマ
colorscheme molokai
set t_Co=256
" 行番号を表示
set number
" タイトルを表示
set title
" 現在の行を強調表示
set cursorline
" 現在の行を強調表示（縦）
" set cursorcolumn
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" エラーメッセージの表示時にビープを鳴らさない
set noerrorbells
" Windowsでパスの区切り文字をスラッシュで扱う
set shellslash
" 対応する括弧やブレースを表示
set showmatch matchtime=1
" シンタックスハイライト
syntax on
" スクロール余裕
set scrolloff=3
" スペルチェック
set spell
set spelllang=en,cjk "日本語を除外
" 折りたたみ
" set foldmethod=indent


" Tab系
" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=4
" 行頭でのTab文字の表示幅
set shiftwidth=4
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
" 開行時に前の行のインデントを継続する
set autoindent
" 貼付け時tabを入れない
"set paste
" ペーストモード解除
"autocmd InsertLeave * set nopaste

" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

if has('persistent_undo')
  set undodir=~/.vim/undo
  set undofile
endif

" nerdtree
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" vim-airline
let g:airline_theme = 'molokai'
let g:airline_powerline_fonts = 1
let g:airline_section_a = airline#section#create(['mode', 'crypt'])
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" deoplete
let g:deoplete#enable_at_startup = 1

augroup cpp-path
    autocmd!
    autocmd FileType cpp setlocal path=.,/usr/include,/usr/local/include
augroup END

" ale
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_sign_colmun_always = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_cursor = 0
let g:ale_open_list = 1
let g:ale_keep_list_window_open = 0
let g:ale_list_window_size = 3
let g:airline#extensions#ale#enabled = 1
