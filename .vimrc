
"------------------------------
" neobundle関連の設定
"------------------------------
if has('vim_starting')
	" 初回起動時のみruntimepathにneobundleのパスを指定する
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" NeoBundleを初期化
call neobundle#begin(expand('~/.vim/bundle/'))

" コード補完
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'marcus/rsense'
NeoBundle 'supermomonga/neocomplete-rsense.vim'

" ドキュメント参照
NeoBundle 'thinca/vim-ref'
NeoBundle 'yuku-t/vim-ref-ri'
"
" " メソッド定義元へのジャンプ
NeoBundle 'szw/vim-tags'

" 自動で閉じる
NeoBundle 'tpope/vim-endwise'

" html入力補助
NeoBundle 'mattn/emmet-vim'
NeoBundle 'tpope/vim-surround'

" ソースの静的解析
NeoBundle 'scrooloose/syntastic'

" html5への対応
NeoBundle 'othree/html5.vim'

" インデントに色を付けて見やすくする
NeoBundle 'nathanaelkane/vim-indent-guides'

" Railsプロジェクト間のファイル移動サポート
NeoBundle 'tpope/vim-rails'

" slim用ハイライト
NeoBundle 'slim-template/vim-slim'


call neobundle#end()
filetype plugin indent on
NeoBundleCheck

" -------------------------------
" Rsense
" -------------------------------
let g:rsenseHome = '/usr/local/lib/rsense-0.3/'
let g:rsenseUseOmniFunc = 1

" --------------------------------
" neocomplete.vim
" --------------------------------
"let g:neocomplete#sources#rsense#home_directory = '/usr/local/lib/rsense-0.3'
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3

if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^.*\t]\.\w*\|\h\w*::'

" rubcop設定
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': ['ruby', 'javascript' ] }
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_javascript_checkers=['eslint']

"let g:syntastic_quiet_warnings = {'level': 'warning'}

" (erb.htmlへのインデント対応) 
let g:html5_event_handler_attributes_complete = 1
let g:html5_rdfa_attributes_complete = 1
let g:html5_microdata_attributes_complete = 1
let g:html5_aria_attributes_complete = 1

" vim-indent-guides
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=237
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1

""""""""""""""""""""""""""""""
" 全角スペースの表示
""""""""""""""""""""""""""""""
" function! ZenkakuSpace()
" highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
" endfunction
"
" if has('syntax')
"   augroup ZenkakuSpace
"     autocmd!
"     autocmd ColorScheme * call ZenkakuSpace()
"     autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
"   augroup END
"   call ZenkakuSpace()
" endif
""""""""""""""""""""""""""""""

autocmd FileType * setlocal formatoptions-=ro

"---------------------------------
"全般設定
"---------------------------------

" キーマッピング

let mapleader = "\<space>"
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>

nnoremap <CR> G
nnoremap <BS> gg

inoremap <silent> qq <ESC>

inoremap <C-j> <Down>
inoremap <C-k> <up>
inoremap <C-h> <left>
inoremap <C-l> <Right>

" neocompleteのキーマッピング
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" カーソルを自動的に()の中へ
"imap {} {}<Left>
"imap [] []<Left>
"imap () ()<Left>
"imap "" ""<Left>
"imap '' ''<Left>
"imap <> <><Left>
" imap // //<left>
" imap /// ///<left>

"レジスタ関連のマッピング
"vmap <Leader>y "+y
"vmap <Leader>d "+d
"nmap <Leader>p "+p
"nmap <Leader>P "+P
"vmap <Leader>p "+p
"vmap <Leader>P "+P

nmap <silent> <Esc><Esc> :nohlsearch<CR>
noremap <Leader><Leader> <C-V>

noremap <C-j> 3+
noremap <C-k> 3- 
nnoremap Y y$
noremap # :call ToggleCommentSelection()<CR>
nnoremap R gR
nnoremap <Space>l :hide bn!<CR>
nnoremap <Space>h :hide bp!<CR>
nnoremap <Tab> <C-w>w
nnoremap <C-h> <C-w>W
vnoremap s y:%s/<C-R>"//g<Left><Left>

" インサート中に誤ってエンターを押してしまったときは C-b
inoremap <C-b> <Esc>kA

" タグジャンプ使用時に新規ウィンドウを開く
nnoremap <C-h> :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <C-k> :split<CR> :exe("tjump ".expand('<cword>'))<CR>

" タグジャンプ使用時に複数候補の表示をデフォルト化する
nnoremap <C-]> g<C-]> 

" ファイル ---------------------------------------------------------
set hidden
set autoread
set isfname-==
set tags=tags;
" 2個上のディレクトリ以下から再帰的に探す
set tags=+../../**/tags;


" 編集 ------------------------------------------------------------ 
set autoindent smartindent
set smarttab
set expandtab tabstop=2 softtabstop=2 shiftwidth=2
set cinoptions=t0,:0,g0,(0
set backspace=indent,eol,start
set formatoptions=tcqnmM
set listchars=tab:>-
set iskeyword+=-,!,?
"set indentkeys-=0#
set virtualedit=block

" カーソル移動 -----------------------------------------------------
set showmatch matchtime=1
set matchpairs+=<:>
set whichwrap+=h,l,<,>,[,],b,s
set scrolloff=4
set sidescrolloff=8

" 表示 -------------------------------------------------------------
set nowrap
set ruler
set ruf=%45(%12f%=\ %m%{'['.(&fenc!=''?&fenc:&enc).']'}\ %l-%v\ %p%%\ [%02B]%)
set statusline=%f\ %m%=%{(&fenc!=''?&fenc:&enc).':'.&ff}%{(&list?'>':'')}\ %l/%L(%p%%)\ %v[%02B]
set showcmd
set cmdheight=1
set laststatus=2
set nonumber
set shortmess+=I
set list
" set nofoldenable
" set vb t_vb=
syntax enable

colorscheme molokai

"colorscheme solarized
"if has('gui_running')
"  set background=light
"else
"  set background=dark
"endif

set t_Co=256

" 検索 -------------------------------------------------------------
set ignorecase
set smartcase
set incsearch
set nohlsearch
set keywordprg=man\ -a
set hlsearch

" 補完・履歴 -------------------------------------------------------
set wildmenu
set history=50

" ウィンドウ -------------------------------------------------------
set splitbelow
set splitright
set sessionoptions+=resize
set previewheight=5

set clipboard=unnamed

" vim内の文字エンコーディングをutf-8にする
set encoding=utf-8

"□や○の文字があってもカーソル位置がずれないようにする。
set ambiwidth=double

"  vim起動時に前回の行で開く
if has("autocmd")
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line ("'\"") <= line("$") |
        \   exe "normal! g'\"" |
        \ endif
endif








