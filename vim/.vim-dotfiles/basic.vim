"===== 表示設定 =====
set number "行番号の表示
set title "編集中ファイル名の表示
set showmatch "括弧入力時に対応する括弧を示す
set matchtime=1
"set colorcolumn=80 " 80文字の目印
set cursorline
set hidden " 保存されていないファイルがあるときでも別のファイルを開くことが出来る
set visualbell "ビープ音を視覚表示
set laststatus=2 "ステータスを表示
set ruler "カーソル位置を表示
syntax on "コードに色をつける
autocmd ColorScheme * highlight LineNr ctermfg=211
colorscheme slate " カラースキーム
hi clear CursorLine 
hi CursorLineNr term=bold cterm=bold ctermfg=0 ctermbg=15
set ambiwidth=double  "Display double-width symbols properly

"===== 文字、カーソル設定 =====
set fenc=utf-8 "文字コードを指定
set virtualedit=onemore "カーソルを行末の一つ先まで移動可能にする
set autoindent "自動インデント
set smartindent "オートインデント
set tabstop=4 "インデントをスペース4つ分に設定
set shiftwidth=4 "自動的に入力されたインデントの空白を4つ分に設定
set whichwrap=b,s,h,l,<,>,[,],~ "行頭、行末で行のカーソル移動を可能にする
set backspace=indent,eol,start "バックスペースでの行移動を可能にする
set wildmenu "コマンドモードの補完
set cmdheight=1
set foldmethod=indent
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up>   gk
noremap <Space>h  ^
noremap <Space>l  $

"===== 検索設定 =====
set ignorecase "大文字、小文字の区別をしない
set smartcase "大文字が含まれている場合は区別する
set wrapscan "検索時に最後まで行ったら最初に戻る
set hlsearch "検索した文字を強調
set incsearch "インクリメンタルサーチを有効にする

"===== マウス設定 =====
set mouse=a
set ttymouse=xterm2

"===== キー入力 =====
set clipboard=unnamed,autoselect
"jキーを二度押しでESCキー
inoremap <silent> jj <Esc>
inoremap <silent> っj <Esc>

"{}の自動補完
inoremap { {}<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>

"===== その他 =====
"履歴を10000件保存
set history=10000
set pumheight=10

