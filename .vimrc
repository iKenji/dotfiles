syntax on


" ▼ エンコード
set encoding=utf-8
set fileencoding=utf-8
set enc=japan
set fileformat=unix

" ▼ 基本的な設定
set autoread       " 外部でファイルに変更がされた場合は読みなおす
set clipboard=unnamed,autoselect "クリックボード
set nobackup       " ファイル保存時にバックアップファイルを作らない
set noswapfile     " ファイル編集中にスワップファイルを作らない
set title          " 編集中のファイル名を表示する
set number         " 行番号を表示する
set cursorline     " カーソル行の背景色を変える
set laststatus=2   " ステータス行を常に表示
set cmdheight=2    " メッセージ表示欄を2行確保
set showmatch      " 対応する括弧を強調表示
set helpheight=999 " ヘルプを画面いっぱいに開く

set hlsearch   " 検索文字列をハイライトする
set incsearch  " インクリメンタルサーチを行う
set ignorecase " 大文字と小文字を区別しない
set smartcase  " 大文字と小文字が混在した言葉で検索を行った場合に限り、大文字と小文字を区別する
set wrapscan   " 最後尾まで検索を終えたら次の検索で先頭に移る
set gdefault   " 置換の時 g オプションをデフォルトで有効にする

set expandtab     " タブ入力を複数の空白入力に置き換える
set tabstop=4     " 画面上でタブ文字が占める幅
set shiftwidth=4  " 自動インデントでずれる幅
set softtabstop=4 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent    " 改行時に前の行のインデントを継続する
set smartindent   " 改行時に入力された行の末尾に合わせて次の行のインデントを増減する

set autoread   "外部でファイルに変更がされた場合は読みなおす
set noundofile "undofileを作らない
set nobackup   " ファイル保存時にバックアップファイルを作らない

set display=lastline
set pumheight=10
set matchtime=1

" neocomplcache
let g:neocomplcache_enable_at_startup = 1 " 起動時に有効化
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" key bind
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
inoremap <silent> jj <ESC>
nnoremap + <C-a>
nnoremap - <C-x>

cnoreabbrev w!! w !sudo tee > /dev/null %

if has('vim_starting')
   " 初回起動時のみruntimepathにneobundleのパスを指定する
   set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" NeoBundleを初期化
call neobundle#begin(expand('~/.vim/bundle/'))

" インストールするプラグインをここに記述
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'itchyny/lightline.vim'
call neobundle#end()


au BufRead,BufNewFile *.md set filetype=markdown

" ファイルタイプ別のプラグイン/インデントを有効にする
filetype plugin indent on
