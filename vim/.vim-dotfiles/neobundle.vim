"===== NeoBundleの設定 =====
if 0 | endif
 
if has('vim_starting')
   if &compatible
      set nocompatible               " Be iMproved
   endif
 
  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
 
" Required:
call neobundle#begin(expand('~/.vim/bundle/'))
 
" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'lervag/vimtex'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tyru/caw.vim'
"NeoBundle 'mattn/emmet-vim'
NeoBundle 'pangloss/vim-javascript'
" NeoBundle 'rbtnn/game_engine.vim'
" NeoBundle 'rbtnn/puyo.vim'
NeoBundle 'marijnh/tern_for_vim', {
  \ 'build': {
  \   'others': 'npm install'
  \}}
NeoBundleLazy 'othree/yajs.vim', {'autoload':{'filetypes':['javascript']}}
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
"NeoBundle 'scrooloose/syntastic'
"NeoBundle 'davidhalter/jedi-vim'
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!
 
call neobundle#end()
 
" Required:
filetype plugin indent on
 
" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"================================

