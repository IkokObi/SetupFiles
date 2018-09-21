"===== quickrunの設定 =====
let g:quickrun_config = {
\   'outputter/buffer/split': ':right 1sp'
\ }
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"


"===== pep8の設定 =====
"let g:syntastic_python_checkers = ['pyflakes', 'pep8']
"let g:syntastic_python_checkers = ['flake8']


"===== コメントアウトの設定 =====
" 行の最初の文字の前にコメント文字をトグル
nmap <C-i> <Plug>(caw:hatpos:toggle)
vmap <C-i> <Plug>(caw:hatpos:toggle)
" 行頭にコメントをトグル
nmap <Leader>c <Plug>(caw:zeropos:toggle)
vmap <Leader>c <Plug>(caw:zeropos:toggle)


"===== MarkDown =====
autocmd BufRead,BufNewFile *.mkd  set filetype=markdown
autocmd BufRead,BufNewFile *.md  set filetype=markdown

" Need: kannokanno/previm
nnoremap <silent> <C-o> :PrevimOpen<CR> " Ctrl-oでプレビュー
" 自動で折りたたまないようにする
let g:vim_markdown_folding_disabled=1
let g:previm_enable_realtime = 1


"===== JavaScriptの設定 =====
let g:javascript_plugin_flow = 1
"autocmd FileType html setlocal indentexpr=""
" autocmd FileType javascript setl autoindent 
" autocmd FileType javascript setl smartindent 
" autocmd FileType javascript setl tabstop=8 expandtab shiftwidth=2 softtabstop=2 
" 必要ならコメントアウト外す
autocmd BufRead,BufNewFile *.es6 setfiletype javascript


"===== 補完の設定 =====
" Vim起動時にneocompleteを有効にする
let g:neocomplete#enable_at_startup = 1
" smartcase有効化. 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplete#enable_smart_case = 1
" 3文字以上の単語に対して補完を有効にする
let g:neocomplete#min_keyword_length = 2
" 区切り文字まで補完する
let g:neocomplete#enable_auto_delimiter = 1
" 1文字目の入力から補完のポップアップを表示
let g:neocomplete#auto_completion_start_length = 1
" バックスペースで補完のポップアップを閉じる
inoremap <expr><BS> neocomplete#smart_close_popup()."<C-h>"

" エンターキーで補完候補の確定. スニペットの展開もエンターキーで確定
imap <expr><CR> neosnippet#expandable() ? "<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "<C-y>" : "<CR>"
" タブキーで補完候補の選択. スニペット内のジャンプもタブキーでジャンプ
imap <expr><TAB> pumvisible() ? "<C-n>" : neosnippet#jumpable() ? "<Plug>(neosnippet_expand_or_jump)" : "<TAB>"

autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

" docstringは表示しない
autocmd FileType python setlocal completeopt-=preview

if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.tex = g:vimtex#re#neocomplete


"===== vimtexの設定=====
" vimtex
let g:tex_flavor='latex'
let g:vimtex_latexmk_options = '-pdfdvi'
let g:tex_conceal = ''
let g:vimtex_imaps_enabled = 0
" viewer
let g:vimtex_view_general_viewer
\ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
let g:vimtex_view_general_options = '@line @pdf @tex'
autocmd FileType tex syntax spell toplevel

"===== NERDTreeの設定=====
nnoremap <silent><Space>f :NERDTreeToggle<CR>

